package org.csource;

import java.io.IOException;
import java.util.Properties;

/**
 * 读取文件上传配置文件
 * @author zhangyong    
 * @date 2015年9月24日
 */
public class FileConfigUtil {

	public FileConfigUtil(){
		
	}
	
	private static Properties properties = new Properties();
	
	/**
	 * 静态代码块加载合同的配置文件
	 */
	static{
		try {
			properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 读取合同配置文件value
	 * @param key
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年9月17日
	 */
	public static String getValue(String key) {
		return properties.getProperty(key);
	}
	
	/**
	 * 读取合同配置文件value（如果没有value，返回默认值）
	 * @param key
	 * @param defaultValue
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年9月17日
	 */
	public static String getValue(String key,String defaultValue) {
		return properties.getProperty(key, defaultValue);
	}

	/**
	 * 修改配置文件key所对应的value
	 * @param key
	 * @param value void
	 * @author zeng.fangfang
	 * @date 2015年9月17日
	 */
	public static void updateProperties(String key, String value) {
		properties.setProperty(key, value);
	}
}
