/**    
 * @filename BaseException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月14日     
 */
package com.cifex.framework.exception;

/**    
 * @classname BaseException    
 * @description 自定义基础异常 
 * @author zeng.fangfang    
 * @date 2015年8月14日   
 */
public class BaseException extends RuntimeException{

	private static final long serialVersionUID = -2500788344371319040L;

	public static final int UNKNOWN_EXCEPTION = 0;//未知异常

	public static final int NETWORK_EXCEPTION = 1;//网络异常

	public static final int TIMEOUT_EXCEPTION = 2;//超时异常

	public static final int BIZ_EXCEPTION = 3;//业务逻辑异常

	public static final int FORBIDDEN_EXCEPTION = 4;//权限异常

	public static final int SERIALIZATION_EXCEPTION = 5;//数据异常

	public static final int MEMCACHED_EXCEPTION = 6;  //数据缓存memcache异常
	
	private int code; // RpcException不能有子类，异常类型用ErrorCode表示，以便保持兼容。

	public BaseException() {
		super();
	}

	public BaseException(String message, Throwable cause) {
		super(message, cause);
	}

	public BaseException(String message) {
		super(message);
	}

	public BaseException(Throwable cause) {
		super(cause);
	}

	public BaseException(int code) {
		super();
		this.code = code;
	}

	public BaseException(int code, String message, Throwable cause) {
		super(message, cause);
		this.code = code;
	}

	public BaseException(int code, String message) {
		super(message);
		this.code = code;
	}

	public BaseException(int code, Throwable cause) {
		super(cause);
		this.code = code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

	public boolean isBiz() {
		return code == BIZ_EXCEPTION;
	}

	public boolean isForbidded() {
		return code == FORBIDDEN_EXCEPTION;
	}

	public boolean isTimeout() {
		return code == TIMEOUT_EXCEPTION;
	}

	public boolean isNetwork() {
		return code == NETWORK_EXCEPTION;
	}

	public boolean isSerialization() {
		return code == SERIALIZATION_EXCEPTION;
	}
}
