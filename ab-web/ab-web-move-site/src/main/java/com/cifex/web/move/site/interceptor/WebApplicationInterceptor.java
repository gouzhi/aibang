
/**   
 * @Title: AllInterceptor.java 
 * @Package com.cifex.admin.controller.interceptor 
 * @Description: (用一句话描述该文件做什么) 
 * @author liuj    
 * @date 2015-7-31 下午5:14:52 
 * Copyright CIFEX Corporation 2015   
 * 版权所有  
 * @version V1.0   
*/ 

package com.cifex.web.move.site.interceptor;

import com.cifex.framework.web.interceptor.BaseWebApplicationInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/** 
 * @ClassName: AllInterceptor
 * @Description: (这里用一句话描述这个类的作用)
 * @author liuj
 * @date 2015-7-31 下午5:14:52
 * Copyright CIFEX Corporation 2015  
 */

public class WebApplicationInterceptor extends BaseWebApplicationInterceptor {

	@SuppressWarnings("unused")
	private MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();
	 
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
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
