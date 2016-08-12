/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2016
 */


package com.cifex.transfer.model.dto;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsUsersChannelRecord extends BaseEntity implements Serializable{
	
	//alias
	public static final String TABLE_ALIAS = "HjsUsersChannelRecord";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_TYPE_NO = "类型  0注册 1开户 2绑卡 3投资 4放款";
	public static final String ALIAS_CHL_USERID = "渠道方用户ID";
	public static final String ALIAS_CHL_USERNAME = "渠道方用户名";
	public static final String ALIAS_LOGO = "渠道方LOGO";
	public static final String ALIAS_CHLID = "渠道方基表ID";
	public static final String ALIAS_USERID = "我方用户BASEID";
	public static final String ALIAS_USERNAME = "我方用户名";
	public static final String ALIAS_TENDER_ACCOUNT = "首次投资金额（按放款算）";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	public static final String ALIAS_BORROWID = "投资产品ID    注册时空";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private java.lang.Integer id;
    /**
     * 类型  0注册 1开户 2绑卡 3投资 4放款       db_column: TYPE_NO 
     */	
	private java.lang.Integer typeNo;
    /**
     * 渠道方用户ID       db_column: CHL_USERID 
     */	
	private java.lang.String chlUserid;
    /**
     * 渠道方用户名       db_column: CHL_USERNAME 
     */	
	private java.lang.String chlUsername;
    /**
     * 渠道方LOGO       db_column: LOGO 
     */	
	private java.lang.String logo;
    /**
     * 渠道方基表ID       db_column: CHLID 
     */	
	private java.lang.Integer chlid;
    /**
     * 我方用户BASEID       db_column: USERID 
     */	
	private java.lang.Integer userid;
    /**
     * 我方用户名       db_column: USERNAME 
     */	
	private java.lang.String username;
    /**
     * 首次投资金额（按放款算）       db_column: TENDER_ACCOUNT 
     */	
	private java.math.BigDecimal tenderAccount;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 投资产品ID    注册时空       db_column: BORROWID 
     */	
	private java.lang.Integer borrowid;
	//columns END

	public HjsUsersChannelRecord(){
	}

	public HjsUsersChannelRecord(
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
	public void setTypeNo(java.lang.Integer value) {
		this.typeNo = value;
	}
	
	public java.lang.Integer getTypeNo() {
		return this.typeNo;
	}
	public void setChlUserid(java.lang.String value) {
		this.chlUserid = value;
	}
	
	public java.lang.String getChlUserid() {
		return this.chlUserid;
	}
	public void setChlUsername(java.lang.String value) {
		this.chlUsername = value;
	}
	
	public java.lang.String getChlUsername() {
		return this.chlUsername;
	}
	public void setLogo(java.lang.String value) {
		this.logo = value;
	}
	
	public java.lang.String getLogo() {
		return this.logo;
	}
	public void setChlid(java.lang.Integer value) {
		this.chlid = value;
	}
	
	public java.lang.Integer getChlid() {
		return this.chlid;
	}
	public void setUserid(java.lang.Integer value) {
		this.userid = value;
	}
	
	public java.lang.Integer getUserid() {
		return this.userid;
	}
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	public java.lang.String getUsername() {
		return this.username;
	}
	public void setTenderAccount(java.math.BigDecimal value) {
		this.tenderAccount = value;
	}
	
	public java.math.BigDecimal getTenderAccount() {
		return this.tenderAccount;
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
	public void setBorrowid(java.lang.Integer value) {
		this.borrowid = value;
	}
	
	public java.lang.Integer getBorrowid() {
		return this.borrowid;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("TypeNo",getTypeNo())
			.append("ChlUserid",getChlUserid())
			.append("ChlUsername",getChlUsername())
			.append("Logo",getLogo())
			.append("Chlid",getChlid())
			.append("Userid",getUserid())
			.append("Username",getUsername())
			.append("TenderAccount",getTenderAccount())
			.append("CreateTime",getCreateTime())
			.append("Borrowid",getBorrowid())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsUsersChannelRecord == false) return false;
		if(this == obj) return true;
		HjsUsersChannelRecord other = (HjsUsersChannelRecord)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

