/**    
 * @filename FrameworkException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.cifex.framework.exception;

import com.cifex.framework.exception.enums.ExceptionEnums;

/**    
 * @classname FrameworkException    
 * @description 框架异常
 * <p>所有在框架层抛出的异常都应包装成这个异常或者它的子类</p> 
 * @author zeng.fangfang    
 * @date 2015年8月10日   
 */
public class FrameworkException extends BaseUnCheckedException {

	private static final long serialVersionUID = 7775345051769502540L;

	private ExceptionEnums exceptionEnums;

	public FrameworkException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public FrameworkException() {
		super();
	}

	public FrameworkException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FrameworkException(String message, Throwable cause) {
		super(message, cause);
	}

	public FrameworkException(String message) {
		super(message);
	}

	public FrameworkException(Throwable cause) {
		super(cause);
	}
	
	
}
