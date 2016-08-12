/**    
 * @filename ImageResourceType.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.rule.impl;

import org.apache.commons.lang.StringUtils;

import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.fileupload.rule.IResourceType;

/**    
 * @classname ImageResourceType    
 * @description 图片规则 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class ImageResourceType implements IResourceType {

	public static String TYPEIMAGES = "gif,jpeg,png,jpg,tif,bmp";
	
	private static long MAX_FILE_SIZE = 1024*1024*10;//图片默认最大上传1GB
	/**
	 * 初始化获取图片上传的类型、最大上传尺寸。可在properties文件中进行配置
	 */
	static{
		String typeimages = Const.getProperty("WEB.UPLOAD.TYPEIMAGES");
		if (StringUtils.isNotEmpty(typeimages)) {
			TYPEIMAGES = typeimages;
		}
		String maxfilesize = Const.getProperty("UTIL.IAMGE.MAX_FILE_SIZE");
		if(maxfilesize!=null){
			MAX_FILE_SIZE =Long.parseLong(maxfilesize);
		}
	}
	
	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.rule.IResourceType#getCanUploadExtension()    
	 */
	@Override
	public String getCanUploadExtension() {
		
		return TYPEIMAGES;
	}

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.rule.IResourceType#getMaxSize()    
	 */
	@Override
	public long getMaxSize() {

		return MAX_FILE_SIZE;
	}

}
