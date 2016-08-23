/**    
 * @filename IBuildPathRule.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.rule;

/**    
 * @classname IBuildPathRule    
 * @description 创建文件规则
 * 如果以后的需求该规则不满足 重新写一个实现类即可 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public interface IBuildPathRule {

	/**
	 * 创建文件目录
	 * 生成规则 
	 * 用户文件夹/当前的年月日/
	 * @param uploadPath 服务器上传的根目录
	 * @param userPath 用户文件夹
	 * @return String 返回文件路径
	 * @author zeng.fangfang
	 * @date 2015.8.12
	 */
	public String mkdir(String uploadPath, String userPath);
}
