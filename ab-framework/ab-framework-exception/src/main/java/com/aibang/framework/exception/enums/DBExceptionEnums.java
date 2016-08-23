/**    
 * @filename DBExceptionEnums.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月11日     
 */
package com.aibang.framework.exception.enums;

/**    
 * @classname DBExceptionEnums    
 * @description 异常处理枚举
 * @author zeng.fangfang    
 * @date 2015年8月11日   
 */
public enum DBExceptionEnums implements ExceptionEnums {
	
	UNIQUE_KEY(10001, "主键约束错误"),
	SYSTEM_ERROR(10002, "系统异常");

	public int code;  
    public String message;  
	
    private DBExceptionEnums(int code, String message){
    	this.code = code;
    	this.message = message;
    }
    
	@Override
	public int getCode() {
		return 0;
	}

	@Override
	public String getMessage() {
		return null;
	}

}
