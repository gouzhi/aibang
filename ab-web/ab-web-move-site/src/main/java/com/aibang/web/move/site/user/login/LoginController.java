package com.aibang.web.move.site.user.login;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.business.api.user.user.UsersLogService;
import com.aibang.framework.common.model.ResultModel;
import com.aibang.framework.utils.AppUtil;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.PageData;
import com.aibang.framework.utils.http.ResponseUtils;
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
public class LoginController extends UserController {

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "usersInfoService")
	private UsersInfoService usersInfoService;
	@Resource(name = "usersLogService")
	private UsersLogService usersLogService;

	private String display(String pageName) {
		return "user/login/" + pageName;
	}

	/**
	 * 访问登录页
	 * @methodname toLogin  
	 * @discription 访问登录页 
	 * @return String
	 * @author liuj
	 * @date 2016年3月4日
	 */
	@RequestMapping(value = "/login",method=RequestMethod.GET)
	public String toLogin() { 
		return display("land");
	}
	/**
	 * 提交登录
	 * @methodname login  
	 * @discription 提交登录 
	 * @param username 用户名
	 * @param password 密码
	 * @param code 验证码
	 * @return
	 * @throws Exception Object
	 * @author liuj
	 * @date 2016年3月4日
	 */
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	@ResponseBody
	public Object login(String username,String password,String autoLogin,String code) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		String message = "success";
		if(StringUtils.isBlank(username))
		{
			message="用户名不能为空";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
		}
		if(StringUtils.isBlank(password))
		{
			message="密码不能为空";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
		}
		if(StringUtils.isBlank(code))
		{
			message="验证码不能为空";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
		}
		/*===bobo
		String sessionCode = (String) getSession().getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
		
		if (!sessionCode.equalsIgnoreCase(code)) 
		{
			message="验证码不正确";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
		} 
		*/
	    AbUser hjsUser = userService.getByName(username);//通过用户名得到用户数据
	    if(hjsUser==null)
	    {
	    	message="用户名或密码不正确";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
	    }
		String passwd = new SimpleHash("SHA-1", hjsUser.getUsername(), password).toString();				
	 	if(!hjsUser.getPassword().equals(passwd))
	 	{
	 		message="用户名或密码不正确";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
	 	} 
		if(hjsUser.getStatus()!=1){
			message = "该用户已停用";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
		}
		// shiro加入身份验证
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);							 
		token.setRememberMe(StringUtils.isBlank(autoLogin)?false:autoLogin.equals("true"));	
		try {
			//固定session攻击安全漏洞  https://issues.apache.org/jira/browse/SHIRO-170
			subject.getSession().stop();
			subject.login(token);
			// shiro管理的session
			Session session = getSession();
			// 获取会员详细信息，会员账户信息
			AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(hjsUser.getId());
			session.setAttribute(Const.SESSION_USERCUSTOMER,usersInfo);
			session.setAttribute(Const.SESSION_USER, hjsUser);
		} catch (AuthenticationException e) {
			message = "身份验证失败！";
			map.put("result", message);
			return AppUtil.returnObject(new PageData(), map);
		}
		//保存登录日志
		AbUsersLog usersLog = new AbUsersLog();
		usersLog.setContent("登陆");
		usersLog.setResult(1);
		usersLog.setUserId(hjsUser.getId());
		usersLog.setCreateIp(Utils.getCdnIpAddr(getRequest()));
		usersLog.setTypeId(1);
		usersLog.setCreateTime(new Date());
		usersLogService.saveObj(usersLog);
		map.put("result", message);
		return AppUtil.returnObject(new PageData(), map);
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
		mv.setViewName(display("land"));
		mv.addObject("pd", pd);
		return mv;
	}
	

	/**
	 * 加载注册页
	 * 
	 * @return String
	 * @author zhangyong
	 * @date 2015年10月21日
	 */
	@RequestMapping(value = "/toReg")
	public String toRegister(ModelMap model, String inviteCode) {
		model.addAttribute("inviteCode", inviteCode);
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
	@RequestMapping(value = "/reg")
	public String registerCustomer(ModelMap model, AbUser user,
			String invitecode, String phonecode, HttpServletRequest request,
			HttpServletResponse response) {
		
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
		usersInfo.setAbUser(user);// 设置登录信息
		usersInfo.setAbUserBase(userBase);// 设置账户信息
		usersInfo.setLastTime(new Date());// 最后登录时间
		usersInfo = usersInfoService.registerUser(usersInfo);

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
		return "redirect:register_ok";
	}
	/**
	 * 注册成功提示页
	 * @methodname registerOk  
	 * @discription 注册成功提示页 
	 * @return String
	 * @author liuj
	 * @date 2015年10月23日
	 */
	@RequestMapping(value="/register_ok")
	public String registerOk(ModelMap model){
		//读取邀请码
		if(getLoginUser()!=null){
			AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(getLoginUser().getId());
			model.addAttribute("inviteCode",usersInfo.getInviteCode());
		}
		return display("register_ok");
	}
	
	/**
	 * 异步加载注册模块
	 * @param model
	 * @param inviteCode
	 * @return String
	 * @author zhangyong
	 * @date 2015年12月16日
	 */
	@RequestMapping(value="/loadReg")
	public String loadRegisterForm(ModelMap model,String inviteCode){
		model.addAttribute("inviteCode", inviteCode);		
		return display("regMod");
	}
	
	
	@RequestMapping(value="/regcommon.js")
	public void regCommon(ModelMap model,javax.servlet.http.HttpServletResponse response){
		String jsString = "$(document).ready(function(){$('#reg_form').load('http://"+Const.WEB_NAME+Const.WEB_DOMAIN+Const.PROJECT_NAME+"/loadReg',function(){});});";
		ResponseUtils.renderText(response, "UTF-8", jsString);
	}
	
	@Autowired
	private SpringRedisCacheService springRedisCacheService;
	/**
	 * 会员注册（异步）
	 * @param model
	 * @param user 用户注册相关对象
	 * @param invitecode  邀请码等
	 * @param phonecode 手机验证码
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年12月16日
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/regAct")
	@ResponseBody
	public String registForAjax(ModelMap model, AbUser user,
			String invitecode, String phonecode, HttpServletRequest request,
			HttpServletResponse response){
		ResultModel rsModel=new ResultModel();
		rsModel.setState("0");
		if (ValidateUtils.isStringEmpty(user.getPhone())) {
			rsModel.setMsg("手机号不能为空");
			rsModel.setState("1");
			return rsModel.toJsonString();
		}
		if (ValidateUtils.isStringEmpty(user.getPassword())) {
			rsModel.setMsg("密码不能为空");
			rsModel.setState("1");
			return rsModel.toJsonString();
		}
		String code = (String)springRedisCacheService.get("reg_"+user.getPhone());
		if (springRedisCacheService.get("reg_"+user.getPhone()) == null) {
			rsModel.setMsg("手机验证码未获取或已失效");
			rsModel.setState("1");
			return rsModel.toJsonString();
		}
		
		
		if(!code.equals(phonecode.trim())){
			rsModel.setMsg("手机验证码不正确");
			rsModel.setState("1");
			return rsModel.toJsonString();
		}
		//验证完毕，销毁验证码
		springRedisCacheService.delete("reg_"+user.getPhone());
		
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
		usersInfo.setAbUser(user);// 设置登录信息
		usersInfo.setAbUserBase(userBase);// 设置账户信息
		usersInfo.setLastTime(new Date());// 最后登录时间
		usersInfo = usersInfoService.registerUser(usersInfo);
		rsModel.setMsg(usersInfo.getInviteCode());
		return rsModel.toJsonString();		
	}
	/**
	 * 异步注册成功，跳转成功提示页
	 * @param model
	 * @param inviteCode
	 * @return String
	 * @author zhangyong
	 * @date 2015年12月16日
	 */
	@RequestMapping(value="/regSuccess")
	public String regActSuccess(ModelMap model,String code){
		model.addAttribute("inviteCode",code);
		return display("register_ok");
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

}
