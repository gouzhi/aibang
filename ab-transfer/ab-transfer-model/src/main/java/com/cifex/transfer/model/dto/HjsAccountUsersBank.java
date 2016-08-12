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

public class HjsAccountUsersBank extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = 3903849900499221200L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountUsersBank";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "USER_ID";
	public static final String ALIAS_STATUS = "状态/0未绑定 1有效绑定 2失效";
	public static final String ALIAS_ACCOUNT = "账号";
	public static final String ALIAS_BANK_ID = "银行ID/HJS_ACCOUNT_BANK";
	public static final String ALIAS_AREA_ID = "地域ID";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_UPDATE_TIME = "更新时间";
	public static final String ALIAS_UPDATE_IP = "更新时IP";
	public static final String ALIAS_OPEN_BANK_ID = "开户银行代号";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * USER_ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 状态/0未绑定 1有效绑定 2失效       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 账号       db_column: ACCOUNT 
     */	
	private String account;
    /**
     * 银行ID/HJS_ACCOUNT_BANK       db_column: BANK_ID 
     */	
	private Integer bankId;
    /**
     * 地域ID       db_column: AREA_ID 
     */	
	private Integer areaId;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 更新时间       db_column: UPDATE_TIME 
     */	
	private java.util.Date updateTime;
    /**
     * 更新时IP       db_column: UPDATE_IP 
     */	
	private String updateIp;
	/**
	 * 开户银行代号
	 */
	private String openBankId;
	//columns END
	
	public String getOpenBankId() {
		return openBankId;
	}

	public void setOpenBankId(String openBankId) {
		this.openBankId = openBankId;
	}

	/**
	 * 关联用户账户
	 */
	private HjsUserBase hjsUserBase;

	public HjsUserBase getHjsUserBase() {
		return hjsUserBase;
	}

	public void setHjsUserBase(HjsUserBase hjsUserBase) {
		this.hjsUserBase = hjsUserBase;
	}

	/**
	 * 银行对象
	 * 
	 */
	private HjsAccountBank hjsAccountBank;

	public HjsAccountBank getHjsAccountBank() {
		return hjsAccountBank;
	}

	public void setHjsAccountBank(HjsAccountBank hjsAccountBank) {
		this.hjsAccountBank = hjsAccountBank;
	}

	public HjsAccountUsersBank(){
	}

	public HjsAccountUsersBank(
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
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setAccount(String value) {
		this.account = value;
	}
	
	public String getAccount() {
		return this.account;
	}
	public void setBankId(Integer value) {
		this.bankId = value;
	}
	
	public Integer getBankId() {
		return this.bankId;
	}
	public void setAreaId(Integer value) {
		this.areaId = value;
	}
	
	public Integer getAreaId() {
		return this.areaId;
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
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
	}
	public String getUpdateTimeString() {
		return DateConvertUtils.format(getUpdateTime(), FORMAT_UPDATE_TIME);
	}
	public void setUpdateTimeString(String value) {
		setUpdateTime(DateConvertUtils.parse(value, FORMAT_UPDATE_TIME,java.util.Date.class));
	}
	
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}
	public void setUpdateIp(String value) {
		this.updateIp = value;
	}
	
	public String getUpdateIp() {
		return this.updateIp;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Status",getStatus())
			.append("Account",getAccount())
			.append("BankId",getBankId())
			.append("AreaId",getAreaId())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.append("UpdateTime",getUpdateTime())
			.append("UpdateIp",getUpdateIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsAccountUsersBank == false) return false;
		if(this == obj) return true;
		HjsAccountUsersBank other = (HjsAccountUsersBank)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

