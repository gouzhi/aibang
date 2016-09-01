package com.aibang.web.move.site.base;


import com.aibang.framework.utils.Const;
import com.aibang.framework.web.controller.BaseController;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUsersInfo;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class UserController extends BaseController {
	/**
	 * 获取当前登录用户信息(登录信息)
	 * @param request
	 * @return HjsUser
	 * @author zeng.fangfang
	 * @date 2015年8月28日
	 */
	public AbUser getLoginUser(){
	   return (AbUser)SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
	}
	
	/**
	 * 获取当天登录会员信息(会员信息、用户帐号信息扩展信息)
	 * @methodname getUsersInfo  
	 * @discription 获取当天登录会员信息 
	 * @return HjsUsersInfo
	 * @author liuj
	 * @date 2015年9月16日
	 */
	public AbUsersInfo getUsersInfo(){
		return (AbUsersInfo)SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USERCUSTOMER);
	}
	/**
	 * 获取Session
	 * @methodname getSession  
	 * @discription 获取Session 
	 * @return Session
	 * @author liuj
	 * @date 2015年9月8日
	 */
	public Session getSession()
	{	
		Subject currentUser = SecurityUtils.getSubject();  
	    Session session = currentUser.getSession();
	    return session;
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	
	public static void main(String[] args) {
		String passwd = new SimpleHash("SHA-1", "user2", "000000").toString(); // 密码加密
		System.out.println(passwd);
	}
}
