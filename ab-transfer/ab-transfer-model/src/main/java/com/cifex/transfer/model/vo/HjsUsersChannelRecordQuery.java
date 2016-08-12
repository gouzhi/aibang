package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsUsersChannelRecordQuery extends BaseQuery implements Serializable {
    

	/** ID */
	private java.lang.Integer id;
	/** 类型  0注册 1开户 2绑卡 3投资 4放款 */
	private java.lang.Integer typeNo;
	/** 渠道方用户ID */
	private java.lang.String chlUserid;
	/** 渠道方用户名 */
	private java.lang.String chlUsername;
	/** 渠道方LOGO */
	private java.lang.String logo;
	/** 渠道方基表ID */
	private java.lang.Integer chlid;
	/** 我方用户BASEID */
	private java.lang.Integer userid;
	/** 我方用户名 */
	private java.lang.String username;
	/** 首次投资金额（按放款算） */
	private java.math.BigDecimal tenderAccount;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 投资产品ID    注册时空 */
	private java.lang.Integer borrowid;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getTypeNo() {
		return this.typeNo;
	}
	
	public void setTypeNo(java.lang.Integer value) {
		this.typeNo = value;
	}
	
	public java.lang.String getChlUserid() {
		return this.chlUserid;
	}
	
	public void setChlUserid(java.lang.String value) {
		this.chlUserid = value;
	}
	
	public java.lang.String getChlUsername() {
		return this.chlUsername;
	}
	
	public void setChlUsername(java.lang.String value) {
		this.chlUsername = value;
	}
	
	public java.lang.String getLogo() {
		return this.logo;
	}
	
	public void setLogo(java.lang.String value) {
		this.logo = value;
	}
	
	public java.lang.Integer getChlid() {
		return this.chlid;
	}
	
	public void setChlid(java.lang.Integer value) {
		this.chlid = value;
	}
	
	public java.lang.Integer getUserid() {
		return this.userid;
	}
	
	public void setUserid(java.lang.Integer value) {
		this.userid = value;
	}
	
	public java.lang.String getUsername() {
		return this.username;
	}
	
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	public java.math.BigDecimal getTenderAccount() {
		return this.tenderAccount;
	}
	
	public void setTenderAccount(java.math.BigDecimal value) {
		this.tenderAccount = value;
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
	
	public java.lang.Integer getBorrowid() {
		return this.borrowid;
	}
	
	public void setBorrowid(java.lang.Integer value) {
		this.borrowid = value;
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

