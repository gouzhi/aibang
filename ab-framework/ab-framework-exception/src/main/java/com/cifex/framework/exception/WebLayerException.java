/**    
 * @filename WebLayerException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.cifex.framework.exception;

import com.cifex.framework.exception.enums.ExceptionEnums;

/**
 * @classname WebLayerException
 * @description 表示层异常.
 *              <p>
 *              所有在表示层抛出的异常都应包装成这个异常或者它的子类
 *              </p>
 * @author zeng.fangfang
 * @date 2015年8月10日
 */
@Deprecated
public class WebLayerException extends BaseUnCheckedException {

	private static final long serialVersionUID = -5953169654376651293L;

	private ExceptionEnums exceptionEnums;

	public WebLayerException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public WebLayerException() {
		super();
	}

	public WebLayerException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public WebLayerException(String message, Throwable cause) {
		super(message, cause);
	}

	public WebLayerException(String message) {
		super(message);
	}

	public WebLayerException(Throwable cause) {
		super(cause);
	}

}
