/**    
 * @filename FileUtils.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.cifex.framework.utils.fileupload.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.fileupload.FileItem;

import com.cifex.framework.utils.DateUtils;
import com.cifex.framework.utils.fileupload.configuration.IConfiguration;
import com.cifex.framework.utils.fileupload.rule.IResourceType;

/**    
 * @classname FileUtils    
 * @description 文件上传工具类 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class FileUtils {
	
	/**
	 * 获取文件的格式后缀
	 * @param fileName 文件名
	 * @return 文件的后缀  不带.
	 */
	public static String getFileExtension(final String fileName) {
		if (fileName == null
				|| fileName.lastIndexOf(".") == -1
				|| fileName.lastIndexOf(".") == fileName.length() - 1) {
			return null;
		}
		return fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
	}

	/**
	 * 检测上传文件大小是否合适
	 * @param fileItem 上传的文件
	 * @param configuration
	 * @param resourceType
	 * @return
	 */
	public static boolean checkFileSize(FileItem fileItem,IConfiguration configuration,IResourceType resourceType){
		long fileSize = fileItem.getSize();//单位byte
		if(fileSize>configuration.getMaxFileSize()||((fileSize/1024)>resourceType.getMaxSize())){
			return false;
		}
		return true;
	}
	
	/**
	 * 检测上传文件格式是否合格
	 * @param  item 上传的文件
	 * @param configuration
	 * @param resourceType
	 * @return
	 */
	public static boolean checkFileExtension(FileItem item,IResourceType resourceType){
		String origin = item.getName();
		if(origin==null||origin.equals("")){
			return false;
		}
		if (origin.indexOf('.') == -1) {
			return false;
		}
		String extName = origin.substring((origin.lastIndexOf(".")+1),origin.length());
		if(extName.equals("")){
			return false;
		}
		if (resourceType.getCanUploadExtension().indexOf(extName.toLowerCase()) == -1) {
			return false;
		}
		return true;
	}
	
	public static void main(String[] args) {
		
	}
	
	/**
	 * 判断传入的文件名称是否是合法的当前登录用户的文件
	 * 必须满足规则  /用户地址/yyyy-MM-dd/数字+字母.后缀
	 * @param userPath
	 * @param deleteFileName
	 * @return
	 */
	public static boolean checkDeleteAuthority(String userPath,String deleteFileName){
		if(deleteFileName==null||deleteFileName.equals("")){
			return false;
		}
		//Pattern p_f = Pattern.compile("(^\\/"+userPath+"\\/[0-9]{4}\\-[0-9]{2}\\-[0-9]{2}\\/[0-9a-zA-z]+\\.[A-z]+$)");
		Pattern p_f = Pattern.compile("(^\\/"+userPath+"\\/temp\\/[0-9a-zA-z]+\\.[A-z]+$)");
		
		Matcher m_f = p_f.matcher(deleteFileName);
		if(m_f.find()){
			return true;
		}
		return false;
	}
	
	/**
	 * 把用户放在临时目录的文件给转换过来
	 * 
	 * @param tempFilePath /用户创建时间/用户ID/temp/xxxx.xx
	 * @param sessionId 当前登录的sessionId
	 * 
	 * @return /用户创建时间/用户ID/当前时间/xxxx.xx
	 */
	public static String updateTempFile(IConfiguration configuration,String tempFilePath,String sessionId){
		return updateTempFile(configuration, null, tempFilePath, sessionId);
	}
	
	/**
	 * 把富文本里边的临时目录给替换
	 * @param configuration
	 * @param content
	 * @param sessionId 当前登录的sessionId
	 * @return
	 */
	public static String updateContentTempFile(IConfiguration configuration,String content,String sessionId) {
		if(content==null){return content;}
		String pat = "(\\/[0-9]{4}\\-[0-9]{2}\\-[0-9]{2}\\/[0-9]+\\/"+sessionId+"\\/[a-zA-z0-9]+\\.[A-z]{1,6})";
		 Pattern p_f = Pattern.compile(pat);
		Matcher m_f = p_f.matcher(content);
		while (m_f.find()) { 
			String rep_str = updateTempFile(configuration, m_f.group(), sessionId);
			content = content.replace(m_f.group(), rep_str); 
		}
		return content;
	}
	

	/**
	 * 把用户放在临时目录的文件给转换过来
	 * 
	 * @param startStr 用于正则前缀  如  user
	 * @param tempFilePath /用户创建时间/用户ID/temp/xxxx.xx
	 * @param sessionId 当前登录的sessionId
	 * 
	 * @return /用户创建时间/用户ID/当前时间/xxxx.xx
	 */
	public static String updateTempFile(IConfiguration configuration,String startStr,String tempFilePath,String sessionId){
		if(tempFilePath==null){return tempFilePath;}
		String pat ;
		if(startStr==null){
			pat = "(^\\/[0-9]{4}\\-[0-9]{2}\\-[0-9]{2}\\/[0-9]+\\/"+sessionId+"\\/(.*)\\.[A-z]+$)";
		}else{
			pat = "(^\\/"+startStr+"\\/[0-9]{4}\\-[0-9]{2}\\-[0-9]{2}\\/[0-9]+\\/"+sessionId+"\\/(.*)\\.[A-z]+$)";
		}
		Pattern p_f = Pattern.compile(pat);
		Matcher m_f = p_f.matcher(tempFilePath);
		if(m_f.find()){
			File file = new File(configuration.getUploadPath()+tempFilePath);
			String replStr = tempFilePath.replace(sessionId, DateUtils.dateToString(new Date()));
			if(file.exists()){
				File renFile = new File(configuration.getUploadPath()+replStr) ;
				if(!renFile.getParentFile().exists()){
					renFile.getParentFile().mkdirs();
				}
				file.renameTo(renFile);
			}
			return replStr;
		}else{
			return tempFilePath;
		}
	}
	
	/**
	 * 清空用户临时文件夹 
	 * @param userId 用户iD
	 * @param userCdate 用户创建时间
	 * @param sessionId 当前登录的sessionId
	 */
	public static void clearTempDir(IConfiguration configuration,String startStr,Integer userId,Date userCdate,String sessionId){
		File file;
		if(startStr==null){
			file = new File(configuration.getUploadPath()+ DateUtils.dateToString(userCdate)+"/"+userId+"/"+sessionId);
		}else{
			file = new File(configuration.getUploadPath()+startStr+"/"+ DateUtils.dateToString(userCdate)+"/"+userId+"/"+sessionId);
		} 
		if(file.exists()){
			 File[] files = file.listFiles();
			  for(File f : files) {
				  f.delete();
			  }
		}
	}

	/**
	 * 清空用户临时文件夹 
	 * @param userId 用户iD
	 * @param userCdate 用户创建时间
	 * @param sessionId 当前登录的sessionId
	 */
	public static void clearTempDir(IConfiguration configuration,Integer userId,Date userCdate,String sessionId){
		clearTempDir(configuration, null, userId, userCdate, sessionId);
	}
	
	/**
	 * 
	 * <p>方法名称: removeLastLoginTempDir </p>
	 * <p>方法描述: 清除不是今天上传的临时文件夹 （文件名长度等于39 的文件夹，不是今天修改的都被删除）,在登录时调用 </p>
	 * <p>作者： yym </p>
	 * <p>完成时间: 2014-6-13 下午03:56:30 </p>
	 * @param configuration
	 * @param userId
	 * @param userCdate
	 *
	 */
	public static void removeLastLoginTempDir(IConfiguration configuration,Integer userId,Date userCdate){
		File file = new File(configuration.getUploadPath()+ DateUtils.dateToString(userCdate)+"/"+userId+"/");
		if(file.isDirectory()){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			File[] files = file.listFiles();
			for (File file2 : files) {
				if(file2.isDirectory()){
					int length = file2.getName().length(); 
					if(length==39){
						if(!today.equals(sdf.format(file2.lastModified()))){
							deleteAllFile(file2); 
						}
					}
				}
			}
		}
		
	}
	
	
	/**
	 * 递归删除所有文件文件夹
	 * @param allFile
	 */
	public static void deleteAllFile( File allFile){  
		 if(allFile.isFile() || allFile.list().length == 0){
			 allFile.delete();
		  }else{
			  File[] files = allFile.listFiles();
			  for(File f : files) {
				  deleteAllFile(f);//递归删除每一个文件
			  }
			  allFile.delete();//删除该文件夹
		  } 
	}
}
