package com.cifex.framework.web.utils;
/**
 * Javascript的escape 编码/解码
 * @classname Escape    
 * @description  Javascript的escape 编码/解码
 * @author liuj    
 * @date 2016年7月25日
 */
public class Escape {

	/**
	 * 编码
	 * @methodname escape  
	 * @discription 编码 
	 * @param src  字符串
	 * @return String
	 * @author liuj
	 * @date 2016年7月25日
	 */
	public static String escape(String src) {
		int i;
		char j;
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length() * 6);
		for (i = 0; i < src.length(); i++) {
			j = src.charAt(i);
			if (Character.isDigit(j) || Character.isLowerCase(j)
					|| Character.isUpperCase(j))
				tmp.append(j);
			else if (j < 256) {
				tmp.append("%");
				if (j < 16)
					tmp.append("0");
				tmp.append(Integer.toString(j, 16));
			} else {
				tmp.append("%u");
				tmp.append(Integer.toString(j, 16));
			}
		}
		return tmp.toString();
	}

	/**
	 * 解码
	 * @methodname unescape  
	 * @discription 解码 
	 * @param src 字符串
	 * @return String
	 * @author liuj
	 * @date 2016年7月25日
	 */
	public static String unescape(String src) {
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(src
							.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(src
							.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}

	public static void main(String[] args) {
		String tmp = "中文";
		System.out.println("testing escape : " + tmp);
		tmp = escape(tmp);
		System.out.println(tmp);
		System.out.println("testing unescape :" + tmp);
		System.out.println(unescape("%u4E2D%u6587"));
		//alert(location.href) escape(location.href).replace(/\//g,"%2F")
		System.out.println(unescape("http%3A%2F%2Fsearch.jd.com%2FSearch%3Fkeyword%3D%25E8%25BD%25A6%25E5%258E%2598%25E5%25AD%2590%26enc%3Dutf-8%26pvid%3Ddlmad1ri.tsosj9"));
    }
}
