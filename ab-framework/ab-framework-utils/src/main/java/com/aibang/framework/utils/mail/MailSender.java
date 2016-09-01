
/**   
 * @Title: MailSender.java 
 * @Package com.cifex.framework.mail 
 * @Description: (用一句话描述该文件做什么) 
 * @author liuj    
 * @date 2015-8-4 上午9:40:21 
 * Copyright CIFEX Corporation 2015   
 * 版权所有  
 * @version V1.0   
*/ 

package com.aibang.framework.utils.mail;



/** 
 * @ClassName: MailSender
 * @Description: (这里用一句话描述这个类的作用)
 * @author liuj
 * @date 2015-8-4 上午9:40:21
 * Copyright CIFEX Corporation 2015  
 */

public class MailSender {
	
	//邮件服务器
	private String smtp;
	//端口
	private String port;
	//本邮箱账号
	private String email;
	//本邮箱密码
	private String password;
	
	/*
	 * @param toEMAIL	对方箱账号
     * @param TITLE		标题
     * @param CONTENT	内容
     * @param TYPE		1：文本格式;2：HTML格式
     */
    public  void sendEmail(String toEMAIL, String TITLE, String CONTENT, String TYPE) throws Exception{
    	
    	SimpleMailSender.sendEmail(this.smtp, this.port, this.email, this.password, toEMAIL, TITLE, CONTENT, TYPE);
    }
    
    public String getSmtp() {
		return smtp;
	}

	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
