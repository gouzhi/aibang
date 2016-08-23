package com.aibang.transfer.model.education.vo;


import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class JcContentExtQuery extends BaseQuery implements Serializable {
    

	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -1077938588655097502L;
	/** 标题 */
	private String title;
	/**
	 * 内容
	 */
	private String txt;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
	}
	
	
}

