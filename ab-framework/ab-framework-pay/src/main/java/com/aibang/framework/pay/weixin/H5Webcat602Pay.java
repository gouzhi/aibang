package com.aibang.framework.pay.weixin;

import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.aibang.framework.utils.Logger;
import com.aibang.framework.utils.MD5;
import com.aibang.framework.utils.UuidUtil;
/**
 * 非微信浏览器微信支付微信必须是602版本以上
 * @classname H5Webcat602Pay    
 * @description 非微信浏览器微信支付微信必须是602版本以上 
 * @author liuj    
 * @date 2016年6月20日
 */
public class H5Webcat602Pay {

	private final static Logger logger = Logger.getLogger(H5Webcat602Pay.class);

	/**
	 * 获取微信H5支付地址
	 * @methodname getDeeplink  
	 * @discription 获取微信H5支付地址 
	 * @param outTradeNo  商户订单号
	 * @param productId   商品ID
	 * @param productName 产品描述
	 * @param price       交易金额
	 * @param remoteAddr  终端IP
	 * @return String
	 * @author liuj
	 * @date 2016年6月20日
	 */
	public static String getDeeplink(String outTradeNo, String productId, String productName, BigDecimal price,String remoteAddr) {
		// 密钥
		String apiKey = "380dbd4361514b6781e34be29b6b8415";
		//公众账号ID
		String appId = "wxea92b8b742528d4e";
		//商户号
		String mchId = "1356298302";
		//微信支付网关
		String WINXINPAY_GATEWAY_NEW = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		//回调host地址
		String PAY_NOTIFY_URL = "http://domain.com.cn:9003/hjs-web-batie-site";
		//回调处理地址
		String WECHAT_NOTIFY_URL = "/pay/weixin_notify";

		SortedMap<String, String> sParaTemp = new TreeMap<String, String>();
		String nonceStr = UuidUtil.get32UUID();
		sParaTemp.put("appid", appId);
		sParaTemp.put("mch_id", mchId);
		sParaTemp.put("out_trade_no", outTradeNo);
		sParaTemp.put("nonce_str", nonceStr);
		long totalFee = (long) (price.doubleValue() * 100);
		sParaTemp.put("total_fee", totalFee + "");
		sParaTemp.put("notify_url", PAY_NOTIFY_URL + WECHAT_NOTIFY_URL);
		sParaTemp.put("trade_type", "WAP");
		sParaTemp.put("product_id", productId);
		sParaTemp.put("device_info", "WEB");
		sParaTemp.put("spbill_create_ip", remoteAddr);
		if (!StringUtils.isBlank(productName)) {
			if (productName.length() > 32) {
				productName = productName.substring(0, 31);
			}
		}
		sParaTemp.put("body", productName); 
		String sign = createSign(sParaTemp, apiKey);
		sParaTemp.put("sign", sign);
		String xml = arrayToXml(sParaTemp);
		logger.debug("xml:" + xml);
		StringEntity myEntity = new StringEntity(xml, "utf-8");

		try {

			HttpPost httpPost = new HttpPost(WINXINPAY_GATEWAY_NEW);
			httpPost.addHeader("Content-Type", "text/xml");
			httpPost.setEntity(myEntity);
			HttpClient httpclient = new DefaultHttpClient();
			HttpResponse httpResponse = httpclient.execute(httpPost);

			HttpEntity entity = httpResponse.getEntity();
			if (entity != null) {

				InputStream inputStream = entity.getContent();
				SAXReader reader = new SAXReader();
				Document document = reader.read(inputStream);
				Element root = document.getRootElement();
				String return_msg = root.element("return_msg").getText();
				logger.debug("return_msg:" + return_msg);
				String codeUrl = root.element("code_url").getText();
				//预支付交易会话标识
				String prepayId = root.element("prepay_id").getText();
				logger.debug("codeUrl:" + codeUrl + ",prepayId" + prepayId);
				logger.debug(root.element("return_code").getText());
				logger.debug(root.element("return_msg").getText());
				
				SortedMap<String, String> wapParam = new TreeMap<String, String>();
				wapParam.put("appid", appId);
				wapParam.put("nonce_str", UuidUtil.get32UUID());
				wapParam.put("package", "WAP");
				wapParam.put("prepayid", prepayId);
				wapParam.put("timestamp", System.currentTimeMillis() / 1000 + "");

				String wapsign = createSign(wapParam, apiKey);
				wapParam.put("sign", wapsign);
				StringBuffer string1Buf = new StringBuffer();

				Set<Entry<String, String>> wapParamSet = wapParam.entrySet();
				for (Entry<String, String> entry : wapParamSet) {
					string1Buf.append(entry.getKey()).append("=")
					          .append(URLEncoder.encode(entry.getValue()))
							  .append("&");
				}
				String string1 = string1Buf.substring(0, string1Buf.length() - 1);

				logger.debug("String1:" + string1);
				String string2 = URLEncoder.encode(string1);
				logger.debug("string2:" + string2);

				String deeplink = "weixin://wap/pay?" + string2;
				logger.debug("deeplink:" + deeplink);
				return deeplink;
			}
		} catch (Exception e) {
			logger.error("edd", e);
		}
		return "";

	}

    /**
     * 验证是否支付成功
     * @methodname isPaySuccess  
     * @discription 验证是否支付成功 
     * @param sortMap
     * @return boolean
     * @author liuj
     * @date 2016年6月20日
     */
	public static boolean isPaySuccess(TreeMap<String, String> sortMap)
	{
		// 密钥
		String apiKey = "380dbd4361514b6781e34be29b6b8415";
		logger.debug("sortMap:"+sortMap);
		String sign = createSign(sortMap,apiKey);
		String wechatsign = (String) sortMap.get("sign");
		String resultCode=(String) sortMap.get("result_code");
		String orderId = (String) sortMap.get("out_trade_no");
		String transactionId = (String) sortMap.get("transaction_id");
		logger.debug("wechat notify----sign:"+sign+",orderId:"+orderId+",transactionId:"+transactionId+",resultCode:"+resultCode+",wechatsign:"+wechatsign);
		if(sign.equals(wechatsign)&&"SUCCESS".equals(resultCode)){
		     return true;
		}else
		{
			 return false;
		}
	}
	
	
	
	//集合转xml
	private static String arrayToXml(SortedMap<String, String> map) {
		StringBuffer xml = new StringBuffer("<xml>");
		Set<String> set = map.keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			String value = map.get(key);
			xml.append("<").append(key).append(">").append(value).append("</").append(key).append(">");
		}
		xml.append("</xml>");

		return xml.toString();
	}

	//签名
	protected static String createSign(SortedMap<String, String> sParaTemp, String apiKey) {
		StringBuffer sb = new StringBuffer();
		Set es = sParaTemp.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			if (null != v && !"".equals(v) && !"sign".equals(k) && !"key".equals(k)) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("key=" + apiKey);
		System.out.println("stringSignTemp:" + sb.toString());
		String sign = MD5.md5(sb.toString()).toUpperCase();

		return sign;

	}
	public static void main(String[] args) {
		System.out.println(getDeeplink("T0001", "1", "巴铁体验票", new BigDecimal("0.01"),"58.132.171.109"));
		
	}
	 
}
