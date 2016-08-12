package com.cifex.framework.pay.weixin.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.cifex.framework.pay.weixin.common.Signature;
import com.cifex.framework.pay.weixin.common.WxPayConfig;
import com.cifex.framework.pay.weixin.protocol.UnifiedReqData;
import com.cifex.framework.pay.weixin.protocol.UnifiedResData;
import com.cifex.framework.utils.BigDecimalUtils;
import com.cifex.framework.utils.DateUtils;
import com.cifex.framework.utils.UuidUtil;
import com.cifex.framework.utils.http.HttpAccessUtil;
import com.cifex.framework.utils.http.MimeTypes;

/**
 * 微信接口调用
 * @author maoruxin  
 * @date 2016年7月7日
 */
public class WxPayCoreService {
	
	/**
	 * 微信网页授权		
	 * @param scope		snsapi_base：获取进入页面的用户的openid   snsapi_userinfo：获取用户的基本信息的
	 * @param state		参数
	 * @param redirectUrl		授权后重定向地址
	 * @param response
	 * @throws IOException void
	 * @author maoruxin
	 * @date 2016年7月7日
	 */
	public static void oauth2(String scope,String state,HttpServletResponse response,String redirectUrl) throws IOException{
		String redirectUri ;
		if(StringUtils.isBlank(redirectUrl)){
			redirectUri = WxPayConfig.return_host+WxPayConfig.redirect_url;
		}else{
			redirectUri = WxPayConfig.return_host+redirectUrl;
		}
		
		String url = WxPayConfig.OAUTH_API + "?appid=" + WxPayConfig.appID + 
				"&redirect_uri=" + URLEncoder.encode(redirectUri, "UTF-8") +   
				"&response_type=code" + "&scope=" + scope + "&state=" + state + "#wechat_redirect";
		response.sendRedirect(url);
	}
	
	/**
	 * 通过code换取网页授权access_token(openId)
	 * @param code		授权接口中返回的code
	 * @return String	返回OpenId
	 * @author maoruxin
	 * @throws Exception 
	 * @date 2016年7月7日
	 */
	public static Map<String, Object>  access(String code) throws Exception{
		String url = WxPayConfig.ACCESS_TOKEN_API + "?appid=" + WxPayConfig.appID
				+ "&secret=" + WxPayConfig.secret + "&code=" + code + "&grant_type=authorization_code";
		String jsonString = HttpAccessUtil.httpRequest(url,
				MimeTypes.TXT, "GET", 100000, 100000,"");
		ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> params = mapper.readValue(jsonString, new TypeReference<HashMap<String, Object>>() {});
		return params;
	}
	
	/**
	 * 微信支付下订单
	 * @param deviceInfo	设备号  PC网页或公众号内支付请传"WEB"
	 * @param body			商品描述
	 * @param outTradeNo	商户订单号
	 * @param sumFee		总金额	单位为元
	 * @param ip			终端IP
	 * @param expire		多长时间后过期  单位为min
	 * @param notifyUrl		通知地址  如果为空则默认地址
	 * @param tradeType		H5为JSAPI
	 * @param limitPay		指定支付方式	no_credit--指定不能使用信用卡支付
	 * @param openid
	 * @return Map
	 * @author maoruxin
	 * @throws Exception 
	 * @date 2016年7月7日
	 */
	public static Map wxPayOrder(String deviceInfo,String body,String outTradeNo,BigDecimal sumFee,String ip,
			int expire,String notifyUrl,String tradeType,String limitPay,String openid) throws Exception{
		int totalFee = (BigDecimalUtils.multiply(sumFee, new BigDecimal(100))).intValue();//订单总金额，单位为分
		if(StringUtils.isBlank(notifyUrl)){
			notifyUrl = WxPayConfig.notify_host + WxPayConfig.notify_url;
		}else{
			notifyUrl = WxPayConfig.notify_host + notifyUrl;
		}
		Date startDate = new Date();
    	String timeStart = DateUtils.formatDate(startDate, "yyyyMMddHHmmss");
    	Date expireDate = DateUtils.addMinutes(startDate, expire);
    	String timeExpire = DateUtils.formatDate(expireDate, "yyyyMMddHHmmss");
		UnifiedReqData unifiedReqData = new UnifiedReqData(deviceInfo, body, null, null, outTradeNo, 
				totalFee, ip, timeStart, timeExpire, null, notifyUrl, tradeType, null, limitPay, openid);
		
		UnifiedResData resDate = UnifiedOrderService.request(unifiedReqData);
		
		//预支付交易会话标识
    	String prepayId = resDate.getPrepay_id();
    	
    	String timeStamp = String.valueOf(System.currentTimeMillis() / 1000);
		String appid = WxPayConfig.appID;
		String nonceStr = UuidUtil.get32UUID();
		String packageValue = "prepay_id=" + prepayId;
		Map param = new HashMap();
		param.put("appId", appid);
		param.put("timeStamp", timeStamp);
		param.put("nonceStr", nonceStr);
		param.put("package", packageValue);
		param.put("signType", "MD5");
		param.put("paySign", Signature.getSign(param));
		//package字段是jap关键字，换属性名
		param.put("packageValue", packageValue);
		return param;
	} 
	
	
}
