package com.aibang.framework.utils;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
/**
 * 项目名称：
 */
public class Const extends PropertyPlaceholderConfigurer {
	public static final String SESSION_SECURITY_CODE = new String("sessionSecCode");
	public static final String SESSION_SECURITY_CASH_CODE = new String("sessionSecCashCode");
	public static final String SESSION_SECURITY_CASH_SMSCODE = new String("sessionSecCashSmsCode");
	public static final String SESSION_USER = new String("sessionUser");
	public static final String SESSION_ROLE_RIGHTS = new String("sessionRoleRights");
	public static final String CACHE_SYSTEM_SERVICE = new String("cacheSystemService");
	public static final String SESSION_menuList = new String("menuList");			//当前菜单
	public static final String SESSION_allmenuList = new String("allmenuList");		//全部菜单
	public static final String SESSION_QX = new String("QX");
	public static final String SESSION_userpds =  new String("userpds");			
	public static final String SESSION_USERNAME = new String("USERNAME");			//用户名
	public static final String SESSION_USEROPT = new String("sessionUserOpt");      //用户企业信息，账户信息
	public static final String SESSION_USERCUSTOMER = new String("sessionUserCustomer");//会员用户信息，账户信息
	public static final String TRUE = new String("T");
	public static final String FALSE = new String("F");
	public static final String LOGIN = new String("/login_toLogin.do");				//登录地址
	public static final String USER_LOGIN = new String("/login");				//登录地址
	public static final String FILEPATHIMG = new String("uploadFiles/uploadImgs/");	//图片上传路径
	public static final String FILEPATHFILE = new String("uploadFiles/file/");		//文件上传路径
	public static final String FILEPATHTWODIMENSIONCODE = new String("uploadFiles/twoDimensionCode/"); //二维码存放路径
	public static final String NO_INTERCEPTOR_PATH = new String(".*/((login)|(logout)|(code)|(app)|(weixin)|(static)|(main)|(websocket)).*");	//不对匹配该值的访问路径拦截（正则）
	public static final String UPLOAD_PIC_PATH= new String("http://127.0.0.1:8080/admin/fileupload/savePic.do");
	public static final String UPLOAD_FILE_PATH= new String("http://127.0.0.1:8080/admin/fileupload/saveFile.do");
	public static final String CSS_IMAGE_DOMAIN = new String("/static");
	public static final String WEB_DOMAIN = new String("/");
	public static final String PROJECT_NAME = new String("");
	public static final String PAGE	= new String("10");			                    //分页条数配置路径
	public static final String WEB_FILE_DOMAIN=new String("");
	public static final String WEB_NAME=new String("money");
	public static Map<String, String> bankMap = new HashMap<String, String>();
	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
	private static Map<String, String> ctxPropertiesMap = new HashMap<String, String>();
	

	public static final String RESP_CODE_SUCCESS = "000"; //应答返回码 000 代表交易成功
	public static final String CHINAPNR = "chinapnr";// 资金托管银行或者第三方 汇付

