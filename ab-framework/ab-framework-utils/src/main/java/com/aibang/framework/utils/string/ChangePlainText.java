/**    
 * @filename ChangePlainText.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月27日     
 */
package com.aibang.framework.utils.string;

import java.util.regex.Pattern;

/**
 * 过滤标签字符串，返回纯文本
 * 
 * @author zeng.fangfang
 * @date 2015年8月27日
 */
public class ChangePlainText {

	/**
	 * 过滤含有html标签的内容，返回纯文本信息
	 * @param inputString 需要过滤的html内容
	 * @return String 纯文本信息
	 * @author zeng.fangfang
	 * @date 2015年9月11日
	 */
	public static String Html2Text(String inputString) {
		String htmlStr = inputString; // 含html标签的字符串
		String textStr = "";
		Pattern p_script;
		java.util.regex.Matcher m_script;
		Pattern p_style;
		java.util.regex.Matcher m_style;
		Pattern p_html;
		java.util.regex.Matcher m_html;

		try {
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
																										// }
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
																									// }
			String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式

			p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
			m_script = p_script.matcher(htmlStr);
			htmlStr = m_script.replaceAll(""); // 过滤script标签

			p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
			m_style = p_style.matcher(htmlStr);
			htmlStr = m_style.replaceAll(""); // 过滤style标签

			p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(htmlStr);
			htmlStr = m_html.replaceAll(""); // 过滤html标签

			textStr = htmlStr;

		} catch (Exception e) {
			System.err.println("Html2Text: " + e.getMessage());
		}

		return textStr;// 返回文本字符串
	}
	
	public static void main(String[] args) {
		 
        String test="<!DOCTYPE html PUBLIC ''-//WAPFORUM//DTD XHTML Mobile 1.0//EN'' ''http://www.wapforum.org/DTD/xhtml-mobile10.dtd''><html xmlns=''http://www.w3.org/1999/xhtml''><head><meta http-equiv=''Content-Type'' content=''text/html; charset=utf-8'' /><meta id=''viewport'' name=''viewport'' content=''width=320,initial-scale=1,maximum-scale=1,user-scalable=0;'' /><title>概述-白塞病诊断和治疗指南</title><link href=''Pub/css/layout.css'' rel=''stylesheet'' type=''text/css'' /><link href=''Pub/css/public.css'' rel=''stylesheet'' type=''text/css'' /><script type=''text/javascript'' src=''Pub/js/jquery-1.6.1.min.js''></script><script type=''text/javascript'' src=''Pub/js/base.js''></script></head><body><div id=''Layout''><div class=''titleBar''><h1 id= ''1''>1. 概述</h1></div><div class=''mainContainer''><p>白塞病(Behcet's disease，BD)又称贝赫切特病、口-眼-生殖器三联征等。 </p></div></div></body></html>";  
 
        String b=ChangePlainText.Html2Text(test);
 
        System.out.println(b);
    }
}
