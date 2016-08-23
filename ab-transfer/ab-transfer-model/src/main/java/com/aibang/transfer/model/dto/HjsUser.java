/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.aibang.transfer.model.dto;
import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.DateConvertUtils;
import com.aibang.transfer.model.BaseEntity;

public class HjsUser extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -7218053125958336728L;
	//alias
	public static final String TABLE_ALIAS = "HjsUser";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_USERNAME = "登录名";
	public static final String ALIAS_TYPE_ID = "用户类型（configid=1,用户/后台管理员";
	public static final String ALIAS_EMAIL = "电子邮箱";
	public static final String ALIAS_PHONE = "手机号";
	public static final String ALIAS_PASSWORD = "密码/系统生成的用户，默认密码000000";
	public static final String ALIAS_STATUS = "状态/configid=18";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_IS_DEL = "是否逻辑删除 0否";
	public static final String ALIAS_DELETE_TIME = "删除时间";
	public static final String ALIAS_PHONE_STATUS = "手机认证";
	public static final String ALIAS_EMAIL_STATUS = "邮箱认证";
	public static final String ALIAS_REALNAME = "真实姓名";
	public static final String ALIAS_REALNAME_STATUS = "实名认证";
	public static final String ALIAS_NRP_USR_ID = "汇付账户ID";
	public static final String ALIAS_IS_UPDATED_USERNAME = "是否修改过用户名 默认否0   ";
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	public static final String FORMAT_DELETE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */	
	private Integer id;
    /**
     * 登录名       db_column: USERNAME 
     */	
	private String username;
    /**
     * 用户类型（configid=1,用户/后台管理员       db_column: TYPE_ID 
     */	
	private Integer typeId;
    /**
     * 电子邮箱       db_column: EMAIL 
     */	
	private String email;
    /**
     * 手机号       db_column: PHONE 
     */	
	private String phone;
    /**
     * 密码/系统生成的用户，默认密码000000       db_column: PASSWORD 
     */	
	private String password;
    /**
     * 状态/configid=18       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 是否逻辑删除 0否       db_column: IS_DEL 
     */	
	private Integer isDel;
    /**
     * 删除时间       db_column: DELETE_TIME 
     */	
	private java.util.Date deleteTime;
	/**
	 * 手机认证
	 */
	private Integer phoneStatus;
	/**
	 * 邮箱认证 
	 */
	private Integer emailStatus;
	/**
	 * 真实姓名
	 */
	private String realName;
	/**
	 * 实名认证
	 */
	private Integer realNameStatus;
	/**
	 * 用户会员信息
	 */
	private HjsUsersInfo hjsUsersInfo;
	/**
	 * 用户操作日志
	 */
	private List<HjsUsersLog> hjsUsersLogs;
	/**
	 * 角色信息
	 */
	private List<HjsSysRole> roles;
	/**
	 * 企业用户信息
	 */
	private HjsUsersOpt hjsUsersOpt;
	//columns END
    /**
     * 密码级别3:高；2：中；1：低
     */
	private Integer passwordLevel;
	/**
	 * 
	 */
	private String nrpUsrId;
	
	/**
     * 是否修改过用户名 默认否0          db_column: IS_UPDATED_USERNAME 
     */	
	private Integer isUpdatedUsername = 0;
	
	
	public String getNrpUsrId() {
		return nrpUsrId;
	}

	public void setNrpUsrId(String nrpUsrId) {
		this.nrpUsrId = nrpUsrId;
	}

	public HjsUser(){
	}

	public HjsUser(
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
	public void setUsername(String value) {
		this.username = value;
	}
	
	public String getUsername() {
		return this.username;
	}
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	public void setEmail(String value) {
		this.email = value;
	}
	
	public String getEmail() {
		return this.email;
	}
	public void setPhone(String value) {
		this.phone = value;
	}
	
	public String getPhone() {
		return this.phone;
	}
	public void setPassword(String value) {
		this.password = value;
	}
	
	public String getPassword() {
		return this.password;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
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
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
	}
	public void setIsDel(Integer value) {
		this.isDel = value;
	}
	
	public Integer getIsDel() {
		return this.isDel;
	}
	public String getDeleteTimeString() {
		return DateConvertUtils.format(getDeleteTime(), FORMAT_DELETE_TIME);
	}
	public void setDeleteTimeString(String value) {
		setDeleteTime(DateConvertUtils.parse(value, FORMAT_DELETE_TIME,java.util.Date.class));
	}
	
	public void setDeleteTime(java.util.Date value) {
		this.deleteTime = value;
	}
	
	public java.util.Date getDeleteTime() {
		return this.deleteTime;
	}

	public Integer getPhoneStatus() {
		return phoneStatus;
	}

	public void setPhoneStatus(Integer phoneStatus) {
		this.phoneStatus = phoneStatus;
	}

	public Integer getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(Integer emailStatus) {
		this.emailStatus = emailStatus;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Integer getRealNameStatus() {
		return realNameStatus;
	}

	public void setRealNameStatus(Integer realNameStatus) {
		this.realNameStatus = realNameStatus;
	}

	public List<HjsSysRole> getRoles() {
		return roles;
	}

	public void setRoles(List<HjsSysRole> roles) {
		this.roles = roles;
	}

	public HjsUsersInfo getHjsUsersInfo() {
		return hjsUsersInfo;
	}

	public void setHjsUsersInfo(HjsUsersInfo hjsUsersInfo) {
		this.hjsUsersInfo = hjsUsersInfo;
	}

	public List<HjsUsersLog> getHjsUsersLogs() {
		return hjsUsersLogs;
	}

	public void setHjsUsersLogs(List<HjsUsersLog> hjsUsersLogs) {
		this.hjsUsersLogs = hjsUsersLogs;
	}

	public HjsUsersOpt getHjsUsersOpt() {
		return hjsUsersOpt;
	}

	public void setHjsUsersOpt(HjsUsersOpt hjsUsersOpt) {
		this.hjsUsersOpt = hjsUsersOpt;
	}
	
	public Integer getIsUpdatedUsername() {
		return isUpdatedUsername;
	}

	public void setIsUpdatedUsername(Integer isUpdatedUsername) {
		this.isUpdatedUsername = isUpdatedUsername;
	}
	
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Username",getUsername())
			.append("TypeId",getTypeId())
			.append("Email",getEmail())
			.append("Phone",getPhone())
			.append("Password",getPassword())
			.append("Status",getStatus())
			.append("OptId",getOptId())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.append("IsDel",getIsDel())
			.append("DeleteTime",getDeleteTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsUser == false) return false;
		if(this == obj) return true;
		HjsUser other = (HjsUser)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public Integer getPasswordLevel() {
		return passwordLevel;
	}

	public void setPasswordLevel(Integer passwordLevel) {
		this.passwordLevel = passwordLevel;
	}
}

