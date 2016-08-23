package com.aibang.framework.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;
/**
 * 系统工具
 * @classname PublicUtil    
 * @description 系统工具 
 * @author liuj    
 */
public class PublicUtil {
	
	public static void main(String[] args) {
		System.out.println("本机的ip=" + PublicUtil.getIp());
	}
	/**
	 * 获取不同系统下的项目路径
	 * @methodname getPorjectPath  
	 * @discription 获取不同系统下的项目路径 
	 * @return String 项目路径
	 * @author liuj
	 */
	public static String getPorjectPath(){
		String nowpath = "";
		nowpath=System.getProperty("user.dir")+"/";
		return nowpath;
	}
	
	/**
	 * 获取本机ip
	 * @return
	 */
	public static String getIp(){
		String ip = "";
		try {
			InetAddress inet = InetAddress.getLocalHost();
			ip = inet.getHostAddress();
			//System.out.println("本机的ip=" + ip);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		return ip;
	}
	
}