package com.aibang.transfer.model.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActInfoQuery extends BaseQuery implements Serializable {

	private static final long serialVersionUID = 2651544416668040850L;
	/** ID */
	private java.lang.Integer id;
	/** 活动编号 */
	private java.lang.String acode;
	/** 活动名称 */
	private java.lang.String aname;
	/** 活动类型/CONFIGID=33 */
	private java.lang.Integer type;
	/** 总预算 */
	private java.math.BigDecimal budgetTotal;
	/** 活动状态/CONFIGID=32 */
	private java.lang.Integer status;
	/** 开始时间 */
	private java.util.Date startTimeBegin;
	private java.util.Date startTimeEnd;
	/** 结束时间 */
	private java.util.Date stopTimeBegin;
	private java.util.Date stopTimeEnd;
	/** 活动红包ID */
	private java.lang.Integer bonusId;
	/** 返佣红包ID */
	private java.lang.Integer bonusChargesId;
	/** 活动链接 */
	private java.lang.String actUrl;
	/** 来源 */
	private java.lang.String actSource;
	/** 规则 */
	private java.lang.String actRules;
	/** 操作员ID。界面录入时需填写 */
	private java.lang.Integer optId;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private java.lang.String createIp;
	/** 已经使用 */
	private java.math.BigDecimal budgetUsed;
	/** 剩余预算 */
	private java.math.BigDecimal budgetLast;
	/** 获取红包的投资范围：最小值。 */
	private java.math.BigDecimal tenderScopeMin;
	/** 获取红包的投资范围：最大值。 */
	private java.math.BigDecimal tenderScopeMax;
	/** 适用的平台：半角逗号隔开：  1WEB，2安卓 ， 3 IOS  4 H5 */
	private java.lang.String systemScope;
	/** 0：基本活动   1：扩展的转盘活动 */
	private java.lang.Integer actType;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.String getAcode() {
		return this.acode;
	}
	
	public void setAcode(java.lang.String value) {
		this.acode = value;
	}
	
	public java.lang.String getAname() {
		return this.aname;
	}
	
	public void setAname(java.lang.String value) {
		this.aname = value;
	}
	
	public java.lang.Integer getType() {
		return this.type;
	}
	
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	
	public java.math.BigDecimal getBudgetTotal() {
		return this.budgetTotal;
	}
	
	public void setBudgetTotal(java.math.BigDecimal value) {
		this.budgetTotal = value;
	}
	
	public java.lang.Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.Integer value) {
		this.status = value;
	}
	
	public java.util.Date getStartTimeBegin() {
		return this.startTimeBegin;
	}
	
	public void setStartTimeBegin(java.util.Date value) {
		this.startTimeBegin = value;
	}	
	
	public java.util.Date getStartTimeEnd() {
		return this.startTimeEnd;
	}
	
	public void setStartTimeEnd(java.util.Date value) {
		this.startTimeEnd = value;
	}
	
	public java.util.Date getStopTimeBegin() {
		return this.stopTimeBegin;
	}
	
	public void setStopTimeBegin(java.util.Date value) {
		this.stopTimeBegin = value;
	}	
	
	public java.util.Date getStopTimeEnd() {
		return this.stopTimeEnd;
	}
	
	public void setStopTimeEnd(java.util.Date value) {
		this.stopTimeEnd = value;
	}
	
	public java.lang.Integer getBonusId() {
		return this.bonusId;
	}
	
	public void setBonusId(java.lang.Integer value) {
		this.bonusId = value;
	}
	
	public java.lang.Integer getBonusChargesId() {
		return this.bonusChargesId;
	}
	
	public void setBonusChargesId(java.lang.Integer value) {
		this.bonusChargesId = value;
	}
	
	public java.lang.String getActUrl() {
		return this.actUrl;
	}
	
	public void setActUrl(java.lang.String value) {
		this.actUrl = value;
	}
	
	public java.lang.String getActSource() {
		return this.actSource;
	}
	
	public void setActSource(java.lang.String value) {
		this.actSource = value;
	}
	
	public java.lang.String getActRules() {
		return this.actRules;
	}
	
	public void setActRules(java.lang.String value) {
		this.actRules = value;
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
	
	public java.math.BigDecimal getBudgetUsed() {
		return this.budgetUsed;
	}
	
	public void setBudgetUsed(java.math.BigDecimal value) {
		this.budgetUsed = value;
	}
	
	public java.math.BigDecimal getBudgetLast() {
		return this.budgetLast;
	}
	
	public void setBudgetLast(java.math.BigDecimal value) {
		this.budgetLast = value;
	}
	
	public java.math.BigDecimal getTenderScopeMin() {
		return this.tenderScopeMin;
	}
	
	public void setTenderScopeMin(java.math.BigDecimal value) {
		this.tenderScopeMin = value;
	}
	
	public java.math.BigDecimal getTenderScopeMax() {
		return this.tenderScopeMax;
	}
	
	public void setTenderScopeMax(java.math.BigDecimal value) {
		this.tenderScopeMax = value;
	}
	
	public java.lang.String getSystemScope() {
		return this.systemScope;
	}
	
	public void setSystemScope(java.lang.String value) {
		this.systemScope = value;
	}
	
	public java.lang.Integer getActType() {
		return this.actType;
	}
	
	public void setActType(java.lang.Integer value) {
		this.actType = value;
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
