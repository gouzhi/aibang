/**
* 版权所有：深圳法大大网络科技有限公司
* Copyright 2015 fadada.com Inc.
* All right reserved. 
*====================================================
* 文件名称: FddConstant.java
* 修订记录：
* No    日期				作者(操作:具体内容)
* 1.    Dec 18, 2015			Mocuishle(创建:创建文件)
*====================================================
* 类描述：(说明未实现或其它不应生成javadoc的内容)
* 
*/
package com.cifex.framework.fadada.config;

import com.cifex.framework.utils.Const;

/**
 * <h3>概要:</h3> 
 *    法大大服务配置类
 * <br>
 * <h3>功能:</h3>
 * <ol>
 * 		<li>通过getValue()获取实际值</li>
 * </ol>
 * <h3>履历:</h3>
 * <ol>
 * 		<li>2015年12月17日[zhouxw] 新建</li>
 * </ol>
 */
public enum FddConstant {

	/**
	 * apiId
	 */
	API_ID("400106"),

	/**
	 * 密钥
	 */
	APP_SECRET("1iLroUGiPhvN5H9zKcubRWz6"),

	/**
	 * 版本
	 */
	V("2.0"),
	
	/**
	 * 地址
	 */
	API_URL("https://testapi.fadada.com:8443/api/"),
	
	/**
	 * 个人注册，审核
	 */
	URL_SYNCPERSON("syncPerson.action"),
	
	/**
	 * 个人注册，免审核
	 */
	URL_SYNCPERSON_AUTO("syncPerson_auto.action"),
	
	/**
	 * 企业注册，免审核
	 */
	URL_SYNCCOMPANY_AUTO("syncCompany_auto.action"),
	
	/**
	 * 上传文档
	 */
	URL_UPLOADDOCS("uploaddocs.api"),
	/**
	 * 已签章合同文档下载
	 */
	URL_GETDOCS("getdocs.api"),
	/**
	 * 已签章合同文档查看
	 */
	URL_VIEWSDOCS("viewdocs.api"),
	/**
	 * 合同模板传输接口
	 */
	URL_UPLOADTEMPLATE("uploadtemplate.api"),
	/**
	 * 合同生成接口
	 */
	URL_GENERATE_CONTRACT("generate_contract.api"),
	/**
	 * 手动签署
	 */
	URL_EXTSIGN("extsign.action"),
	
	/**
	 * 自动签署
	 */
	URL_EXTSIGN_AUTO("extsign_auto.action"),
	
	/**
	 * 合同归档
	 */
	URL_CONTRACTFILING("contractFiling.action"), 
	
	/** 身份证检验 */
	URL_CHECKIDCARD("checkIdCard.action"), 
	
	/** 修改用户信息 */
	URL_INFOCHANGE("infochange.action"),
	
	/** 合同模板ID **/
	DOC_TEMPLATE_ID("contract20160720"),
	
	/** 授权合同模板ID **/
	DOC_TEMPLATE_AUTHORID("author2016801"),
	
	/** 默认服务器异步通知主机地址 **/
	FDD_NOTIFY_HOST("http://admin.domain.com.cn"),
	
	/** 默认服务器同步通知主机地址 **/
	FDD_RETURN_HOST("http://admin.domain.com.cn"),
	
	/** 手动签名服务器异步通知页面路径 **/
	FDD_NOTIFY_SIGN_URL("/fadada/notify_sign_url"),
	
	/** 手动签名页面跳转同步通知路径 **/
	FDD_RETURN_SIGN_URL("/fadada/return_sign_url"),

	/** 甲方（出借人）签章关键字 **/
	FDD_SIGNATURE_INVESTOR("investorsignature"),
	
    /** 乙方（借款人）签章关键字 **/
    FDD_SIGNATURE_BORROWER("borrowersignature"),
    
    /** 丙方（平台服务方）签章关键字 **/
    FDD_SIGNATURE_PLATFORM("platformsignature");

	/**
	 * 值
	 */
	private String value;
	
	static{
		String config_api_id=Const.getProperty("FDD_API_ID");
		if(config_api_id!=null)
		{
			FddConstant.API_ID.setValue(config_api_id);
		}
		String config_app_secret=Const.getProperty("FDD_APP_SECRET");
		if(config_app_secret!=null)
		{
			FddConstant.APP_SECRET.setValue(config_app_secret);	
		}
		String config_api_url=Const.getProperty("FDD_API_URL");
		if(config_api_url!=null)
		{
			FddConstant.API_URL.setValue(config_api_url);
		}
		
		String config_doc_template_id=Const.getProperty("FDD_DOC_TEMPLATE_ID");
		if(config_doc_template_id!=null)
		{
			FddConstant.DOC_TEMPLATE_ID.setValue(config_doc_template_id);
		}
		
		
		String config_notify_host=Const.getProperty("FDD_NOTIFY_HOST");
		if(config_notify_host!=null)
		{
		   FddConstant.FDD_NOTIFY_HOST.setValue(config_notify_host);
		}
		
		String config_return_host=Const.getProperty("FDD_RETURN_HOST");
		if(config_return_host!=null)
		{
		   FddConstant.FDD_RETURN_HOST.setValue(config_return_host);
		}
		
		String config_notify_sign_url=Const.getProperty("FDD_NOTIFY_SIGN_URL");
		if(config_notify_sign_url!=null)
		{
		FddConstant.FDD_NOTIFY_SIGN_URL.setValue(config_notify_sign_url);
		}
		
		String config_return_sign_url=Const.getProperty("FDD_RETURN_SIGN_URL");
		if(config_return_sign_url!=null)
		{
		 FddConstant.FDD_RETURN_SIGN_URL.setValue(config_return_sign_url);
		}
		
		String config_doc_template_authorid=Const.getProperty("FDD_DOC_TEMPLATE_AUTHORID");
		
		if(config_doc_template_authorid!=null)
		{
			FddConstant.DOC_TEMPLATE_AUTHORID.setValue(config_doc_template_authorid);
		}
		
		
	}
	
	/**
	 * 概要：FddConstant类的构造函数
	 */
	FddConstant(){};
	/**
	 * 概要：FddConstant类的构造函数
	 * @param val
	 */
	FddConstant(String val){
		this.value = val;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	 
	
}
