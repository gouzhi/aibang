package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActBonusUsersManualQuery extends BaseQuery implements Serializable {
    
	private static final long serialVersionUID = 7478272827481125846L;
	/** ID */
	private java.lang.Integer id;
	/** 用户帐户ID    user_base */
	private java.lang.Integer userId;
	/** REALNAME */
	private java.lang.String realname;
	/** 手机号 */
	private java.lang.String phone;
	/** 冗余用户名 */
	private java.lang.String username;
	/** 红包ID/hjs_act_bonus：ID */
	private java.lang.Integer bonusId;
	/** 冗余红包名称 */
	private java.lang.String bname;
	/** 冗余面值 */
	private java.math.BigDecimal value;
	/** 发放红包数量 */
	private java.lang.Integer bonusNum;
	/** 摘要说明 */
	private java.lang.String memo;
	/** 操作员ID。界面录入时需输入 */
	private java.lang.Integer optId;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(java.lang.Integer value) {
		this.userId = value;
	}
	
	public java.lang.String getRealname() {
		return this.realname;
	}
	
	public void setRealname(java.lang.String value) {
		this.realname = value;
	}
	
	public java.lang.String getPhone() {
		return this.phone;
	}
	
	public void setPhone(java.lang.String value) {
		this.phone = value;
	}
	
	public java.lang.String getUsername() {
		return this.username;
	}
	
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	public java.lang.Integer getBonusId() {
		return this.bonusId;
	}
	
	public void setBonusId(java.lang.Integer value) {
		this.bonusId = value;
	}
	
	public java.lang.String getBname() {
		return this.bname;
	}
	
	public void setBname(java.lang.String value) {
		this.bname = value;
	}
	
	public java.math.BigDecimal getValue() {
		return this.value;
	}
	
	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}
	
	public java.lang.Integer getBonusNum() {
		return this.bonusNum;
	}
	
	public void setBonusNum(java.lang.Integer value) {
		this.bonusNum = value;
	}
	
	public java.lang.String getMemo() {
		return this.memo;
	}
	
	public void setMemo(java.lang.String value) {
		this.memo = value;
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

