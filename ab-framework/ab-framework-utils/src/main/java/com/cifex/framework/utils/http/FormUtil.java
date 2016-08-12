package com.cifex.framework.utils.http;

import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 支付表单
 * @classname FormUtil    
 * @description 支付表单 
 * @author liuj    
 * @date 2015年11月10日
 */
public class FormUtil {
	private static Log log = LogFactory.getLog(FormUtil.class);

	 
	/**
	 * 构造form表单提交HTML
	 * @methodname buildForm  
	 * @discription 构造form表单提交HTML
	 * @param sParaTemp 请求参数Map
	 * @param gateway 访问地址url
	 * @param strMethod 提交方式。两个值可选：post、get
	 * @param strButtonName 确认按钮显示文字
	 * @return String 提交表单HTML文本
	 * @author liuj
	 * @date 2015年11月10日
	 */
	private static String buildForm(Map<String, String> sParaTemp, String gateway, String strMethod, String strButtonName) {
		// 待请求参数数组
		Set<String> keys = sParaTemp.keySet();

		StringBuffer sbHtml = new StringBuffer();

		sbHtml.append("<form id=\"editForm\" name=\"editForm\" action=\"");
		sbHtml.append(gateway);
		sbHtml.append("\" method=\"");
		sbHtml.append(strMethod);
		sbHtml.append("\">");
		for (String name : keys) {
			String value = sParaTemp.get(name);
			sbHtml.append("<input type=\"hidden\" name=\"");
			sbHtml.append(name);
			sbHtml.append("\" value='");
			sbHtml.append(value);
			sbHtml.append("'/>");
			System.out.println(name + "=============" + value);
			log.info(name + "=============" + value);
		}
		// submit按钮控件请不要含有name属性
		sbHtml.append("<input type=\"submit\" value=\"" + strButtonName + "\" style=\"display:none;\"></form>");
		sbHtml.append("<script>onload=document.forms['editForm'].submit();</script>");
        return sbHtml.toString();
	}

	/**
	 *  构造form表单提交HTML
	 * @methodname buildHtmlForm  
	 * @discription 构造form表单提交HTML 
	 * @param sParaTemp 请求参数Map
	 * @param gateway 访问地址url
	 * @param method 提交方式。两个值可选：post、get
	 * @return String HTML
	 * @author liuj
	 * @date 2015年11月10日
	 */
	public static String buildHtmlForm(Map<String, String> sParaTemp, String gateway, String method) {
		StringBuffer htmlBuf = new StringBuffer();
		htmlBuf.append("<html><meta http-equiv='Content-Type' content='text/html' />");
		htmlBuf.append(" <head><meta charset=\"UTF-8\" /></head>");
		htmlBuf.append(" <head><title>sender</title></head>");
		htmlBuf.append(" <body>");
		htmlBuf.append(buildForm(sParaTemp, gateway, method, "提交"));
		htmlBuf.append(" </body>");
		htmlBuf.append("</html>");
		return htmlBuf.toString();
	}

	/**
	 * 构造jquery post请求 提交数据 调用时在页面写一个 js回调方法: function buildFromCallBack(data){}
	 * @methodname buildHtmlJqueryPost  
	 * @discription 构造jquery post请求 提交数据 调用时在页面写一个 js回调方法: function buildFromCallBack(data){} 
	 * @param param 请求参数Map
	 * @param url  访问地址url
	 * @return String HTML
	 * @author liuj
	 * @date 2015年11月10日
	 */
	public static String buildHtmlJqueryPost(Map<String, String> param, String url) {
		StringBuffer htmlBuf = new StringBuffer();
		htmlBuf.append("<html><head><title>sender</title></head><body></body>");
		htmlBuf.append("<script src='http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js' type='text/javascript'></script>");
		htmlBuf.append(buildJqueryPost(param, url)).append("</html>");
		return htmlBuf.toString();
	}

	/**
	 *  构造jquery post请求提交数据
	 * @methodname buildJqueryPost  
	 * @discription  构造jquery post请求提交数据 
	 * @param param 请求参数Map
	 * @param url 访问地址url
	 * @return String HTML
	 * @author liuj
	 * @date 2015年11月10日
	 */
	private static String buildJqueryPost(Map<String, String> param, String url) {
		Set<String> keys = param.keySet();
		StringBuffer sbHtml = new StringBuffer();
		sbHtml.append("<script>").append(" $(function() {");
		// 开始构造请求参数 格式: param={name:value,name1,value1....}
		sbHtml.append(" var param={");
		for (String name : keys) {
			String value = param.get(name);
			sbHtml.append(name + ":'" + value + "',");
		}
		sbHtml.deleteCharAt(sbHtml.length() - 1).append("};");// 请求参数构造Ok
		sbHtml.append("$.post('" + url + "', $.param(param), buildFromCallBack(data));    });");
		sbHtml.append("</script>");
		return sbHtml.toString();
	}

}
