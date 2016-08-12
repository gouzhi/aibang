package com.cifex.framework.utils.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.TimeZone;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cifex.framework.utils.DateUtils;
/**
 * Apache.FTPClient FTP操作共公类
 * @classname FTPFileUtil    
 * @description Apache.FTPClient FTP操作共公类 
 * @author liuj    
 * @date 2016年4月20日
 */
public class FTPFileUtil {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private FTPClient ftpClient;
	private FTPModel ftpModel;

	public FTPFileUtil(FTPModel ftp) {
		super();
		// 从配置文件中读取初始化信息
		this.ftpClient = new FTPClient();
		this.ftpModel = ftp;
	}

	/**
	 * 连接并登录FTP服务器
	 * 
	 */
	public boolean ftpLogin() {
		boolean isLogin = false;
		FTPClientConfig ftpClientConfig = new FTPClientConfig(FTPClientConfig.SYST_NT);
		ftpClientConfig.setServerTimeZoneId(TimeZone.getDefault().getID());
		this.ftpClient.setControlEncoding("GBK");
		this.ftpClient.configure(ftpClientConfig);
		try {
			if (this.ftpModel.getPort() > 0) {
				this.ftpClient.connect(ftpModel.getUrl(), ftpModel.getPort());
			} else {
				this.ftpClient.connect(ftpModel.getUrl());
			}
			// FTP服务器连接回答
			int reply = this.ftpClient.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				this.ftpClient.disconnect();
				return isLogin;
			}
			this.ftpClient.login(this.ftpModel.getUsername(), this.ftpModel.getPassword());
			this.ftpClient.changeWorkingDirectory(this.ftpModel.getRemoteDir());
			this.ftpClient.setFileType(FTPClient.FILE_STRUCTURE);
			logger.info("成功登陆FTP服务器：" + this.ftpModel.getUrl() + " 端口号：" + this.getFtpModel().getPort() + " 目录："+ this.ftpModel.getRemoteDir());
			isLogin = true;
		} catch (SocketException e) {
			e.printStackTrace();
			
			logger.error("连接FTP服务失败！");
			logger.error(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("登录FTP服务失败！");
			logger.error(e.getMessage());
		}
		System.out.println(this.ftpClient.getBufferSize());
		this.ftpClient.setBufferSize(1024 * 20);
		this.ftpClient.setDataTimeout(1200000);
		return isLogin;
	}

	/**
	 * 退出并关闭FTP连接
	 * 
	 */
	public void close() {
		if (null != this.ftpClient && this.ftpClient.isConnected()) {
			try {
				boolean reuslt = this.ftpClient.logout();// 退出FTP服务器
				if (reuslt) {
					logger.info("退出并关闭FTP服务器的连接");
				}
			} catch (IOException e) {
				e.printStackTrace();
				logger.error("退出FTP服务器异常！");
				logger.error(e.getMessage());
			} finally {
				try {
					this.ftpClient.disconnect();// 关闭FTP服务器的连接
				} catch (IOException e) {
					e.printStackTrace();
					logger.error("关闭FTP服务器的连接异常！");
					logger.error(e.getMessage());
				}
			}
		}
	}

