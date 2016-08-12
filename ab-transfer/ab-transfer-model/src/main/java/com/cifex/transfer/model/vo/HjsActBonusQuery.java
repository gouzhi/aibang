package com.cifex.transfer.model.vo;

import java.io.Serializable;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.page.BaseQuery;


public class HjsActBonusQuery extends BaseQuery implements Serializable {
    

	
	private static final long serialVersionUID = -7059269068838183103L;
	/** ID */
	private java.lang.Integer id;
	/** 编号 */
	private java.lang.String bcode;
	/** 名称 */
	private java.lang.String bname;
	/** 红包类型/configid=31 */
	private java.lang.Integer type;
	/** 面值 */
	private java.math.BigDecimal value;
	/** 有效期 */
	private java.lang.Integer avlDays;
	/** 操作员ID。界面录入时需填写 */
	private java.lang.Integer optId;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private java.lang.String createIp;
	/** 使用方式逗号隔开 1提现 2购买    例如 ,2,1, */
	private java.lang.String useType;
	/** 投资使用下限金额。 */
	private java.math.BigDecimal tenderMin;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.String getBcode() {
		return this.bcode;
	}
	
	public void setBcode(java.lang.String value) {
		this.bcode = value;
	}
	
	public java.lang.String getBname() {
		return this.bname;
	}
	
	public void setBname(java.lang.String value) {
		this.bname = value;
	}
	
	public java.lang.Integer getType() {
		return this.type;
	}
	
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	
	public java.math.BigDecimal getValue() {
		return this.value;
	}
	
	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}
	
	public java.lang.Integer getAvlDays() {
		return this.avlDays;
	}
	
	public void setAvlDays(java.lang.Integer value) {
		this.avlDays = value;
	}
	
	public java.lang.Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(java.lang.Integer value) {
		this.optId = value;
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
	
	public java.lang.String getCreateIp() {
		return this.createIp;
	}
	
	public void setCreateIp(java.lang.String value) {
		this.createIp = value;
	}
	
	public java.lang.String getUseType() {
		return this.useType;
	}
	
	public void setUseType(java.lang.String value) {
		this.useType = value;
	}
	
	public java.math.BigDecimal getTenderMin() {
		return this.tenderMin;
	}
	
	public void setTenderMin(java.math.BigDecimal value) {
		this.tenderMin = value;
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

