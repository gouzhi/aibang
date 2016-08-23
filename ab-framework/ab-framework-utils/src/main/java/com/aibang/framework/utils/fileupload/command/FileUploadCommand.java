/**    
 * @filename FileUploadCommand.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.command;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.csource.FastDFSTempUtil;

import com.aibang.framework.utils.fileupload.configuration.IConfiguration;
import com.aibang.framework.utils.fileupload.configuration.UploadState;
import com.aibang.framework.utils.fileupload.rule.IBuildPathRule;
import com.aibang.framework.utils.fileupload.rule.IImageSaveRule;
import com.aibang.framework.utils.fileupload.rule.IResourceType;
import com.aibang.framework.utils.fileupload.rule.ReturnResult;
import com.aibang.framework.utils.fileupload.rule.impl.BuildPathRuleImpl;
import com.aibang.framework.utils.fileupload.rule.impl.ImageSaveRuleImpl;
import com.aibang.framework.utils.fileupload.util.FileUtils;
import com.aibang.framework.utils.fileupload.util.ImageUtils;
import com.alibaba.fastjson.JSON;

/**
 * @classname FileUploadCommand
 * @description 文件上传指令 继承 JsonCommand 则返回结果为json格式
 * @author zeng.fangfang
 * @date 2015年8月12日
 */
public class FileUploadCommand extends JsonCommand implements IPostCommand {

	/**
	 * 文件构造规则
	 */
	private static IBuildPathRule buildPathRule;
	/**
	 * 图片生成规则
	 */
	private static IImageSaveRule imageSaveRule;

	/**
	 * 用户请求类型
	 */
	protected IResourceType resourceType;

	/**
	 * 获取上传文件名称
	 * 
	 * @param item
	 * @return
	 */
	private String getFileName(final FileItem item) {
		String origin = item.getName();
		return String.valueOf(new Date().getTime()) + "."
				+ FileUtils.getFileExtension(origin);
	}

	/**
	 * 验证上传文件 验证规则 先验证跟前台的限制、再验证跟对应类型的限制、再验证跟系统的限制
	 * 
	 * @return
	 */
	private boolean validateUploadItem(HttpServletRequest request,
			FileItem fileItem) {
		// 判断前端传 过来的验证大小
		String requestFileSizeStr = request.getParameter("filesize");
		if (requestFileSizeStr != null && !requestFileSizeStr.equals("0")) {
			Long requestFileSize = null;
			try {
				requestFileSize = new Long(requestFileSizeStr);
				long fileSize = fileItem.getSize();
				System.out.println("fileSize:" + fileSize);
				if (fileSize > requestFileSize.longValue()) {
					this.error = UploadState.UPLOAD_OVERSIZE.getMessage();
					return false;
				}

			} catch (Exception e) {

			}

		}
		// 判断文件大小
		if (!FileUtils.checkFileSize(fileItem, configuration, resourceType)) {
			this.error = UploadState.UPLOAD_OVERSIZE.getMessage();
			return false;
		}
		// 判断文件后缀
		if (!FileUtils.checkFileExtension(fileItem, resourceType)) {
			this.error = UploadState.UPLOAD_TYPE_ERROR.getMessage();
			return false;
		}
		return true;
	}

	/**
	 * 文件上传
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private boolean fileUpload(final HttpServletRequest request) {
		/**
		 * 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
		 */
		DiskFileItemFactory factory = new DiskFileItemFactory();
		/**   
         * 用以上工厂实例化上传组件   
         * 设置最大上传尺寸   
         */    
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		try {
			List<FileItem> listFile = upload.parseRequest(request);
			for (FileItem fileItem : listFile) {
				if (!fileItem.isFormField()) {
					try {
						if (validateUploadItem(request, fileItem)) {
							return saveTemporaryFile(request, fileItem);
						} else {
							return false;
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						fileItem.delete();
					}
				}
			}
			this.error = UploadState.UPLOAD_NOTFOUND.getMessage();
			return false;
		} catch (FileUploadException e) {
			this.exception = e;
			this.error = UploadState.UPLOAD_FAILURE.getMessage();
			return false;
		} catch (Exception e) {
			this.exception = e;
			this.error = UploadState.UPLOAD_FAILURE.getMessage();
			return false;
		}
	}

