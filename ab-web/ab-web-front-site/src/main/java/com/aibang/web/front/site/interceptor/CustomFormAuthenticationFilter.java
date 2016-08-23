package com.aibang.web.front.site.interceptor;

import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.business.api.user.user.UsersLogService;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.ip.Utils;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.transfer.model.dto.HjsUsersInfo;
import com.aibang.transfer.model.dto.HjsUsersLog;

public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

	@Autowired
	private UserService userService;
	@Autowired
	private UsersInfoService usersInfoService;
	@Autowired
	private UsersLogService usersLogService;
	/**
	 * 在url过滤之前，做自动登录操作
	 */
	@Override
	public boolean onPreHandle(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		//String path = ((HttpServletRequest)request).getServletPath();
		Subject subject = SecurityUtils.getSubject();
		if (!subject.isAuthenticated() && subject.isRemembered()) {
		            Object principal = subject.getPrincipal();
		            if (null != principal) {			            	
						HjsUser u = userService.getByUsername(String.valueOf(principal));
						if (u != null) {
							if(u.getStatus()==1){					
								subject.getSession().setAttribute(Const.SESSION_USER, u);
								subject.getSession().removeAttribute(Const.SESSION_SECURITY_CODE);
								// shiro加入身份验证									
								UsernamePasswordToken token = new UsernamePasswordToken(
									u.getUsername(), u.getPassword());								 
								token.setRememberMe(true);								 
								try {
									subject.login(token);
								} catch (AuthenticationException e) {
									e.printStackTrace();
								}								
								// 获取会员详细信息，会员账户信息
								try {
									HjsUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(u.getId());
									subject.getSession().setAttribute(Const.SESSION_USERCUSTOMER,usersInfo);
								} catch (Exception e) {
									e.printStackTrace();
								}
								//保存登录日志
								HjsUsersLog usersLog = new HjsUsersLog();
								usersLog.setContent("登陆");
								usersLog.setResult(1);
								usersLog.setUserId(u.getId());
								usersLog.setCreateIp(Utils.getCdnIpAddr((HttpServletRequest)request));
								usersLog.setTypeId(1);
								usersLog.setCreateTime(new Date());
								usersLogService.saveObj(usersLog);
							}
						}
		            }
		        }
		return super.onPreHandle(request, response, mappedValue);
	}
	 
}
