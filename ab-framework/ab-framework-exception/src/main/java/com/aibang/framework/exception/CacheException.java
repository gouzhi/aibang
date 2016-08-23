/**    
 * @filename CacheException.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月10日     
 */
package com.aibang.framework.exception;

import com.aibang.framework.exception.enums.ExceptionEnums;

/**    
 * @classname CacheException    
 * @description 缓存异常 
 * <p>所有数据转哈出现的异常都应该是这个异常的子类</p>
 * @author zeng.fangfang    
 * @date 2015年8月10日   
 */
@Deprecated
public class CacheException extends BaseUnCheckedException {

	private static final long serialVersionUID = -92274746129832712L;

	private ExceptionEnums exceptionEnums;

	public CacheException(ExceptionEnums exceptionEnums) {
		this.exceptionEnums = exceptionEnums;
	}

	public ExceptionEnums getExceptionEnums() {
		return exceptionEnums;
	}

	public CacheException() {
		super();
	}

	public CacheException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public CacheException(String message, Throwable cause) {
		super(message, cause);
	}

	public CacheException(String message) {
		super(message);
	}

	public CacheException(Throwable cause) {
		super(cause);
	}
	
	
}
