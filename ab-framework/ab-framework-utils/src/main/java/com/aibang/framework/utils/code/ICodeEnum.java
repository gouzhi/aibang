package com.aibang.framework.utils.code;

/**
 * 编码枚举接口
 * @classname ICodeEnum    
 * @description 编码枚举接口 
 * @author liuj    
 * @date 2015年10月16日
 */
public interface ICodeEnum {
	/**
	 * 获取code码
	 * @methodname getCode  
	 * @discription 获取code码 
	 * @return String
	 * @author liuj
	 * @date 2015年10月16日
	 */
	public String getCode();
	/**
	 * 修改code码
	 * @methodname setCode  
	 * @discription 修改code码 
	 * @param code void 码
	 * @author liuj
	 * @date 2015年10月16日
	 */
	public void setCode(String code);

	/**
	 * 文本描述
	 * @methodname getText 获取文本描述
	 * @discription 文本描述 
	 * @return String
	 * @author liuj
	 * @date 2015年10月16日
	 */
	public String getText();
    /**
     * 修改文本描述
     * @methodname setText  
     * @discription 修改文本描述 
     * @param text void 文本
     * @author liuj
     * @date 2015年10月16日
     */
	public void setText(String text);
}
