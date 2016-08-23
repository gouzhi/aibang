/**    
 * @filename ReturnResult.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.rule;

import java.util.Map;

/**    
 * @classname ReturnResult    
 * @description 返回前台的bean 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class ReturnResult {

	public final static String SUCCESS = "S";
	public final static String ERROR = "E";
	
	private String result; //状态  S 成功  E 失败
	private String msg;//提示信息
	private Map<String, String> data;//数据
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, String> getData() {
		return data;
	}
	public void setData(Map<String, String> data) {
		this.data = data;
	}
}
