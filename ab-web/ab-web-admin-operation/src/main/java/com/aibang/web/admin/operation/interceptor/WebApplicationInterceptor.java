
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

package com.aibang.web.admin.operation.interceptor;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.aibang.framework.web.interceptor.BaseWebApplicationInterceptor;



/** 
 * @ClassName: AllInterceptor
 * @Description: (这里用一句话描述这个类的作用)
 * @author liuj
 * @date 2015-7-31 下午5:14:52
 * Copyright CIFEX Corporation 2015  
 */

public class WebApplicationInterceptor extends BaseWebApplicationInterceptor {

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
