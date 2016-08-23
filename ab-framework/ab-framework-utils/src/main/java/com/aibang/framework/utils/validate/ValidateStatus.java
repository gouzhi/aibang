/**    
 * @filename ValidateStatus.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月31日     
 */
package com.aibang.framework.utils.validate;

/**      
 * 验证状态枚举 
 * @author zeng.fangfang    
 * @date 2015年8月31日   
 */
public enum ValidateStatus {

	SUCCESS("success");
	
	private String code;

	private ValidateStatus(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
}
