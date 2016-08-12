package com.cifex.framework.utils;

import org.apache.commons.codec.binary.Base64;
/**
 * Base64 加密解密
 * @classname Base64Utils    
 * @description 加密解密 
 * @author liuj    
 * @date 2015年9月17日
 */
public class Base64Utils {

   /**
    * 解密
    * @methodname decodeStr  
    * @discription 解密 
    * @param content
    * @return String
    * @author liuj
    * @date 2015年9月17日
    */
    @SuppressWarnings("static-access")
	public static String decodeStr(String content)  
    {  
        Base64 base64 = new Base64();  
        byte[] debytes = base64.decodeBase64(new String(content).getBytes());  
        return new String(debytes);  
    }  
  
    /**
     * 加密   
     * @methodname encodeStr  
     * @discription 加密 
     * @param content
     * @return String
     * @author liuj
     * @date 2015年9月17日
     */
    @SuppressWarnings("static-access")
	public static String encodeStr(String content)  
    {  
        Base64 base64 = new Base64();  
        byte[] enbytes = base64.encodeBase64Chunked(content.getBytes());  
        return new String(enbytes);  
    }
    public static void main(String[] args) {
    	System.out.println(encodeStr("emailId=10|email=sdfsdf@qq.com"));
    	System.out.println(decodeStr("ZW1haWxJZD0xMHxlbWFpbD1zZGZzZGZAcXEuY29t"));
	}
}
