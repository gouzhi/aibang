package com.cifex.web.front.site.user.user;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.velocity.app.VelocityEngine;
import org.csource.FastDFSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cifex.business.api.user.approve.ApproveEmailActiveService;
import com.cifex.business.api.user.approve.ApproveRealnameService;
import com.cifex.business.api.user.approve.ApproveSmsService;
import com.cifex.business.api.user.area.SysAreaService;
import com.cifex.business.api.user.message.UsersMessageService;
import com.cifex.business.api.user.user.UserService;
import com.cifex.business.api.user.user.UsersAddService;
import com.cifex.business.api.user.user.UsersInfoService;
import com.cifex.framework.utils.AppUtil;
import com.cifex.framework.utils.BankName;
import com.cifex.framework.utils.Base64Utils;
import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.DateUtils;
import com.cifex.framework.utils.PageData;
import com.cifex.framework.utils.ip.Utils;
import com.cifex.framework.utils.validate.ValidateUtils;
import com.cifex.transfer.model.dto.HjsApproveRealname;
import com.cifex.transfer.model.dto.HjsApproveSms;
import com.cifex.transfer.model.dto.HjsSysArea;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.transfer.model.dto.HjsUserBase;
import com.cifex.transfer.model.dto.HjsUsersAdd;
import com.cifex.transfer.model.dto.HjsUsersInfo;
import com.cifex.web.front.site.base.UserController;

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
	 * 加载会员账户安全页
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月16日
	 */
	@RequestMapping(value="/toSafe")
	private String toCustomerSafe(ModelMap model){
		//判断是否绑定银行
		if(!ValidateUtils.isStringEmpty(getLoginUser().getNrpUsrId())){
			Map<String,Object> bankMap = null;
			String cardId = "";//银行卡号
			String BankId = "";//银行代号
			String lastfourNumber = "";//银行卡后四位
			String bankName = "";//银行名称
			if(bankMap!=null&&!bankMap.isEmpty()){
				cardId = bankMap.get("CardId").toString();
				BankId = bankMap.get("BankId").toString();
				model.addAttribute("hasBank",true);
				//获取银行卡号后四位
				lastfourNumber = cardId.substring(cardId.length()-4, cardId.length());
				bankName = BankName.getName(BankId);//通过银行代号获得银行名称
				model.addAttribute("bankName",bankName);
				model.addAttribute("account",lastfourNumber);
			}else{
				model.addAttribute("hasBank",false);
			}
		}else{
			model.addAttribute("bankName","");
			model.addAttribute("account","");
			model.addAttribute("hasBank",false);
		}


		HjsUser user = userService.getById(getLoginUser().getId());
		//手机格式处理
		String phoneString = user.getPhone();
		if(phoneString!=null&&phoneString.length()==11){
			model.addAttribute("phone",phoneString.substring(0,3)+"******"+phoneString.substring(phoneString.length()-2, phoneString.length()));
		}
		//邮箱格式处理
		String emailString = user.getEmail();
		if(emailString!=null&&emailString.indexOf("@")!=-1){
			model.addAttribute("email",emailString.substring(0,1)+"******"+emailString.substring(emailString.indexOf("@"), emailString.length()));
		}
		Integer loginUserId=getLoginUser().getId();
		Integer unreadMessageCount= usersMessageService.getUnreadMessageCount(loginUserId);
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.setAttribute("unreadMessageCount", unreadMessageCount);
		model.addAttribute("HFID",user.getNrpUsrId());//汇付帐号		
		model.addAttribute("emailStatus",user.getEmailStatus());
		getRequest().getSession().removeAttribute("result_name");//清除实名认证安全缓存
		return "user/customer/safe";
	}
	/**
	 * 前台加载修改密码页面
	 * @param model
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月17日
	 */
	@RequestMapping(value="/toEditPass")
	public String toEditPass(ModelMap model){
		return "user/customer/editpass";
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
	public String editPass(ModelMap model,String oldPass,String newPass,Integer passwordLevel,HttpServletRequest request, HttpServletResponse response){
		//参数服务端验证
		if (ValidateUtils.isStringEmpty(oldPass)){
			error("请填写旧密码", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(newPass)){
			error("请填写新密码", request, response);
			return null;
		}
		//旧密码校验
		HjsUser user = getLoginUser();
		oldPass =new SimpleHash("SHA-1",user.getUsername(),oldPass).toString();
		if(!oldPass.equals(user.getPassword())){
			error("旧密码不正确，请重新输入", request, response);
			return null;
		}
		newPass = new SimpleHash("SHA-1",user.getUsername(),newPass).toString();//对新密码做加密处理
		user.setPassword(newPass);
		user.setPasswordLevel(passwordLevel);
		userService.updateCustomerPass(user);
		request.getSession().setAttribute(Const.SESSION_USER, user);
		model.addAttribute("result","success");
		return "user/customer/editpass";
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
		String sessionCode = (String) request.getSession().getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
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
		user.setEmail(email);
		//已经验证邮箱后不做操作，防止重复发送激活邮件
		if(email.equals(user.getEmail())&&user.getEmailStatus()==1){
			toCustomerSafe(model);
		}
		//邮箱是否存在
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
		Map<String, Object> mm = new HashMap<String, Object>();
		mm.put("activateUrl", activateString);
		mm.put("emailAction", "activateEmail");
		mm.put("domain", Const.WEB_NAME+Const.WEB_DOMAIN);
		mm.put("projectName", Const.PROJECT_NAME);
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
		HjsUser hjsUser = new HjsUser();
		hjsUser.setPhone(phone);
		if(!userService.isUnique(hjsUser, "phone")){
			error("手机号已经被注册", request, response);
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
		return "user/customer/activatephone_ok";
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
	 * 级联获取区域信息
	 * @param parentId 区域父类ID
	 * @param areaId 区域级别，暂时三级 1 省级 2 市级 3 区县级
	 * @return Object
	 * @author zhangyong
	 * @date 2015年9月23日
	 */
	@RequestMapping(value = "/changeArea", produces = "application/json;charset=UTF-8")
	public Object changeArea(Integer parentId,Integer areaId){
		Map<String, Object> map = new HashMap<String, Object>();
		List<HjsSysArea> area = sysAreaService.getAreaLayer(areaId, parentId);
		if(area!=null&&area.size()>0){
			for(HjsSysArea aa:area){
				//处理areaname中的名称显示
				if(aa.getAreaName().indexOf("_")>0){
					aa.setAreaName(aa.getAreaName().substring(aa.getAreaName().indexOf("_")+1,aa.getAreaName().length()));
				}
			}
		}
		map.put("area", area);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 加载个人资料页
	 * @param model
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月23日
	 */
	@RequestMapping(value="/toPersonal")
	public String toPersonalProfile(ModelMap model){
		HjsUser hjsUser = userService.getById(getLoginUser().getId());
		HjsUsersInfo info = usersInfoService.getById(getUsersInfo().getId());//会员信息，账户信息
		HjsSysArea userArea = sysAreaService.getById(info.getAreaid());//会员区域信息
		HjsUsersAdd usersAdd = usersAddService.getAddressByBaseId(info.getUserId());//收货地址信息
		
		//会员所属区域处理
		HjsSysArea userParentArea = null;
		if(userArea!=null){
			userParentArea = sysAreaService.getById(userArea.getParentId());
		}
		List<HjsSysArea> area1=null;
		List<HjsSysArea> area = sysAreaService.getAreaLayer(1, 0);//获取省级地域
		if(userParentArea!=null){
			area1 = sysAreaService.getAreaLayer(2, userParentArea.getParentId());//获取市级地域
		}
		List<HjsSysArea> area2 =null;
		if(userArea!=null){
			area2 = sysAreaService.getAreaLayer(3, userArea.getParentId());//获取区县级地域
		}
		if(area2!=null&&area2.size()>0){
			for(HjsSysArea aa:area2){
				//处理areaname中的名称显示
				if(aa.getAreaName().indexOf("_")>0){
					aa.setAreaName(aa.getAreaName().substring(aa.getAreaName().indexOf("_")+1,aa.getAreaName().length()));
				}
			}
		}

		//会员收货区域处理	
		HjsSysArea addressArea = null;
		if(usersAdd!=null){
			addressArea = sysAreaService.getById(usersAdd.getAreaid());
		}
		HjsSysArea addressParentArea = null;
		if(addressArea!=null){
			addressParentArea = sysAreaService.getById(addressArea.getParentId());
		}
		List<HjsSysArea> area4=null;
		List<HjsSysArea> area3 = sysAreaService.getAreaLayer(1, 0);//获取省级地域
		if(addressParentArea!=null){
			area4 = sysAreaService.getAreaLayer(2, addressParentArea.getParentId());//获取市级地域
		}
		List<HjsSysArea> area5 =null;
		if(addressArea!=null){
			area5 = sysAreaService.getAreaLayer(3, addressArea.getParentId());//获取区县级地域
		}
		if(area5!=null&&area5.size()>0){
			for(HjsSysArea aa:area5){
				//处理areaname中的名称显示
				if(aa.getAreaName().indexOf("_")>0){
					aa.setAreaName(aa.getAreaName().substring(aa.getAreaName().indexOf("_")+1,aa.getAreaName().length()));
				}
			}
		}

		//生日是否选择
		String birthday = info.getBirthdayString();
		String yearString = "";
		String monthString = "";
		String dayString = "";
		if(birthday!=null){
			String[] birthdayInfo = birthday.split("-");
			yearString = birthdayInfo[0];
			monthString = birthdayInfo[1];
			dayString = birthdayInfo[2];
		}

		//标签页选项 1 基本信息 2 详细信息 3 头像信息 4 收货信息
		String tag="1";
		if(model.get("tag")!=null&&!model.get("tag").toString().equals("")){
			tag =model.get("tag").toString();
		}
		//性别附默认
		if(info.getSex()==null){
			info.setSex(1);
		}
		model.addAttribute("isUpdatedUsername", hjsUser.getIsUpdatedUsername());//判断用户名是否修改
		model.addAttribute("username",hjsUser.getUsername());
		model.addAttribute("tag",tag);
		model.addAttribute("userArea",userArea);
		model.addAttribute("userParentArea", userParentArea);
		model.addAttribute("area",area);//会员所属省
		model.addAttribute("area1",area1);//会员所属市
		model.addAttribute("area2",area2);//会员所属区县

		model.addAttribute("area3",area3);//会员收货地址所属省
		model.addAttribute("area4",area4);//会员收货地址所属市
		model.addAttribute("area5",area5);//会员收货地址所属区县

		model.addAttribute("year",yearString);//生日年
		model.addAttribute("month",monthString);//生日月
		model.addAttribute("day",dayString);//生日天
		model.addAttribute("usersInfo",info);//会员个人信息
		model.addAttribute("addressInfo",usersAdd);//会员收货地址信息
		model.addAttribute("addressArea",addressArea);
		model.addAttribute("addressParentArea", addressParentArea);
		return "user/customer/personal";
	}
	/**
	 * 个人资料模块修改会员基本信息
	 * @param model
	 * @param sex 性别 0女1男
	 * @param year 出生年
	 * @param month 出生月
	 * @param day 出生日	
	 * @param introduction 简介
	 * @param baseinfo 是否开放基本资料（暂时隐藏）
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月28日
	 */
	@RequestMapping(value="/editPBaseInfo")
	public String editUsersInfoBase(ModelMap model,String username,String password,String issetname,Integer sex,String year,String month,String day,String introduction,Integer baseinfo,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("tag","1");
		if(StringUtils.isNotBlank(introduction) && introduction.length()>600){
			error("简介最多可输入600个字符", request, response);
			return null;
		}
		//获得登陆用户
		HjsUser hjsUser = userService.getById(getLoginUser().getId());

		//更改密码更改用户名
		Integer isUpdatedUsername = hjsUser.getIsUpdatedUsername();
		if((isUpdatedUsername==null||isUpdatedUsername.intValue() != 1)&&  issetname.equals("1"))
		{
			//验证用户登录密码是否正确
			String passwordOld = new SimpleHash("SHA-1",hjsUser.getUsername(),password).toString();
			if(!passwordOld.equals(hjsUser.getPassword())){
				error("登录密码错误", request, response);
				return null;
			}
			if(null != userService.getByName(username)){
				error("用户名已经存在", request, response);
				return null;
			}
			HjsUser user = new HjsUser();
			user.setPhone(username);
			if(!userService.isUnique(user,"phone")){
				error("用户名已经存在", request, response);
				return null;
			}
			password = new SimpleHash("SHA-1",username,password).toString();
			hjsUser.setPassword(password);
			hjsUser.setUsername(username);
			hjsUser.setIsUpdatedUsername(1);
			userService.update(hjsUser);
			Session session = getSession();
			session.setAttribute(Const.SESSION_USER, hjsUser);
			HjsUsersInfo usersInfo = getUsersInfo();
			HjsUserBase hjsUserBase = usersInfo.getHjsUserBase();
			hjsUserBase.setUsername(username);
		}
		
		HjsUsersInfo usersInfo = getUsersInfo();
		//处理生日日期格式
		String dateString = year+"-"+(month.length()==1?"0"+month:month)+"-"+(day.length()==1?"0"+day:day);
		usersInfo.setBirthday(DateUtils.fomatDate(dateString));//生日
		usersInfo.setSex(sex);//性别
		usersInfo.setBaseinfoOpen(baseinfo);//基本信息是否公开
		usersInfo.setIntroduction(introduction);//简介
		usersInfoService.updateUserBaseInfo(usersInfo);
		//更新session
		request.getSession().removeAttribute(Const.SESSION_USERCUSTOMER);
		request.getSession().setAttribute(Const.SESSION_USERCUSTOMER,usersInfo);

		model.addAttribute("result","success");

		return toPersonalProfile(model);
	}
	/**
	 * 个人资料模块修改会员详细信息
	 * @param model
	 * @param area1 所属区域代码省
	 * @param area2 所属区域代码市
	 * @param user 修改详细信息对象
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月28日
	 */
	@RequestMapping(value="/editPDetail")
	public String editUsersInfoDetail(ModelMap model,Integer area1,Integer area2,Integer area3,HjsUsersInfo user,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("tag","2");
		if(area1!=null&&area2==null){
			error("请选择市", request, response);
			return null;
		}else if(area2!=null&&area3==null){
			error("请选择区县", request, response);
			return null;
		}
		//区域选择
		int areaId = 0;
		if(area3 !=null){
			areaId = area3;
		}else if(area2!=null){
			areaId = area2;
		}else if(area1!=null){
			areaId = area1;
		}
		user.setAreaid(areaId);
		usersInfoService.updateUserDetailInfo(user);
		//更新session
		HjsUsersInfo newInfo =getUsersInfo();
		newInfo.setAreaid(areaId);//区域ID
		newInfo.setQq(user.getQq());//qq号
		newInfo.setBlood(user.getBlood());//血型
		newInfo.setEducation(user.getEducation());//学历
		newInfo.setUniversity(user.getUniversity());//学校
		newInfo.setMarriage(user.getMarriage());//婚姻情况
		newInfo.setFaith(user.getFaith());//信仰
		request.getSession().removeAttribute(Const.SESSION_USERCUSTOMER);
		request.getSession().setAttribute(Const.SESSION_USERCUSTOMER,newInfo);
		model.addAttribute("result","success");

		return toPersonalProfile(model);
	}
	/**
	 * 个人资料模块保存头像地址
	 * @param model
	 * @param id 会员信息表ID
	 * @param headPic 头像地址
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception String
	 * @author zhangyong
	 * @date 2015年9月28日
	 */
	@RequestMapping(value="/editPAvatar")
	public Object editUsersInfoAvatar(ModelMap model,Integer id,String headPic,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		model.addAttribute("tag","3");
		String msg = "";
		if(ValidateUtils.isStringEmpty(headPic)){
			msg = "error";//请上传选择头像
			map.put("result", msg);
			return AppUtil.returnObject(new PageData(), map);
		}
		HjsUsersInfo info = new HjsUsersInfo();
		info.setId(id);
		if(getUsersInfo().getHeadPic()!=null&&!getUsersInfo().getHeadPic().equals(headPic)){
			headPic = FastDFSUtil.uploadFilePublic(headPic);//将头像图片从nginx保存到服务器			
		}
		info.setHeadPic(headPic);
		usersInfoService.updateUserAvatar(info);//保存地址到数据库
		//更新session
		HjsUsersInfo newInfo =getUsersInfo();
		newInfo.setHeadPic(headPic);
		request.getSession().removeAttribute(Const.SESSION_USERCUSTOMER);
		request.getSession().setAttribute(Const.SESSION_USERCUSTOMER,newInfo);
		model.addAttribute("result","success");
		msg = "success";
		map.put("result", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 个人资料保存收货地址
	 * @param model
	 * @param addressId 收货地址ID
	 * @param area1 省ID
	 * @param area2 市ID
	 * @param area3 区县ID
	 * @param address 详细收货地址
	 * @param number 邮政编码
	 * @param receiver 收货人姓名
	 * @param receiverPhone 收货人手机
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年11月2日
	 */
	@RequestMapping(value="/editUsersAddress")
	public String editUsersAddress(ModelMap model,Integer addressId,Integer area4,Integer area5,Integer area6,String address,String number,String receiver,String receiverPhone,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("tag","4");
		if(area4!=null&&area5==null){
			error("请选择市", request, response);
			return null;
		}else if(area5!=null&&area6==null){
			error("请选择区县", request, response);
			return null;
		}
		if(ValidateUtils.isStringNotEmpty(number)&&!ValidateUtils.isPostalcode(number)){
			error("请输入正确邮编", request, response);
			return null;
		}
		if(ValidateUtils.isStringNotEmpty(receiverPhone)&&!ValidateUtils.isMobile(receiverPhone)){
			error("请输入正确收货手机号", request, response);
			return null;
		}

		//区域选择
		Integer areaId = 0;
		if(area6 !=null){
			areaId = area6;
		}else if(area5!=null){
			areaId = area5;
		}else if(area4!=null){
			areaId = area4;
		}
		HjsUsersAdd usersAdd = new HjsUsersAdd();
		usersAdd.setAreaid(areaId);//收货区域
		usersAdd.setCreateTime(new Date());//添加时间
		usersAdd.setPost(number+"");//邮政编码
		usersAdd.setRealname(receiver);//收货人
		usersAdd.setTel(receiverPhone);//收货手机
		usersAdd.setUserId(getUsersInfo().getHjsUserBase().getId());//关联账户ID
		usersAdd.setId(addressId);//收货地址ID
		usersAdd.setAddr(address);//收货详细地址
		usersAddService.saveOrUpdate(usersAdd);
		model.addAttribute("result","success");

		return toPersonalProfile(model);
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
	 * 验证修改的用户名是否已经存在
	 * @methodname validateUsername  
	 * @discription TODO 
	 * @param username
	 * @param out
	 * @return String
	 * @author yinzhigang
	 * @date 2016年4月12日
	 */
	@RequestMapping(value = "/validateUsername")
	public void validateUsername(String username,PrintWriter out){
		HjsUser nameUser = userService.getByName(username);
		if(nameUser == null){
			out.write("success");
		}else{
			out.write("error");
		}
	}
	
	/**
	 * 调往法大大协议
	 * @methodname tofadadaAgreement  
	 * @discription TODO 
	 * @return String
	 * @author yinzhigang
	 * @date 2016年8月9日
	 */
	@RequestMapping(value = "/tofadadaAgreement")
	public String tofadadaAgreement(){
		return "user/customer/fadadaAgreement";
	}

}
