/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */
package com.cifex.transfer.model.dto;
import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsAccountBank extends BaseEntity implements Serializable{
 
	private static final long serialVersionUID = 4767507898971625158L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountBank";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_BANK_NAME = "银行名称";
	public static final String ALIAS_CASH_MONEY = "现金限额";
	public static final String ALIAS_REACH_DAY = "到账天数";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 银行名称       db_column: BANK_NAME 
     */	
	private String bankName;
    /**
     * 现金限额       db_column: CASH_MONEY 
     */	
	private java.math.BigDecimal cashMoney;
    /**
     * 到账天数       db_column: REACH_DAY 
     */	
	private Integer reachDay;
    /**
     * 状态       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 备注       db_column: REMARK 
     */	
	private String remark;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsAccountBank(){
	}

	public HjsAccountBank(
		Integer id
	){
		this.id = id;
	}

	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setBankName(String value) {
		this.bankName = value;
	}
	
	public String getBankName() {
		return this.bankName;
	}
	public void setCashMoney(java.math.BigDecimal value) {
		this.cashMoney = value;
	}
	
	public java.math.BigDecimal getCashMoney() {
		return this.cashMoney;
	}
	public void setReachDay(Integer value) {
		this.reachDay = value;
	}
	
	public Integer getReachDay() {
		return this.reachDay;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("BankName",getBankName())
			.append("CashMoney",getCashMoney())
			.append("ReachDay",getReachDay())
			.append("Status",getStatus())
			.append("Remark",getRemark())
			.append("OptId",getOptId())
			.append("CreateIp",getCreateIp())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsAccountBank == false) return false;
		if(this == obj) return true;
		HjsAccountBank other = (HjsAccountBank)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

