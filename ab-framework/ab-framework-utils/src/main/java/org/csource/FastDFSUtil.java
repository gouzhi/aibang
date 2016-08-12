package org.csource;

import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;


import java.io.IOException;
import java.io.InputStream;

public class FastDFSUtil {

	static{

		try{
			InputStream is=FastDFSUtil.class.getResourceAsStream("/META-INF/fdfs_with_redis_client.conf");
			ClientGlobal.init(is);
		}catch (Exception ex){
			ex.printStackTrace();
		}
	}



    /**
     * 上传到正式的dfs服务器
     * @methodname uploadFile  
     * @discription 上传到正式的dfs服务器 
     * @param fileAbsPath 本地文件磁盘绝对路径 例如 d://path//11.png
     * @return
     * @throws IOException
     * @throws MyException String
     * @author liuj
     * @date 2016年2月18日
     */
	public static String uploadFile(String fileAbsPath) throws IOException, MyException{
		
		//获取配置文件中nginx的路径文件
		String uploadPath = FileConfigUtil.getValue("WEB.NGINX.HTMLPATH");
		//拼写文件的绝对路径
		String uploadFileName = uploadPath + fileAbsPath;
        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = tracker.getConnection();
        StorageServer storageServer = null;
        StorageClient1 client = new StorageClient1(trackerServer, storageServer);

        NameValuePair[] metaList = new NameValuePair[1];
        metaList[0] = new NameValuePair("fileName", uploadFileName);
        String filePath = client.upload_file1(uploadFileName, null, metaList);

  		trackerServer.close();
		return filePath; 
	}
	

	/**
	 * 上传图片到正式的dfs服务器
	 * @methodname uploadFile  
	 * @discription 上传图片到dfs 
	 * @param file_buff  字节
	 * @param uploadFileName 文件名
	 * @return 路径
	 * @throws IOException
	 * @throws MyException String
	 * @author liuj
	 * @date 2015年12月24日
	 */
	public static String uploadFile(byte[] file_buff, String uploadFileName) throws IOException, MyException
	{
		TrackerClient tracker = new TrackerClient();
	    TrackerServer trackerServer = tracker.getConnection();
	    StorageServer storageServer = null;
	    NameValuePair[] metaList = new NameValuePair[1];
        metaList[0] = new NameValuePair("fileName", uploadFileName);
		StorageClient1 client = new StorageClient1(trackerServer, storageServer);
		String[] fileNames=uploadFileName.split("\\.");
		String filePath= client.upload_file1(file_buff, fileNames[fileNames.length-1], metaList);
		trackerServer.close();
		return filePath;
	}
	
	/**
	 * 将临时dfs文件转移到正式的dfs文件
	 * 通过临时dfs文件路径
	 * @methodname uploadFilePublic  
	 * @discription 文件上传到正式环境
	 * @param tempDfsPath 临时的dfs文件上传路径 例如 group1/M00/00/05/rAsB-VZ7pFSAGwq7AACLPPiIYq0174.png
	 * @return String  正式的dfs文件路径
	 * @author liuj
	 * @throws IOException 
	 * @throws MyException 
	 * @date 2015年12月24日
	 */
	public static String uploadFilePublic(String tempDfsPath) throws IOException, MyException
	{
		tempDfsPath=tempDfsPath.substring(7);
		byte[] file_buff=FastDFSTempUtil.downloadFile(tempDfsPath);
		String[] pathArray=tempDfsPath.split("\\/");
		String uploadPath=uploadFile(file_buff,pathArray[pathArray.length-1]);
  		FastDFSTempUtil.deleteFile(tempDfsPath);
		return uploadPath;
	}

	public static void main(String[] args) throws Exception {
		String filePath = 	FastDFSUtil.uploadFile("//11.png");
		System.out.println(filePath);
//		String string1="group1/M00/00/05/rAsB-VZ7pFSAGwq7AACLPPiIYq0174.png";
		
//		System.out.println(string1.substring(7));
		
		//group1/M00/00/05/rAsB-VZ7myGAPOGdAACLPPiIYq0830.png
		//		目前访问的机器为172.11.1.249机器，那么访问路径就应该是 Http://172.11.1.249/ +filePath
		//		http://172.11.1.249/group1/M00/00/00/rAsB-VX4wUWALnTFAAOFQ9N3oVs650.png

	}

}
