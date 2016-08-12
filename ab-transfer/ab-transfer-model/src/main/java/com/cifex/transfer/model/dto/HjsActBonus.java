package com.cifex.transfer.model.dto;

import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity;

public class HjsActBonus extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = 1186388507031055118L;
	//alias
	public static final String TABLE_ALIAS = "HjsActBonus";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_BCODE = "编号";
	public static final String ALIAS_BNAME = "名称";
	public static final String ALIAS_TYPE = "红包类型/configid=31";
	public static final String ALIAS_VALUE = "面值";
	public static final String ALIAS_AVL_DAYS = "有效期";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_USE_TYPE = "使用方式逗号隔开 1提现 2购买    例如 ,2,1,";
	public static final String ALIAS_TENDER_MIN = "投资使用下限金额。";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	 /**
     * ID       db_column: ID 
     */	
	private java.lang.Integer id;
    /**
     * 编号       db_column: B_CODE 
     */	
	private java.lang.String bcode;
    /**
     * 名称       db_column: B_NAME 
     */	
	private java.lang.String bname;
    /**
     * 红包类型/configid=31       db_column: TYPE 
     */	
	private java.lang.Integer type;
    /**
     * 面值       db_column: VALUE 
     */	
	private java.math.BigDecimal value;
    /**
     * 有效期       db_column: AVL_DAYS 
     */	
	private java.lang.Integer avlDays;
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
     * 使用方式逗号隔开 1提现 2购买    例如 ,2,1,       db_column: USE_TYPE 
     */	
	private java.lang.String useType;
    /**
     * 投资使用下限金额。       db_column: TENDER_MIN 
     */	
	private java.math.BigDecimal tenderMin;
	//columns END

	public HjsActBonus(){
	}

	public HjsActBonus(
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
	public void setBcode(java.lang.String value) {
		this.bcode = value;
	}
	
	public java.lang.String getBcode() {
		return this.bcode;
	}
	public void setBname(java.lang.String value) {
		this.bname = value;
	}
	
	public java.lang.String getBname() {
		return this.bname;
	}
	public void setType(java.lang.Integer value) {
		this.type = value;
	}
	
	public java.lang.Integer getType() {
		return this.type;
	}
	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}
	
	public java.math.BigDecimal getValue() {
		return this.value;
	}
	public void setAvlDays(java.lang.Integer value) {
		this.avlDays = value;
	}
	
	public java.lang.Integer getAvlDays() {
		return this.avlDays;
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
	public void setUseType(java.lang.String value) {
		this.useType = value;
	}
	
	public java.lang.String getUseType() {
		return this.useType;
	}
	public void setTenderMin(java.math.BigDecimal value) {
		this.tenderMin = value;
	}
	
	public java.math.BigDecimal getTenderMin() {
		return this.tenderMin;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Bcode",getBcode())
			.append("Bname",getBname())
			.append("Type",getType())
			.append("Value",getValue())
			.append("AvlDays",getAvlDays())
			.append("OptId",getOptId())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.append("UseType",getUseType())
			.append("TenderMin",getTenderMin())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActBonus == false) return false;
		if(this == obj) return true;
		HjsActBonus other = (HjsActBonus)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

