package com.cifex.web.move.site.user.forget;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cifex.business.api.user.user.UserService;
import com.cifex.framework.utils.Base64Utils;
import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.DateUtils;
import com.cifex.framework.utils.MD5;
import com.cifex.framework.utils.redis.SpringRedisCacheService;
import com.cifex.framework.utils.validate.ValidateUtils;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.web.move.site.base.UserController;
/**
 * 忘记密码
 * @classname ForgetController    
 * @description 忘记密码 
 * @author liuj    
 * @date 2016年3月7日
 */
@Controller
public class ForgetController extends UserController {
	
	@Resource(name = "userService")
	private UserService userService;
	
	private String display(String pageName)
	{
		return  "user/forget/"+pageName;
	} 
	
	/**
	 * 加载找回密码页
	 * @methodname toFindPass  
	 * @discription 加载找回密码页 
	 * @return String
	 * @author liuj
	 * @date 2016年3月7日
	 */
	@RequestMapping(value="/toFindPass")
	public String toFindPass(){
		return display("forget");
	}
	
	 
	/**
	 * 验证用户并且跳转到验证页（找回密码前用）
	 * @methodname toValidate  
	 * @discription 验证用户并且跳转到验证页（找回密码前用） 
	 * @param model
	 * @param name 户输入的用户名或者手机或者邮箱
	 * @param code 验证码
	 * @param request
	 * @param response
	 * @return String
	 * @author liuj
	 * @date 2016年3月8日
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
		if(!getSession().getAttribute(Const.SESSION_SECURITY_CODE).toString().equalsIgnoreCase(code))
		{
			error("验证码不正确", request, response);
			return null;
		}
		HjsUser user = userService.getByName(name);
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
		return display("safeValidate");
	}
	
	/**
	 * 手机验证用户，通过后跳转修改密码页
	 * @methodname phoneValidate  
	 * @discription 手机验证用户，通过后跳转修改密码页 
	 * @param model
	 * @param userId 用户ID
	 * @param code 验证码
	 * @param request
	 * @param response
	 * @return String
	 * @author liuj
	 * @date 2016年3月8日
	 */
	@RequestMapping(value="/phoneValidate")
	@ResponseBody
	public String phoneValidate(ModelMap model,Integer userId,String code,HttpServletRequest request,HttpServletResponse response){
		
		if (ValidateUtils.isStringEmpty(code)){
			return "请输入验证码";
		}
		if(request.getSession().getAttribute("passCode")==null)
		{
			return "请获取手机验证码";
		}
		String codeString = request.getSession().getAttribute("passCode").toString();
		Date codeTime = (Date)request.getSession().getAttribute("passTime");
		String phoneString = request.getSession().getAttribute("passPhone").toString();
		long diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
		
		HjsUser user = userService.getById(userId);
		if(!codeString.equals(code)||diff>30||!user.getPhone().equals(phoneString)){
			return "手机校验码不正确";
		}
		request.getSession().setAttribute("passCode", null);
		request.getSession().setAttribute("resetUserId",user.getId());
		model.addAttribute("user", user);
		return "0";
	}
	
	/**
	 * 密码重置页面
	 * @methodname resetpage  
	 * @discription 密码重置页面 
	 * @return String
	 * @author liuj
	 * @date 2016年5月10日
	 */
	@RequestMapping(value="/resetpage")
	public String resetpage() {
		return display("reset");
	}
	
	
	
	/**
	 * 邮件模版
	 */
	@Autowired
	private VelocityEngine velocityEngine;
	@Autowired
	private SpringRedisCacheService springRedisCacheService;
	/**
	 * 发送认证邮件
	 * @methodname sendValidateEmail  
	 * @discription 发送认证邮件 
	 * @param model
	 * @param userId
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception String
	 * @author liuj
	 * @date 2016年3月8日
	 */
	@RequestMapping(value="/sendEmail")
	public String sendValidateEmail(ModelMap model,Integer userId,HttpServletRequest request,HttpServletResponse response) throws Exception{
		if (ValidateUtils.isStringEmpty(userId+"")){
			error("参数错误", request, response);
			return null;
		}
		HjsUser user = userService.getById(userId);
		
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
		//拼接用户名+邮箱+时间戳字符串作为激活ID
		String activateString = Base64Utils.encodeStr(user.getUsername()+"####"+email+"####"+timeString);
		String validatePassword= MD5.md5(user.getUsername()+email+timeString+user.getPassword());
		Map<String, Object> mm = new HashMap<String, Object>();
		mm.put("activateUrl", activateString);
		mm.put("emailAction", "emailValidate");
		mm.put("domain", Const.WEB_NAME+Const.WEB_DOMAIN);
		mm.put("projectName", Const.PROJECT_NAME);
		mm.put("validatePassword", validatePassword);
		
		
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
		return display("emailVer");
	}
	/**
	 * 验证邮件
	 * @methodname emailValidate  
	 * @discription 验证邮件 
	 * @param model
	 * @param kid
	 * @param request
	 * @param response
	 * @return String
	 * @author liuj
	 * @date 2016年3月8日
	 */
	@RequestMapping(value="/emailValidate")
	public String emailValidate(ModelMap model,String kid,String code,HttpServletRequest request,HttpServletResponse response){
		if(ValidateUtils.isStringEmpty(kid)){
			error("参数错误", request, response);
			return null;
		}
		String infoString = Base64Utils.decodeStr(kid);
		String[] infos = infoString.split("####"); 
		if(infos.length!=3){
			error("参数错误", request, response);
			return null;
		}
		//激活邮件发送时间
		Date vDate = DateUtils.fomatDate(infos[2]);
		//当前时间
		Date nDate = DateUtils.fomatDate(DateUtils.getTime());
		Long datesub = DateUtils.getHourSub(infos[2],DateUtils.getTime());
		DateUtils.compareDate(vDate, nDate);
		HjsUser user = userService.getByUsername(infos[0]);
		//用户不存在及邮件失效处理
		if(user==null){
			error("激活用户不存在，激活失败", request, response);
			return null;
		}else if(!user.getEmail().equals(infos[1])||datesub>120){
			error("邮箱异常或激活邮件失效，激活失败", request, response);
			return null;
		}
		if(!MD5.md5(infos[0]+infos[1]+infos[2]+user.getPassword()).equals(StringUtils.trim(code)))
		{
			error("邮箱认证失败", request, response);
			return null;
		}
		request.getSession().setAttribute("resetUserId",user.getId());
		model.addAttribute("user", user);
		return display("reset");
	}
	
	
	/**
	 * 重设密码
	 * @methodname editPass  
	 * @discription 重设密码 
	 * @param model
	 * @param userId
	 * @param newPass
	 * @param passwordLevel
	 * @param request
	 * @param response
	 * @return String
	 * @author liuj
	 * @date 2016年3月8日
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
		request.getSession().setAttribute("resetUserId",null);
		HjsUser user = userService.getById(userId);
		newPass = new SimpleHash("SHA-1",user.getUsername(),newPass).toString();//密码加密
		user.setPassword(newPass);
		user.setPasswordLevel(passwordLevel);
		userService.updateCustomerPass(user);
		return display("resetok");
	}
}
