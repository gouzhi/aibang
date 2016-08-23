/**    
 * @filename BaseUnCheckedException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.aibang.framework.exception;

import com.aibang.framework.exception.enums.ExceptionEnums;

/**
 * @classname BaseUnCheckedException
 * @description 所有unchecked异常的基类s
 * @author zeng.fangfang
 * @date 2015年8月10日
 */
public class BaseUnCheckedException extends RuntimeException {

	private static final long serialVersionUID = 7188843242474705605L;

	private ExceptionEnums exceptionEnums;

	public BaseUnCheckedException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public BaseUnCheckedException() {
		super();
	}

	public BaseUnCheckedException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public BaseUnCheckedException(String message, Throwable cause) {
		super(message, cause);
	}

	public BaseUnCheckedException(String message) {
		super(message);
	}

	public BaseUnCheckedException(Throwable cause) {
		super(cause);
	}

}
