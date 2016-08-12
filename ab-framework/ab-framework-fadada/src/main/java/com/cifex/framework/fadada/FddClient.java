/**
* 版权所有：深圳法大大网络科技有限公司
* Copyright 2015 fadada.com Inc.
* All right reserved. 
*====================================================
* 文件名称: FddClient.java
* 修订记录：
* No    日期				作者(操作:具体内容)
* 1.    Dec 18, 2015			Mocuishle(创建:创建文件)
*====================================================
* 类描述：(说明未实现或其它不应生成javadoc的内容)
* 
*/
package com.cifex.framework.fadada;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.cifex.framework.fadada.config.FddConstant;
import com.cifex.framework.fadada.utils.FddEncryptTool;
import com.cifex.framework.fadada.utils.SSLClient;

/**
 * <h3>概要:</h3> 
 *    法大大接口调用
 * <br>
 * <h3>功能:</h3>
 * <ol>
 * 		<li>个人注册需审核</li>
 * 		<li>个人注册免审核</li>
 * 		<li>企业注册免审核</li>
 * 		<li>上传合同</li>
 * 		<li>手动签章</li>
 * 		<li>自动签章</li>
 * 		<li>合同归档</li>
 * 		<li>身份验证</li>
 * 		<li>修改用户信息</li>
 *      <li>合同模板传输接口</li>
 *      <li>合同生成接口</li>
 * </ol>
 * <h3>履历:</h3>
 * <ol>
 * 		<li>2015年12月17日[zhouxw] 新建</li>
 * </ol>
 */
public class FddClient {
	
