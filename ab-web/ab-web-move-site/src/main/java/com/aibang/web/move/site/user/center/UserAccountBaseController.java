package com.aibang.web.move.site.user.center;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aibang.business.api.user.account.UserBaseService;
import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.framework.utils.validate.ValidateUtils;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.dto.AbUsersInfo;
import com.aibang.web.move.site.base.UserController;
/**
 * 用户资金明细
 * @classname UserAccountBaseController    
 * @description 用户资金明细 
 * @author liuj    
 * @date 2015年9月16日
 */
@Controller
@RequestMapping(value="/user/center")
public class UserAccountBaseController extends UserController {

	@Resource(name="userBaseService")
	private UserBaseService userBaseService; //账户服务
	
	@Resource(name = "usersInfoService")
	private UsersInfoService usersInfoService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	private String display(String pageName)
	{
		return  "user/center/"+pageName;
	} 
	
	/**
	 * 账户总览
	 * @methodname accountall  
	 * @discription 账户总览 
	 * @param model
	 * @return String
	 * @author liuj
	 * @date 2015年9月21日
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/accountall") 
	public String accountall(ModelMap model,String flag)
	{
		AbUsersInfo userInfo = getUsersInfo();  //会员信息
		userInfo=usersInfoService.getById(userInfo.getId());
		AbUser loginUser =getLoginUser();       //登录用户信息
		loginUser =userService.getById(loginUser.getId());
		AbUserBase userBase= (AbUserBase)userBaseService.getById(userInfo.getUserId()); //账户信息
		/* 1.未实名认证、未绑定银行卡、未设置支付密码时：
		      注册密码简单或中等为一星
		      注册密码高为两星
		   2.手机认证加一星（必然加）
		   3.开通汇付帐号加一星
		   4.绑定银行卡加一星
		*/
		//账户安全级别 
		int safeLevel=0;
		if(loginUser.getPasswordLevel()!=null&&loginUser.getPasswordLevel().intValue()>=3)
		{
			safeLevel=2;
		}else {
			safeLevel=1;
		}
		
		//因为注册的时候已经验证过手机，所以必然加一颗星
		safeLevel+=1;
		

		 
		model.addAttribute("safeLevel",safeLevel);
		model.addAttribute("userBase", userBase);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("flag", flag);
		
		return display("personalCenter");
	}
	
	
}
