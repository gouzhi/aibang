/**    
 * @filename IResourceType.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.rule;

/**    
 * @classname IResourceType    
 * @description 用户上传文件格式的规则 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public interface IResourceType {

	/**
	 * @methodname getCanUploadExtension  
	 * @discription 获取允许上传的文件后缀
	 * @return String "jpg,gif" 
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public String getCanUploadExtension();
	
	/**
	 * @methodname getMaxSize  
	 * @discription 获取允许上传的最大文件大小 kb 
	 * @return long
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public long getMaxSize();
}
