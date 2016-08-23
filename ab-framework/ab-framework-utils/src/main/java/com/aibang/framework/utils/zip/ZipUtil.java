/**    
 * @filename ZipUtil.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.zip;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**    
 * @classname ZipUtil    
 * @description zip操作工具   支持中文 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class ZipUtil {

	private final static Logger LOGGER = LoggerFactory.getLogger(ZipUtil.class);
	
	/**
	 * 压缩文件(.zip)的函数
	 * @param zipDirectory (需要)压缩的文件夹路径
	 * @param zipPath 文件压缩后放置的路径,该路径可以为null,null表示压缩到原文件的同级目录
	 * @param zipName 保存的压缩文件名可以为空，为空取压缩的文件夹的名称。如果传入请不包含后缀.zip
	 * @param deleteSourceFiles 是否删除压缩的源文件目录 <b>false</b>不删除<b>true</b> 删除 （递归删除清空）
	 * @return 返回一个压缩好的文件(File),否则返回null
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	public static File doZip(String zipDirectory, String zipPath,
			String zipName, boolean deleteSourceFiles) {
		File zipDir = new File(zipDirectory);

		if (zipPath == null) {
			zipPath = zipDir.getParent();
		}
		if (zipName == null) {
			zipName = zipDir.getName();
		}
		// 压缩后生成的zip文件名
		String zipFileName = zipPath + "/" + zipName + ".zip";

		try {
			ZipOutputStream zipOut = new ZipOutputStream(
					new BufferedOutputStream(new FileOutputStream(zipFileName)));
			handleDir(zipOut, zipDirectory);
			zipOut.close();
			if (deleteSourceFiles) {
				deleteAllFile(new File(zipDirectory));
			}
			return new File(zipFileName);
		} catch (IOException e) {
			LOGGER.error("压缩zip文件出错", e);
			return null;
		}
	}

	/**
	 * 递归删除所有文件文件夹
	 * @param allFile
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	private static void deleteAllFile(File allFile) {
		if (allFile.isFile() || allFile.list().length == 0) {
			allFile.delete();
		} else {
			File[] files = allFile.listFiles();
			for (File f : files) {
				deleteAllFile(f);// 递归删除每一个文件
			}
			allFile.delete();// 删除该文件夹
		}
	}

	/**
	 * 由doZip调用,递归完成目录文件读取
	 * 
	 * @param dir (需要)压缩的文件夹(File 类型)
	 * @param len 一个参数(记录压缩文件夹的parent路径的长度)
	 * @param zipOut 需要压缩进的压缩文件
	 * @throws java.io.IOException 如果出错,会抛出IOE异常
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	private static void handleDir(ZipOutputStream zipOut, String fileName)
			throws IOException {
		File srcFileName = new File(fileName);
		if (srcFileName.isDirectory()) {
			// 如果是文件夹，遍历下面的文件
			File[] files = srcFileName.listFiles();
			for (File file : files) {
				handleDir(zipOut, file.getAbsolutePath());
			}
		} else {
			// 创建文件输入流对象
			byte[] buf = new byte[1024];
			int readLen = 0;
			ZipEntry ze = new ZipEntry(srcFileName.getName());
			ze.setSize(srcFileName.length());
			ze.setTime(srcFileName.lastModified());
			zipOut.putNextEntry(ze);
			BufferedInputStream is = new BufferedInputStream(
					new FileInputStream(srcFileName));
			while ((readLen = is.read(buf, 0, 1024)) != -1) {
				zipOut.write(buf, 0, readLen);
			}
			zipOut.closeEntry();
			is.close();
		}

	}

	/**
	 * 解压指定zip文件
	 * 
	 * @param unZipfileName 需要解压的zip文件路径
	 * @param unZipPath 文件解压的路径,该路径可以为null,null表示解压到原文件的同级目录
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
	@SuppressWarnings("unchecked")
	public static boolean unZip(File zipFile, String unZipPath) {// unZipfileName需要解压的zip文件名
		org.apache.tools.zip.ZipFile zip = null;
		if (unZipPath == null) {
			unZipPath = zipFile.getParent();
		}
		try {
			zip = new org.apache.tools.zip.ZipFile(zipFile,getZipEncode(zipFile));
			Enumeration<org.apache.tools.zip.ZipEntry> en = zip.getEntries();
			org.apache.tools.zip.ZipEntry entry = null;
			byte[] buffer = new byte[8192];
			int length = -1;
			InputStream input = null;
			BufferedOutputStream bos = null;
			File file = null;

			while (en.hasMoreElements()) {
				entry = (org.apache.tools.zip.ZipEntry) en.nextElement();
				if (entry.isDirectory()) {
					continue;
				}

				input = zip.getInputStream(entry);
				file = new File(unZipPath, entry.getName());
				if (!file.getParentFile().exists()) {
					file.getParentFile().mkdirs();
				}
				bos = new BufferedOutputStream(new FileOutputStream(file));

				while (true) {
					length = input.read(buffer);
					if (length == -1)
						break;
					bos.write(buffer, 0, length);
				}
				bos.close();
				input.close();
			}
			zip.close();
		} catch (ZipException e) {
			LOGGER.error("解压文件出错", e);
			return false;
		} catch (IOException e) {
			LOGGER.error("解压文件出错", e);
			return false;
		}
		return true;
	}

	/**
	 * @methodname getZipEncode  
	 * @discription 获取zip包的编码 
	 * @param sourceFileName
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月19日
	 */
	@SuppressWarnings("unchecked")
	private static String getZipEncode(File sourceFileName) {
		String encode = "GBK";
		try {
			org.apache.tools.zip.ZipFile zipFile = new org.apache.tools.zip.ZipFile(
					sourceFileName);
			Enumeration<org.apache.tools.zip.ZipEntry> e = zipFile.getEntries();
			org.apache.tools.zip.ZipEntry zipEntry;
			while (e.hasMoreElements()) {
				zipEntry = (org.apache.tools.zip.ZipEntry) e.nextElement();
				encode = getZipEncode(zipEntry.getPlatform());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return encode;
	}

	/**
	 * @methodname getZipEncode  
	 * @discription 获取zip包的编码  
	 * @param encodeI
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月19日
	 */
	private static String getZipEncode(int encodeI) {
		String encode = "GBK";
		switch (encodeI) {
		case 0:
			encode = "GBK";
			break;
		case 3:
			encode = "UTF-8";
			break;
		default:
			break;
		}
		return encode;
	}
}
