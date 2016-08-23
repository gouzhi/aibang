/**    
 * @filename MimeTypes.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月27日     
 */
package com.aibang.framework.utils.http;

/**
 * 常见报文请求的mime类型，用于httpConn Content-Type的类型的设置(已含charset=UTF-8) </br>
 * 
 * @author zeng.fangfang
 * @date 2015年8月27日
 */
public enum MimeTypes {

	/**
	 * json类型
	 */
	JSON("application/json;charset=UTF-8"),
	/**
	 * txt text conf xml类型
	 */
	TXT("text/plain;charset=UTF-8"),
	
	/**
	 *text html 类型
	 */
	HTML("text/html;charset=UTF-8"),
	/**
	 * java序列化对象类型
	 */
	SERIALIZED_OBJECT("application/x-java-serialized-object;charset=UTF-8");

	private String mimeType;

	/**
	 * 获得对应的mime类型
	 * 
	 * @return
	 * @see
	 */
	public String getMimeType() {
		return mimeType;
	}

	private MimeTypes(String mimeType) {
		this.mimeType = mimeType;
	}
}
