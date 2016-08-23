package com.aibang.framework.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.aibang.framework.utils.PageData;
import com.aibang.framework.utils.UuidUtil;
import com.aibang.framework.utils.filedown.FileDownloadUtil;
import com.aibang.framework.utils.page.PagePd;

/**
 * @classname BaseController
 * @description controller基类，所有的controller都需要继承这个类
 * @author zeng.fangfang
 * @date 2015年8月17日
 */
public abstract class BaseController {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@SuppressWarnings("unused")
	private static final long serialVersionUID = 6357869213649815390L;

	/**
	 * 得到PageData
	 */
	public PageData getPageData() {
		return new PageData(this.getRequest());
	}

	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}

	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();

		return request;
	}

	/**
	 * 得到32位的uuid
	 * 
	 * @return
	 */
	public String get32UUID() {

		return UuidUtil.get32UUID();
	}

	/**
	 * 得到分页列表的信息
	 */
	public PagePd getPage() {

		return new PagePd();
	}

	public static void logBefore(Logger logger, String interfaceName) {
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}

	public static void logAfter(Logger logger) {
		logger.info("end");
		logger.info("");
	}

	/**
	 * @methodname success
	 * @discription 正确提示 返回上一级
	 * @param msg
	 *            提示信息
	 * @param request
	 * @param response
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	protected String success(String msg, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			jsAlertReturn(msg, null, request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @methodname success
	 * @discription 正确提示 返回传入的地址
	 * @param msg
	 *            提示信息
	 * @param goTo
	 *            返回地址
	 * @param request
	 * @param response
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	protected String success(String msg, String goTo,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			jsAlertReturn(msg, goTo, request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @methodname error
	 * @discription 錯誤提示
	 * @param msg
	 *            錯誤信息
	 * @param request
	 * @param response
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	protected String error(String msg, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			jsAlertReturn(msg, null, request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @methodname jsAlertReturn
	 * @discription 设置弹出提示
	 * @param alertStr
	 *            提示信息
	 * @param returnPath
	 *            跳转完整路径，不填跳转上一个地址
	 * @param request
	 * @param response
	 *            void
	 * @author zeng.fangfang
	 * @throws java.io.IOException
	 * @date 2015年8月17日
	 */
	protected void jsAlertReturn(String alertStr, String returnPath,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script type='text/javascript'>alert('" + alertStr
				+ "');</script>");
		if (returnPath == null) {
			out.print("<script>history.go(-1);</script>");
		} else {
			out.print("<script>window.location.href='" + returnPath
					+ "';</script>");
		}
		out.flush();
		out.close();
	}
	/**
	 * 输入html到页面
	 * @methodname htmlReturn  
	 * @discription 输入html到页面 
	 * @param htmlStr 打印到页面内容 html
	 * @param returnPath 跳转完整路径，不填跳转上一个地址
	 * @param request
	 * @param response
	 * @throws java.io.IOException void
	 * @author liuj
	 * @date 2015年11月16日
	 */
	protected void htmlReturn(String htmlStr, 
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(htmlStr);
		out.flush();
		out.close();
	}
	
	
	

	/**
	 * @methodname fileOutPut  
	 * @discription 支持中文,文件名长度无限制     不支持国际化   （下载类型默认 application/octet-stream)）
	 * @param file  要下载的文件
	 * @param outfileName  需要下载的文件名称   格式必须为 xxx.xx，需要带后缀名
	 * @param request
	 * @param response 
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	protected void fileOutPut(File file, String outfileName,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			FileDownloadUtil.download(file.getAbsolutePath(), outfileName,
					null, request, response);
		} catch (Exception e) {
			logger.error("下载失敗");
		}
	}
}
