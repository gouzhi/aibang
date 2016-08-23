package com.aibang.framework.utils.fileupload.rule.impl;

import org.apache.commons.lang.StringUtils;

import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.fileupload.rule.IResourceType;

/**
 * @classname ExecelResourceType    
 * @description Execel规则 
 * @author zeng.fangfang    
 * @date 2015年8月12日
 */
public class ExecelResourceType implements IResourceType {

	private static String TYPEEXCEL = "xls,xlsx";
	
	private static long MAX_EXCEL_SIZE = 1024*1024*5;//excel默认最大上传5M
	
	static{
		String typeothers = Const.getProperty("WEB.UPLOAD.TYPEEXCEL");
		if (StringUtils.isNotEmpty(typeothers)) {
			TYPEEXCEL = typeothers;
		}
		String maxfilesize = Const.getProperty("UTIL.EXCEL.MAX_FILE_SIZE");
		if(maxfilesize!=null){
			MAX_EXCEL_SIZE =Long.parseLong(maxfilesize);
		}
	}
	
	@Override
	public String getCanUploadExtension() {
		return TYPEEXCEL;
	}

	@Override
	public long getMaxSize() {
		return MAX_EXCEL_SIZE;
	}

}
