package com.aibang.framework.utils.excel.export.test;

public class User {

	private String username;
	private String mobile;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public User(String username, String mobile) {
		super();
		this.username = username;
		this.mobile = mobile;
	}
	public User() {
		super();
	}
	
}
