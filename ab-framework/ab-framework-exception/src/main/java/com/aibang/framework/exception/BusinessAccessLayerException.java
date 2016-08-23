/**    
 * @filename BusinessAccessLayerException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.aibang.framework.exception;

import com.aibang.framework.exception.enums.ExceptionEnums;

/**    
 * @classname BusinessAccessLayerException    
 * @description 业务交互层异常
 * <p>所有在业务交互层出现的异常都应该是这个异常的子类</p>  
 * @author zeng.fangfang    
 * @date 2015年8月10日   
 */
@Deprecated
public class BusinessAccessLayerException extends BaseUnCheckedException {

	private static final long serialVersionUID = -2006183115850184188L;

	private ExceptionEnums exceptionEnums;

	public BusinessAccessLayerException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public BusinessAccessLayerException() {
		super();
	}

	public BusinessAccessLayerException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public BusinessAccessLayerException(String message, Throwable cause) {
		super(message, cause);
	}

	public BusinessAccessLayerException(String message) {
		super(message);
	}

	public BusinessAccessLayerException(Throwable cause) {
		super(cause);
	}
	
	

}
