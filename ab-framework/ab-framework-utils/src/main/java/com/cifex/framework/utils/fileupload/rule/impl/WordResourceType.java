/**    
 * @filename WordResourceType.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月28日     
 */
package com.cifex.framework.utils.fileupload.rule.impl;

import org.apache.commons.lang.StringUtils;

import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.fileupload.rule.IResourceType;

/**      
 * word规则 
 * @author zeng.fangfang    
 * @date 2015年8月28日   
 */
public class WordResourceType implements IResourceType{

	private static String TYPEWORD = "doc,docx";
	
	private static long MAX_WORD_SIZE = 1024*1024*1024;//文件默认最大上传1G
	
	static{
		String typeothers = Const.getProperty("WEB.UPLOAD.TYPEWORD");
		if (StringUtils.isNotEmpty(typeothers)) {
			TYPEWORD = typeothers;
		}
		String maxfilesize = Const.getProperty("UTIL.FILE.MAX_WORD_SIZE");
		if(maxfilesize!=null){
			MAX_WORD_SIZE =Long.parseLong(maxfilesize);
		}
	}
	
	@Override
	public String getCanUploadExtension() {
		return TYPEWORD;
	}

	@Override
	public long getMaxSize() {
		return MAX_WORD_SIZE;
	}

}
