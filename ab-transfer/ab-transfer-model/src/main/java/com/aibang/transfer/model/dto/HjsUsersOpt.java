/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.aibang.transfer.model.dto;
import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.DateConvertUtils;
import com.aibang.transfer.model.BaseEntity;

public class HjsUsersOpt extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -6299501999388474042L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersOpt";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_LOGIN_ID = "统一登录ID";
	public static final String ALIAS_ENT_ID = "企业ID";
	public static final String ALIAS_OPT_USERNAME = "密码";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_QQ = "QQ";
	public static final String ALIAS_SEX = "性别 0女1男";
	public static final String ALIAS_LAST_TIME = "最后登录时间";
	public static final String ALIAS_LAST_IP = "最后IP";
	
	//date formats
	public static final String FORMAT_LAST_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 统一登录ID       db_column: LOGIN_ID 
     */	
	private Integer loginId;
    /**
     * 企业ID       db_column: ENT_ID 
     */	
	private Integer entId;
    /**
     * 密码       db_column: OPT_USERNAME 
     */	
	private String optUsername;
    /**
     * 备注       db_column: REMARK 
     */	
	private String remark;
    /**
     * QQ       db_column: QQ 
     */	
	private String qq;
    /**
     * 性别 0女1男       db_column: SEX 
     */	
	private Integer sex;
    /**
     * 最后登录时间       db_column: LAST_TIME 
     */	
	private java.util.Date lastTime;
    /**
     * 最后IP       db_column: LAST_IP 
     */	
	private String lastIp;
	private HjsUser hjsUser;
	//columns END

	
	public HjsUsersOpt(){
	}

	public HjsUsersOpt(Integer id){
		this.id = id;
	}

	public HjsUser getHjsUser() {
		return hjsUser;
	}

	public void setHjsUser(HjsUser hjsUser) {
		this.hjsUser = hjsUser;
	}

	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setLoginId(Integer value) {
		this.loginId = value;
	}
	
	public Integer getLoginId() {
		return this.loginId;
	}
	public void setEntId(Integer value) {
		this.entId = value;
	}
	
	public Integer getEntId() {
		return this.entId;
	}
	public void setOptUsername(String value) {
		this.optUsername = value;
	}
	
	public String getOptUsername() {
		return this.optUsername;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	public void setQq(String value) {
		this.qq = value;
	}
	
	public String getQq() {
		return this.qq;
	}
	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	public String getLastTimeString() {
		return DateConvertUtils.format(getLastTime(), FORMAT_LAST_TIME);
	}
	public void setLastTimeString(String value) {
		setLastTime(DateConvertUtils.parse(value, FORMAT_LAST_TIME,java.util.Date.class));
	}
	
	public void setLastTime(java.util.Date value) {
		this.lastTime = value;
	}
	
	public java.util.Date getLastTime() {
		return this.lastTime;
	}
	public void setLastIp(String value) {
		this.lastIp = value;
	}
	
	public String getLastIp() {
		return this.lastIp;
	}


	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("LoginId",getLoginId())
			.append("EntId",getEntId())
			.append("OptUsername",getOptUsername())
			.append("Remark",getRemark())
			.append("Qq",getQq())
			.append("Sex",getSex())
			.append("LastTime",getLastTime())
			.append("LastIp",getLastIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsUsersOpt == false) return false;
		if(this == obj) return true;
		HjsUsersOpt other = (HjsUsersOpt)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

