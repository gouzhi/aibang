package com.aibang.framework.pay.alipay;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.FastDateFormat;

import com.aibang.framework.pay.alipay.config.AlipayConfig;
import com.aibang.framework.pay.alipay.sign.MD5;
import com.aibang.framework.pay.alipay.util.AlipayCore;
import com.aibang.framework.pay.alipay.util.AlipaySubmit;
import com.aibang.framework.pay.weixin.H5Webcat602Pay;
import com.aibang.framework.utils.Logger;
/**
 * 支付宝支付接口
 * @classname ApliPayUtils    
 * @description 支付宝支付接口
 * @author liuj    
 * @date 2016年6月21日
 */
public class ApliPayUtils {
	private final static Logger logger = Logger.getLogger(H5Webcat602Pay.class);

	/**
	 * 支付宝h5表单提交支付
	 * @methodname submitAliPay  
	 * @discription 支付宝h5表单提交支付 
	 * @param tradeNo     订单号
	 * @param subject     商品的标题/交易标题/订单标题/订单关键字
	 * @param totalFee    总金额
	 * @param notifyUrl   服务器异步回调地址 如果为空则默认地址
	 * @param returnUrl   跳转同步通知页面    如果为空则默认地址 
	 * @return  表单
	 * @author liuj 
	 * @date 2016年7月4日
	 */
	/*public  static String submitAliPay(String tradeNo,String subject,BigDecimal totalFee,String notifyUrl,String returnUrl)  
	{
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", AlipayConfig.mobile_service);
		sParaTemp.put("partner", AlipayConfig.partner);
		sParaTemp.put("seller_id", AlipayConfig.seller_id);
		sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", AlipayConfig.payment_type);
		if(!StringUtils.isBlank(notifyUrl))
		{
			sParaTemp.put("notify_url",AlipayConfig.host_url + notifyUrl);
		}else {
		    sParaTemp.put("notify_url",AlipayConfig.host_url + AlipayConfig.notify_url);
		}
		if(!StringUtils.isBlank(returnUrl))
		{
			sParaTemp.put("returnUrl", AlipayConfig.host_url +returnUrl);
		}else {
			sParaTemp.put("return_url", AlipayConfig.host_url +AlipayConfig.return_url);	
		}
		sParaTemp.put("out_trade_no", tradeNo);
		sParaTemp.put("subject", subject);
		sParaTemp.put("total_fee", new DecimalFormat("0.00").format(totalFee));
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
		return sHtmlText;
	} */
	
	
	
	/**
	 * 支付宝h5链接支付
	 * @methodname submitAliPay  
	 * @discription 支付宝h5链接支付
	 * @param tradeNo     订单号
	 * @param subject   商品的标题/交易标题/订单标题/订单关键字
	 * @param totalFee    总金额
	 * @param notifyUrl   服务器异步回调地址 如果为空则默认地址
	 * @param returnUrl   跳转同步通知页面    如果为空则默认地址 
	 * @return 链接
	 * @author liuj
	 * @date 2016年7月4日
	 */
    public static String mobilePay(String tradeNo,String subject,BigDecimal totalFee,String notifyUrl,String returnUrl) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("_input_charset", AlipayConfig.input_charset);
        params.put("service", AlipayConfig.mobile_service);
        params.put("partner", AlipayConfig.partner);
        params.put("seller_id", AlipayConfig.partner);
        params.put("payment_type", AlipayConfig.payment_type);//支付类型
        if(!StringUtils.isBlank(notifyUrl))
		{
        	params.put("notify_url", AlipayConfig.notify_host +notifyUrl);
		}else {
			params.put("notify_url", AlipayConfig.notify_host + AlipayConfig.notify_url);
		}
		
		if(!StringUtils.isBlank(returnUrl))
		{
			params.put("returnUrl", AlipayConfig.return_host + returnUrl);
		}else {
			params.put("return_url", AlipayConfig.return_host + AlipayConfig.return_url);	
		}
        params.put("out_trade_no", tradeNo);
        params.put("subject", subject);
        params.put("total_fee", new DecimalFormat("0.00").format(totalFee));//交易金额 
        Map<String, String> sPara = AlipayCore.paraFilter(params);
        String content = AlipayCore.createLinkString(sPara);

