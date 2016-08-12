/**    
 * @filename FileResourceType.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.rule.impl;

import org.apache.commons.lang.StringUtils;

import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.fileupload.rule.IResourceType;

/**    
 * @classname FileResourceType    
 * @description 文件规则 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class FileResourceType implements IResourceType {

	private static String TYPEFILE = "chm,pdf,swf,rar,zip,jpg,png,gif,bmp,doc,docx,mpeg,avi,mp3,mp4,xls,xlsx,jsk,p12,jpeg";
	
	private static long MAX_FILE_SIZE = 1024*1024*1024;//文件默认最大上传1G
	
	static{
		String typeothers = Const.getProperty("WEB.UPLOAD.TYPEFILE");
		if (StringUtils.isNotEmpty(typeothers)) {
			TYPEFILE = typeothers;
		}
		String maxfilesize = Const.getProperty("UTIL.FILE.MAX_FILE_SIZE");
		if(maxfilesize!=null){
			MAX_FILE_SIZE =Long.parseLong(maxfilesize);
		}
	}
	
	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.rule.IResourceType#getCanUploadExtension()    
	 */
	@Override
	public String getCanUploadExtension() {
		return TYPEFILE;
	}

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.rule.IResourceType#getMaxSize()    
	 */
	@Override
	public long getMaxSize() {
		return MAX_FILE_SIZE;
	}

}
