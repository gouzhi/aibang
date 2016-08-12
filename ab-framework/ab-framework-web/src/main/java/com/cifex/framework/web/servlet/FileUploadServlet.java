/**    
 * @filename FileUploadServlet.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cifex.framework.utils.fileupload.command.Command;
import com.cifex.framework.utils.fileupload.command.DeleteFileCommand;
import com.cifex.framework.utils.fileupload.command.FileUploadCommand;
import com.cifex.framework.utils.fileupload.command.IPostCommand;
import com.cifex.framework.utils.fileupload.configuration.Configuration;
import com.cifex.framework.utils.fileupload.configuration.IConfiguration;

/**
 * @classname FileUploadServlet
 * @description 文件上传入口 上传的文件全部生成在 用户的temp 临时目录下 后台接收的时候
 *              用FileUtil.updateTempFile(config,tempUrl);把临时目录的文件给转换到正常路径 然后再
 *              FileUtil.clearTempDir(config,userId,userCdate);进行清空临时目录
 * @author zeng.fangfang
 * @date 2015年8月12日
 */
public class FileUploadServlet extends HttpServlet {

	private static final long serialVersionUID = -8199843721237391866L;

	private static IConfiguration configuration;

	@Override
	public void init() throws ServletException {
		super.init();
		configuration = new Configuration();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		getResponse(req, resp, false);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		getResponse(req, resp, true);
	}

	/**
	 * URL GET 
	 * 参数 command = FILEUPLOAD文件上传
	 * @param type =image 图片上传 
	 * command=FILEUPLOAD&type=image
	 * @methodname getResponse  
	 * @param request
	 * @param response
	 * @param post
	 * @throws ServletException
	 * @throws java.io.IOException void
	 * @author zeng.fangfang
	 * @date 2015年8月13日
	 */
	private void getResponse(final HttpServletRequest request,
			final HttpServletResponse response, final boolean post)
			throws ServletException, IOException {

		String command = request.getParameter("command");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		if (command != null && !command.equals("")) {
			try {
				CommandHeadEnum comm = CommandHeadEnum.valueOf(command
						.toUpperCase());
				if (comm.getCommand() instanceof IPostCommand) {
					if (post) {
						comm.execute(request, response, configuration);
					}
				} else {
					comm.execute(request, response, configuration);
				}
			} catch (IllegalArgumentException e) {
			}
		}
		// testForm(response);
	}

	public enum CommandHeadEnum {

		FILEUPLOAD(new FileUploadCommand()),

		DELETEFILE(new DeleteFileCommand());

		private final Command command;

		CommandHeadEnum(Command command) {
			this.command = command;
		}

		private void execute(final HttpServletRequest request,
				final HttpServletResponse response,
				final IConfiguration configuration, final Object... params)
				throws IOException {
			Command com = null;
			try {
				com = command.getClass().newInstance();
			} catch (IllegalAccessException e1) {

			} catch (InstantiationException e1) {

			}
			if (com != null) {
				com.runCommand(request, response, configuration, params);
			}
		}

		public Command getCommand() {
			return command;
		}
	}

}
