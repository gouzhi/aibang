package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActDrawUsersLogQuery extends BaseQuery implements Serializable {
    

	/** ID */
	private java.lang.Integer id;
	/** 活动表ID */
	private java.lang.Integer actId;
	/** 用户ID */
	private java.lang.Integer userId;
	/** 用户取值 */
	private java.lang.Integer userValue;
	/** 是否中奖 ：  1中  0未中 */
	private java.lang.Integer isWin;
	/** 投注日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getActId() {
		return this.actId;
	}
	
	public void setActId(java.lang.Integer value) {
		this.actId = value;
	}
	
	public java.lang.Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(java.lang.Integer value) {
		this.userId = value;
	}
	
	public java.lang.Integer getUserValue() {
		return this.userValue;
	}
	
	public void setUserValue(java.lang.Integer value) {
		this.userValue = value;
	}
	
	public java.lang.Integer getIsWin() {
		return this.isWin;
	}
	
	public void setIsWin(java.lang.Integer value) {
		this.isWin = value;
	}
	
	public java.util.Date getCreateTimeBegin() {
		return this.createTimeBegin;
	}
	
	public void setCreateTimeBegin(java.util.Date value) {
		this.createTimeBegin = value;
	}	
	
	public java.util.Date getCreateTimeEnd() {
		return this.createTimeEnd;
	}
	
	public void setCreateTimeEnd(java.util.Date value) {
		this.createTimeEnd = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	/**
	 * 关键字搜索
	 */
	private String context;
	
	public String getContext() {
		return context;
	}
	
	public void setContext(String context) {
		this.context = context;
	}
}

