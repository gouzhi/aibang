/**    
 * @filename DeleteFileCommand.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.cifex.framework.utils.fileupload.configuration.UploadState;
import com.cifex.framework.utils.fileupload.rule.ReturnResult;

/**    
 * @classname DeleteFileCommand    
 * @description 文件删除s
 * 只能删除 userPath 下的文件 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class DeleteFileCommand extends JsonCommand{

	/**
	 * @methodname deleteFile  
	 * @discription 删除上传文件 
	 * @param request
	 * @return boolean
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	private boolean deleteFile(HttpServletRequest request){
		/*int i=0;
		String[] deleteFiles = request.getParameterValues("fileName");
		if(deleteFiles!=null){
			for (String deleteFileName : deleteFiles) {
				if(FileUtils.checkDeleteAuthority(userPath, deleteFileName)){
					 String deleteFilePath = configuration.getUploadPath()+userPath+(deleteFileName.split(userPath)[1]);
					 File deleteFile = new File(deleteFilePath);
					 if(deleteFile.exists()){
						 if(deleteFile.delete()){
							 i++;
						 }
					 }
				}
			}
		}
		returnResult.setMsg(i+"");*/
		return true;
	}
	
	@Override
	protected String getDataForJson(HttpServletRequest request,
			HttpServletResponse response) {
		returnResult = new ReturnResult();
		if(!checkAuthentication(request, response)){
			this.returnResult.setResult(ReturnResult.ERROR);
			this.returnResult.setMsg(UploadState.SYSTEM_USER_NOLOGIN.getMessage());
		}else{
			if(deleteFile(request)){
				this.returnResult.setResult(ReturnResult.SUCCESS);
			}else{
				this.returnResult.setResult(ReturnResult.ERROR);
				this.returnResult.setMsg(error);
			}	
		}
		
		return JSON.toJSONString(returnResult);
	}

}
