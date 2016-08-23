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

public class HjsApproveEmailActive extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -4755696588912199402L;
	//alias
	public static final String TABLE_ALIAS = "HjsApproveEmailActive";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_EMAIL = "邮箱地址";
	public static final String ALIAS_STATUS = "激活状态 0未激活1激活";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_VERIFY_USERID = "人工审核人ID";
	public static final String ALIAS_VERIFY_MEMO = "审核备注";
	public static final String ALIAS_VERIFY_TIME = "审核时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 用户ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 邮箱地址       db_column: EMAIL 
     */	
	private String email;
    /**
     * 激活状态 0未激活1激活       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	/**
     * 人工审核人ID       db_column: VERIFY_USERID 
     */	
	private Integer verifyUserid;
    /**
     * 审核备注       db_column: VERIFY_MEMO 
     */	
	private String verifyMemo;
    /**
     * 审核时间       db_column: VERIFY_TIME 
     */	
	private java.util.Date verifyTime;
	//columns END
	/**
	 * 关联用户对象
	 */
	private HjsUser hjsUser;

	public HjsUser getHjsUser() {
		return hjsUser;
	}

	public void setHjsUser(HjsUser hjsUser) {
		this.hjsUser = hjsUser;
	}

	public HjsApproveEmailActive(){
	}

	public HjsApproveEmailActive(
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
	public void setEmail(String value) {
		this.email = value;
	}
	
	public String getEmail() {
		return this.email;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
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

	public Integer getVerifyUserid() {
		return verifyUserid;
	}

	public void setVerifyUserid(Integer verifyUserid) {
		this.verifyUserid = verifyUserid;
	}

	public String getVerifyMemo() {
		return verifyMemo;
	}

	public void setVerifyMemo(String verifyMemo) {
		this.verifyMemo = verifyMemo;
	}

	public java.util.Date getVerifyTime() {
		return verifyTime;
	}

	public void setVerifyTime(java.util.Date verifyTime) {
		this.verifyTime = verifyTime;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Email",getEmail())
			.append("Status",getStatus())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsApproveEmailActive == false) return false;
		if(this == obj) return true;
		HjsApproveEmailActive other = (HjsApproveEmailActive)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

