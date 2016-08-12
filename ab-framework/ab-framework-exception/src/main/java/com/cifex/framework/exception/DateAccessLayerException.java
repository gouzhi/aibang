/**    
 * @filename DateAccessLayerException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.cifex.framework.exception;

import com.cifex.framework.exception.enums.ExceptionEnums;

/**    
 * @classname DateAccessLayerException    
 * @description 数据存取层异常
 * <p>所有在数据存取层出现的异常都应该是这个异常的子类</p> 
 * @author zeng.fangfang    
 * @date 2015年8月10日   
 */
@Deprecated
public class DateAccessLayerException extends BaseUnCheckedException {

	private static final long serialVersionUID = -9122295996350073981L;

	private ExceptionEnums exceptionEnums;

	public DateAccessLayerException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public DateAccessLayerException() {
		super();
	}

	public DateAccessLayerException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DateAccessLayerException(String message, Throwable cause) {
		super(message, cause);
	}

	public DateAccessLayerException(String message) {
		super(message);
	}

	public DateAccessLayerException(Throwable cause) {
		super(cause);
	}
	

}
