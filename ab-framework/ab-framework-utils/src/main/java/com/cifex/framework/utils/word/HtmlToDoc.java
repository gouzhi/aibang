/**    
 * @filename HtmlToDoc.java     
 * @version www.cifex.com.cn    
 * @date 2015年10月8日     
 */
package com.cifex.framework.utils.word;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**      
 * HtmlToDoc
 * @author zeng.fangfang    
 * @date 2015年10月8日   
 */
public class HtmlToDoc {

	/**
	 * 用于记录日志
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(HtmlToDoc.class);
	
	/**
	 * 读取html文件到word
	 * @param filepath  html文件的路径
	 * @return boolean
	 * @author zeng.fangfang
	 * @date 2015年10月8日
	 */
	public boolean writeWordFile(String filepath) {
		boolean flag = false;
		ByteArrayInputStream bais = null;
		FileOutputStream fos = null;
		String path = "C:/"; // 根据实际情况写路径
		try {
			if (!"".equals(path)) {
				File fileDir = new File(path);
				if (fileDir.exists()) {
					String content = "<html xmlns:v="
							+ "'urn:schemas-microsoft-com:vml'"
							+ "xmlns:o="
							+ "'urn:schemas-microsoft-com:office:office'"
							+ "xmlns:w="
							+ "'urn:schemas-microsoft-com:office:word'"
							+ "xmlns:m="
							+ "'http://schemas.microsoft.com/office/2004/12/omml'"
							+ "xmlns=" + "'http://www.w3.org/TR/REC-html40'>"
							+ readFile(filepath) + "</html>";
					byte b[] = content.getBytes();
					bais = new ByteArrayInputStream(b);
					POIFSFileSystem poifs = new POIFSFileSystem();
					DirectoryEntry directory = poifs.getRoot();
					directory.createDocument("WordDocument", bais);
					fos = new FileOutputStream(path + "temp.doc");
					poifs.writeFilesystem(fos);
					bais.close();
					fos.close();
				}
			}

		} catch (Exception e) {
			LOGGER.error("html2doc error",e);
		} finally {
			if (fos != null)
				try {
					fos.close();
				} catch (IOException e) {
					LOGGER.error(e.getMessage());
				}
			if (bais != null)
				try {
					bais.close();
				} catch (IOException e) {
					LOGGER.error(e.getMessage());
				}
		}
		return flag;
	}
	
	
	/**
	 * 读取html文件到字符串
	 * @param filename
	 * @return 返回html字符串
	 * @throws Exception String
	 * @author zeng.fangfang
	 * @date 2015年10月8日
	 */
	public String readFile(String filename) throws Exception {
        StringBuffer buffer = new StringBuffer("");
        BufferedReader br = null;
        try {
               br = new BufferedReader(new FileReader(filename));
               buffer = new StringBuffer();
               while (br.ready())
                      buffer.append((char) br.read());
        } catch (Exception e) {
               e.printStackTrace();
        } finally {
               if(br!=null) br.close();
        }
        return buffer.toString();
 }
}
