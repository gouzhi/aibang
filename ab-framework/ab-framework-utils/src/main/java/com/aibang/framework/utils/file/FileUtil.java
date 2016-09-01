package com.aibang.framework.utils.file;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.code.RandomUtil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * @classname FileUtil    
 * @description 文件处理工具类 (用于操作文件和文件夹 ) 
 * @author zeng.fangfang    
 * @date 2015年8月12日
 */
public class FileUtil {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FileUtil.class);
	
	//定义可以上传文件的后缀数组，默认“*”，代表所有
	public static String[] filePostfixs = {"*"};
	public static String[] typeImages = { "gif", "jpeg", "png", "jpg", "tif", "bmp" };  
	public static String[] typeVideo = {"mp4","mkv","flv","avi","wmv","rmvb"};
	public static String[] typeOthers = { "html", "htm", "doc", "xls", "txt", "zip", "rar", "pdf", "cll" };  
	
	static{
		String TYPEIMAGES = Const.getProperty("WEB.UPLOAD.TYPEIMAGES");
		if (StringUtils.isNotEmpty(TYPEIMAGES)) {
			typeImages = TYPEIMAGES.split(",");
		}
		
		String TYPEVIDEO = Const.getProperty("WEB.UPLOAD.TYPEVIDEO");
		if (StringUtils.isNotEmpty(TYPEVIDEO)) {
			typeVideo = TYPEVIDEO.split(",");
		}
		
		String TYPEOTHERS = Const.getProperty("WEB.UPLOAD.TYPEOTHERS");
		if (StringUtils.isNotEmpty(TYPEOTHERS)) {
			typeOthers = TYPEOTHERS.split(",");
		}
		
	}
	
	/**
	 * @methodname copyFile  
	 * @discription <p>将源文件的数据写入到目标文件中， </p>
	 * <p>不会检查源文件是否存在， </p>
	 * <p>若目标文件存在则直接写入， </p>
	 * <p>否则创建目标文件后再进行写入。 </p> 
	 * @param srcPath 源文件路徑
	 * @param desPath 目標文件路徑
	 * @author zeng.fangfang
	 * @date 2015年8月12日
	 */
    private static void copyFile(String srcPath,String desPath){  
        try {  
            FileInputStream in = new FileInputStream(srcPath);  
            FileOutputStream out = new FileOutputStream(desPath);  
            byte[] bt = new byte[1024];  
            int count;  
            while ((count = in.read(bt)) > 0) {  
                out.write(bt, 0, count);  
            }  
            in.close();  
            out.close();   
        } catch (IOException ex) {  
        	LOGGER.error(ex.getMessage());
        }         
    }  
      
    /**
     * @methodname copyAndReplaceFile  
     * @discription 复制文件，若文件存在则替换该文件。  
     * @param srcPath 源文件路径
     * @param desPath 目标文件路径
     * @throws Exception void
     * @author zeng.fangfang
     * @date 2015年8月12日
     */
    public static void copyAndReplaceFile(String srcPath,String desPath) throws Exception{  
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);  
        File srcFile = new File(srcPath);  
        if(!srcFile.isFile()){  
            throw new Exception("source file not found!");  
        }  
        copyFile(srcPath,desPath);  
    }  
      
    /**
     * @methodname copyAndNotReplaceFile  
     * @discription 复制文件，若文件已存在则不进行替换。  
     * @param srcPath 源文件路径
     * @param desPath 目标文件路径
     * @throws Exception void
     * @author zeng.fangfang
     * @date 2015年8月12日
     */
    public static void copyAndNotReplaceFile(String srcPath,String desPath) throws Exception{  
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);  
        File srcFile = new File(srcPath);  
        File desFile = new File(desPath);  
        if(!srcFile.isFile()){  
            throw new Exception("source file not found!");  
        }  
        if(desFile.isFile()){  
            return;  
        }  
        copyFile(srcPath,desPath);  
    }  
      
    /**
     * @methodname moveAndReplaceFile  
     * @discription 移动文件，若文件存在则替换该文件。  
     * @param srcPath 源文件路径
     * @param desPath 目标文件路径
     * @throws Exception void
     * @author zeng.fangfang
     * @date 2015年8月12日
     */
    public static void moveAndReplaceFile(String srcPath,String desPath) throws Exception{  
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);  
        copyAndReplaceFile(srcPath,desPath);  
        deleteFile(srcPath);  
    }  
      
    /**
     * @methodname moveAndNotReplaceFile  
     * @discription 移动文件，若文件存在则不进行替换。  
     * @param srcPath 源文件路径
     * @param desPath 目标文件路径
     * @throws Exception void
     * @author zeng.fangfang
     * @date 2015年8月12日
     */
    public static void moveAndNotReplaceFile(String srcPath,String desPath) throws Exception{  
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);  
        copyAndNotReplaceFile(srcPath,desPath);  
        deleteFile(srcPath);  
    }  
      
    /**
     * @methodname copyAndMergerFolder  
     * @discription <p>复制并合并文件夹</p>
     * <p>不会替换目标文件夹中已经存在的文件或文件夹</p> 
     * @param srcPath 源文件路径
     * @param desPath 目标文件路径
     * @throws Exception void
     * @author zeng.fangfang
     * @date 2015年8月12日
     * @
     */
    public static void copyAndMergerFolder(String srcPath,String desPath) throws Exception{       
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);  
        File folder = getFolder(srcPath);  
        createFolder(desPath);  
        File[] files = folder.listFiles();  
        for(File file:files){  
            String src = file.getAbsolutePath();  
            String des = desPath+File.separator+file.getName();  
            if(file.isFile()){  
                copyAndNotReplaceFile(src,des);  
            }else if(file.isDirectory()){  
                copyAndMergerFolder(src,des);  
            }  
        }  
    }  
      
    /** 
     * 复制并替换文件夹， 
     * 将目标文件夹完全替换成源文件夹， 
     * 目标文件夹原有的资料会丢失。 
     * @param srcPath 
     * @param desPath 
     * @throws Exception  
     */  
    public static void copyAndReplaceFolder(String srcPath,String desPath) throws Exception{     
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);  
        File folder = getFolder(srcPath);  
        createNewFolder(desPath);  
        File[] files = folder.listFiles();  
        for(File file:files){  
            String src = file.getAbsolutePath();  
            String des = desPath+File.separator+file.getName();  
            if(file.isFile()){  
                copyAndReplaceFile(src,des);  
            }else if(file.isDirectory()){  
                copyAndReplaceFolder(src,des);  
            }  
        }  
    }   
      
    /** 
     * 合并文件夹后，将源文件夹删除。 
     * @param srcPath 
     * @param desPath 
     * @throws Exception  
     */  
    public static void moveAndMergerFolder(String srcPath,String desPath) throws Exception{  
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);          
        copyAndMergerFolder(srcPath,desPath);  
        deleteFolder(srcPath);  
    }  
      
    /** 
     * 替换文件夹后，将源文件夹删除。 
     * @param srcPath 
     * @param desPath 
     * @throws Exception  
     */  
    public static void moveAndReplaceFolder(String srcPath,String desPath) throws Exception{  
        srcPath = separatorReplace(srcPath);  
        desPath = separatorReplace(desPath);  
        copyAndReplaceFolder(srcPath,desPath);  
        deleteFolder(srcPath);  
    }      
  
    /** 
     * 创建文件夹，如果文件夹存在则不进行创建。 
     * @param path 
     * @throws Exception  
     */  
    public static void createFolder(String path) throws Exception{  
        path = separatorReplace(path);  
        File folder = new File(path);  
        if(folder.isDirectory()){  
            return;  
        }else if(folder.isFile()){  
            deleteFile(path);  
        }  
        folder.mkdirs();  
    }  
      
    /** 
     * 创建一个新的文件夹，如果文件夹存在，则删除后再创建。 
     * @param path 
     * @throws Exception 
     */  
    public static void createNewFolder(String path) throws Exception{  
        path = separatorReplace(path);  
        File folder = new File(path);  
        if(folder.isDirectory()){  
            deleteFolder(path);  
        }else if(folder.isFile()){  
            deleteFile(path);  
        }  
        folder.mkdirs();  
    }  
      
    /** 
     * 创建一个文件，如果文件存在则不进行创建。 
     * @param path 
     * @throws Exception 
     */  
    public static File createFile(String path) throws Exception{  
        path = separatorReplace(path);  
        File file = new File(path);  
        if(file.isFile()){  
            return file;  
        }else if(file.isDirectory()){  
            deleteFolder(path);  
        }  
        return createFile(file);  
    }  
      
    /** 
     * 创建一个新文件，如果存在同名的文件或文件夹将会删除该文件或文件夹， 
     * 如果父目录不存在则创建父目录。 
     * @param path 
     * @throws Exception 
     */  
    public static File createNewFile(String path) throws Exception{  
        path = separatorReplace(path);  
        File file = new File(path);  
        if(file.isFile()){  
            deleteFile(path);  
        }else if(file.isDirectory()){  
            deleteFolder(path);  
        }  
        return createFile(file);  
    }  
      
    /** 
     * 分隔符替换 
     * window下测试通过 
     * @param path 
     * @return 
     */  
    public static String separatorReplace(String path){  
        return path.replace("\\","/");  
    }  
      
    /** 
     * 创建文件及其父目录。 
     * @param file 
     * @throws Exception 
     */  
    public static File createFile(File file) throws Exception{  
        createParentFolder(file);  
        if(!file.createNewFile()) {  
            throw new Exception("create file failure!");  
        }  
        return file;  
    }  
      
    /** 
     * 创建父目录 
     * @param file 
     * @throws Exception 
     */  
    private static void createParentFolder(File file) throws Exception{  
        if(!file.getParentFile().exists()) {  
            if(!file.getParentFile().mkdirs()) {  
                throw new Exception("create parent directory failure!");  
            }  
        }  
    }  
      
    /** 
     * 根据文件路径删除文件，如果路径指向的文件不存在或删除失败则抛出异常。 
     * @param path 
     * @return 
     * @throws Exception  
     */  
    public static void deleteFile(String path) throws Exception {  
        path = separatorReplace(path);  
        File file = getFile(path);      
        if(!file.delete()){  
            throw new Exception("delete file failure");  
        }                        
    }  
      
    /** 
     * 删除指定目录中指定前缀和后缀的文件。 
     * @param dir 
     * @param prefix 
     * @param suffix 
     * @throws Exception  
     */  
    public static void deleteFile(String dir,String prefix,String suffix) throws Exception{       
        dir = separatorReplace(dir);  
        File directory = getFolder(dir);  
        File[] files = directory.listFiles();  
        for(File file:files){  
            if(file.isFile()){  
                String fileName = file.getName();  
                if(fileName.startsWith(prefix)&&fileName.endsWith(suffix)){  
                    deleteFile(file.getAbsolutePath());  
                }  
            }  
        }      
    }  
      
    /** 
     * 根据路径删除文件夹，如果路径指向的目录不存在则抛出异常， 
     * 若存在则先遍历删除子项目后再删除文件夹本身。 
     * @param path 
     * @throws Exception  
     */  
    public static void deleteFolder(String path) throws Exception {  
        path = separatorReplace(path);  
        File folder = getFolder(path);  
        File[] files = folder.listFiles();   
        for(File file:files) {                  
            if(file.isDirectory()){  
                deleteFolder(file.getAbsolutePath());  
            }else if(file.isFile()){                      
                deleteFile(file.getAbsolutePath());                                   
            }  
        }    
        folder.delete();   
    }  
      
    /** 
     * 查找目标文件夹下的目标文件 
     * @param dir 
     * @param fileName 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static File searchFile(String dir,String fileName) throws FileNotFoundException{  
        dir = separatorReplace(dir);  
        File f = null;  
        File folder = getFolder(dir);  
        File[] files = folder.listFiles();   
        for(File file:files) {                  
            if(file.isDirectory()){  
                f =  searchFile(file.getAbsolutePath(),fileName);  
                if(f!=null){  
                    break;  
                }  
            }else if(file.isFile()){   
                if(file.getName().equals(fileName)){  
                    f = file;  
                    break;  
                }                                                             
            }  
        }            
        return f;  
    }  
    /**
     * 获取目录文件列表
     * @methodname getListFiels  
     * @discription 获取目录文件列表
     * @param dir 路径
     * @return 文件列表
     * @throws FileNotFoundException File[]
     * @author liuj
     * @date 2016年4月20日
     */
    public static File[] getListFiels(String dir) throws FileNotFoundException {
    	  dir = separatorReplace(dir);  
          File f = null;  
          File folder = getFolder(dir);  
          File[] files = folder.listFiles();   
          return files;
    }
    /** 
     * 获得文件类型。 
     * @param path：文件路径 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static String getFileType(String path) throws FileNotFoundException {  
        path = separatorReplace(path);  
        File file = getFile(path);  
        String fileName = file.getName();  
        String[] strs = fileName.split("\\.");  
        if(strs.length<2){  
            return "unknownType";  
        }  
        return strs[strs.length-1];  
    }  
      
    /** 
     * 根据文件路径，获得该路径指向的文件的大小。 
     * @param path 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static long getFileSize(String path) throws FileNotFoundException{  
        path = separatorReplace(path);        
        File file = getFile(path);  
        return file.length();  
    }  
      
    /** 
     * 根据文件夹路径，获得该路径指向的文件夹的大小。 
     * 遍历该文件夹及其子目录的文件，将这些文件的大小进行累加，得出的就是文件夹的大小。 
     * @param path 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static long getFolderSize(String path) throws FileNotFoundException{  
        path = separatorReplace(path);                
        long size = 0;  
        File folder = getFolder(path);  
        File[] files = folder.listFiles();  
        for(File file:files){  
            if(file.isDirectory()){  
                size += getFolderSize(file.getAbsolutePath());  
            }else if(file.isFile()){  
                size += file.length();  
            }  
        }  
        return size;  
    }  
      
    /** 
     * 通过路径获得文件， 
     * 若不存在则抛异常， 
     * 若存在则返回该文件。 
     * @param path 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static File getFile(String path) throws FileNotFoundException{  
        path = separatorReplace(path);                
        File file = new File(path);  
        if(!file.isFile()){  
            throw new FileNotFoundException("file not found!");  
        }  
        return file;  
    }  
      
    /** 
     * 通过路径获得文件夹， 
     * 若不存在则抛异常， 
     * 若存在则返回该文件夹。 
     * @param path 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static File getFolder(String path) throws FileNotFoundException{  
        path = separatorReplace(path);                
        File folder = new File(path);  
        if(!folder.isDirectory()){  
            throw new FileNotFoundException("folder not found!");  
        }  
        return folder;  
    }  
      
    /** 
     * 获得文件最后更改时间。 
     * @param path 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static Date getFileLastModified(String path) throws FileNotFoundException{  
        path = separatorReplace(path);                
        File file = getFile(path);  
        return new Date(file.lastModified());  
    }  
      
    /** 
     * 获得文件夹最后更改时间。 
     * @param path 
     * @return 
     * @throws java.io.FileNotFoundException
     */  
    public static Date getFolderLastModified(String path) throws FileNotFoundException{  
        path = separatorReplace(path);        
        File folder = getFolder(path);  
        return new Date(folder.lastModified());  
    }
    
    /**
	 * @Title: validTypeByPostfix4Others
	 * @Description: 验证当前后缀、文件类型是否是非图片类型（常用办公文件类型）  typeOthers 可以设置文件类型 
	 * @param suffix 验证文件的后缀 
	 * @return boolean 是否合法 
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByPostfix4Others(String suffix) {  
        return validTypeByPostfix(suffix, typeOthers);  
    }  
	
	/**
	 * @Title: validTypeByPostfix4Images
	 * @Description: 验证当前后缀、文件类型是否是图片类型   typeImages 可以设置图片类型 
	 * @param suffix 验证文件的后缀 
	 * @return boolean 是否合法
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByPostfix4Images(String suffix) {  
        return validTypeByPostfix(suffix, typeImages);  
    }  
	
	/**
	 * @Description: 验证当前后缀、文件类型是否是图片类型   typeVideo 可以设置视频类型  
	 * @param suffix 验证文件的后缀 
	 * @return boolean 是否合法
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByPostfix4Video(String suffix) {  
        return validTypeByPostfix(suffix, typeVideo);  
    }  
	
	/**
	 * @Title: validTypeByPostfix
	 * @Description: 根据文件后缀名和类型数组，验证文件类型是否合法  
	 * @param suffix 验证文件的后缀 
	 * @param allowTypes 类型数组 
	 * @return boolean 是否合法 
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByPostfix(String suffix, String[] allowTypes) {  
        return validTypeByPostfix(suffix, allowTypes, true);  
    }  
	
	/**
	 * @Title: validTypeByPostfix
	 * @Description: 根据后缀和类型数组验证文件类型是否合法，flag严格区分大小写  ，true不区分大小写后缀  
	 * @param suffix 验证文件的后缀 
	 * @param allowTypes 类型数组 
	 * @param flag  是否区分大小写 
	 * @return boolean 是否合法 
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByPostfix(String suffix, String[] allowTypes, boolean flag) {
		boolean valid = false;
		if (allowTypes.length > 0 && "*".equals(allowTypes[0])) {
			valid = true;
		} else {
			for (String type : allowTypes) {
				if (flag) {// 不区分大小写后缀
					if (suffix != null && suffix.equalsIgnoreCase(type)) {
						valid = true;
						break;
					}
				} else {// 严格区分大小写
					if (suffix != null && suffix.equals(type)) {
						valid = true;
						break;
					}
				}
			}
		}
		return valid;
	}

	/**
	 * @Title: validTypeByName
	 * @Description: >根据文件名称和类型数组验证文件类型是否合法  
	 * @param fileName 文件名 
	 * @param allowTypes 文件类型数组 
	 * @return boolean 是否合法
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByName(String fileName, String[] allowTypes) {  
        return validTypeByName(fileName, allowTypes, true);  
    }  
	
	/**
	 * @Title: validTypeByName4Others
	 * @Description: 验证当前文件名称、文件类型是否是非图片类型（常用办公文件类型）   typeOthers 可以设置文件类型
	 * @param fileName 验证文件的名称 
	 * @return boolean  是否合法 
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByName4Others(String fileName){
		return validTypeByName(fileName, typeOthers);
	}
	
	/**
	 * @Title: validTypeByName4Images
	 * @Description: 验证当前文件名、文件类型是否是图片类型   typeImages 可以设置图片类型 
	 * @param fileName 验证文件的名称 
	 * @return boolean 是否合法
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByName4Images(String fileName) {  
        return validTypeByName(fileName, typeImages);  
    }  
	
	/**
	 * @Title: validTypeByName4Images
	 * @Description: 验证当前文件名、文件类型是否是图片类型   typeVideo 可以设置视频类型 
	 * @param fileName 验证文件的名称 
	 * @return boolean 是否合法
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByName4Video(String fileName) {  
        return validTypeByName(fileName, typeVideo);  
    }  
	
	/**
	 * @Title: validTypeByName
	 * @Description: 根据文件名和类型数组验证文件类型是否合法，flag严格区分大小写  ，true不区分大小写后缀  
	 * @param fileName 文件名 
	 * @param allowTypes 类型数组 
	 * @param flag 是否获得大小写 
	 * @return boolean 是否验证通过 
	 * @author: zeng.fangfang
	 */
	public static boolean validTypeByName(String fileName, String[] allowTypes,boolean flag) {
		String suffix = getType(fileName);
		boolean valid = false;
		if (null != allowTypes && allowTypes.length > 0 && "*".equals(allowTypes[0])) {
			valid = true;
		}else {
			for (String type : allowTypes) {
				if (flag) {//不区分大小写后缀  
					if (null != suffix && suffix.equalsIgnoreCase(type)) {
						valid = true;
						break;
					}
				}else {//严格区分大小写  
					if (null != suffix && suffix.equals(type)) {
						valid = true;
						break;
					}
				}
			}
		}
		return valid;
	}

	/**
	 * @Description: 传递一个路径和文件名称，删除该文件  
	 * @param fileName 文件名称 
	 * @param path 文件路径
	 * @return boolean 是否删除成功
	 * @author: zeng.fangfang
	 */
	public static boolean removeFile(String fileName,String path){
		boolean flag = false;
		if (isFileExist(fileName, path)) {
			File file = new File(getDoPath(path) + fileName);
			flag = file.delete();
		}
		return flag;
	}
	
	/**
	 * @Title: removeFile
	 * @Description: 删除当前文件  
	 * @param file 要删除的文件
	 * @return boolean 是否删除成功
	 * @author: zeng.fangfang
	 */
	public static boolean removeFile(File file){
		boolean flag = false;
		if (null != file && file.exists()) {
			flag = file.delete();
		}
		return flag;
	}
	
	/**
	 * @Title: removeFile
	 * @Description: 删除某个文件 
	 * @param path 需要删除的文件路径
	 * @return boolean 是否删除成功
	 * @author: zeng.fangfang
	 */
	public static boolean removeFile(String path){
		return removeFile(new File(path));
	}
	
	/**
	 * @Title: removeFile4Dir
	 * @Description: 删除当前文件下面所有文件  
	 * @param file  要删除的文件夹下面文件的文件对象 
	 * @return boolean 是否删除成功，如果有一个文件删除失败，将返回false 
	 * @author: zeng.fangfang
	 */
	public static boolean removeFile4Dir(File file){
		boolean flag = false;
		if (null != file && file.exists() && file.isDirectory()) {
			File[] allFile = file.listFiles();
			for (File f : allFile) {
				flag = f.delete();
				if (!flag) {
					LOGGER.error("删除文件" + f.getAbsolutePath() + "出错了");
					break;
				}
			}
		}
		return flag;
	}
	
	/**
	 * @Title: removeFile4Dir
	 * @Description: 删除当前目录下所有文件 
	 * @param path 目录、路径
	 * @return boolean 是否成功
	 * @author: zeng.fangfang
	 */
	public static boolean removeFile4Dir(String path){
		return removeFile4Dir(new File(path));
	}
	
	/**
	 * @Title: removeAllFile4Dir
	 * @Description: 删除某个文件夹下的所有文件（除目录），包含子文件夹的文件  
	 * @param file 即将删除文件夹对象
	 * @return boolean 是否删除成功 
	 * @author: zeng.fangfang
	 */
	public static boolean removeAllFile4Dir(File file){
		boolean flag = false;
		if (null != file && file.exists() && file.isDirectory()) {
			File[] allFile = file.listFiles();
			for (File f : allFile) {
				if (!f.isDirectory()) {
					flag = f.delete();
				}else {
					flag = removeAllFile4Dir(f);
				}
				if (!flag) {
					LOGGER.error("删除文件" + f.getAbsolutePath() + "出错了");
					break;
				}
			}
		}
		return flag;
	}
	
	/**
	 * @Title: removeAllFile4Dir
	 * @Description: 删除某个目录下所有文件（不包含文件夹，包含文件夹下的文件）  
	 * @param path 目录的文件路径
	 * @return boolean 是否删除成功
	 * @author: zeng.fangfang
	 */
	public static boolean removeAllFile4Dir(String path){
		return removeAllFile4Dir(new File(path));
	}
	
	/**
	 * @Title: getRandomName
	 * @Description:  利用uuid产生一个随机的name 
	 * @param fileName 带后缀的文件名称 
	 * @return String 随机生成的name 
	 * @author: zeng.fangfang
	 */
	public static String getRandomName(String fileName){
		String randomName = UUID.randomUUID().toString();
		return getNewFileName(fileName, randomName, "txt");
	}
	
	/**
	 * @Title: getNumberName
	 * @Description: 用当前日期、时间和1000以内的随机数组合成的文件名称 
	 * @param fileName 文件名称 
	 * @return String 新文件名称
	 * @author: zeng.fangfang
	 */
	public static String getNumberName(String fileName){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
		int rand = new Random().nextInt(1000);
		String numberName = format.format(new Date()) + rand;
		return getNewFileName(fileName, numberName, "txt");
	}
	
	/**
	 * @Title: getNewFileName
	 * @Description: 传递一个文件名称和一个新名称，组合成一个新的带后缀文件名 
     * 当传递的文件名没有后缀，会添加默认的后缀  
	 * @param fileName 文件名称 
	 * @param newName 新文件名称
	 * @param nullSuffix 为没有后缀的文件所添加的后缀;eg:txt 
	 * @return String 返回文件名称
	 * @author: zeng.fangfang
	 */
	public static String getNewFileName(String fileName,String newName,String nullSuffix){
		String suffix = getSuffix(fileName); 
		if (null != suffix) {
			newName += suffix;
		}else {
			newName = newName.concat(".").concat(nullSuffix);
		}
		return newName;
	}
	
	/**
	 * @Title: getSuffix
	 * @Description: 传入一个文件名，得到这个文件名称的后缀 
	 * @param fileName 文件名
	 * @return String 后缀名
	 * @author: zeng.fangfang
	 */
	public static String getSuffix(String fileName) {
		int index = fileName.lastIndexOf(".");
		if (index != -1) {
			String suffix = fileName.substring(index);// 后缀
			return suffix;
		}
		return null;
	}
	
	/**
	 * @Title: getType
	 * @Description:  和文件后缀一样，不同的是没有“.” 
	 * @param fileName 文件名称 
	 * @return String 返回文件类型
	 * @author: zeng.fangfang
	 */
	public static String getType(String fileName){
		int index = fileName.lastIndexOf(".");
		if (index != -1) {
			String suffix = fileName.substring(index + 1);
			return suffix;
		}
		return null;
	}

	/**
	 * @Title: getBracketFileName
	 * @Description: 返回可用的文件名 
	 * @param fileName 文件名
	 * @param path 路径
	 * @return String 可用文件名
	 * @author: zeng.fangfang
	 */
	public static String getBracketFileName(String fileName,String path){
		return getBracketFileName(fileName, fileName, path, 1);
	}
	
	/**
	 * @Title: getBracketFileName
	 * @Description: 递归处理文件名称，直到名称不重复（对文件名、目录文件夹都可用）
	 * eg: a.txt --> a(1).txt   
	 * 文件夹upload--> 文件夹upload(1) 
	 * @param fileName 文件名称 
	 * @param bracketName
	 * @param path 文件路径 
	 * @param num 累加数字，种子 
	 * @return String 返回没有重复的名称 
	 * @author: zeng.fangfang
	 */
	public static String getBracketFileName(String fileName,String bracketName,String path,int num){
		boolean exist = isFileExist(bracketName, path);
		if (exist) {
			int index = fileName.lastIndexOf(".");
			String suffix = "";
			bracketName = fileName;
			if (index != -1) {  
				suffix = fileName.substring(index);
				bracketName = fileName.substring(0,index);
			}
			bracketName += "(" + num + ")" + suffix;
			num++;
			bracketName = getBracketFileName(fileName, bracketName, path, num);
		}
		return bracketName;
	}
	
	/**
	 * @Title: isFileExist
	 * @Description:  判断该文件是否存在 
	 * @param fileName 文件名称
	 * @param path 文件路径
	 * @return boolean 是否存在
	 * @author: zeng.fangfang
	 */
	public static boolean isFileExist(String fileName,String path){
		File file = new File(getDoPath(path)+fileName);
		return file.exists();
	}
	
	/**
	 * @Title: getDoPath
	 * @Description: 处理后的系统文件路径  
	 * @param path 文件路径 
	 * @return String 返回处理后的路径 
	 * @author: zeng.fangfang
	 */
	public static String getDoPath(String path){
		path = path.replace("\\", "/");
		String lastChar = path.substring(path.length()-1);
		if (!"/".equals(lastChar)) {
			path += "/";
		}
		return path;
	}
	
	/**
	 * @Title: mkDir
	 * @Description: 创建指定的path路径目录  
	 * @param path  目录、路径 
	 * @return boolean 是否创建成功
	 * @throws Exception boolean
	 * @author: zeng.fangfang
	 */
	public static boolean mkDir(String path)throws Exception{
		File file = null;
		try {
			file = new File(path);
			if (!file.exists()) {
				return file.mkdirs();
			}
		} catch (RuntimeException e) {
			throw e;
		}finally {
			file = null;
		}
		return false;
	}
	
	/**
	 * @Title: writeBrevityPic
	 * @Description: 创建缩略图  
	 * @param file 上传的文件 
	 * @param width 最小的尺寸 
	 * @param height 最小的尺寸 
	 * @throws java.io.IOException void
	 * @author: zeng.fangfang
	 */
	public static void writeBrevityPic(File file, float width, float height) throws IOException {
		Image src = javax.imageio.ImageIO.read(file); // 构造Image对象
		int old_w = src.getWidth(null); // 得到源图宽
		int old_h = src.getHeight(null);
		int new_w = 0;
		int new_h = 0; // 得到源图长
		float tempdouble;
		if (old_w >= old_h) {
			tempdouble = old_w / width;
		} else {
			tempdouble = old_h / height;
		}

		if (old_w >= width || old_h >= height) { // 如果文件小于锁略图的尺寸则复制即可
			new_w = Math.round(old_w / tempdouble);
			new_h = Math.round(old_h / tempdouble);// 计算新图长宽
			while (new_w > width && new_h > height) {
				if (new_w > width) {
					tempdouble = new_w / width;
					new_w = Math.round(new_w / tempdouble);
					new_h = Math.round(new_h / tempdouble);
				}
				if (new_h > height) {
					tempdouble = new_h / height;
					new_w = Math.round(new_w / tempdouble);
					new_h = Math.round(new_h / tempdouble);
				}
			}
			BufferedImage tag = new BufferedImage(new_w, new_h, BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(src, 0, 0, new_w, new_h, null); // 绘制缩小后的图
			FileOutputStream newimage = new FileOutputStream(file); // 输出到文件流
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
			JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(tag);
			param.setQuality((float) (100 / 100.0), true);// 设置图片质量,100最大,默认70
			encoder.encode(tag, param);
			encoder.encode(tag); // 将JPEG编码
			newimage.close();
		}
	}
	/**
	 * 生成大小不同的图片
	 * 
	 * @param multipartRequest
	 * @param file
	 * @param typeVal
	 *            类型 区分不同的文件夹
	 * @param types
	 *            图片大小类型
	 * @param widths
	 *            宽度
	 * @param heights
	 *            高度
	 * @return
	 * @throws Exception
	 */
	public String uploadFileWithMagickImage(String realPath,
			MultipartFile file, int width, int height) {
		if (file == null) {
			return "";
		}

		String target = "";
		try {
			ByteArrayInputStream inputStream = new ByteArrayInputStream(
					file.getBytes());
			BufferedImage oldimg = ImageIO.read(inputStream);

			BufferedImage newimg = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = newimg.createGraphics();
			// g.setBackground(Color.WHITE);// 设置背景色
			g.clearRect(0, 0, width, height);

			AffineTransform at = AffineTransform.getScaleInstance(
					(double) width / oldimg.getWidth(), (double) height
							/ oldimg.getHeight());
			g.drawRenderedImage(oldimg, at);

			String newFileName = getNewFileName(file.getOriginalFilename());

			String currentDate = new SimpleDateFormat("yyyyMMdd")
					.format(new Date());
			File imgFile = new File(realPath + Const.FILEPATHIMG + currentDate);
			if (!imgFile.exists()) {
				imgFile.mkdirs();
			}

			target =  Const.FILEPATHIMG + currentDate + "/" + newFileName;
			imgFile = new File(realPath + target);
			ImageIO.write(newimg, "png", imgFile);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return target;
	}

	/**
	 * 生成大小不同的图片
	 * 
	 * @param multipartRequest
	 * @param file
	 * @param typeVal
	 *            类型 区分不同的文件夹
	 * @param types
	 *            图片大小类型
	 * @param widths
	 *            宽度
	 * @param heights
	 *            高度
	 * @return
	 * @throws Exception
	 */
	public String uploadFileWithMagickImage2(String realPath,
			MultipartFile file, int width, int height) {
		if (file == null) {
			return "";
		}

		String target = "";
		try {
			ByteArrayInputStream inputStream = new ByteArrayInputStream(
					file.getBytes());
			BufferedImage oldimg = ImageIO.read(inputStream);

			BufferedImage newimg = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = newimg.createGraphics();
			// g.setBackground(Color.WHITE);// 设置背景色
			g.clearRect(0, 0, width, height);

			AffineTransform at = AffineTransform.getScaleInstance(
					(double) width / oldimg.getWidth(), (double) height
							/ oldimg.getHeight());
			g.drawRenderedImage(oldimg, at);

			String newFileName = getNewFileName(file.getOriginalFilename());

			String currentDate = new SimpleDateFormat("yyyyMMdd")
					.format(new Date());
			File imgFile = new File(realPath +  Const.FILEPATHIMG
					+ currentDate);
			if (!imgFile.exists()) {
				imgFile.mkdirs();
			}

			target =  Const.FILEPATHIMG + currentDate + "/" + newFileName;
			imgFile = new File(realPath + target);
			ImageIO.write(newimg, "png", imgFile);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return target;
	}
	
	/**
     * 读sql文件
     */
    public static List<String> readSqlFile(String filepath){
    	List<String> sqlList = new ArrayList<String>();
    	File file = new File(filepath);
    	BufferedReader reader = null;
    	try {
    		reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
    		StringBuffer contents = new StringBuffer();
    		String text = null;
    		while ((text = reader.readLine()) != null){
    			if(StringUtils.isNotBlank(text)){
    				contents.append(text);
    				if(text.endsWith(";")){    					
    					sqlList.add(contents.toString());
    					contents.setLength(0);    					
    				}
    			}
    		}
		} catch (FileNotFoundException e) {
			 e.printStackTrace();
		} catch (IOException e) {
			 e.printStackTrace();
		} finally{
			try {
				 if (reader != null){
					 reader.close();
				 }
			} catch (Exception e) {
				 e.printStackTrace();
			}
		}
    	
    	return sqlList;

    }
    
	/**
	 * 根据原始文件名，得到新的文件名
	 * 
	 * @param originalFileName
	 * @return
	 */
	private String getNewFileName(String originalFileName) {
		String newFileName = new SimpleDateFormat("yyyyMMddhhmmss")
				.format(new Date())
				+ "_"
				+ RandomUtil.generateNumber(8)
				+ originalFileName.substring(originalFileName.lastIndexOf("."));
		return newFileName;
	}
	public static String writeBrevityPic(String sourceFilePath, String tagerFilePath, float width, float height) throws Exception{
		FileUtil.copyAndNotReplaceFile(sourceFilePath, tagerFilePath);
		return null;
	}
}