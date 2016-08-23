/**    
 * @filename JsonCommand.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**    
 * @classname JsonCommand    
 * @description 返回json格式的行为类 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public abstract class JsonCommand extends Command {

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.command.Command#setResponseHeader(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)    
	 */
	@Override
	protected void setResponseHeader(HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	}

	/* (non-Javadoc)    
	 * @see com.cifex.framework.utils.fileupload.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)    
	 */
	@Override
	protected void execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String json = getDataForJson(request, response);
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}

	/**
	 * @methodname getDataForJson  
	 * @discription 返回json数据 
	 * @param request
	 * @param response
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	protected abstract String getDataForJson(final HttpServletRequest request,final  HttpServletResponse response);
	
}
