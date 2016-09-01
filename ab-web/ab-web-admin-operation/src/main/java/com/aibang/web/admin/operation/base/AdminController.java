package com.aibang.web.admin.operation.base;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.aibang.framework.utils.Const;
import com.aibang.framework.web.controller.BaseController;
import com.aibang.transfer.model.dto.AbUser;



public class AdminController extends BaseController {
	
	/* ===============================权限================================== */
	@SuppressWarnings("unchecked")
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	/**
	 * 获取当前登录用户信息
	 * @return HjsUser
	 * @author zeng.fangfang
	 * @date 2015年8月28日
	 */
	public AbUser getLoginUser(){
	   return (AbUser)SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_USER);
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
}
