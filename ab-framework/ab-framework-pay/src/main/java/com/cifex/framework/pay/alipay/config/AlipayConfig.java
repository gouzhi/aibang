package com.cifex.framework.pay.alipay.config;

import com.cifex.framework.utils.Const;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.4
 *修改日期：2016-03-08
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
public class AlipayConfig {
	
    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    //支付宝提供给商户的服务接入网关URL(新)
    public static final String alipay_gateway_new = "https://mapi.alipay.com/gateway.do?";

	// 合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://b.alipay.com/order/pidAndKey.htm PID
	public static String partner = "2088421264504790";
	
	// 收款支付宝账号，以2088开头由16位纯数字组成的字符串，一般情况下收款账号就是签约账号
	public static String seller_id = partner;

	//支付宝账号
	public static String seller_email="haoyumeng@huayingjituan.com.cn";
	
	// MD5密钥，安全检验码，由数字和字母组成的32位字符串，查看地址：https://b.alipay.com/order/pidAndKey.htm
    public static String md5_key = "mv371y02jeu9e0kdphqupb38a3u91h6y";
	

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "";
	
	
	public static String notify_host="http://58.132.171.109:9005";

	public static String return_host="http://www.domain.com.cn";
	
	// 签名方式
	public static String sign_type = "MD5";
	
	// 调试用，创建TXT日志文件夹路径，见AlipayCore.java类中的logResult(String sWord)打印方法。
	public static String log_path = "C:\\";
		
	// 字符编码格式 目前支持utf-8
	public static String input_charset = "utf-8";
		
	// 支付类型 ，无需修改
	public static String payment_type = "1";
		
	 /**
     * 支付宝服务
     */
    public static final String refund_fastpay_by_platform_pwd = "refund_fastpay_by_platform_pwd";//退款服务
    public static final String mobile_service = "alipay.wap.create.direct.pay.by.user";//手机网站支付服务
    public static final String create_direct_pay_by_user = "create_direct_pay_by_user";//即时到账


    //↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	
	static
	{
		String config_partner=Const.getProperty("ALIPAY_PARTNER");
		if(config_partner!=null)
		{
			partner=config_partner;
		}
		
		String config_md5_key=Const.getProperty("ALIPAY_MD5_KEY");
		if(config_md5_key!=null)
		{
			md5_key=config_md5_key;
		}
		
		String config_seller_email=Const.getProperty("ALIPAY_SELLER_EMAIL");
		if(config_seller_email!=null)
		{
			seller_email=config_seller_email;
		}
		
		String config_notify_host=Const.getProperty("ALIPAY_NOTIFY_HOST");
		if(config_notify_host!=null)
		{
			notify_host=config_notify_host;
		}
		
		String config_return_host=Const.getProperty("ALIPAY_RETURN_HOST");
		if(config_return_host!=null)
		{
			return_host=config_return_host;
		}
		
		String config_notify_url=Const.getProperty("ALIPAY_NOTIFY_URL");
		if(config_notify_url!=null)
		{
			notify_url=config_notify_url;
		}
		
		String config_return_url=Const.getProperty("ALIPAY_RETURN_URL");
		if(config_return_url!=null)
		{
			return_url=config_return_url;
		}
		
		String config_sign_type=Const.getProperty("ALIPAY_SIGN_TYPE");
		if(config_sign_type!=null)
		{
			sign_type=config_sign_type;
		}
		
		String config_input_charset=Const.getProperty("ALIPAY_INPUT_CHARSET");
		if(config_input_charset!=null)
		{
			input_charset=config_input_charset;
		}
	}

}

