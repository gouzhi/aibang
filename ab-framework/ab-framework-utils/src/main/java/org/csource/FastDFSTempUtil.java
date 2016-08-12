package org.csource;

import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class FastDFSTempUtil {

	static{

		try{
			InputStream is=FastDFSTempUtil.class.getResourceAsStream("/META-INF/fdfs_with_redis_client_temp.conf");
			ClientGlobal.init(is);
		}catch (Exception ex){
			ex.printStackTrace();
		}
	}

	public static String uploadFile(String fileAbsPath) throws IOException, MyException{
		String uploadFileName =  fileAbsPath;
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
	
	
	public static byte[] downloadFile(String dfsFileAbsPath) throws IOException, MyException
	{
		    TrackerClient tracker = new TrackerClient();
	        TrackerServer trackerServer = tracker.getConnection();
	        StorageServer storageServer = null;
	        StorageClient1 client = new StorageClient1(trackerServer, storageServer);
	        byte[] file_buff=client.download_file("group1", dfsFileAbsPath);
	        trackerServer.close();
	        return file_buff;
	}
	
	public static String deleteFile(String dfsFileAbsPath) throws IOException, MyException{

        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = tracker.getConnection();
        StorageServer storageServer = null;
        StorageClient1 client = new StorageClient1(trackerServer, storageServer);

		//int i = client.delete_file("group1", "M00/00/05/rAsB-VZ4t1qAFSc4AAOFQ9N3oVs234.png");
        int i = client.delete_file("group1", dfsFileAbsPath);
  		trackerServer.close();
		return i+"";
	}

	public static void main(String[] args) throws Exception {
//		String filePath = 	FastDFSTempUtil.uploadFile("d://11.png");
//		System.out.println(filePath);

		
        File content = new File("D:\\tools\\nginx\\html\\images\\alipay120x120.png");
		
		FileInputStream fis = new FileInputStream(content);
	    byte[] file_buff = null;
	    if (fis != null) {
	    	int len = fis.available();
	    	file_buff = new byte[len];
	    	fis.read(file_buff);
	    }
	    String path=uploadFile(file_buff,"alipay120x120.png");
	    System.out.println(path);
	    //System.out.println(uploadFile("D:\\tools\\nginx\\html\\images\\alipay120x120.png"));
	    
	    /*
	    
		String flag = 	FastDFSTempUtil.deleteFile();
		System.out.println(flag);*/



//		目前访问的机器为172.11.1.249机器，那么访问路径就应该是 Http://172.11.1.249/ +filePath
//		http://172.11.1.249/group1/M00/00/05/rAsB-VZ4t1qAFSc4AAOFQ9N3oVs234.png


	}

}