        String sign = MD5.sign(content, AlipayConfig.md5_key,AlipayConfig.input_charset);
        
        
        try {
        	if(!StringUtils.isBlank(subject))
        	{
			 sPara.put("subject", URLEncoder.encode(subject,"UTF-8"));
		     content = AlipayCore.createLinkString(sPara);
        	}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        StringBuilder builder = new StringBuilder(300);
        builder.append(AlipayConfig.alipay_gateway_new);
        builder.append(content);
        builder.append("&sign=" + sign);
        builder.append("&sign_type=" + AlipayConfig.sign_type);
        return builder.toString();
    }
    
	 
    /**
	 * 支付宝PC链接支付
	 * @methodname submitAliPay  
	 * @discription 支付宝PC链接支付
	 * @param tradeNo     订单号
	 * @param subject   商品的标题/交易标题/订单标题/订单关键字
	 * @param totalFee    总金额
	 * @param notifyUrl   服务器异步回调地址 如果为空则默认地址
	 * @param returnUrl   跳转同步通知页面    如果为空则默认地址 
	 * @return 链接
	 * @author liuj
	 * @date 2016年7月4日
	 */
    public static String directPay(String tradeNo,String subject,BigDecimal totalFee,String notifyUrl,String returnUrl) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("_input_charset", AlipayConfig.input_charset);
        params.put("service", AlipayConfig.create_direct_pay_by_user);
        params.put("partner", AlipayConfig.partner);
        params.put("seller_id", AlipayConfig.partner);
        params.put("payment_type", "1");//支付类型
        if(!StringUtils.isBlank(notifyUrl))
		{
        	params.put("notify_url", AlipayConfig.notify_host +notifyUrl);
		}else {
			params.put("notify_url", AlipayConfig.notify_host + AlipayConfig.notify_url);
		}
		
		if(!StringUtils.isBlank(returnUrl))
		{
			params.put("returnUrl", AlipayConfig.return_host + returnUrl);
		}else {
			params.put("return_url", AlipayConfig.return_host + AlipayConfig.return_url);	
		}
        params.put("out_trade_no",tradeNo);
        params.put("subject", subject);
        params.put("total_fee", new DecimalFormat("0.00").format(totalFee));//交易金额

        Map<String, String> sPara = AlipayCore.paraFilter(params);
        String content = AlipayCore.createLinkString(sPara);

        String sign = MD5.sign(content, AlipayConfig.md5_key, AlipayConfig.input_charset);
        StringBuilder builder = new StringBuilder(300);
        builder.append(AlipayConfig.alipay_gateway_new);
        builder.append(content);
        builder.append("&sign=" + sign);
        builder.append("&sign_type=" + AlipayConfig.sign_type);

        return builder.toString();
    }

    
    
	/**
	 * 退款链接
	 * @methodname refund  
	 * @discription 退款链接 
	 * @param tradeNo  原付款支付宝交易号
	 * @param price    退款总金额
	 * @param reason   退款理由
	 * @param batchNo  退款批次号
	 * @param notifyUrl   服务器异步回调地址 如果为空则默认地址
	 * @return String  链接
	 * @author liuj
	 * @date 2016年7月4日
	 */ 
    public static String refund(String tradeNo,BigDecimal price,String reason,String batchNo,String notifyUrl) {
        FastDateFormat format = FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss");
        Map<String, String> params = new HashMap<String, String>();
        params.put("_input_charset", AlipayConfig.input_charset);
        params.put("service", AlipayConfig.refund_fastpay_by_platform_pwd);
        params.put("partner", AlipayConfig.partner);
        params.put("seller_email", AlipayConfig.seller_email);
        params.put("seller_user_id", AlipayConfig.partner);
        params.put("refund_date", format.format(System.currentTimeMillis()));
        params.put("batch_no", batchNo);
        /**
         * 即参数 detail_data 的值 中，“#”字符出现的数量 加 1，最大支持 1000 笔（即 “#”字符出现的最大数量 为 999 个）。
         */
        params.put("batch_num", String.valueOf(1));
        // 原付款支付宝交易号^退款总金额^退款理由
        params.put("detail_data", tradeNo + "^" + new DecimalFormat("0.00").format(price) + "^" + reason);
        params.put("notify_url",AlipayConfig.notify_host + AlipayConfig.notify_url);//默认通知链接
        if (StringUtils.isNotBlank(notifyUrl)) {
            params.put("notify_url",AlipayConfig.notify_host + notifyUrl);
        }
        Map<String, String> sPara = AlipayCore.paraFilter(params);
        String content = AlipayCore.createLinkString(sPara);

        String sign = MD5.sign(content, AlipayConfig.md5_key,
                AlipayConfig.input_charset);
        StringBuilder builder = new StringBuilder(300);
        builder.append(AlipayConfig.alipay_gateway_new);
        builder.append(content);
        builder.append("&sign=" + sign);
        builder.append("&sign_type=" + AlipayConfig.sign_type);

        return builder.toString();
    }
    
	public static void main(String[] args) {
		try {
			System.out.println(mobilePay("T0002", "商品订单", new BigDecimal("0.01"),"/pay/alipay_notify_bak","/pay/alipay_return"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
