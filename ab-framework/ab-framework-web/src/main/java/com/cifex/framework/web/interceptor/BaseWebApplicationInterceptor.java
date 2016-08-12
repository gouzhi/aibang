package com.cifex.framework.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;

import com.cifex.framework.utils.Const;

public abstract class BaseWebApplicationInterceptor implements HandlerInterceptor {

	
	private MethodNameResolver methodNameResolver = new InternalPathMethodNameResolver();

	 
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		request.setAttribute("upload_pic_path",basePath+Const.UPLOAD_PIC_PATH);  //上传图片路径
		request.setAttribute("upload_file_path",Const.UPLOAD_FILE_PATH); //上传文件路径
		request.setAttribute("webpath", request.getContextPath());
		request.setAttribute("resolvedMethodName",methodNameResolver.getHandlerMethodName(request));// 访问方法名
        request.setAttribute("css_imagedomain",Const.CSS_IMAGE_DOMAIN);// 设置服务器基础样式图片地址  
		request.setAttribute("web_domain", Const.WEB_DOMAIN);// 设置网站基础域名
		request.setAttribute("web_file_domain", Const.WEB_FILE_DOMAIN);// 设置网站基础文件域名
		request.setAttribute("project_name", Const.PROJECT_NAME); //设置被nginx拦截的项目名
		request.setAttribute("imagedomain", Const.getProperty("WEB.COMMONINTERCEPTOR.IMAGE_DOMAIN"));//设置上传服务器的临时图片显示地址
		request.setAttribute("imagedomainpublic", Const.getProperty("WEB.COMMONINTERCEPTOR.IMAGE_DOMAIN_PULBIC"));//设置上传服务器的正式图片显示地址
		request.setAttribute("education_domain", Const.getProperty("EDUCATION_DOMAIN"));//设置上传服务器的正式图片显示地址
		request.setAttribute("web_name", Const.getProperty("WEB_NAME"));
		request.setAttribute("move_domain", Const.getProperty("MOVE_DOMAIN"));

		return true;
	}

	
 
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	 
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
	 
}
