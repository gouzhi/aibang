/**   
 * @Title: LoginController.java 
 * @Package com.cifex.front.controller.user.login 
 * @Description: 用户登录
 * @author liuj    
 * @date 2015-7-29 下午2:15:57 
 * Copyright CIFEX Corporation 2015   
 * 版权所有  
 * @version V1.0   
*/ 
package com.aibang.web.front.site.user.login;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aibang.business.api.user.approve.ApproveEmailActiveService;
import com.aibang.business.api.user.message.UsersMessageService;
import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.business.api.user.user.UsersLogService;
import com.aibang.framework.activemq.SendMessage;
import com.aibang.framework.utils.AppUtil;
import com.aibang.framework.utils.Base64Utils;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.CookiesUtil;
import com.aibang.framework.utils.DateUtils;
import com.aibang.framework.utils.JSONUtils;
import com.aibang.framework.utils.MD5;
import com.aibang.framework.utils.PageData;
import com.aibang.framework.utils.Tools;
import com.aibang.framework.utils.ip.Utils;
import com.aibang.framework.utils.redis.SpringRedisCacheService;
import com.aibang.framework.utils.validate.ValidateUtils;
import com.aibang.transfer.model.dto.AbApproveEmailActive;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.dto.AbUsersInfo;
import com.aibang.transfer.model.dto.AbUsersLog;
import com.aibang.transfer.model.vo.AbUserQuery;
import com.aibang.web.front.site.base.UserController;
 

/** 
 * @ClassName: LoginController
 * @Description: 用户登录
 * @author liuj
 * @date 2015-7-29 下午2:15:57
 * Copyright CIFEX Corporation 2015  
 */
