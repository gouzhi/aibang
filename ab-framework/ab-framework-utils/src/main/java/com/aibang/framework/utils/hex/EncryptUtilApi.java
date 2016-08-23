/**    
 * @filename EncryptUtilApi.java     
 * @version www.cifex.com.cn    
 * @date 2015年9月21日     
 */
package com.aibang.framework.utils.hex;

/**      
 * java支持的加密解密
 * @author zeng.fangfang    
 * @date 2015年9月21日   
 */
public interface EncryptUtilApi {

	//------MD5-------//
    String MD5(String res);
    String MD5(String res, String key);
 
    //------SHA1-------//
    String SHA1(String res);
    String SHA1(String res, String key);
 
    //------DES-------//
    String DESencode(String res, String key);
    String DESdecode(String res, String key);
 
    //------AES-------//
    String AESencode(String res, String key);
    String AESdecode(String res, String key);
     
    //------异或加密-----//
    String XORencode(String res, String key);
    String XORdecode(String res, String key);
    int XOR(int res, String key);
}
