package com.aibang.framework.pay.weixin.protocol;
/**
 * 微信异步通知需要返回的数据
 */
public class NotifyResDate {
	
	private String return_code ;
	private String return_msg;
	public NotifyResDate(String returnCode, String returnMsg){
		return_code = returnCode;
		return_msg = returnMsg;
	}
	public String getReturn_code() {
		return return_code;
	}
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}
	public String getReturn_msg() {
		return return_msg;
	}
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}
	
}
