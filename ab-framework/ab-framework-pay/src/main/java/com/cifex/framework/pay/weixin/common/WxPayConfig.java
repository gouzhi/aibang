package com.cifex.framework.pay.weixin.common;

import com.cifex.framework.utils.Const;

/**
 * User: rizenguo
 * Date: 2014/10/29
 * Time: 14:40
 * 这里放置各种配置数据
 */
public class WxPayConfig {
//这个就是自己要保管好的私有Key了（切记只能放在自己的后台代码里，不能放在任何可能被看到源代码的客户端程序中）
	// 每次自己Post数据给API的时候都要用这个key来对所有字段进行签名，生成的签名会放在Sign这个字段，API收到Post数据的时候也会用同样的签名算法对Post过来的数据进行签名和验证
	// 收到API的返回的时候也要用这个key来对返回的数据算下签名，跟API的Sign数据进行比较，如果值不一致，有可能数据被第三方给篡改

	public static String key = "380dbd4361514b6781e34be29b6b8415";

	//微信分配的公众号ID（开通公众号之后可以获取到）
	public static String appID = "wxea92b8b742528d4e";

	//微信支付分配的商户号ID（开通公众号的微信支付功能之后可以获取到）
	public static String mchID = "1356298302";
	
	//令牌
	public static String token = "13omnbo3nol93sv5k243ljh1hligb03c";
	
	//消息加解密密钥
	public static String encodingAESKey = "FIygteVSq6ovQBgTCEyqAlvSBrSb5tmxjjDVAcggz0A";
	
	//应用密钥
	public static String secret = "1cbffade5a25ac5753d84f4d3e651e4e";
	
	//异步通知路径
	public static String notify_url = "";
	
	//授权回调路径
	public static String redirect_url = "";
	
	public static String notify_host= "";
	
	public static String return_host= "";

	//以下是几个API的路径：
	//1）授权API
	public static final String OAUTH_API = "https://open.weixin.qq.com/connect/oauth2/authorize";

	//2）获取网页授权API
	public static final String ACCESS_TOKEN_API = "https://api.weixin.qq.com/sns/oauth2/access_token";

	//3）统一下单API
	public static final String UNIFIED_ORDER_API = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	
	
	
	//4）授权回调API
	public static String REDIRECT_URI_API = "http://s152823i71.iok.la/hjs-web-batie-site/wxPay/pay";
	
	//5）支付回调API
	public static String NOTIFY_URL_API = "http://s152823i71.iok.la/hjs-web-batie-site/wxPay/wxNotify";
	
	static{
		String config_key = Const.getProperty("WXPAY_KEY");
		if(config_key!=null){
			key = config_key;
		}
		
		String config_appID = Const.getProperty("WXPAY_APPID");
		if(config_appID!=null){
			appID = config_appID;
		}
		
		String config_mchID = Const.getProperty("WXPAY_MCHID");
		if(config_mchID!=null){
			mchID = config_mchID;
		}
		
		String config_token = Const.getProperty("WXPAY_TOKEN");
		if(config_token!=null){
			token = config_token;
		}
		
		String config_encodingAESKey = Const.getProperty("WXPAY_ENCODINGAESKEY");
		if(config_encodingAESKey!=null){
			encodingAESKey = config_encodingAESKey;
		}
		
		String config_secret = Const.getProperty("WXPAY_SECRET");
		if(config_secret!=null){
			secret = config_secret;
		}
		
		String config_notify_url = Const.getProperty("WXPAY_NOTIFY_URL");
		if(config_notify_url!=null){
			notify_url = config_notify_url;
		}
		
		String config_redirect_url = Const.getProperty("WXPAY_REDIRECT_URL");
		if(config_redirect_url!=null){
			redirect_url = config_redirect_url;
		}
		
		String config_notify_host = Const.getProperty("WXPAY_NOTIFY_HOST");
		if(config_notify_host!=null){
			notify_host = config_notify_host;
		}
		
		String config_return_host = Const.getProperty("WXPAY_RETURN_HOST");
		if(config_return_host!=null){
			return_host = config_return_host;
		}
	}
	
	
}
