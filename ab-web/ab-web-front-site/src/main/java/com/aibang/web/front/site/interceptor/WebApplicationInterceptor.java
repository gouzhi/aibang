
/**   
 * 全局拦截器
 * @Title: AllInterceptor.java 
 * @Package com.cifex.admin.controller.interceptor 
 * @Description: 全局拦截器
 * @author liuj    
 * @date 2015-7-31 下午5:14:52 
 * Copyright CIFEX Corporation 2015   
 * 版权所有  
 * @version V1.0   
*/ 
package com.aibang.web.front.site.interceptor;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;

import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.business.api.user.user.UsersLogService;
import com.aibang.framework.utils.Const;
import com.aibang.framework.web.interceptor.BaseWebApplicationInterceptor;


/** 
 * @ClassName: AllInterceptor
 * @Description: (这里用一句话描述这个类的作用)
 * @author liuj
 * @date 2015-7-31 下午5:14:52
 * Copyright CIFEX Corporation 2015  
 */

public class WebApplicationInterceptor extends BaseWebApplicationInterceptor {

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "usersInfoService")
	private UsersInfoService usersInfoService;
	@Resource(name = "usersLogService")
	private UsersLogService usersLogService;
	
	@SuppressWarnings("unused")
	private MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
	 
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		request.setAttribute("money_domain", Const.getProperty("MONEY_DOMAIN"));
		request.setAttribute("fund_domain", Const.getProperty("FUND_DOMAIN"));
		return super.preHandle(request, response, handler);
	}
	
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	 
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	 
}
