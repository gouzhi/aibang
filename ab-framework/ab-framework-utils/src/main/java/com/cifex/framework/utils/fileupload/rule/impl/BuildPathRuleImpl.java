/**    
 * @filename BuildPathRuleImpl.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.rule.impl;

import java.io.File;

import com.cifex.framework.utils.fileupload.rule.IBuildPathRule;

/**    
 * @classname BuildPathRuleImpl    
 * @description 创建文件规则 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class BuildPathRuleImpl implements IBuildPathRule {

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.rule.IBuildPathRule#mkdir(java.lang.String, java.lang.String)    
	 */
	@Override
	public String mkdir(String uploadPath, String userPath) {
		File file = new File(uploadPath+userPath);// /放在一个临时文件夹
		if(!file.exists()){
			file.mkdirs();
		}
		return file.getAbsolutePath();
	}

}
