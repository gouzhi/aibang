package com.cifex.framework.utils;


import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 

public class CookiesUtil {
	private HttpServletRequest request;
	private HttpServletResponse response; 
	/**域名*/
	private static  String DOMAIN = ".domain.com.cn";
	
	private static  final String PATH="/";
	
	static{ 
		String domain =Const.getProperty("WEB_DOMAIN");
		if(domain!=null){
			DOMAIN = domain;
		}
	}
	 
	
	public CookiesUtil(HttpServletRequest request, HttpServletResponse response) {
		this.request  = request;
		this.response = response;
	}
	
	/**
	 * 设置cookie
	 * @param key
	 * @param value
	 * @param domain
	 * @return
	 */
	public boolean setCookieValue(String key, String value){
		try{
			Cookie cookie = new Cookie(key,value);
			cookie.setPath(PATH);// very important
			cookie.setDomain(DOMAIN);
			cookie.setMaxAge(-1);
			response.addCookie(cookie);		
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	  
	/**
	 * 设置cookie
	 * @param key
	 * @param value
	 * @param domain
	 * @return
	 */
	public boolean setCookieValue(String key, String value,String path, String domain){
		try{
			Cookie cookie = new Cookie(key,value);
			cookie.setPath(path);// very important
			cookie.setDomain(domain);
			cookie.setMaxAge(-1);
			response.addCookie(cookie);		
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	
	
	/**
	 * 设置cookie
	 * @param key
	 * @param value
	 * @param domain
	 * @return
	 */
	public boolean setCookieValue(String key, String value, String domain,Integer maxtime){
		try{
			Cookie cookie = new Cookie(key,value);
			cookie.setPath(PATH);
			cookie.setDomain(domain);
			cookie.setMaxAge(maxtime);
			response.addCookie(cookie);	
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	

	/**
	 * 取cookie的值
	 * @param key
	 * @return
	 */
	public String getCookieValue(String key){
		try{		
			Cookie[] cookies = request.getCookies();
			if (cookies == null)
			  return "";
			for(int i=0; i<cookies.length; i++) {
			  Cookie cookie = cookies[i];
			  if (key.equals(cookie.getName()))
				return(cookie.getValue());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 快速设置 
	 * @param key
	 * @param value
	 * @return
	 */
	public static boolean set(String key, String value,HttpServletResponse response){
		try{
			Cookie cookie = new Cookie(key,value);
			cookie.setPath(PATH);// very important
			cookie.setDomain(DOMAIN);
			cookie.setMaxAge(-1);
			response.addCookie(cookie);		
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 快速设置cookie
	 * @param key
	 * @param value
	 * @param maxtime 单位秒
	 * @return
	 */
	public static boolean set(String key, String value,Integer maxtime,HttpServletResponse response){
		try{
			Cookie cookie = new Cookie(key,value);
			cookie.setPath(PATH);
			cookie.setDomain(DOMAIN);
			cookie.setMaxAge(maxtime);
			response.addCookie(cookie);	
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 快速获取
	 * @param key
	 * @param request
	 * @return
	 */
	public static String get(String key,HttpServletRequest request){
		try{		
			Cookie[] cookies = request.getCookies();
			if (cookies == null)
			  return "";
			for(int i=0; i<cookies.length; i++) {
			  Cookie cookie = cookies[i];
			  if (key.equals(cookie.getName()))
				return(cookie.getValue());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * sessionKey生成
	 * @methodname createSessionKey  
	 * @discription sessionKey生成 
	 * @return String
	 * @author liuj
	 * @date 2016年7月12日
	 */
	public static String  createSessionKey(){
	    	String uuid = UUID.randomUUID().toString();
			uuid = uuid.replaceAll("-", "");
			String time_str = System.currentTimeMillis()+"";
			time_str =time_str.substring(time_str.length()-7,time_str.length());
			return uuid+time_str;
    }
	 
}