package com.aibang.framework.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 路径工具类
 * @classname PathUtil    
 * @description 路径工具类 
 * @author liuj    
 */
public class PathUtil {

	/**
	 * 图片访问路径
	 * 
	 * @param pathType      图片类型 visit-访问；save-保存
	 * @param pathCategory  图片类别，如：话题图片-topic、话题回复图片-reply、商家图片
	 * @return
	 */
	public static String getPicturePath(String pathType, String pathCategory) {
		String strResult = "";
		StringBuffer strBuf = new StringBuffer();
		if ("visit".equals(pathType)) {
			
		} else if ("save".equals(pathType)) {
			String projectPath = PublicUtil.getPorjectPath().replaceAll("\\\\","/");
			projectPath = splitString(projectPath, "bin/");
			strBuf.append(projectPath);
			strBuf.append("webapps/ROOT/");
		}
		strResult = strBuf.toString();
		return strResult;
	}
	
    /**
     * 获取分隔符之前的字符串
     * @methodname splitString  
     * @discription 获取分隔符之前的字符串 
     * @param str      字符串
     * @param param    分隔符
     * @return String  分隔后字符串
     * @author liuj
     */
	private static String splitString(String str, String param) {
		String result = str;
		if (str.contains(param)) {
			int start = str.indexOf(param);
			result = str.substring(0, start);
		}
		return result;
	}
	
	 
	/**
	 * 获取项目路径
	 * @methodname getClasspath  
	 * @discription 获取项目路径
	 * @return String
	 * @author liuj
	 */
	public static String getClasspath(){
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		if(path.indexOf(":") != 1){
			path = File.separator + path;
		}
		return path;
	}
	
    /**
     * 获取项目classpath路径
     * @methodname getClassResources  
     * @discription 获取项目classpath路径 
     * @return String
     * @author liuj
     * @date 2015年10月27日
     */
	public static String getClassResources(){
		String path =  (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))).replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		if(path.indexOf(":") != 1){
			path = File.separator + path;
		}
		return path;
	}
	/**
	 * 获取当前项目网站URL(包含项目名)
	 * @methodname PathAddress  
	 * @discription 获取当前项目网站URL(包含项目名) 
	 * @return String
	 * @author liuj
	 */
	public static String PathAddress() {
		String strResult = "";

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();

		StringBuffer strBuf = new StringBuffer();

		strBuf.append(request.getScheme() + "://");
		strBuf.append(request.getServerName() + ":");
		strBuf.append(request.getServerPort() + "");

		strBuf.append(request.getContextPath() + "/");

		strResult = strBuf.toString();// +"ss/";//加入项目的名称

		return strResult;
	}
	
	
}