@Controller
public class LoginController extends UserController {
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "usersInfoService")
	private UsersInfoService usersInfoService;
	@Resource(name = "usersLogService")
	private UsersLogService usersLogService;
	@Resource(name = "approveEmailActiveService")
	private ApproveEmailActiveService approveEmailActiveService;
	@Resource(name = "usersMessageService")
	private UsersMessageService usersMessageService;
	@Autowired
    private Destination queueDestinationLogin;
    @Autowired
    private Destination queueDestinationRegist;
    @Autowired
    @Qualifier("activemqSendMessage")
    private SendMessage activemqSendMessage;
	private String display(String pageName)
	{
		return  "user/login/"+pageName;
	} 
	/**
	 * 访问登录页
	 * @return
	 * @throws Exception ModelAndView
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value="/login")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName(display("login"));
		mv.addObject("pd",pd);
		getRequest().getSession().setAttribute("referer", getRequest().getHeader("referer"));
		return mv;
	}
	/**
	 * 请求登录，验证会员信息
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value = "/login_login", produces = "application/json;charset=UTF-8")
	public Object login() throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();//页面对象
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").split(",fh,");//前台传来的数据用户名，密码，验证码	用,fh,隔开	
		String aotoLoginString =pd.getString("autoLogin");//自动登录标识
		//获取数据非空判断及位数判断
		if (null != KEYDATA && KEYDATA.length == 3) {
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			
			String sessionCode = (String) currentUser.getSession().getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码

			String code = KEYDATA[2];//用户输入的验证码
			//验证码校验
			if (null == code || "".equals(code)) {
				errInfo = "nullcode"; // 验证码为空
			} else {
				String USERNAME = KEYDATA[0];
				String PASSWORD = KEYDATA[1];
				pd.put("USERNAME", USERNAME);
				if (Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)) {
					AbUser nameUser = userService.getByName(USERNAME);//通过用户名得到用户数据
					if(nameUser != null){
						String passwd =  new SimpleHash("SHA-1", nameUser.getUsername(), PASSWORD).toString(); // 密码加密
						pd.put("PASSWORD", passwd);
						AbUserQuery query = new AbUserQuery();
						query.setUsername(USERNAME);
						query.setPassword(passwd);
						AbUser u = userService.getSysUserByNameAndPwd(query);//通过用户输入的用户名跟密码做校验
						if (u != null) {
							if(u.getStatus()==1){	
								//查询消息数
								Integer unreadMessageCount= usersMessageService.getUnreadMessageCount(u.getId());
								pd.put("LAST_LOGIN", DateUtils.getTime().toString());
								// shiro加入身份验证
								Subject subject = SecurityUtils.getSubject();
								UsernamePasswordToken token = new UsernamePasswordToken(
									USERNAME, PASSWORD);							 
								token.setRememberMe(aotoLoginString.equals("true"));			 
								try {
									//固定session攻击安全漏洞  https://issues.apache.org/jira/browse/SHIRO-170
									subject.getSession().stop();
									subject.login(token);
									Session session = currentUser.getSession();
									session.setAttribute("unreadMessageCount", unreadMessageCount);
									session.setAttribute(Const.SESSION_USER, u);
									session.removeAttribute(Const.SESSION_SECURITY_CODE);
									AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(u.getId());
									session.setAttribute(Const.SESSION_USERCUSTOMER,usersInfo);
								} catch (AuthenticationException e) {
									errInfo = "身份验证失败！";
								}
								//保存登录日志
								AbUsersLog usersLog = new AbUsersLog();
								usersLog.setContent("登陆");
								usersLog.setResult(1);
								usersLog.setUserId(u.getId());
								usersLog.setCreateIp(Utils.getCdnIpAddr(getRequest()));
								usersLog.setTypeId(1);
								usersLog.setCreateTime(new Date());
								usersLogService.saveObj(usersLog);
							}else{
								errInfo = "statuserror";
							}
						} else {
							errInfo = "usererror"; // 用户名或密码有误
						}
					}else{
						errInfo = "usererror"; // 用户名或密码有误
					}
				} else {
					errInfo = "codeerror"; // 验证码输入有误
				}
				if (Tools.isEmpty(errInfo)) {
					errInfo = "success"; // 验证成功
				}
			}
		} else {
			errInfo = "error"; // 缺少参数
		}
		
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 加载头部页面，该请求不需要拦截（CMS需要）
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月29日
	 */
	@RequestMapping(value="/loadtop")
	public String loadtop(ModelMap model){
		model.addAttribute("top","top");
		return "common/commonTop";
	}
	/**
	 * 加载服务协议页面
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value="/serAgreement")
	public ModelAndView toAgreementService(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();//页面对象
		pd = this.getPageData();
		mv.setViewName(display("agreement_service"));//跳转到的页面
		mv.addObject("pd",pd);
		return mv;
	}
	/**
	 * 加载注册协议页面
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value="/regAgreement")
	public ModelAndView toAgreementRegister(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();//页面对象
		pd = this.getPageData();
		mv.setViewName(display("agreement_register"));//跳转到的页面
		mv.addObject("pd",pd);
		return mv;
	}
	/**
	 * 加载个人隐私保护协议页面
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value="/proAgreement")
	public ModelAndView toAgreementProtect(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();//页面对象
		pd = this.getPageData();
		mv.setViewName(display("agreement_protect"));//跳转到的页面
		mv.addObject("pd",pd);
		return mv;
	}
	/**
	 * 用户注销(头部注销)
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value = "/toplogout")
	public String toplogout() {

		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_USERCUSTOMER);
		session.removeAttribute(Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(Const.SESSION_allmenuList);
		session.removeAttribute(Const.SESSION_menuList);
		session.removeAttribute(Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute("changeMenu");

		// shiro销毁登录
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "common/commonTop";
	}
	/**
	 * 用户注销
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_USERCUSTOMER);
		session.removeAttribute(Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(Const.SESSION_allmenuList);
		session.removeAttribute(Const.SESSION_menuList);
		session.removeAttribute(Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute("changeMenu");

		// shiro销毁登录
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		subject.getSession().stop();
		pd = this.getPageData();
		String msg = pd.getString("msg");
		pd.put("msg", msg);
		mv.setViewName(display("login"));
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 跳转到会员注册页面
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月16日
	 */
	@RequestMapping(value="/toReg")
	public String toRegisterCustomer(ModelMap model,HttpServletRequest request,HttpServletResponse response,String inviteCode,String uid,String uname ,String chlid,String logo){
		
		//将渠道用户参数缓存cookie
		if(StringUtils.isNotBlank(chlid) || StringUtils.isNotBlank(inviteCode)){
			CookiesUtil.set("uid", uid, 1800, response);
			CookiesUtil.set("uname", uname, 1800, response);
			CookiesUtil.set("chlid", chlid, 1800, response);
			CookiesUtil.set("logo", logo, 1800, response);
			CookiesUtil.set("inviteCode", inviteCode, 1800, response);
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
		String inviteCodeC = CookiesUtil.get("inviteCode", request);
		
		model.addAttribute("inviteCode",inviteCodeC);
		model.addAttribute("uid", uidC);
		model.addAttribute("uname", unameC);
		model.addAttribute("chlid", chlidC);
		model.addAttribute("logo", logoC);
		return display("register");
	}
	/**
	 * 注册会员信息
	 * @param model
	 * @param user 会员登录信息
	 * @param code 验证码
	 * @param invitecode 邀请码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月23日
	 */
	@RequestMapping(value="/reg")
	public String registerCustomer(ModelMap model,AbUser user,String uid,String uname ,String chlid,String logo,String code,String invitecode,String phonecode,HttpServletRequest request,HttpServletResponse response){
		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		//验证码验证
		if (null == code || "".equals(code)) {
			error("验证码为空", request, response);
			return null;
		}else{
			//信息服务端验证
			/*if (ValidateUtils.isStringEmpty(user.getUsername())){
				error("请填写登录名", request, response);
				return null;
			}*/
			if (ValidateUtils.isStringEmpty(user.getPassword())){
				error("请填写密码", request, response);
				return null;
			}
			if (ValidateUtils.isStringEmpty(user.getPhone())){
				error("请填写手机", request, response);
				return null;
			}
			if(request.getSession().getAttribute("regCode")==null)
			{
				error("请获取手机验证码", request, response);
				return null;
			}
			//后台验证手机号是否跟用户名冲突
			AbUser hjsUserV = new AbUser();
			hjsUserV.setUsername(user.getPhone());
			if(!userService.isUnique(hjsUserV,"username")){
				error("手机已经被注册", request, response);
				return null;
			}
			//验证手机验证码
			String codeString = request.getSession().getAttribute("regCode").toString();
			Date codeTime = (Date)request.getSession().getAttribute("regTime");
			String phoneString = request.getSession().getAttribute("regPhone").toString();
			long diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
			if(!codeString.equals(phonecode)||diff>30||!phoneString.equals(user.getPhone())){
				error("手机校验码不正确", request, response);
				return null; 
			}
			AbUsersInfo usersInfo = new AbUsersInfo();
			AbUserBase userBase = new AbUserBase();
			//会员账户预设置
			userBase.setCreateIp(Utils.getCdnIpAddr(request));//创建IP
			userBase.setCreateTime(new Date());//创建时间
			userBase.setTypeId(3);//用户类型1管理员 2企业用户3会员
			userBase.setUsername(user.getPhone());//登录名
			
			//会员登陆信息预设置
			user.setCreateIp(Utils.getCdnIpAddr(request));//创建IP
			user.setCreateTime(new Date());//创建时间
			user.setTypeId(3);//用户类型1管理员 2企业用户3会员
			user.setStatus(1);//用户状态1有效用户2停用用户
			user.setIsDel(0);//是否删除1删除0不删除
			user.setEmailStatus(0);//邮箱状态默认0未验证1验证通过
			user.setRealNameStatus(0);//实名状态默认0未验证1验证通过
			user.setUsername(user.getPhone());
			user.setPassword(new SimpleHash("SHA-1",user.getPhone(),user.getPassword()).toString());//登录密码
			
			//会员信息
			usersInfo.setInviteCode(invitecode);//邀请码
			usersInfo.setAbUser(user);//设置登录信息
			usersInfo.setAbUserBase(userBase);//设置账户信息
			usersInfo.setLastTime(new Date());//最后登录时间
			usersInfo = usersInfoService.registerUser(usersInfo);//注册会员
			
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
			
			/*if(null != uid && null != chlid && null != logo){
				HjsUsersChannelRecord hjsUsersChannelRecord = new HjsUsersChannelRecord();
				hjsUsersChannelRecord.setTypeNo(0);
				hjsUsersChannelRecord.setChlUserid(Integer.parseInt(uid));
				hjsUsersChannelRecord.setChlUsername(user.getUsername());
				hjsUsersChannelRecord.setLogo(logo);
				hjsUsersChannelRecord.setChlid(Integer.parseInt(chlid));
				hjsUsersChannelRecord.setUserid(usersInfo.getUserId());
				hjsUsersChannelRecord.setUsername(user.getUsername());
				hjsUsersChannelRecord.setCreateTime(new Date());
				hjsUsersChannelRecord = usersChannelRecordService.saveObj(hjsUsersChannelRecord);
				
				//注册回调通知
			}*/
			
			//注册红包
//			actBonusUsersService.saveActBonusUsers(usersInfo.getHjsUserBase().getId(), usersInfo.getInviteUserid(), Utils.getCdnIpAddr(request));
			
		}		
		return registerSuccess(model,user);
	}
	
	/**
	 * 注册成功后，保存会员信息，跳转成功页面
	 * @param model
	 * @param user
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月16日
	 */
	private String  registerSuccess(ModelMap model,AbUser user){
		
		//保存会员相关信息session
		AbUserQuery hjsUserQuery = new AbUserQuery();
		hjsUserQuery.setUsername(user.getUsername());
		hjsUserQuery.setPassword(user.getPassword());
		AbUser u = userService.getSysUserByNameAndPwd(hjsUserQuery);	
		AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(u.getId());
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_USER, u);
		Integer loginUserId=getLoginUser().getId();
		Integer unreadMessageCount= usersMessageService.getUnreadMessageCount(loginUserId);
		session.setAttribute("unreadMessageCount", unreadMessageCount);
		// shiro加入身份验证
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(
			u.getUsername(), u.getPassword());
		 
		try {
			subject.login(token);
		} catch (AuthenticationException e) {
			e.printStackTrace();
		}
	
		//保存登录日志
		AbUsersLog usersLog = new AbUsersLog();
		usersLog.setContent("登陆");
		usersLog.setResult(1);
		usersLog.setUserId(u.getId());
		usersLog.setCreateIp(Utils.getCdnIpAddr(getRequest()));
		usersLog.setTypeId(1);
		usersLog.setCreateTime(new Date());
		usersLogService.saveObj(usersLog);
		session.setAttribute(Const.SESSION_USERCUSTOMER,usersInfo);
		return "redirect:register_success";
	}
	
	/**
	 * 注册成功提示页
	 * @methodname registerOk  
	 * @discription 注册成功提示页 
	 * @return String
	 * @author liuj
	 * @date 2015年10月23日
	 */
	@RequestMapping(value="/register_success")
	public String registerOk(){
		return display("register_success");
	}
	
	/**
	 * 加载找回密码页
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	@RequestMapping(value="/toFindPass")
	public String toFindPass(){
		return display("confirmuser");
	}
	/**
	 * 验证用户并且跳转到验证页（找回密码前用）
	 * @param model
	 * @param name 用户输入的用户名或者手机或者邮箱
	 * @param code 验证码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	@RequestMapping(value="/toValidate")
	public String toValidate(ModelMap model,String name,String code,HttpServletRequest request,HttpServletResponse response){
		//帐号验证
		if (ValidateUtils.isStringEmpty(name)){
			error("请输入手机/邮箱", request, response);
			return null;
		}
		//验证码
		if (ValidateUtils.isStringEmpty(code)){
			error("请输入验证码", request, response);
			return null;
		}

		AbUser user = userService.getByName(name);
		//用户信息是否存在
		if(user==null){
			error("用户信息不存在或者用户已经停用，请与客服联系", request, response);
			return null;
		}
		//手机号显示效果字段
		String phoneShowString = "";
		if(user.getPhone()!=null&&!user.getPhone().equals("")&&user.getPhoneStatus()==1){
			
			phoneShowString = user.getPhone().substring(0,3)+"*****"+user.getPhone().substring(user.getPhone().length()-3, user.getPhone().length());
		}
		//邮箱显示效果字段
		String emailShowString = "";
		if(user.getEmail()!=null&&!user.getEmail().equals("")&&user.getEmailStatus()==1){
			
			emailShowString = user.getEmail().substring(0,1)+"*****"+user.getEmail().substring(user.getEmail().indexOf("@"));
		}
		model.addAttribute("user",user);
		model.addAttribute("phone",phoneShowString);
		model.addAttribute("email",emailShowString);
		return display("validateuser");
	}
	/**
	 * 手机验证用户，通过后跳转修改密码页
	 * @param model
	 * @param userId 用户登录ID
	 * @param code 验证码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	@RequestMapping(value="/phoneValidate")
	public String phoneValidate(ModelMap model,Integer userId,String code,HttpServletRequest request,HttpServletResponse response){
		if (ValidateUtils.isStringEmpty(code)){
			error("请输入验证码", request, response);
			return null;
		}
		AbUser user = userService.getById(userId);
		if(request.getSession().getAttribute("passCode")==null)
		{
			error("请获取手机验证码", request, response);
			return null;
		}
		String codeString = request.getSession().getAttribute("passCode").toString();
		Date codeTime = (Date)request.getSession().getAttribute("passTime");
		String phoneString = request.getSession().getAttribute("passPhone").toString();
		long diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
		if(!codeString.equals(code)||diff>30||!user.getPhone().equals(phoneString)){
			error("手机校验码不正确", request, response);
			return null;
		}
		request.getSession().setAttribute("passCode", null);
		request.getSession().setAttribute("resetUserId",user.getId());
		model.addAttribute("user", user);
		return display("resetpass");
	}
	
	/**
	 * 邮件模版
	 */
	@Autowired
	private VelocityEngine velocityEngine;
	@Autowired
	private SpringRedisCacheService springRedisCacheService;
	@RequestMapping(value="/sendEmail")
	public String sendValidateEmail(ModelMap model,Integer userId,HttpServletRequest request,HttpServletResponse response) throws Exception{
		if (ValidateUtils.isStringEmpty(userId+"")){
			error("参数错误", request, response);
			return null;
		}
		AbUser user = userService.getById(userId);
		
		int times = 0;
		//判断找回密码次数，每天超过5次不做操作
		if(springRedisCacheService.get("reset_"+user.getId())!=null){			
			times =Integer.parseInt(springRedisCacheService.get("reset_"+user.getId()).toString());
			if(times>5){
				error("每天最多可找回密码5次，您已经超出", request, response);
				return null;
			}
		}

		String email = user.getEmail();
		if(ValidateUtils.isStringEmpty(email)){
			error("邮箱异常", request, response);
			return null;
		}
		
		String timeString = DateUtils.getTime();//获得时间戳字符串
		String validatePassword= MD5.md5(user.getUsername()+email+timeString+user.getPassword());
		//拼接用户名+邮箱+时间戳字符串作为激活ID
		String activateString = Base64Utils.encodeStr(user.getUsername()+"####"+email+"####"+timeString+"####"+validatePassword);
		
		Map<String, Object> mm = new HashMap<String, Object>();
		mm.put("activateUrl", activateString);
		mm.put("emailAction", "emailValidate");
		mm.put("domain", Const.WEB_NAME+Const.WEB_DOMAIN);
		mm.put("projectName", Const.PROJECT_NAME);
	 
		
		//装载邮件页面模版
		String emailText = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "velocity/mail_template.vm", "UTF-8", mm);
		//保存最多修改密码次数
		times+=1;
		Date nowTime = new Date();
		String nowTimeString = DateUtils.dateToString(nowTime,"yyyy-MM-dd HH:mm:ss");
		String lastTimeString = nowTimeString.substring(0,10)+" 23:59:59";
		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date end = dfs.parse(lastTimeString);
		long between=(end.getTime()-nowTime.getTime())/1000;
		springRedisCacheService.set("reset_"+user.getId(), times,(int)between);
		
		
		model.addAttribute("email",email);
		model.addAttribute("emailShow",email.substring(0,2)+"******@"+email.substring(email.indexOf("@")));
		model.addAttribute("mailUrl","http://mail."+email.substring(email.indexOf("@")+1));
		model.addAttribute("userId",user.getId());
		return display("emailsend");
	}
	/**
	 * 验证邮件
	 * @param model
	 * @param kid 验证信息码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	@RequestMapping(value="/emailValidate")
	public String emailValidate(ModelMap model,String kid,HttpServletRequest request,HttpServletResponse response){
		if(ValidateUtils.isStringEmpty(kid)){
			error("参数错误", request, response);
			return null;
		}
		String infoString = Base64Utils.decodeStr(kid);
		String[] infos = infoString.split("####"); 
		if(infos.length!=4){
			error("参数错误", request, response);
			return null;
		}
		//激活邮件发送时间
		Date vDate = DateUtils.fomatDate(infos[2]);
		//当前时间
		Date nDate = DateUtils.fomatDate(DateUtils.getTime());
		Long datesub = DateUtils.getHourSub(infos[2],DateUtils.getTime());
		DateUtils.compareDate(vDate, nDate);
		AbUser user = userService.getByUsername(infos[0]);
		//用户不存在及邮件失效处理
		if(user==null){
			error("激活用户不存在，激活失败", request, response);
			return null;
		}else if(!user.getEmail().equals(infos[1])||datesub>120){
			error("邮箱异常或激活邮件失效，激活失败", request, response);
			return null;
		}
		if(!MD5.md5(infos[0]+infos[1]+infos[2]+user.getPassword()).equals(StringUtils.trim(infos[3])))
		{
			error("邮箱认证失败", request, response);
			return null;
		}
		request.getSession().setAttribute("resetUserId",user.getId());
		model.addAttribute("user", user);
		return display("resetpass");
	}
	/**
	 * 重设密码
	 * @param model
	 * @param newPass 新密码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月25日
	 */
	@RequestMapping(value="/resetPass")
	public String editPass(ModelMap model,String newPass,Integer passwordLevel,HttpServletRequest request,HttpServletResponse response){
		if (ValidateUtils.isStringEmpty(newPass)){
			error("请填写新密码", request, response);
			return null;
		}
		if(request.getSession().getAttribute("resetUserId")==null)
		{
			error("重设密码失败，请稍后再试", request, response);
			return null;
		}
		Integer userId=(Integer) request.getSession().getAttribute("resetUserId");
		AbUser user = userService.getById(userId);
		newPass = new SimpleHash("SHA-1",user.getUsername(),newPass).toString();//密码加密
		user.setPassword(newPass);
		user.setPasswordLevel(passwordLevel);
		userService.updateCustomerPass(user);
		return display("resetpass_ok");
	}
	/**
	 * 判断用户是否唯一
	 * @param user
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月28日
	 */
	@RequestMapping(value="/hasU")
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
	@RequestMapping(value="/hasE")
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
	@RequestMapping(value="/hasP")
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
	/**
	 * 验证邮箱激活邮件
	 * @param kid 激活信息码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月18日
	 */
	@RequestMapping(value="/activateEmail")
	public String activateEmail(String kid,HttpServletRequest request,HttpServletResponse response){
		if(ValidateUtils.isStringEmpty(kid)){
			error("参数错误", request, response);
			return "user/customer/activatemail_no";
		}
		String infoString = Base64Utils.decodeStr(kid);
		String[] infos = infoString.split("####"); 
		if(infos.length!=3){
			error("参数错误", request, response);
			return "user/customer/activatemail_no";
		}
		Date vDate = DateUtils.fomatDate(infos[2]);
		Date nDate = DateUtils.fomatDate(DateUtils.getTime());
		Long datesub = DateUtils.getHourSub(infos[2],DateUtils.getTime());
		DateUtils.compareDate(vDate, nDate);
		AbUser user = userService.getByUsername(infos[0]);
		
		if(user==null){
			error("用户不存在，验证失败", request, response);
			return "user/customer/activatemail_no";
		}else if(!user.getEmail().equals(infos[1])||datesub>120){
			error("邮箱异常或验证邮件失效，验证失败", request, response);
			return "user/customer/activatemail_no";
		}
		//验证成功，修改相关激活状态
		AbApproveEmailActive hjsApproveEmailActive = new AbApproveEmailActive();
		hjsApproveEmailActive.setUserId(user.getId());
		hjsApproveEmailActive.setEmail(user.getEmail());
		hjsApproveEmailActive.setCreateIp(Utils.getCdnIpAddr(request));
		approveEmailActiveService.activateEmail(hjsApproveEmailActive);
		//激活成功，自动登录用户
		user.setEmailStatus(1);
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_USER, user);
		AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(user.getId());
		session.setAttribute(Const.SESSION_USERCUSTOMER, usersInfo);
		return "user/customer/activatemail_ok";
	}
	/**
	 * 异步验证手机验证码
	 * @param u 用户ID(可以空)
	 * @param t 验证类型
	 * @param ph 手机号
	 * @param co 用户输入的验证码
	 * @param out
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年11月11日
	 */
	@RequestMapping(value="/vphonecode")
	public void validatePhoneCode(Integer u,String t,String ph,String co,PrintWriter out,HttpServletRequest request,HttpServletResponse response){
		if(u!=null){
			AbUser user = userService.getById(u);
			ph=user.getPhone();
		}
		String codeString = "";
		Date codeTime = null;
		String phoneString = "";
		long diff = 0;
		String result = "success";
		if(request.getSession().getAttribute(t+"Code")!=null){
			codeString = request.getSession().getAttribute(t+"Code").toString();//手机验证码
			codeTime = (Date)request.getSession().getAttribute(t+"Time");//获取验证码的时间
			phoneString = request.getSession().getAttribute(t+"Phone").toString();//获取的手机号
			diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
			if(request.getSession().getAttribute(t+"Code")==null)
			{
				result= "error1";//验证码不为空			
			}else if(!codeString.equals(co)||diff>30||!phoneString.equals(ph)){
				result = "error";//验证码不正确或失效
			}else{
				result = "success";//验证通过
			}
		}else{
			result = "error";//验证码未获取
		}
		try{
			out.write(result);
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
	/**
	 * 异步验证图片验证码
	 * @param code
	 * @param out
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年12月3日
	 */
	@RequestMapping(value="/vcode")
	public  void validateCode(String code,PrintWriter out,HttpServletRequest request,HttpServletResponse response){
		String sessionCode = (String) request.getSession().getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
		
		try{
			if(ValidateUtils.isStringEmpty(code)){
				out.write("error1");//验证码为空

			}else if(!code.toUpperCase().equals(sessionCode.toUpperCase())){
				out.write("error");//验证码不正确
			}else{
				out.write("success");//验证通过
			}
			request.getSession().removeAttribute(Const.SESSION_SECURITY_CODE);//验证完毕，清除session中的验证码
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
}
