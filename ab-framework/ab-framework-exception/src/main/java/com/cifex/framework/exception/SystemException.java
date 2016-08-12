/**    
 * @filename SystemException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.cifex.framework.exception;

import com.cifex.framework.exception.enums.ExceptionEnums;

/**    
 * @classname SystemException    
 * @description 系统异常.
 * <p>所有系统级异常都应该包装成这个异常再抛出。</p> 
 * @author zeng.fangfang    
 * @date 2015年8月10日   
 */
@Deprecated
public class SystemException extends BaseUnCheckedException {

 	private static final long serialVersionUID = 4230776672196972124L;

 	private ExceptionEnums exceptionEnums;

	public SystemException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public SystemException() {
		super();
	}

	public SystemException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public SystemException(String message, Throwable cause) {
		super(message, cause);
	}

	public SystemException(String message) {
		super(message);
	}

	public SystemException(Throwable cause) {
		super(cause);
	}
	

}