	@Override
	protected void processProperties(
			ConfigurableListableBeanFactory beanFactoryToProcess,
			Properties props) throws BeansException {
		 super.processProperties(beanFactoryToProcess, props);
		 for (Object key : props.keySet()) {
		 	 String keyStr = key.toString();
			 String value = props.getProperty(keyStr);
			 ctxPropertiesMap.put(keyStr, value);
		 }
	    bankMap.put("ICBC", "工商银行");
		bankMap.put("ABC", "农行");
		bankMap.put("CMB", "招行");
		bankMap.put("CCB", "建设银行");
		bankMap.put("BCCB", "北京银行");
		bankMap.put("BJRCB", "北京农村商业银行");
		bankMap.put("BOC", "中国银行");
		bankMap.put("BOCOM", "交通银行");
		bankMap.put("CMBC", "民生银行");
		bankMap.put("BOS", "上海银行");
		bankMap.put("CBHB", "渤海银行");
		bankMap.put("CEB", "光大银行");
		bankMap.put("CIB", "兴业银行");
		bankMap.put("CITIC", "中信银行");
		bankMap.put("CZB", "浙商银行");
		bankMap.put("GDB", "广发银行");
		bankMap.put("HKBEA", "东亚银行");
		bankMap.put("HXB", "华夏银行");
		bankMap.put("HZCB", "杭州银行");
		bankMap.put("NJCB", "南京银行");
		bankMap.put("PINGAN", "平安银行");
		bankMap.put("PSBC", "邮储银行");
		bankMap.put("SDB", "深发银行");
		bankMap.put("SPDB", "浦发");
		bankMap.put("SRCB", "上海农村商业银行");
	     try {
			Field[] fileds=Const.class.getDeclaredFields();
			for (Field field : fileds) {
				field.setAccessible(true);
				        Field modifiersField;
						modifiersField = Field.class.getDeclaredField("modifiers");
						modifiersField.setAccessible(true);
						modifiersField.setInt(field, field.getModifiers() & ~Modifier.FINAL);
						if(props.get(field.getName())!=null&&!StringUtils.isBlank(props.get(field.getName()).toString()))
						{
						  field.set(null, props.get(field.getName()).toString());
						} 
		 	 }
		 } catch (NoSuchFieldException e) {
		 	e.printStackTrace();
		 } catch (SecurityException e) {
			e.printStackTrace();
		 } catch (IllegalArgumentException e) {
			e.printStackTrace();
		 } catch (IllegalAccessException e) {
			e.printStackTrace();
		 }   
	}
	
	public static String getProperty(String key) {
		return ctxPropertiesMap.get(key);
	}
	
	/*
	public static Properties props=null;
	static{
		Resource resource = new ClassPathResource("/system.properties");
		try {
			props = PropertiesLoaderUtils.loadProperties(resource);
			Const c=new Const();
			Field[] fileds=Const.class.getDeclaredFields();
			for (Field field : fileds) {
				field.setAccessible(true);
				        Field modifiersField;
						modifiersField = Field.class.getDeclaredField("modifiers");
						modifiersField.setAccessible(true);
						modifiersField.setInt(field, field.getModifiers() & ~Modifier.FINAL);
						if(props.get(field.getName())!=null&&!StringUtils.isBlank(props.get(field.getName()).toString()))
						{
						  field.set(null, props.get(field.getName()).toString());
						} 
			}
			} catch (NoSuchFieldException e) {
				//  Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				//  Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				//  Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				//  Auto-generated catch block
				e.printStackTrace();
			}  catch (IOException e) {
			  //  Auto-generated catch block
			  e.printStackTrace();
		   }
	}*/
	public static final String SYSNAME = new String("admin/config/SYSNAME.txt");	//系统名称路径
	public static final String EMAIL = new String("admin/config/EMAIL.txt");		//邮箱服务器配置路径
	public static final String SMS1 = new String("admin/config/SMS1.txt");			//短信账户配置路径1
	public static final String SMS2 = new String("admin/config/SMS2.txt");			//短信账户配置路径2
	public static final String FWATERM = new String("admin/config/FWATERM.txt");	//文字水印配置路径
	public static final String IWATERM = new String("admin/config/IWATERM.txt");	//图片水印配置路径
	public static final String WEIXIN	= new String("admin/config/WEIXIN.txt");	//微信配置路径
	/**
	 * APP Constants
	 */
	//app注册接口_请求协议参数)
	public static  String[] APP_REGISTERED_PARAM_ARRAY = new String[]{"countries","uname","passwd","title","full_name","company_name","countries_code","area_code","telephone","mobile"};
	public static  String[] APP_REGISTERED_VALUE_ARRAY = new String[]{"国籍","邮箱帐号","密码","称谓","名称","公司名称","国家编号","区号","电话","手机号"};
	
	//app根据用户名获取会员信息接口_请求协议中的参数
	public static  String[] APP_GETAPPUSER_PARAM_ARRAY = new String[]{"USERNAME"};
	public static  String[] APP_GETAPPUSER_VALUE_ARRAY = new String[]{"用户名"};
	
}
