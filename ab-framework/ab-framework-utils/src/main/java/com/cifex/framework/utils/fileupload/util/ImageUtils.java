/**    
 * @filename ImageUtils.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import com.cifex.framework.utils.file.FileUtil;
import com.cifex.framework.utils.fileupload.configuration.IConfiguration;

/**    
 * @classname ImageUtils    
 * @description 图片工具类 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class ImageUtils {

	private static final String[] ALLOWED_EXT = { "gif", "jpeg", "jpg", "png",
		"psd", "bmp", "tiff", "tif", "swc", "jpc", "jp2", "jpx", "jb2",
		"xbm", "wbmp" };
	
	/**
	 * 生成缩略图
	 * @param sourcefile  原图片
	 * @param width
	 * @param height
	 * @param destFile 生成后的图片s
	 * @param configuration
	 * @throws java.io.IOException
	 */
	public static void createTmpThumb(File sourcefile,IConfiguration configuration)
			throws IOException {
		FileUtil.writeBrevityPic(sourcefile, configuration.getMaxWidth(), configuration.getMaxHeight());
	}
	
	/**
	 * 判断是否是图片文件
	 * @param file
	 * @return
	 * @throws java.io.FileNotFoundException
	 */
	public static boolean isImage(final File file) throws FileNotFoundException {
		List<String> list = Arrays.asList(ALLOWED_EXT);
		String fileExt = null;
		if (file != null) {
			fileExt = FileUtil.getFileType(file.getAbsolutePath());
			return (fileExt != null) ? list.contains(fileExt) : false;
		} else {
			return false;
		}
	}
}
