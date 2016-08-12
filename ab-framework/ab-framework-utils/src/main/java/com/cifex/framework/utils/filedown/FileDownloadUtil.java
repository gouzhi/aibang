/**    
 * @filename FileDownloadUtil.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月13日     
 */
package com.cifex.framework.utils.filedown;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**    
 * @classname FileDownloadUtil    
 * @description 文件下载工具类 
 * @author zeng.fangfang    
 * @date 2015年8月13日   
 */
public class FileDownloadUtil {

	private final static Logger LOGGER = LoggerFactory.getLogger(FileDownloadUtil.class);
	
	/**
	 * @methodname downloadI18N  
	 * @discription 该方法支持支持国际化    但是文件名不能超过17个汉字    而且在IE6下存在bug    
	 * @param filePath   要下载的文件路徑
	 * @param outfileName   需要下載的文件名稱   格式必须为 xxx.xx
	 * @param contentType   下载类型 可为空(为空默认 application/x-msdownload)
	 * @param request
	 * @param response
	 * @throws Exception void
	 * @author zeng.fangfang
	 * @date 2015年8月13日
	 */
	public static void downloadI18N(String filePath, String outfileName,String contentType, HttpServletRequest request, HttpServletResponse response) throws Exception {     
        response.setContentType("text/html;charset=utf-8");     
        BufferedInputStream bis = null;     
        BufferedOutputStream bos = null;  
        String[] dfileSp = outfileName.split("[.]");
		String fileName = dfileSp[0];
		String exe = dfileSp[1];
		if (request.getHeader("user-agent").indexOf("MSIE") != -1) {
			try {
				fileName = URLEncoder.encode(fileName, "utf-8")+ "." + exe;
			} catch (UnsupportedEncodingException e) {
				LOGGER.error("URLEncoder转码异常", e);
			}
		} else {
			try {
				fileName = new String(fileName.getBytes("utf-8"),"iso-8859-1") + "." + exe;
			} catch (UnsupportedEncodingException e) {
				LOGGER.error("字符串转码异常", e);
			}
		}
        try {     
            long fileLength = new File(filePath).length();     
    
            fileName = URLEncoder.encode(fileName, "UTF-8");     
            response.setContentType(StringUtils.isEmpty(contentType)? "application/x-msdownload" : contentType);
            response.setHeader("Content-disposition", "attachment; filename=" + fileName);     
            response.setHeader("Content-Length", String.valueOf(fileLength));     
    
            bis = new BufferedInputStream(new FileInputStream(filePath));     
            bos = new BufferedOutputStream(response.getOutputStream());     
            byte[] buff = new byte[2048];     
            int bytesRead;     
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {     
                bos.write(buff, 0, bytesRead);     
            }     
        } catch (Exception e) {     
            e.printStackTrace();     
        } finally {     
            if (bis != null)     
                bis.close();     
            if (bos != null)     
                bos.close();     
        }     
    }  
	
	/**
	 * @methodname download  
	 * @discription 支持中文,文件名长度无限制     不支持国际化   
	 * @param filePath   要下载的文件路徑
	 * @param fileName   需要下載的文件名稱   格式必须为 xxx.xx
	 * @param contentType   下载类型 可为空(为空默认 application/x-msdownload)
	 * @param request
	 * @param response
	 * @throws Exception void
	 * @author zeng.fangfang
	 * @date 2015年8月13日
	 */
	public static void download(String filePath, String outfileName, String contentType, HttpServletRequest request, HttpServletResponse response) throws Exception {     
        response.setContentType("text/html;charset=utf-8");     
        request.setCharacterEncoding("UTF-8");     
        BufferedInputStream bis = null;     
        BufferedOutputStream bos = null;     
        String[] dfileSp = outfileName.split("[.]");
		String fileName = dfileSp[0];
		String exe = dfileSp[1];
		if (request.getHeader("user-agent").indexOf("MSIE") != -1) {
			try {
				fileName = URLEncoder.encode(fileName, "utf-8")+ "." + exe;
			} catch (UnsupportedEncodingException e) {
				LOGGER.error("URLEncoder转码异常", e);
			}
		} else {
			try {
				fileName = new String(fileName.getBytes("utf-8"),"iso-8859-1") + "." + exe;
			} catch (UnsupportedEncodingException e) {
				LOGGER.error("字符串转码异常", e);
			}
		}
        try {     
            long fileLength = new File(filePath).length();     
    
            response.setContentType(StringUtils.isEmpty(contentType)? "application/x-msdownload" : contentType);
            response.setHeader("Content-disposition", "attachment; filename=" + new String(fileName.getBytes("GBK"),"ISO8859-1"));     
            response.setHeader("Content-Length", String.valueOf(fileLength));     
    
            bis = new BufferedInputStream(new FileInputStream(filePath));     
            bos = new BufferedOutputStream(response.getOutputStream());     
            byte[] buff = new byte[2048];     
            int bytesRead;     
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {     
                bos.write(buff, 0, bytesRead);     
            }     
        } catch (Exception e) {     
            e.printStackTrace();     
        } finally {     
            if (bis != null)     
                bis.close();     
            if (bos != null)     
                bos.close();     
        }     
    }     
}