	/**
	 * 将上传的临时文件转到上传目录
	 * 
	 * @param fileItem
	 * @return
	 */
	private boolean saveTemporaryFile(final HttpServletRequest request,
			final FileItem fileItem) throws Exception {
		String rN = request.getParameter("replayName");// 是否替换文件名 0 不替换 1改名
		String newFileName;
		// 处理特殊字符
		String regEx = "[`~!@#$%^&*+=|':;',\\[\\]<>/?~！@#￥%……&*（）——+|{}‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(fileItem.getName());
		String originName = m.replaceAll("").trim().replaceAll("\\s", "");
		// 处理特殊字符
		if (rN == null || rN.equals("1")) {
			newFileName = getFileName(fileItem);
		} else {
			newFileName = originName;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("originName", originName);// 原文件名
		
		//jj update 2015-12-24
		InputStream ins = fileItem.getInputStream();
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
	
        try{
    	    byte[] buff = new byte[100];  
            int rc = 0;  
            while ((rc = ins.read(buff, 0, 100)) > 0) {  
                swapStream.write(buff, 0, rc);  
            }  
            byte[] in2b = swapStream.toByteArray();  
            map.put("savePath", FastDFSTempUtil.uploadFile(in2b, newFileName));//保存路径
        }finally{
        	swapStream.close();
            ins.close();
        }
    	returnResult.setData(map);
		 /*File file = new File(buildPathRule.mkdir(configuration.getUploadPath(),
				userPath) + "/" + newFileName);
		fileItem.write(file);
		Map<String, String> map = new HashMap<String, String>();
		map.put("originName", originName);// 原文件名
		//map.put("savePath",Const.PROJECT_NAME + (file.toURI().toString().split(Const.PROJECT_NAME)[1]));// 保存路径
		map.put("savePath", "/"+userPath+(file.toURI().toString().split(userPath)[1]));//保存路径
		returnResult.setData(map);
		if (ImageUtils.isImage(file)) {// 如果是图片文件
			this.returnResult = imageSaveRule.uploadImage(request,
					returnResult, file, userPath);
		} */
    	//jj update 2015-12-24
		return true;
	}

	@Override
	protected String getDataForJson(final HttpServletRequest request,
			final HttpServletResponse response) {
		if (!checkAuthentication(request, response)) {
			this.returnResult.setResult(ReturnResult.ERROR);
			this.returnResult.setMsg(UploadState.SYSTEM_USER_NOLOGIN
					.getMessage());
		} else {
			if (fileUpload(request)) {
				this.returnResult.setResult(ReturnResult.SUCCESS);
			} else {
				this.returnResult.setResult(ReturnResult.ERROR);
				this.returnResult.setMsg(error);
			}
		}

		return JSON.toJSONString(returnResult);
	}

	@Override
	protected void initParams(final HttpServletRequest request,
			final HttpServletResponse response,
			final IConfiguration configuration) {
		super.initParams(request, response, configuration);
		if (buildPathRule == null) {
			buildPathRule = new BuildPathRuleImpl();
		}
		if (imageSaveRule == null) {
			imageSaveRule = new ImageSaveRuleImpl();
		}

		String type = request.getParameter("type");
		if (type == null || type.equals("")) {
			type = "FILE";
		}
		try {
			resourceType = RequestResourceTypeEnum.valueOf(type.toUpperCase())
					.getResourceType();
		} catch (IllegalArgumentException e) {
			resourceType = RequestResourceTypeEnum.valueOf("FILE")
					.getResourceType();
		}

		returnResult = new ReturnResult();
	}

}
