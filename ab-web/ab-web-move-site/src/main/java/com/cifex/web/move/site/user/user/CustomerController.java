package com.cifex.web.move.site.user.user;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.SendFailedException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.cifex.business.api.user.approve.ApproveEmailActiveService;
import com.cifex.business.api.user.approve.ApproveRealnameService;
import com.cifex.business.api.user.approve.ApproveSmsService;
import com.cifex.business.api.user.area.SysAreaService;
import com.cifex.business.api.user.message.UsersMessageService;
import com.cifex.business.api.user.user.UserService;
import com.cifex.business.api.user.user.UsersAddService;
import com.cifex.business.api.user.user.UsersInfoService;
import com.cifex.framework.utils.AppUtil;
import com.cifex.framework.utils.Base64Utils;
import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.DateUtils;
import com.cifex.framework.utils.MD5;
import com.cifex.framework.utils.PageData;
import com.cifex.framework.utils.ip.Utils;
import com.cifex.framework.utils.validate.ValidateUtils;
import com.cifex.transfer.model.dto.HjsApproveRealname;
import com.cifex.transfer.model.dto.HjsApproveSms;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.web.move.site.base.UserController;

/**
 * 会员相关操作
 * @author zhangyong
 * @date 2015年9月16日
 */
@Controller
@RequestMapping(value="/user/customer")
public class CustomerController extends UserController{

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "usersInfoService")
	private UsersInfoService usersInfoService;
	@Resource(name = "approveEmailActiveService")
	private ApproveEmailActiveService approveEmailActiveService;
	@Resource(name = "approveSmsService")
	private ApproveSmsService approveSmsService;
	@Resource(name = "approveRealNameService")
	private ApproveRealnameService approveRealnameService;
	@Resource(name = "sysAreaService")
	private SysAreaService sysAreaService;
	@Resource(name = "usersAddService")
	private UsersAddService usersAddService;
	@Resource(name = "usersMessageService")
	private UsersMessageService usersMessageService;
	/**
	 * 前台加载修改密码页面
	 * @param model
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月17日
	 */
	@RequestMapping(value="/toEditPass")
	public String toEditPass(ModelMap model){
		return "user/customer/modifyPassword";
	}
	/**
	 * 前台修改密码
	 * @param oldPass 旧密码
	 * @param newPass 新密码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月17日
	 */
	@RequestMapping(value="/editPass")
	public Object editPass(ModelMap model,String oldPass,String newPass,HttpServletRequest request, HttpServletResponse response){
		Map<String, String> map = new HashMap<String, String>();
		String msg = "";
		//参数服务端验证
		if (ValidateUtils.isStringEmpty(oldPass)){
			msg = "errorOld";//请输入旧密码
			map.put("result", msg);
			return AppUtil.returnObject(new PageData(), map);
		}
		if (ValidateUtils.isStringEmpty(newPass)){
			msg = "errorNew";//请输入新密码
			map.put("result", msg);
			return AppUtil.returnObject(new PageData(), map);
		}
		//旧密码校验
		HjsUser user = getLoginUser();
		oldPass =new SimpleHash("SHA-1",user.getUsername(),oldPass).toString();
		if(!oldPass.equals(user.getPassword())){
			msg = "errorOldW";//旧密码输入错误
			map.put("result", msg);
			return AppUtil.returnObject(new PageData(), map);
		}
		newPass = new SimpleHash("SHA-1",user.getUsername(),newPass).toString();//对新密码做加密处理
		user.setPassword(newPass);
		userService.updateCustomerPass(user);
		request.getSession().setAttribute(Const.SESSION_USER, user);
		//success("密码修改成功!", request, response);
		msg = "success";
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 加载安全验证页面
	 * @param model
	 * @param vt 验证内容：1，邮箱 2，手机 3，支付密码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月17日
	 */
	@RequestMapping(value="/pv")
	public String toPhoneValidate(ModelMap model,String vt,HttpServletRequest request,HttpServletResponse response){
		//参数服务端验证
		if(ValidateUtils.isStringEmpty(vt)){
			error("参数错误", request, response);
			return null;
		}
		//手机号显示格式修改
		String phoneString = "";
		if(getLoginUser().getPhone()!=null&&!getLoginUser().getPhone().equals("")){
			phoneString = getLoginUser().getPhone().substring(0,3)+"******"+getLoginUser().getPhone().substring(9,11);
		}	
		model.addAttribute("phoneShow",phoneString);
		model.addAttribute("userId",getLoginUser().getId());
		model.addAttribute("vt",vt);
		return "user/customer/phonevalidate";
	}
	/**
	 * 进行安全验证，通过后进行相应激活
	 * @param vt 验证内容：1，邮箱 2，手机 3，支付密码
	 * @param code 验证码
	 * @param credit 手机校验码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月17日
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/toActivate")
	public String toActivate(ModelMap model,String vt,String code,String credit,HttpServletRequest request,HttpServletResponse response){
		//参数服务端验证
		if(ValidateUtils.isStringEmpty(vt)){
			error("参数错误", request, response);
			return null;
		}
		if(ValidateUtils.isStringEmpty(code)){
			error("请输入验证码", request, response);
			return null;
		}
		if(ValidateUtils.isStringEmpty(credit)){
			error("请输入手机校验码", request, response);
			return null;
		}

		String gotoString = "";
		if(vt.equals("1")){
			if(request.getSession().getAttribute("emailCode")==null)
			{
				error("请获取手机验证码", request, response);
				return null;
			}
			String codeString = request.getSession().getAttribute("emailCode").toString();
			Date codeTime = (Date)request.getSession().getAttribute("emailTime");
			String phoneString = request.getSession().getAttribute("emailPhone").toString();
			long diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
			//验证码不匹配，验证码失效，验证手机号不匹配均不通过
			if(!codeString.equals(credit)||diff>30||!getLoginUser().getPhone().equals(phoneString)){
				error("手机校验码不正确", request, response);
				return null;
			}
			gotoString = "user/customer/activatemail";
		}else if(vt.equals("2")){
			if(request.getSession().getAttribute("phoneCode")==null)
			{
				error("请获取手机验证码", request, response);
				return null;
			}
			String codeString = request.getSession().getAttribute("phoneCode").toString();
			Date codeTime = (Date)request.getSession().getAttribute("phoneTime");
			String phoneString = request.getSession().getAttribute("phonePhone").toString();
			long diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
			//验证码不匹配，验证码失效，验证手机号不匹配均不通过
			if(!codeString.equals(credit)||diff>30||!getLoginUser().getPhone().equals(phoneString)){
				error("手机校验码不正确", request, response);
				return null;
			}
			gotoString = "user/customer/activatephone";
		}
		return gotoString;
	}

	/**
	 * 邮件模版
	 */
	@Autowired
	private VelocityEngine velocityEngine;
	/**
	 * 邮件发送服务
	 */
	@Autowired
	private MailSender mailSender;
	/**
	 * 验证邮箱提交
	 */
	@RequestMapping(value="/validEmail")
	public JSONObject validEmail(ModelMap model,String email,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//参数服务端验证
		JSONObject json = new JSONObject();
		if(ValidateUtils.isStringEmpty(email)){
			json.put("code", "1");
			json.put("msg", "请输入邮箱");
			return json;
		}
		if(!ValidateUtils.isEmail(email)){
			json.put("code", "1");
			json.put("msg", "邮箱格式不正确");
			return json;
		}
		HjsUser user = getLoginUser();
		//已经验证邮箱后不做操作，防止重复发送激活邮件
		if(email.equals(user.getEmail())&&user.getEmailStatus()==1){
			json.put("code", "1");
			json.put("msg", "邮箱已存在");
			return json;
		}
		//邮箱是否存在
		user.setEmail(email);
		if(!userService.isUnique(user,"email")){
			json.put("code", "1");
			json.put("msg", "该邮箱已被其他会员激活，请填写其他邮箱");
			return json;
		}
		json.put("code", "0");
		return json;
	}
	/**
	 * 发送激活邮件
	 * @param email 邮箱
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @throws Exception
	 * @date 2015年9月17日
	 */
	@RequestMapping(value="/sendEmail")
	public String sendEmail(ModelMap model,String email,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//参数服务端验证
		if(ValidateUtils.isStringEmpty(email)){
			error("请输入邮箱", request, response);
			return null;
		}
		if(!ValidateUtils.isEmail(email)){
			error("邮箱格式不正确", request, response);
			return null;
		}
		HjsUser user = getLoginUser();
		//user.setEmail(email); //--毛茹新注掉，如果执行这句话，已验证邮箱不能修改
		//已经验证邮箱后不做操作，防止重复发送激活邮件
		if(email.equals(user.getEmail())&&user.getEmailStatus()==1){
			error("邮箱已存在", request, response);
			return null;
		}
		//邮箱是否存在
		user.setEmail(email);
		if(!userService.isUnique(user,"email")){
			error("该邮箱已被其他会员激活，请填写其他邮箱", request, response);
			return null;
		}
		//先暂存用户邮箱
		user.setEmailStatus(0);
		userService.update(user);
		String timeString = DateUtils.getTime();//获得时间戳字符串
		//拼接用户名+邮箱+时间戳字符串作为激活ID
		String activateString = Base64Utils.encodeStr(user.getUsername()+"####"+email+"####"+timeString);
		String validatePassword= MD5.md5(user.getUsername()+email+timeString+user.getPassword());
		Map<String, Object> mm = new HashMap<String, Object>();
		mm.put("activateUrl", activateString);
		mm.put("emailAction", "activateEmail");
		mm.put("domain", Const.WEB_NAME+Const.WEB_DOMAIN);
		mm.put("projectName", Const.PROJECT_NAME);
		mm.put("validatePassword", validatePassword);

		//装载邮件页面模版
		String emailText = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "velocity/mail_template.vm", "UTF-8", mm);

		model.addAttribute("email",email);
		model.addAttribute("emailShow",email.substring(0,1)+"******"+email.substring(email.indexOf("@")));
		model.addAttribute("mailUrl","http://mail."+email.substring(email.indexOf("@")+1));
		return "user/customer/activatemail_send";
	}


	/**
	 * 修改手机
	 * @param phone 要修改的手机号
	 * @param code 手机验证码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月18日
	 */
	@RequestMapping(value="/editPhone")
	public String editPhone(String phone,String code,HttpServletRequest request,HttpServletResponse response){
		//参数服务端验证
		if(ValidateUtils.isStringEmpty(phone)){
			error("手机号不能为空", request, response);
			return null;
		}
		if(ValidateUtils.isStringEmpty(code)){
			error("手机验证码不存在", request, response);
			return null;
		}
		String codeString = request.getSession().getAttribute("phoneCode").toString();
		Date codeTime = (Date)request.getSession().getAttribute("phoneTime");
		String phoneString = request.getSession().getAttribute("phonePhone").toString();
		long diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
		//验证码不匹配，验证码失效，验证手机号不匹配均不通过
		if(!codeString.equals(code)||diff>30||!phone.equals(phoneString)){
			error("手机校验码不正确", request, response);
			return null;
		}
		HjsApproveSms sms = new HjsApproveSms();
		HjsUser user = getLoginUser();
		sms.setCreateIp(Utils.getCdnIpAddr(request));//创建IP
		sms.setCreateTime(new Date());
		sms.setVerifyRemark("");//备注
		sms.setVerifyTime(new Date());//验证时间
		sms.setVerifyUserid(user.getId());//验证者ID
		sms.setUserId(user.getId());//用户id
		sms.setPhone(phone);//手机号
		sms.setCredit(Integer.parseInt(code));//手机验证码
		sms.setStatus(1);//验证状态
		sms.setType(1);
		approveSmsService.activateSms(sms);//保存手机信息
		user.setPhone(phone);
		getRequest().getSession().setAttribute(Const.SESSION_USER, user);
		return "redirect:/user/center/accountall "; 
	}
	/**
	 * 加载汇付添加账户填写实名信息页面
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	@RequestMapping(value="/toActivateName")
	public String toActivateRealName(){
		return "user/customer/activatename";
	}

	/**
	 * 查看汇付账户详细
	 * @param model
	 * @return String
	 * @author zhangyong
	 * @date 2015年11月19日
	 */
	@RequestMapping(value="/detailHF")
	public String detailHF(ModelMap model){
		HjsApproveRealname realname = approveRealnameService.getByLoginId(getLoginUser().getId());//通过登录ID获取实名验证信息
		String rn = "";
		String cid = "";
		if(realname!=null){
			rn= realname.getRealname().substring(0,1);
			for(int i=1;i<realname.getRealname().length();i++){
				rn += "*";
			}
			cid = realname.getCardId().substring(0,1)+"****************"+realname.getCardId().substring(realname.getCardId().length()-1,realname.getCardId().length());
		}			
		model.addAttribute("realName",rn);//真实姓名
		model.addAttribute("cardId",cid);//身份证号
		model.addAttribute("hfId",getLoginUser().getNrpUsrId());//汇付客户号		
		return "user/customer/detailHF";
	}
	/**
	 * 用户注销
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@RequestMapping(value = "/logout")
	public String logout() {
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
		return "redirect:/login";
	}
}
