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

public class HjsActBonusUsersManual extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = 5279373050640772246L;
	//alias
	public static final String TABLE_ALIAS = "HjsActBonusUsersManual";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户帐户ID    user_base";
	public static final String ALIAS_REALNAME = "REALNAME";
	public static final String ALIAS_PHONE = "手机号";
	public static final String ALIAS_USERNAME = "冗余用户名";
	public static final String ALIAS_BONUS_ID = "红包ID/hjs_act_bonus：ID";
	public static final String ALIAS_BNAME = "冗余红包名称";
	public static final String ALIAS_VALUE = "冗余面值";
	public static final String ALIAS_BONUS_NUM = "发放红包数量";
	public static final String ALIAS_MEMO = "摘要说明";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需输入";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private java.lang.Integer id;
    /**
     * 用户帐户ID    user_base       db_column: USER_ID 
     */	
	private java.lang.Integer userId;
    /**
     * REALNAME       db_column: REALNAME 
     */	
	private java.lang.String realname;
    /**
     * 手机号       db_column: PHONE 
     */	
	private java.lang.String phone;
    /**
     * 冗余用户名       db_column: USERNAME 
     */	
	private java.lang.String username;
    /**
     * 红包ID/hjs_act_bonus：ID       db_column: BONUS_ID 
     */	
	private java.lang.Integer bonusId;
    /**
     * 冗余红包名称       db_column: B_NAME 
     */	
	private java.lang.String bname;
    /**
     * 冗余面值       db_column: VALUE 
     */	
	private java.math.BigDecimal value;
    /**
     * 发放红包数量       db_column: BONUS_NUM 
     */	
	private java.lang.Integer bonusNum;
    /**
     * 摘要说明       db_column: MEMO 
     */	
	private java.lang.String memo;
    /**
     * 操作员ID。界面录入时需输入       db_column: OPT_ID 
     */	
	private java.lang.Integer optId;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsActBonusUsersManual(){
	}

	public HjsActBonusUsersManual(
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
	public void setUserId(java.lang.Integer value) {
		this.userId = value;
	}
	
	public java.lang.Integer getUserId() {
		return this.userId;
	}
	public void setRealname(java.lang.String value) {
		this.realname = value;
	}
	
	public java.lang.String getRealname() {
		return this.realname;
	}
	public void setPhone(java.lang.String value) {
		this.phone = value;
	}
	
	public java.lang.String getPhone() {
		return this.phone;
	}
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	public java.lang.String getUsername() {
		return this.username;
	}
	public void setBonusId(java.lang.Integer value) {
		this.bonusId = value;
	}
	
	public java.lang.Integer getBonusId() {
		return this.bonusId;
	}
	public void setBname(java.lang.String value) {
		this.bname = value;
	}
	
	public java.lang.String getBname() {
		return this.bname;
	}
	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}
	
	public java.math.BigDecimal getValue() {
		return this.value;
	}
	public void setBonusNum(java.lang.Integer value) {
		this.bonusNum = value;
	}
	
	public java.lang.Integer getBonusNum() {
		return this.bonusNum;
	}
	public void setMemo(java.lang.String value) {
		this.memo = value;
	}
	
	public java.lang.String getMemo() {
		return this.memo;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Realname",getRealname())
			.append("Phone",getPhone())
			.append("Username",getUsername())
			.append("BonusId",getBonusId())
			.append("Bname",getBname())
			.append("Value",getValue())
			.append("BonusNum",getBonusNum())
			.append("Memo",getMemo())
			.append("OptId",getOptId())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActBonusUsersManual == false) return false;
		if(this == obj) return true;
		HjsActBonusUsersManual other = (HjsActBonusUsersManual)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