	/**
	 * <b>概要：</b>
	 * 个人注册需审核
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月18日 </br>
	 * @param customer_name 名称
	 * @param email 邮箱
	 * @param id_card 身份证号码
	 * @param mobile 手机号码
	 * @return 接口处理结果
	 */
	public static String invokeSyncPerson(String customer_name,String email,String id_card,String mobile){
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(appid+md5(timestamp)+SHA1(appsecret)))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			params.add(new BasicNameValuePair("app_id", FddConstant.API_ID.getValue()));
			params.add(new BasicNameValuePair("timestamp", timeStamp));
			params.add(new BasicNameValuePair("v", FddConstant.V.getValue()));
			params.add(new BasicNameValuePair("customer_name", customer_name));
			params.add(new BasicNameValuePair("email", email));
			String id_mobile = FddEncryptTool.encrypt(id_card + "|" + mobile, FddConstant.APP_SECRET.getValue());
			params.add(new BasicNameValuePair("id_mobile", id_mobile));
			params.add(new BasicNameValuePair("msg_digest", msgDigest));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doPost(FddConstant.API_URL.getValue()+FddConstant.URL_SYNCPERSON.getValue(), params, charset);
	}
	
	/**
	 * <b>概要：</b>
	 * 个人注册免审核
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月17日 </br>
	 * @param customer_name 名称
	 * @param email 邮箱
	 * @param id_card 身份证号码
	 * @param mobile 手机号码
	 * @return 接口处理结果
	 */
	public static String invokeSyncPersonAuto(String customer_name,String email,String id_card,String mobile){
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(appid+md5(timestamp)+SHA1(appsecret)))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));

			params.add(new BasicNameValuePair("app_id", FddConstant.API_ID.getValue()));
			params.add(new BasicNameValuePair("timestamp", timeStamp));
			params.add(new BasicNameValuePair("v", FddConstant.V.getValue()));
			params.add(new BasicNameValuePair("customer_name", customer_name));
			params.add(new BasicNameValuePair("email", email));
			String id_mobile = FddEncryptTool.encrypt(id_card + "|" + mobile, FddConstant.APP_SECRET.getValue());
			params.add(new BasicNameValuePair("id_mobile", id_mobile));
			params.add(new BasicNameValuePair("msg_digest", msgDigest));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doPost(FddConstant.API_URL.getValue()+FddConstant.URL_SYNCPERSON_AUTO.getValue(), params, charset);
	}


	/**
	 * 合同模板传输接口
	 * @methodname uploadtemplate  
	 * @discription 合同模板传输接口 
	 * @param template_id  必选	合同模板编号
	 * @param file         可选	文档	File   doc_url 和file 两个参数必选一
	 * @param doc_url      可选	文档地址	文档地址 doc_url 和file 两个参数必选一
	 * @return String 接口处理结果
	 * @author liuj
	 * @date 2016年7月18日
	 */
    public static String invokeUploadTemplate(String template_id,File file,String doc_url) {
    	String result = "";
    	try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(timestamp)+SHA1(app_secret+   template_id)))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+template_id));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			
			HttpClient httpclient = new DefaultHttpClient();  
	        HttpPost httppost = new HttpPost(FddConstant.API_URL.getValue()+FddConstant.URL_UPLOADTEMPLATE.getValue());  
	        FileBody fileBody = new FileBody(file); //创建待处理的文件  
	        MultipartEntity reqEntity = new MultipartEntity();  //对请求的表单域进行填充  
	        reqEntity.addPart("app_id", new StringBody(FddConstant.API_ID.getValue()));  //创建待处理的表单域内容文本  
	        reqEntity.addPart("v", new StringBody(FddConstant.V.getValue()));  
	        reqEntity.addPart("timestamp", new StringBody(timeStamp));  
	        reqEntity.addPart("template_id", new StringBody(template_id));  
	        reqEntity.addPart("doc_url", new StringBody(doc_url));
	        reqEntity.addPart("file", fileBody);  
	        reqEntity.addPart("msg_digest", new StringBody(msgDigest));
	        httppost.setEntity(reqEntity);  
	        HttpResponse response = httpclient.execute(httppost);
	        if(HttpStatus.SC_OK==response.getStatusLine().getStatusCode()){  
	            HttpEntity entity = response.getEntity();  
	            //显示内容  
	            if (entity != null) {  
	            	result = EntityUtils.toString(entity);
	            }  
	        }
    	}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    
    

    /**
     * 合同生成接口
     * @methodname generateContract  
     * @discription 合同生成接口 
     * @param doc_title   必选      待签署文档标题	如“xx投资合同” URL encoding处理
     * @param template_id 必选	合同模板编号
     * @param contract_id 必选	合同编号	此合同编号用于后续调用签署接口时使用 
     * @param parameter_map  必选	参数键值对	将map<key,value>转成json格式，key为模板里定义的参数名，value为需要填充的参数值。
     * @return String 接口处理结果
     * @author liuj
     * @date 2016年7月18日
     */
    public static String  invokeGenerateContract(String doc_title,String template_id,String contract_id,Map<String,Object> parameter_map)
    {
    	String json=JSON.toJSON(parameter_map).toString();
    	List<NameValuePair> params = new ArrayList<NameValuePair>();
		try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(timestamp)+SHA1(app_secret+   template_id+contract_id)+ parameter_map))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+template_id+contract_id)+json);
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			params.add(new BasicNameValuePair("app_id", FddConstant.API_ID.getValue()));
			params.add(new BasicNameValuePair("v", FddConstant.V.getValue()));
			params.add(new BasicNameValuePair("timestamp", timeStamp));
			params.add(new BasicNameValuePair("doc_title", doc_title));
			params.add(new BasicNameValuePair("template_id", template_id));
			params.add(new BasicNameValuePair("contract_id", contract_id));
			params.add(new BasicNameValuePair("parameter_map", json));
			params.add(new BasicNameValuePair("msg_digest", msgDigest));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doPost(FddConstant.API_URL.getValue()+FddConstant.URL_GENERATE_CONTRACT.getValue(), params, charset);
    }

 


	/**
	 * <b>概要：</b>
	 * 上传合同
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月17日 </br>
	 * @param contract_id 合同编号
	 * @param file 合同文件,与doc_url两个只传一个
	 * @param doc_url 合同文件url地址
	 * @param docType 合同类型：.html .doc .docx .pdf ……
	 * @return 接口处理结果
	 */
	public static String invokeUploadDocs(String contract_id,File file,String doc_url,String docType){
		String result = "";
		try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(timestamp)+SHA1(app_secret+  contract_id )))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+contract_id));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			
			HttpClient httpclient = new DefaultHttpClient();  
	        HttpPost httppost = new HttpPost(FddConstant.API_URL.getValue()+FddConstant.URL_UPLOADDOCS.getValue());  
	        FileBody fileBody = new FileBody(file); //创建待处理的文件  
	        MultipartEntity reqEntity = new MultipartEntity();  //对请求的表单域进行填充  
	        reqEntity.addPart("file", fileBody);  
	        reqEntity.addPart("doc_url", new StringBody(doc_url));
	        reqEntity.addPart("app_id", new StringBody(FddConstant.API_ID.getValue()));  //创建待处理的表单域内容文本  
	        reqEntity.addPart("v", new StringBody(FddConstant.V.getValue()));  
	        reqEntity.addPart("contract_id", new StringBody(contract_id));  
	        reqEntity.addPart("timestamp", new StringBody(timeStamp));  
	        reqEntity.addPart("msg_digest", new StringBody(msgDigest));
	        reqEntity.addPart("doc_type", new StringBody(docType)); 
	        httppost.setEntity(reqEntity);  
	        HttpResponse response = httpclient.execute(httppost);
	        if(HttpStatus.SC_OK==response.getStatusLine().getStatusCode()){  
	            HttpEntity entity = response.getEntity();  
	            //显示内容  
	            if (entity != null) {  
	            	result = EntityUtils.toString(entity);
	            }  
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * <b>概要：</b>
	 * 手动签章
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月30日 </br>
	 * @param transaction_id 交易号，长度小于等于32位
	 * @param contract_id 合同编号
	 * @param doc_type 文档类型，此参数已废弃，请传空字符串
	 * @param return_url 跳转地址
	 * @param client_type 客户类型：1-个人，2-企业
	 * @param customer_id 客户编号
	 * @param doc_title 文档标题
	 * @param doc_url 文档地址，此参数已废弃，请传空字符串
	 * @param notify_url 异步通知地址
	 * @param sign_keyword 签章关键字
	 * @return 返回拼接好的地址，请重定向到该地址
	 */
	public static String invokeExtSign(String transaction_id,String contract_id,String doc_type,String return_url,String client_type,String customer_id,String doc_title,String doc_url,String notify_url,String sign_keyword){
		String timeStamp = getTimeStamp();
		StringBuffer sb = new StringBuffer(FddConstant.API_URL.getValue()+FddConstant.URL_EXTSIGN.getValue());
		try {
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(transaction_id+timestamp)+SHA1(app_secret+ customer_id +doc_url)))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(transaction_id+timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+customer_id+doc_url));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));

			sb.append("?timestamp=").append(timeStamp);
			sb.append("&app_id=").append(FddConstant.API_ID.getValue());
			sb.append("&v=").append(FddConstant.V.getValue());
			sb.append("&msg_digest=").append(msgDigest);
			sb.append("&transaction_id=").append(transaction_id);
			sb.append("&contract_id=").append(contract_id);
			sb.append("&client_type=").append(client_type);
			sb.append("&customer_id=").append(customer_id);
			sb.append("&doc_title=").append(URLEncoder.encode(doc_title, charset));
			sb.append("&doc_url=").append(URLEncoder.encode(doc_url, charset));
			sb.append("&doc_type=").append(doc_type);
			sb.append("&sign_keyword=").append(URLEncoder.encode(sign_keyword, charset));
			sb.append("&return_url=").append(URLEncoder.encode(return_url, charset));
			sb.append("&notify_url=").append(URLEncoder.encode(notify_url, charset));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	/**
	 * 已签章合同文档下载
	 * @methodname invokeGetdocs  
	 * @discription 已签章合同文档下载 
	 * @param transaction_id 交易号
	 * @return String
	 * @author liuj
	 * @date 2016年7月31日
	 */
	public static String invokeGetdocs(String transaction_id)
	{
		String timeStamp = getTimeStamp();
		StringBuffer sb = new StringBuffer(FddConstant.API_URL.getValue()+FddConstant.URL_GETDOCS.getValue());
		try {
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(transaction_id+timestamp)+SHA1(app_secret+ customer_id +doc_url)))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+transaction_id));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			sb.append("?app_id=").append(FddConstant.API_ID.getValue());
			sb.append("&v=").append(FddConstant.V.getValue());
			sb.append("&timestamp=").append(timeStamp);
			sb.append("&transaction_id=").append(transaction_id);
			sb.append("&msg_digest=").append(msgDigest);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	/**
	 * 已签章合同文档查看
	 * @methodname invokeGetdocs  
	 * @discription 已签章合同文档查看
	 * @param transaction_id 交易号
	 * @return String
	 * @author liuj
	 * @date 2016年7月31日
	 */
	public static String invokeViewdocs(String transaction_id)
	{
		String timeStamp = getTimeStamp();
		StringBuffer sb = new StringBuffer(FddConstant.API_URL.getValue()+FddConstant.URL_VIEWSDOCS.getValue());
		try {
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(transaction_id+timestamp)+SHA1(app_secret+ customer_id +doc_url)))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+transaction_id));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			sb.append("?app_id=").append(FddConstant.API_ID.getValue());
			sb.append("&v=").append(FddConstant.V.getValue());
			sb.append("&timestamp=").append(timeStamp);
			sb.append("&transaction_id=").append(transaction_id);
			sb.append("&msg_digest=").append(msgDigest);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	/**
	 * <b>概要：</b>
	 * 自动签署
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月30日 </br>
	 * @param transaction_id 交易号
	 * @param customer_id 客户编号
	 * @param doc_url 文档URL，此参数已废弃，请传空字符串
	 * @param batch_id 批次号（交易号）
	 * @param client_type 客户类型：1-个人，2-企业
	 * @param client_role 客户角色
	 * @param contract_id 合同编号
	 * @param doc_title 文档标题
	 * @param sign_keyword 签章关键字
	 * @param notify_url 异步通知地址
	 * @param doc_type 文档类型，此参数已废弃，请传空字符串
	 * @return 接口处理结果
	 */
	public static String invokeExtSignAuto(String transaction_id,String customer_id,String doc_url,String batch_id,String client_type,String client_role,String contract_id,String doc_title,String sign_keyword,String notify_url,String doc_type){
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(transaction_id+timestamp) + SHA1(app_secret+ customer_id +doc_url)))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(transaction_id+timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+customer_id+doc_url));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));

			params.add(new BasicNameValuePair("app_id", FddConstant.API_ID.getValue()));
			params.add(new BasicNameValuePair("timestamp", timeStamp));
			params.add(new BasicNameValuePair("v", FddConstant.V.getValue()));
			params.add(new BasicNameValuePair("msg_digest", msgDigest));
			params.add(new BasicNameValuePair("transaction_id", transaction_id)); 
			params.add(new BasicNameValuePair("batch_id", batch_id));
			params.add(new BasicNameValuePair("contract_id", contract_id));
			params.add(new BasicNameValuePair("client_type", client_type));
			params.add(new BasicNameValuePair("client_role", client_role));
			params.add(new BasicNameValuePair("customer_id", customer_id));
			params.add(new BasicNameValuePair("doc_title", doc_title));
			params.add(new BasicNameValuePair("doc_url", doc_url));
			params.add(new BasicNameValuePair("doc_type", doc_type));
			params.add(new BasicNameValuePair("sign_keyword", sign_keyword));
			params.add(new BasicNameValuePair("notify_url", notify_url));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doPost(FddConstant.API_URL.getValue()+FddConstant.URL_EXTSIGN_AUTO.getValue(), params, charset);
	}
	
	
	/**
	 * <b>概要：</b>
	 * 合同归档
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月18日 </br>
	 * @param contract_id 合同编号
	 * @return 接口处理结果
	 */
	public static String invokeContractFilling(String contract_id){
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(timestamp)+SHA1(app_secret+  contract_id )))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()+contract_id));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			params.add(new BasicNameValuePair("app_id", FddConstant.API_ID.getValue()));
			params.add(new BasicNameValuePair("timestamp", timeStamp));
			params.add(new BasicNameValuePair("v", FddConstant.V.getValue()));
			params.add(new BasicNameValuePair("msg_digest", msgDigest));
			params.add(new BasicNameValuePair("contract_id", contract_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doPost(FddConstant.API_URL.getValue()+FddConstant.URL_CONTRACTFILING.getValue(), params, charset);
	}
	
	/**
	 * <b>概要：</b>
	 * 修改用户信息
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月23日 </br>
	 * @param email 邮箱
	 * @param mobile 手机号码11位
	 * @param customer_id 客户编号
	 * @return 接口处理结果
	 */
	public static String invokeInfoChange(String email,String mobile,String customer_id){
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		try {
			String timeStamp = getTimeStamp();
			String msgDigest = "";
			//Base64(SHA1(app_id+md5(timestamp)+SHA1(app_secret )))
			String sha1 = FddEncryptTool.sha1(FddConstant.API_ID.getValue()+FddEncryptTool.md5Digest(timeStamp)+FddEncryptTool.sha1(FddConstant.APP_SECRET.getValue()));
			msgDigest = new String(FddEncryptTool.Base64Encode(sha1.getBytes()));
			params.add(new BasicNameValuePair("app_id", FddConstant.API_ID.getValue()));
			params.add(new BasicNameValuePair("timestamp", timeStamp));
			params.add(new BasicNameValuePair("v", FddConstant.V.getValue()));
			params.add(new BasicNameValuePair("msg_digest", msgDigest));
			params.add(new BasicNameValuePair("email", email));
			params.add(new BasicNameValuePair("mobile", mobile));
			params.add(new BasicNameValuePair("customer_id", customer_id));
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return doPost(FddConstant.API_URL.getValue()+FddConstant.URL_INFOCHANGE.getValue(), params, charset);
	}
	
    /*===================================doPost==============================================*/
	private static String charset = "UTF-8";
	/**
	 * <b>概要：</b>
	 * post请求方法
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月17日 </br>
	 * @param url
	 * @param params
	 * @param charset
	 * @return 链接响应内容
	 */
	public static String doPost(String url,List<NameValuePair> params,String charset){
		HttpClient httpClient = null;
		HttpPost httpPost = null;
		String result = null;
		try{
			httpClient = new SSLClient();
			httpPost = new HttpPost(url);
			//设置参数
			if(null!=params && params.size() > 0){
				UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params,charset);
				httpPost.setEntity(entity);
			}
			HttpResponse response = httpClient.execute(httpPost);
			if(response != null){
				HttpEntity resEntity = response.getEntity();
				if(resEntity != null){
					result = EntityUtils.toString(resEntity,charset);
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return result;
	}

	
	
	/*===================================doPost==============================================*/

	/**
	 * <b>概要：</b>
	 * 获取当前时间戳
	 * <b>作者：</b>zhouxw </br>
	 * <b>日期：</b>2015年12月17日 </br>
	 * @return 当前时间：'yyyyMMddHHmmss'格式
	 */
	public static String getTimeStamp(){
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(ts);
	}
	 
}
