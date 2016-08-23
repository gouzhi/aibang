/**    
 * @filename UploadState.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.configuration;

/**    
 * @classname UploadState    
 * @description 文件上传状态枚举类 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public enum UploadState {

	/**
	 * 上传成功
	 */
	UPLOAD_SUCCSSS(0, "上传文件成功！"),
	/**
	 * 上传失败
	 */
    UPLOAD_FAILURE(1, "上传文件失败！"),   
    /**
     * 上传文件类型错误
     */
    UPLOAD_TYPE_ERROR(2, "上传文件类型错误！"),
    /**
     * 上传文件过大
     */
    UPLOAD_OVERSIZE(3, "上传文件过大！"),
    /**
     * 上传文件为空
     */
    UPLOAD_ZEROSIZE(4, "上传文件为空！"),
    /**
     * 上传文件路径错误
     */
    UPLOAD_NOTFOUND(5, "上传文件路径错误！"),
    /**
     * 请先登录
     */
    SYSTEM_USER_NOLOGIN(6,"请先登录");  
	
	private int code;
	
	private String message;
	
	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}
	
	UploadState(int code,String message){
		this.code = code;
		this.message = message;
	}

}
