package com.aibang.framework.web.filter;
import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.filter.GenericFilterBean;
import org.springframework.web.util.HtmlUtils;

/**
 * 描述：防止SQL注入和XSS攻击的过滤器
 * @classname XSSFilter    
 * @description 描述：防止SQL注入和XSS攻击的过滤器 
 * @author liuj    
 * @date 2015年12月15日
 */
public class XSSFilter extends GenericFilterBean  {
	/**
	 * 防止SQL注入和XSS攻击
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		
		chain.doFilter(new XSSRequestWrapper((HttpServletRequest) request), response);
	}
	
	 
}
