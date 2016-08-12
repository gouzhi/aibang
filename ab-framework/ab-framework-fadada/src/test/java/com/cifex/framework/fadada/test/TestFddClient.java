/**
* 版权所有：深圳法大大网络科技有限公司
* Copyright 2015 fadada.com Inc.
* All right reserved. 
*====================================================
* 文件名称: TestFddClient.java
* 修订记录：
* No    日期				作者(操作:具体内容)
* 1.    Dec 18, 2015			Mocuishle(创建:创建文件)
*====================================================
* 类描述：(说明未实现或其它不应生成javadoc的内容)
* 
*/
package com.cifex.framework.fadada.test;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.cifex.framework.fadada.FddClient;
import com.cifex.framework.fadada.config.FddConstant;
import com.cifex.framework.utils.JSONUtils;

/**
 * <h3>概要:</h3> 
 *    FddClient的测试类
 * <br>
 * <h3>功能:</h3>
 * <ol>
 * 		<li>提供对FddClient方法的调用实例</li>
 * </ol>
 * <h3>履历:</h3>
 * <ol>
 * 		<li>2015年12月30日[zhouxw] 新建</li>
 * </ol>
 */
public class TestFddClient {

	public static void main(String[] args) {
		String response  = "Welcome to www.fadada.com!";
		
		// 个人注册免审核
		// response = FddClient.invokeSyncPersonAuto("祁依霜", "z010801@ddd.com", "370403199205094668", "18926460051");
		// 个人注册需审核
        // response = FddClient.invokeSyncPerson("z12181", "z12181@fdd.com", "431003199112180002", "18926460050");
		// 合同上传
	 	// response = FddClient.invokeUploadDocs("2015122302", new File("D:\\uuuuuuu2222.pdf"), "", ".pdf");
		// 手动签署
        /* response = FddClient.invokeExtSign("201512181205",
							        		 "201607180102", "", FddConstant.FDD_RETURN_HOST.getValue()+FddConstant.FDD_RETURN_SIGN_URL.getValue(), 
							        		 "1", "2010B0F70B480609", "test", "",
							        		 FddConstant.FDD_NOTIFY_HOST.getValue()+FddConstant.FDD_NOTIFY_SIGN_URL.getValue(),"");*/
		// 自动签署
 	    // response = FddClient.invokeExtSignAuto("201512181222", "2010B0F70B480609", "", "", "1", "3", "201607180105",  "test", FddConstant.FDD_SIGNATURE_BORROWER.getValue(), "", "");
		// 合同归档
		// response = FddClient.invokeContractFilling("2015122301");
		// 合同模板上传
	    //response =FddClient.invokeUploadTemplate("author2016731", new File("D:\\fadada\\author2016731.pdf"), "");
		//已签章合同文档下载
		//response=FddClient.invokeGetdocs("201512181222");
		//已签章合同文档查看
		//response=FddClient.invokeViewdocs("201512181222");
		// 合同生成
	/*  Map<String, Object> parameter_map=new HashMap<String, Object>();
		parameter_map.put("fill_1","1456");
		parameter_map.put("fill_2","sdf.kljdls");
		parameter_map.put("fill_3","第三方水的附件");
		parameter_map.put("fill_4","！@*#（*sdf");
		response=FddClient.invokeGenerateContract("个人投资合同", "author2016731", "201607180105", parameter_map);*/  
		
 		//https://testapi.fadada.com:8443/api//getdocs.action?app_id=400106&v=2.0&timestamp=20160713165702&transaction_id=201512181212&msg_digest=NDg4QTBCMUQ2MDQ0NjNGNkUxRTU2Qjg2RDU0RjQ2QTE4QzAxQ0I2NQ==","msg":"文档签署成功","result":"success","viewpdf_url":"https://testapi.fadada.com:8443/api//viewdocs.action?app_id=400106&v=2.0&timestamp=20160713165702&transaction_id=201512181212&msg_digest=NDg4QTBCMUQ2MDQ0NjNGNkUxRTU2Qjg2RDU0RjQ2QTE4QzAxQ0I2NQ==
 		//{"code":"1000","download_url":"https:\/\/testapi.fadada.com:8443\/api\/\/getdocs.action?app_id=400106&v=2.0&timestamp=20160713165702&transaction_id=201512181212&msg_digest=NDg4QTBCMUQ2MDQ0NjNGNkUxRTU2Qjg2RDU0RjQ2QTE4QzAxQ0I2NQ==","msg":"文档签署成功","result":"success","viewpdf_url":"https:\/\/testapi.fadada.com:8443\/api\/\/viewdocs.action?app_id=400106&v=2.0&timestamp=20160713165702&transaction_id=201512181212&msg_digest=NDg4QTBCMUQ2MDQ0NjNGNkUxRTU2Qjg2RDU0RjQ2QTE4QzAxQ0I2NQ=="}
		//{"code":"1000","download_url":"https:\/\/testapi.fadada.com:8443\/api\/\/getdocs.action?app_id=400106&v=2.0&timestamp=20160713171918&transaction_id=201512181213&msg_digest=Q0I0MEQwRDk5NjY3RTdDQzAzQTExNzZEREFENUM0QURFMzkyRjc4Qw==","msg":"文档签署成功","result":"success","viewpdf_url":"https:\/\/testapi.fadada.com:8443\/api\/\/viewdocs.action?app_id=400106&v=2.0&timestamp=20160713171918&transaction_id=201512181213&msg_digest=Q0I0MEQwRDk5NjY3RTdDQzAzQTExNzZEREFENUM0QURFMzkyRjc4Qw=="}
 		//https://testapi.fadada.com:8443/api//getdocs.action?app_id=400106&v=2.0&timestamp=20160713172714&transaction_id=201512181214&msg_digest=QjE5NjZCRDkwNzFFN0Q5OEJEMDJFODQ3RTdFRUNGQzZCMzM0QzE3NQ==
		//https://testapi.fadada.com:8443/api//getdocs.action?app_id=400106&v=2.0&timestamp=20160713171918&transaction_id=201512181213&msg_digest=Q0I0MEQwRDk5NjY3RTdDQzAzQTExNzZEREFENUM0QURFMzkyRjc4Qw==
 	    
		
		
		System.out.println(response); 
		Map<String, Object> resultMap =JSON.parseObject(response, new TypeReference<Map<String,Object>>(){});
		System.out.println(resultMap.get("msg"));
	}

	
}
