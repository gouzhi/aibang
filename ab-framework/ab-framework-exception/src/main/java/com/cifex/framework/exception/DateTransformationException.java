/**    
 * @filename DateTransformationException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.cifex.framework.exception;

import com.cifex.framework.exception.enums.ExceptionEnums;

/**
 * @classname DateTransformationException
 * @description 数据转化异常
 *              <p>
 *              所有数据转哈出现的异常都应该是这个异常的子类
 *              </p>
 * @author zeng.fangfang
 * @date 2015年8月10日
 */
@Deprecated
public class DateTransformationException extends BaseUnCheckedException {

	private static final long serialVersionUID = -9198333865341983866L;

	private ExceptionEnums exceptionEnums;

	public DateTransformationException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public DateTransformationException() {
		super();
	}

	public DateTransformationException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DateTransformationException(String message, Throwable cause) {
		super(message, cause);
	}

	public DateTransformationException(String message) {
		super(message);
	}

	public DateTransformationException(Throwable cause) {
		super(cause);
	}

}
