/**    
 * @filename IImageSaveRule.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.rule;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

/**    
 * @classname IImageSaveRule    
 * @description 图片上传保存行为接口
 * 如果以后的需求该规则不满足 重新写一个实现类即可 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public interface IImageSaveRule {
	
	/**
	 * @methodname uploadImage  
	 * @discription 图片上传 
	 * @param request
	 * @param returnResult
	 * @param destFile 保存的文件
	 * @param userPath
	 * @throws Exception ReturnResult
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public ReturnResult uploadImage(final HttpServletRequest request, final ReturnResult returnResult, final File destFile, final String userPath)throws Exception;
}
