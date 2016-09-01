package com.aibang.web.front.site.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.aibang.framework.utils.Const;
import com.aibang.transfer.model.dto.AbUser;

 
 
/**
 * 
* 类名称：LoginHandlerInterceptor.java
* 类描述： 
* 作者单位： 
* 联系方式：
* @version 1.6
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String path = request.getServletPath();
		if(path.matches(Const.NO_INTERCEPTOR_PATH)){
			return true;
		}else{
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			AbUser user = (AbUser)session.getAttribute(Const.SESSION_USER);
			if(user!=null){
				return true;
			}else{
				//登陆过滤
				response.sendRedirect(request.getContextPath() + Const.USER_LOGIN);
				return false;		
				//return true;
			}
		}
	}
	
}