	/**
	 * 检查FTP服务器是否关闭 ，如果关闭接则连接登录FTP
	 * 
	 * @return
	 */
	public boolean isOpenFTPConnection() {
		boolean isOpen = false;
		if (null == this.ftpClient) {
			return false;
		}
		try {
			// 没有连接
			if (!this.ftpClient.isConnected()) {
				isOpen = this.ftpLogin();
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("FTP服务器连接登录异常！");
			logger.error(e.getMessage());
			isOpen = false;
		}
		return isOpen;
	}

	/**
	 * 设置传输文件的类型[文本文件或者二进制文件]
	 * 
	 * @param fileType--FTPClient.BINARY_FILE_TYPE,FTPClient.ASCII_FILE_TYPE
	 */
	public void setFileType(int fileType) {
		try {
			this.ftpClient.setFileType(fileType);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("设置传输文件的类型异常！");
			logger.error(e.getMessage());
		}
	}

	/**
	 * 下载文件
	 * 
	 * @param localFilePath
	 *            本地文件名及路径
	 * @param remoteFileName
	 *            远程文件名称
	 * @return
	 */
	public boolean downloadFile(String localFilePath, String remoteFileName) {
		BufferedOutputStream outStream = null;
		boolean success = false;
		try {
			outStream = new BufferedOutputStream(new FileOutputStream(localFilePath));
			success = this.ftpClient.retrieveFile(remoteFileName, outStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (outStream != null) {
				try {
					outStream.flush();
					outStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return success;
	}

	/**
	 * 下载文件
	 * 
	 * @param localFilePath
	 *            本地文件
	 * @param remoteFileName
	 *            远程文件名称
	 * @return
	 */
	public boolean downloadFile(File localFile, String remoteFileName) {
		BufferedOutputStream outStream = null;
		FileOutputStream outStr = null;
		boolean success = false;
		try {
			outStr = new FileOutputStream(localFile);
			outStream = new BufferedOutputStream(outStr);
			success = this.ftpClient.retrieveFile(remoteFileName, outStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace(); 
		} catch (IOException e) {
			e.printStackTrace(); 
		} finally {
			try {
				if (null != outStream) {
					try {
						outStream.flush();
						outStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (null != outStr) {
					try {
						outStr.flush();
						outStr.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return success;
	}

	/**
	 * 上传文件
	 * 
	 * @param localFilePath
	 *            本地文件路径及名称
	 * @param remoteFileName
	 *            FTP 服务器文件名称
	 * @return
	 */
	public boolean uploadFile(String localFilePath, String remoteFileName) {
		BufferedInputStream inStream = null;
		boolean success = false;
		try {
			inStream = new BufferedInputStream(new FileInputStream(localFilePath));
			success = this.ftpClient.storeFile(remoteFileName, inStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inStream != null) {
				try {
					inStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return success;
	}

	/**
	 * 上传文件
	 * 
	 * @param localFilePath
	 *            本地文件
	 * @param remoteFileName
	 *            FTP 服务器文件名称
	 * @return
	 */
	public boolean uploadFile(File localFile, String remoteFileName) {
		BufferedInputStream inStream = null;
		boolean success = false;
		try {
			inStream = new BufferedInputStream(new FileInputStream(localFile));
			success = this.ftpClient.storeFile(remoteFileName, inStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inStream != null) {
				try {
					inStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return success;
	}

	/**
	 * 变更工作目录
	 * 
	 * @param remoteDir--目录路径
	 */
	public void changeDir(String remoteDir) {
		try {
			this.ftpClient.changeWorkingDirectory(remoteDir);
			logger.info("变更工作目录为:" + remoteDir);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("变更工作目录为:" + remoteDir + "时出错！");
			logger.error(e.getMessage());
		}
	}

	/**
	 * 变更工作目录
	 * 
	 * @param remoteDir--目录路径
	 */
	public void changeDir(String[] remoteDirs) {
		String dir = "";
		try {
			for (int i = 0; i < remoteDirs.length; i++) {
				this.ftpClient.changeWorkingDirectory(remoteDirs[i]);
				dir = dir + remoteDirs[i] + "/";
			}
			logger.info("变更工作目录为:" + dir);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("变更工作目录为:" + dir + "时出错！");
			logger.error(e.getMessage());
		}
	}

	/**
	 * 返回上级目录
	 * 
	 */
	public void toParentDir(String[] remoteDirs) {
		try {
			for (int i = 0; i < remoteDirs.length; i++) {
				this.ftpClient.changeToParentDirectory();
			}
			logger.info("返回上级目录");
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("返回上级目录时出错！");
			logger.error(e.getMessage());
		}
	}

	/**
	 * 返回上级目录
	 * 
	 */
	public void toParentDir() {
		try {
			this.ftpClient.changeToParentDirectory();
			logger.info("返回上级目录");
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("返回上级目录时出错！");
			logger.error(e.getMessage());
		}
	}

	/**
	 * 获得FTP 服务器下所有的文件名列表
	 * 
	 * @param regex
	 * @return
	 */
	public String[] getListFiels() {
		String files[] = null;
		try {
			files = this.ftpClient.listNames("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return files;
	}
	/**
	 * 获得FTP 服务器下所有的文件名列表
	 * @methodname getListFiels  
	 * @discription 获得FTP 服务器下所有的文件名列表 
	 * @param pathname 路径名
	 */
	public String[] getListFiels(String pathname) {
		String files[] = null;
		try {
			files = this.ftpClient.listNames(pathname);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return files;
	}
	
	public boolean createDirectory(String pathName) throws IOException {
       return ftpClient.makeDirectory(pathName);
    }
	 
	public FTPClient getFtpClient() {
		return ftpClient;
	}

	public FTPModel getFtpModel() {
		return ftpModel;
	}

	public void setFtpModel(FTPModel ftpModel) {
		this.ftpModel = ftpModel;
	}
	
    public static void main(String[] args) throws IOException {
        FTPModel ftpModel1 = new FTPModel("partner","NMaJk5dfl86UdW79","api.qianjing.com",21,"/fund_nav");
        FTPFileUtil ftpFileUtil = new FTPFileUtil(ftpModel1);
        ftpFileUtil.ftpLogin();
        String[] files=ftpFileUtil.getListFiels();
        for(int i=0;i<files.length;i++){
        	String names=files[i];
        	System.out.println("names:::"+names);
        	ftpFileUtil.downloadFile("D:\\Users\\Administrator\\workspace1\\E-Finance\\hjs-web\\hjs-web-front-site\\src\\test\\java\\"+names, names);
        }
        //ftpFileUtil.downloadFile("D:\\Users\\Administrator\\workspace1\\E-Finance\\hjs-web\\hjs-web-front-site\\src\\test\\java\\20160429.txt", "20160429.txt");
        ftpFileUtil.close();
    }
//    
   /* public static void main(String[] args) throws FileNotFoundException, IOException {
        try {
            Scanner in = new Scanner(new File("D:\\Users\\Administrator\\workspace1\\E-Finance\\hjs-web\\hjs-web-front-site\\src\\test\\java\\20160429.txt"));      
            while (in.hasNextLine()) {
                String str = in.nextLine();
                splitt(str);   
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    	String fileName = "D:\\Users\\Administrator\\workspace1\\E-Finance\\hjs-web\\hjs-web-front-site\\src\\test\\java\\20160429.txt";//要读取的txt文件
    	  List<String[]> list = getFileContent(fileName);//将所有读到的文件放到数组里面
    	   List<fundunitVO> listvo=new ArrayList<>();
    	  //System.out.println(DateUtils.unixTimeStamp2Date(1462723200));
    	  for(int i=1;i<list.size();i++){
    		  String[] ary = list.get(i);
    		  for(int j=0;j<ary.length;j++){
    	    	  // System.out.println(str);//想取其中的任何一段只要按照数组的下标拿就可以了
    	    	   if(ary[j].equals("102003459")){
    	    		   Map<String, fundunitVO> mapvp=new HashMap<>();
    	    		   fundunitVO vo=new fundunitVO();
    	    		   String modifytime=ary[j+2];//截止时间
    	    		   String initanv=ary[j+3];//单位净值
    	    		   Date modifytime1=DateUtils.unixTimeStamp2Date(modifytime);
    	    		   DateUtils.formatCnDate(modifytime1);
    	    		   vo.setEndtime( DateUtils.formatCnDate(modifytime1));
    	    		   vo.setUnitanv(initanv);
    	    		   vo.setFundcode("102003459");
    	    		   vo.setTradeTime("20160429");
    	    		   listvo.add(vo);
    	    		   System.out.println("modifytime1::"+DateUtils.formatCnDate(modifytime1));
    	    		   System.out.println("initanv::"+initanv);
    	    		   break;
    	    	   }
    	  }
    	  }
    	  int length=listvo.size();
		  int index=length-1;
		  System.out.print("fundcode::"+listvo.get(index).getEndtime());
    }
     */
    public static String[] splitt(String str){
        String strr = str.trim();
        String[] abc = strr.split("[\\p{Space}]+");
        /*String str1 = abc[4];
        String str2 = abc[8];*/
        System.out.println(abc);
        //System.out.println(str2);
        return abc;
    }
    
  public static List<String[]> getFileContent(String fileName) throws FileNotFoundException, IOException {
    	  File file = (new File(fileName));
    	  BufferedReader bf = new BufferedReader(new FileReader(file));
    	  
    	  String content = "";
    	  
    	  List<String[]> contentList = new ArrayList<String[]>();
    	  while(content != null){
    	   content = bf.readLine();
    	   
    	   if(content == null){
    	    break;
    	   }
    	   
    	   if(!content.trim().equals("")){
    	    contentList.add(content.trim().split("\\s+")); 
    	   }
    	   
    	  }
    	  
    	  bf.close();
    	  
    	  return contentList;
    	 }
    	

}
