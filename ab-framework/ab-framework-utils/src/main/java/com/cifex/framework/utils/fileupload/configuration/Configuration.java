/**    
 * @filename Configuration.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.configuration;


import com.cifex.framework.utils.Const;

/**    
 * @classname Configuration    
 * @description 上传文件实现 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class Configuration implements IConfiguration {
	
	//文件保存地址 以 "/结尾"
	//默认上传路径
	private static  String UPLOAD_PATH="E:/upload/";
	//默认文件允许上传的大小 
	private static long MAX_FILE_SIZE=1024*1024*4;
	//定义可以上传文件的后缀数组，默认“*”，代表所有

	static{
		String config_path = Const.getProperty("UTIL.CONFIGURATION.UPLOAD_PATH");
		if(config_path!=null){
			UPLOAD_PATH =config_path;
		}
		String maxfilesize = Const.getProperty("UTIL.CONFIGURATION.MAX_FILE_SIZE");
		if(maxfilesize!=null){
			MAX_FILE_SIZE =Long.parseLong(maxfilesize);
		}
	}
	

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.configuration.IConfiguration#getMaxFileSize()    
	 */
	@Override
	public long getMaxFileSize() {
		return MAX_FILE_SIZE;
	}

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.configuration.IConfiguration#getMaxWidth()    
	 */
	@Override
	public int getMaxWidth() {
		return 0;
	}

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.configuration.IConfiguration#getMaxHeight()    
	 */
	@Override
	public int getMaxHeight() {
		return 0;
	}

	@Override
	public String getUploadPath() {
		return UPLOAD_PATH;
	}


}
