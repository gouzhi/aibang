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

public class HjsApproveSms extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = 8319803527819078852L;
	//alias
	public static final String TABLE_ALIAS = "HjsApproveSms";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_STATUS = "认证状态 0未审核1审核成功-1审核失败";
	public static final String ALIAS_TYPE = "类型";
	public static final String ALIAS_PHONE = "手机号码";
	public static final String ALIAS_CREDIT = "验证码";
	public static final String ALIAS_VERIFY_USERID = "人工审核人ID";
	public static final String ALIAS_VERIFY_TIME = "审核时间";
	public static final String ALIAS_VERIFY_REMARK = "审核备注";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
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
     * 认证状态 0未审核1审核成功-1审核失败       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 类型       db_column: TYPE 
     */	
	private Integer type;
    /**
     * 手机号码       db_column: PHONE 
     */	
	private String phone;
    /**
     * 验证码       db_column: CREDIT 
     */	
	private Integer credit;
    /**
     * 人工审核人ID       db_column: VERIFY_USERID 
     */	
	private Integer verifyUserid;
    /**
     * 审核时间       db_column: VERIFY_TIME 
     */	
	private java.util.Date verifyTime;
    /**
     * 审核备注       db_column: VERIFY_REMARK 
     */	
	private String verifyRemark;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
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

	public HjsApproveSms(){
	}

	public HjsApproveSms(
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
	public void setType(Integer value) {
		this.type = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	public void setPhone(String value) {
		this.phone = value;
	}
	
	public String getPhone() {
		return this.phone;
	}
	public void setCredit(Integer value) {
		this.credit = value;
	}
	
	public Integer getCredit() {
		return this.credit;
	}
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
	}
	
	public java.util.Date getVerifyTime() {
		return verifyTime;
	}

	public void setVerifyTime(java.util.Date verifyTime) {
		this.verifyTime = verifyTime;
	}

	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
	}
	
	public String getVerifyRemark() {
		return this.verifyRemark;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Status",getStatus())
			.append("Type",getType())
			.append("Phone",getPhone())
			.append("Credit",getCredit())
			.append("VerifyUserid",getVerifyUserid())
			.append("VerifyTime",getVerifyTime())
			.append("VerifyRemark",getVerifyRemark())
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
		if(obj instanceof HjsApproveSms == false) return false;
		if(this == obj) return true;
		HjsApproveSms other = (HjsApproveSms)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

