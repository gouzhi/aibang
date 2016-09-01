package com.aibang.web.move.site.user.register;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.business.api.user.user.UsersLogService;
import com.aibang.framework.activemq.SendMessage;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.CookiesUtil;
import com.aibang.framework.utils.JSONUtils;
import com.aibang.framework.utils.ip.Utils;
import com.aibang.framework.utils.redis.SpringRedisCacheService;
import com.aibang.framework.utils.validate.ValidateUtils;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.dto.AbUsersInfo;
import com.aibang.transfer.model.dto.AbUsersLog;
import com.aibang.transfer.model.vo.AbUserQuery;
import com.aibang.web.move.site.base.UserController;

@Controller
public class RegisterController extends UserController{
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "usersInfoService")
	private UsersInfoService usersInfoService;
	@Resource(name = "usersLogService")
	private UsersLogService usersLogService;
	@Autowired
    private Destination queueDestinationRegist;
    @Autowired
    @Qualifier("activemqSendMessage")
    private SendMessage activemqSendMessage;
	private String display(String pageName) {
		return "user/register/" + pageName;
	}
	@Autowired
	private SpringRedisCacheService springRedisCacheService;
	/**
	 * 加载注册页
	 * 
	 * @return String
	 * @author zhangyong
	 * @date 2015年10月21日
	 */
	@RequestMapping(value = "register",method=RequestMethod.GET)
	public String toRegister(ModelMap model, String inviteCode,HttpServletRequest request,HttpServletResponse response,String uid,String uname ,String chlid,String logo) {
		//将渠道用户参数缓存cookie
		if(StringUtils.isNotBlank(chlid)){
			CookiesUtil.set("uid", uid, 1800, response);
			CookiesUtil.set("uname", uname, 1800, response);
			CookiesUtil.set("chlid", chlid, 1800, response);
			CookiesUtil.set("logo", logo, 1800, response);
			model.addAttribute("inviteCode",inviteCode);
			model.addAttribute("uid", uid);
			model.addAttribute("uname", uname);
			model.addAttribute("chlid", chlid);
			model.addAttribute("logo", logo);
			return display("register");
		}
		//从cookies中得到渠道用户参数
		String uidC = CookiesUtil.get("uid", request);
		String unameC = CookiesUtil.get("uname", request);
		String chlidC = CookiesUtil.get("chlid", request);
		String logoC = CookiesUtil.get("logo", request);
		
		model.addAttribute("inviteCode",inviteCode);
		model.addAttribute("uid", uidC);
		model.addAttribute("uname", unameC);
		model.addAttribute("chlid", chlidC);
		model.addAttribute("logo", logoC);
		return display("register");
	}

	/**
	 * 注册会员信息
	 * 
	 * @param model
	 * @param user
	 *            会员登录信息
	 * @param code
	 *            验证码
	 * @param invitecode
	 *            邀请码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月23日
	 */
	@RequestMapping(value = "/register",method=RequestMethod.POST)
	public String registerCustomer(ModelMap model, AbUser user,
			String invitecode, String phonecode, HttpServletRequest request,
			HttpServletResponse response,String uid,String uname ,String chlid,String logo) {
		
		if (ValidateUtils.isStringEmpty(user.getPhone())) {
			error("请填写手机", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(user.getPassword())) {
			error("请填写密码", request, response);
			return null;
		}
		if (request.getSession().getAttribute("regCode") == null) {
			error("请获取手机验证码", request, response);
			return null;
		}
		String codeString = request.getSession().getAttribute("regCode")
				.toString();
		Date codeTime = (Date) request.getSession().getAttribute("regTime");
		String phoneString = request.getSession().getAttribute("regPhone")
				.toString();
		long diff = (new Date().getTime() - codeTime.getTime()) / (1000 * 60);
		if (!codeString.equals(phonecode) || diff > 30
				|| !phoneString.equals(user.getPhone())) {
			error("手机校验码不正确", request, response);
			return null;
		}
		user.setUsername(user.getPhone());
		AbUsersInfo usersInfo = new AbUsersInfo();
		AbUserBase userBase = new AbUserBase();
		// 会员账户预设置
		userBase.setCreateIp(Utils.getCdnIpAddr(request));// 创建IP
		userBase.setCreateTime(new Date());// 创建时间
		userBase.setTypeId(3);// 用户类型1管理员 2企业用户3会员
		userBase.setUsername(user.getUsername());// 登录名

		// 会员登陆信息预设置
		user.setCreateIp(Utils.getCdnIpAddr(request));// 创建IP
		user.setCreateTime(new Date());// 创建时间
		user.setTypeId(3);// 用户类型1管理员 2企业用户3会员
		user.setStatus(1);// 用户状态1有效用户2停用用户
		user.setIsDel(0);// 是否删除1删除0不删除
		user.setEmailStatus(0);// 邮箱状态默认0未验证1验证通过
		user.setRealNameStatus(0);// 实名状态默认0未验证1验证通过
		user.setPassword(new SimpleHash("SHA-1", user.getUsername(), user
				.getPassword()).toString());// 登录密码

		// 会员信息
		usersInfo.setInviteCode(invitecode);// 邀请码
		usersInfo.setHjsUser(user);// 设置登录信息
		usersInfo.setHjsUserBase(userBase);// 设置账户信息
		usersInfo.setLastTime(new Date());// 最后登录时间
		usersInfo = usersInfoService.registerUser(usersInfo);
		
		//渠道用户信息,发送队列消息
		//String paras = uid +"&"+ uname +"&"+ logo + "&" + chlid + "&" + usersInfo.getUserId() + "&" + user.getUsername() + "&" + usersInfo.getInviteUserid() + "&" + Utils.getCdnIpAddr(request);
		Map<String, Object> paras = new HashMap<>();
		paras.put("chlUserid", uid);
		paras.put("chlUsername", uname);
		paras.put("logo", logo);
		paras.put("chlid", chlid);
		paras.put("userid", usersInfo.getUserId());
		paras.put("userloginid",usersInfo.getLoginId());
		paras.put("username", user.getUsername());
		if(usersInfo.getInviteUserid() != null){
			paras.put("inviteUserid", usersInfo.getInviteUserid());
		}
		paras.put("ip", Utils.getCdnIpAddr(request));
		JSONObject jsonObject = JSONUtils.toJSONObject(paras);
		String jsonString = JSONUtils.toJSONString(jsonObject);
		activemqSendMessage.sendMessage(queueDestinationRegist, jsonString);
		
		// 注册红包
/*		actBonusUsersService.saveActBonusUsers(usersInfo.getHjsUserBase()
				.getId(), usersInfo.getInviteUserid(), Utils
				.getCdnIpAddr(request));*/

		return registerSuccess(model, user);
	}

	/**
	 * 注册成功后，保存会员信息，跳转成功页面
	 * 
	 * @param model
	 * @param user
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月16日
	 */
	private String registerSuccess(ModelMap model, AbUser user) {

		// 保存会员相关信息session
		AbUserQuery hjsUserQuery = new AbUserQuery();
		hjsUserQuery.setUsername(user.getUsername());
		hjsUserQuery.setPassword(user.getPassword());
		AbUser u = userService.getSysUserByNameAndPwd(hjsUserQuery);
		AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(u
				.getId());
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_USER, u);
		// shiro加入身份验证
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(
				u.getUsername(), u.getPassword());

		try {
			subject.login(token);
		} catch (AuthenticationException e) {
			e.printStackTrace();
		}

		// 保存登录日志
		AbUsersLog usersLog = new AbUsersLog();
		usersLog.setContent("登陆");
		usersLog.setResult(1);
		usersLog.setUserId(u.getId());
		usersLog.setCreateIp(Utils.getCdnIpAddr(getRequest()));
		usersLog.setTypeId(1);
		usersLog.setCreateTime(new Date());
		usersLogService.saveObj(usersLog);
		session.setAttribute(Const.SESSION_USERCUSTOMER, usersInfo);
		return "redirect:/";
	}
	/**
	 * 注册成功提示页
	 * @methodname registerOk  
	 * @discription 注册成功提示页 
	 * @return String
	 * @author liuj
	 * @date 2015年10月23日
	 */
	@RequestMapping(value="/register/success")
	public String registerOk(ModelMap model){
		//读取邀请码
		if(getLoginUser()!=null){
			AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(getLoginUser().getId());
			model.addAttribute("inviteCode",usersInfo.getInviteCode());
		}
		return display("register_ok");
	}
	
	
	@RequestMapping(value="/regAgreement")
	public String regAgreement(ModelMap model){
		return display("regAgreement");
		
	}
	
	/**
	 * 判断用户是否唯一
	 * @param user
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月28日
	 */
	@RequestMapping(value="/register/hasU")
	public void hasUsername(AbUser user,PrintWriter out){
		try{
			if(!userService.isUnique(user,"username")){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	/**
	 * 判断邮箱是否唯一
	 * @param user
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月28日
	 */
	@RequestMapping(value="/register/hasE")
	public void hasEmail(AbUser user,PrintWriter out){
		try{
			if(!userService.isUnique(user,"email")){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	/**
	 * 判断手机是否唯一
	 * @param user
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月28日
	 */
	@RequestMapping(value="/register/hasP")
	public void hasPhone(AbUser user,PrintWriter out){
		try{
			if(!userService.isUnique(user,"phone")){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
}
