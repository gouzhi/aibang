/**    
 * @filename IConfiguration.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.configuration;


/**    
 * @classname IConfiguration    
 * @description 上传文件接口
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public interface IConfiguration {

	/**
	 * @methodname getUploadPath  
	 * @discription 获取文件上传根目录  以"/结尾" 
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public String getUploadPath();
	
	/**
	 * @methodname getMaxFileSize  
	 * @discription 文件允许上传的大小 单位 b 
	 * @return long
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public long getMaxFileSize();
	
	/**
	 * @methodname getMaxWidth  
	 * @discription 最大的图片 宽 如果超出 将压缩成 缩略图 
	 * @return int
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public int getMaxWidth();
	
	/**
	 * @methodname getMaxHeight  
	 * @discription 最大的图片高 如果超出 将压缩成 缩略图 
	 * @return int
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public int getMaxHeight();

	
}
