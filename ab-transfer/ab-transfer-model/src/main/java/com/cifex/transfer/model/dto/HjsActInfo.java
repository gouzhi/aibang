/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2016
 */

package com.cifex.transfer.model.dto;

import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity;

public class HjsActInfo extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -5017941774551231435L;
	//alias
	public static final String TABLE_ALIAS = "HjsActInfo";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_ACODE = "活动编号";
	public static final String ALIAS_ANAME = "活动名称";
	public static final String ALIAS_TYPE = "活动类型/CONFIGID=33";
	public static final String ALIAS_BUDGET_TOTAL = "总预算";
	public static final String ALIAS_STATUS = "活动状态/CONFIGID=32";
	public static final String ALIAS_START_TIME = "开始时间";
	public static final String ALIAS_STOP_TIME = "结束时间";
	public static final String ALIAS_BONUS_ID = "活动红包ID";
	public static final String ALIAS_BONUS_CHARGES_ID = "返佣红包ID";
	public static final String ALIAS_ACT_URL = "活动链接";
	public static final String ALIAS_ACT_SOURCE = "来源";
	public static final String ALIAS_ACT_RULES = "规则";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_BUDGET_USED = "已经使用";
	public static final String ALIAS_BUDGET_LAST = "剩余预算";
	public static final String ALIAS_TENDER_SCOPE_MIN = "获取红包的投资范围：最小值。";
	public static final String ALIAS_TENDER_SCOPE_MAX = "获取红包的投资范围：最大值。";
	public static final String ALIAS_SYSTEM_SCOPE = "适用的平台：半角逗号隔开：  1WEB，2安卓 ， 3 IOS  4 H5";
	public static final String ALIAS_ACT_TYPE = "0：基本活动   1：扩展的转盘活动";
	
	//date formats
	public static final String FORMAT_START_TIME = DATE_FORMAT;
	public static final String FORMAT_STOP_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private java.lang.Integer id;
    /**
     * 活动编号       db_column: A_CODE 
     */	
	private java.lang.String acode;
    /**
     * 活动名称       db_column: A_NAME 
     */	
	private java.lang.String aname;
    /**
     * 活动类型/CONFIGID=33       db_column: TYPE 
     */	
	private java.lang.Integer type;
    /**
     * 总预算       db_column: BUDGET_TOTAL 
     */	
	private java.math.BigDecimal budgetTotal;
    /**
     * 活动状态/CONFIGID=32       db_column: STATUS 
     */	
	private java.lang.Integer status;
    /**
     * 开始时间       db_column: START_TIME 
     */	
	private java.util.Date startTime;
    /**
     * 结束时间       db_column: STOP_TIME 
     */	
	private java.util.Date stopTime;
    /**
     * 活动红包ID       db_column: BONUS_ID 
     */	
	private java.lang.Integer bonusId;
    /**
     * 返佣红包ID       db_column: BONUS_CHARGES_ID 
     */	
	private java.lang.Integer bonusChargesId;
    /**
     * 活动链接       db_column: ACT_URL 
     */	
	private java.lang.String actUrl;
    /**
     * 来源       db_column: ACT_SOURCE 
     */	
	private java.lang.String actSource;
    /**
     * 规则       db_column: ACT_RULES 
     */	
	private java.lang.String actRules;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private java.lang.Integer optId;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private java.lang.String createIp;
    /**
     * 已经使用       db_column: BUDGET_USED 
     */	
	private java.math.BigDecimal budgetUsed;
    /**
     * 剩余预算       db_column: BUDGET_LAST 
     */	
	private java.math.BigDecimal budgetLast;
    /**
     * 获取红包的投资范围：最小值。       db_column: TENDER_SCOPE_MIN 
     */	
	private java.math.BigDecimal tenderScopeMin;
    /**
     * 获取红包的投资范围：最大值。       db_column: TENDER_SCOPE_MAX 
     */	
	private java.math.BigDecimal tenderScopeMax;
    /**
     * 适用的平台：半角逗号隔开：  1WEB，2安卓 ， 3 IOS  4 H5       db_column: SYSTEM_SCOPE 
     */	
	private java.lang.String systemScope;
    /**
     * 0：基本活动   1：扩展的转盘活动       db_column: ACT_TYPE 
     */	
	private java.lang.Integer actType;
	//columns END

	public HjsActInfo(){
	}

	public HjsActInfo(
		java.lang.Integer id
	){
		this.id = id;
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setAcode(java.lang.String value) {
		this.acode = value;
	}
	
	public java.lang.String getAcode() {
		return this.acode;
	}
	public void setAname(java.lang.String value) {
		this.aname = value;
	}
	
	public java.lang.String getAname() {
		return this.aname;
	}
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	
	public java.lang.Integer getType() {
		return this.type;
	}
	public void setBudgetTotal(java.math.BigDecimal value) {
		this.budgetTotal = value;
	}
	
	public java.math.BigDecimal getBudgetTotal() {
		return this.budgetTotal;
	}
	public void setStatus(java.lang.Integer value) {
		this.status = value;
	}
	
	public java.lang.Integer getStatus() {
		return this.status;
	}
	public String getStartTimeString() {
		return DateConvertUtils.format(getStartTime(), FORMAT_START_TIME);
	}
	public void setStartTimeString(String value) {
		setStartTime(DateConvertUtils.parse(value, FORMAT_START_TIME,java.util.Date.class));
	}
	
	public void setStartTime(java.util.Date value) {
		this.startTime = value;
	}
	
	public java.util.Date getStartTime() {
		return this.startTime;
	}
	public String getStopTimeString() {
		return DateConvertUtils.format(getStopTime(), FORMAT_STOP_TIME);
	}
	public void setStopTimeString(String value) {
		setStopTime(DateConvertUtils.parse(value, FORMAT_STOP_TIME,java.util.Date.class));
	}
	
	public void setStopTime(java.util.Date value) {
		this.stopTime = value;
	}
	
	public java.util.Date getStopTime() {
		return this.stopTime;
	}
	public void setBonusId(java.lang.Integer value) {
		this.bonusId = value;
	}
	
	public java.lang.Integer getBonusId() {
		return this.bonusId;
	}
	public void setBonusChargesId(java.lang.Integer value) {
		this.bonusChargesId = value;
	}
	
	public java.lang.Integer getBonusChargesId() {
		return this.bonusChargesId;
	}
	public void setActUrl(java.lang.String value) {
		this.actUrl = value;
	}
	
	public java.lang.String getActUrl() {
		return this.actUrl;
	}
	public void setActSource(java.lang.String value) {
		this.actSource = value;
	}
	
	public java.lang.String getActSource() {
		return this.actSource;
	}
	public void setActRules(java.lang.String value) {
		this.actRules = value;
	}
	
	public java.lang.String getActRules() {
		return this.actRules;
	}
	public void setOptId(java.lang.Integer value) {
		this.optId = value;
	}
	
	public java.lang.Integer getOptId() {
		return this.optId;
	}
	public String getCreateTimeString() {
		return DateConvertUtils.format(getCreateTime(), FORMAT_CREATE_TIME);
	}
	public void setCreateTimeString(String value) {
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,java.util.Date.class));
	}
	
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	public void setCreateIp(java.lang.String value) {
		this.createIp = value;
	}
	
	public java.lang.String getCreateIp() {
		return this.createIp;
	}
	public void setBudgetUsed(java.math.BigDecimal value) {
		this.budgetUsed = value;
	}
	
	public java.math.BigDecimal getBudgetUsed() {
		return this.budgetUsed;
	}
	public void setBudgetLast(java.math.BigDecimal value) {
		this.budgetLast = value;
	}
	
	public java.math.BigDecimal getBudgetLast() {
		return this.budgetLast;
	}
	public void setTenderScopeMin(java.math.BigDecimal value) {
		this.tenderScopeMin = value;
	}
	
	public java.math.BigDecimal getTenderScopeMin() {
		return this.tenderScopeMin;
	}
	public void setTenderScopeMax(java.math.BigDecimal value) {
		this.tenderScopeMax = value;
	}
	
	public java.math.BigDecimal getTenderScopeMax() {
		return this.tenderScopeMax;
	}
	public void setSystemScope(java.lang.String value) {
		this.systemScope = value;
	}
	
	public java.lang.String getSystemScope() {
		return this.systemScope;
	}
	public void setActType(java.lang.Integer value) {
		this.actType = value;
	}
	
	public java.lang.Integer getActType() {
		return this.actType;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Acode",getAcode())
			.append("Aname",getAname())
			.append("Type",getType())
			.append("BudgetTotal",getBudgetTotal())
			.append("Status",getStatus())
			.append("StartTime",getStartTime())
			.append("StopTime",getStopTime())
			.append("BonusId",getBonusId())
			.append("BonusChargesId",getBonusChargesId())
			.append("ActUrl",getActUrl())
			.append("ActSource",getActSource())
			.append("ActRules",getActRules())
			.append("OptId",getOptId())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.append("BudgetUsed",getBudgetUsed())
			.append("BudgetLast",getBudgetLast())
			.append("TenderScopeMin",getTenderScopeMin())
			.append("TenderScopeMax",getTenderScopeMax())
			.append("SystemScope",getSystemScope())
			.append("ActType",getActType())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActInfo == false) return false;
		if(this == obj) return true;
		HjsActInfo other = (HjsActInfo)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

