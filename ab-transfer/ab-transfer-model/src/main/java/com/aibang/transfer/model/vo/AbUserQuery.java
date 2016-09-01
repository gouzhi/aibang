package com.aibang.transfer.model.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

public class AbUserQuery extends BaseQuery implements Serializable {

	/**
	 * serialVersionUID 
	 * 
	 * @since Ver 1.1
	 */

	private static final long serialVersionUID = -1926549988005682396L;
	/** id */
	private Integer id;
	/** 登录名 */
	private String username;
	/** 用户类型（configid=1,用户/后台管理员 */
	private Integer typeId;
	/** 电子邮箱 */
	private String email;
	/** 手机号 */
	private String phone;
	/** 密码/系统生成的用户，默认密码000000 */
	private String password;
	/** 状态/configid=18 */
	private Integer status;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	/** 是否逻辑删除 0否 */
	private Integer isDel;
	/** 删除时间 */
	private java.util.Date deleteTimeBegin;
	private java.util.Date deleteTimeEnd;
	/** 手机认证 */
	private Integer phoneStatus;
	/** 邮箱认证 */
	private Integer emailStatus;
	/** 真实姓名 */
	private String realName;
	/** 实名认证 */
	private Integer realNameStatus;

	/** role_id */
	private Integer roleId;

	/**
	 * 用户ID数组，用于查询传参
	 */
	private String[] sysUserIds;
	/**
	 * 用户会员信息
	 */
	private AbUsersInfoQuery hjsUsersInfoQuery;
	/**
	 * 用户操作日志
	 */
	private List<AbUsersLogQuery> hjsUsersLogsQuery;
	/**
	 * 角色信息
	 */
	private List<AbSysRoleQuery> rolesQuery;
	/**
	 * 企业用户信息
	 */
	private AbUsersOptQuery hjsUsersOptQuery;
	/**
     * 密码级别3:高；2：中；1：低
     */
	private Integer passwordLevel;
	private String nrpUsrId;
	/** 是否修改过用户名 默认否0    */
	private Integer isUpdatedUsername;
	
	public String getNrpUsrId() {
		return nrpUsrId;
	}

	public void setNrpUsrId(String nrpUsrId) {
		this.nrpUsrId = nrpUsrId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer value) {
		this.id = value;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String value) {
		this.username = value;
	}

	public Integer getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Integer value) {
		this.typeId = value;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String value) {
		this.email = value;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String value) {
		this.phone = value;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String value) {
		this.password = value;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer value) {
		this.status = value;
	}

	public Integer getOptId() {
		return this.optId;
	}

	public void setOptId(Integer value) {
		this.optId = value;
	}

	public java.util.Date getCreateTimeBegin() {
		return this.createTimeBegin;
	}

	public void setCreateTimeBegin(java.util.Date value) {
		this.createTimeBegin = value;
	}

	public java.util.Date getCreateTimeEnd() {
		return this.createTimeEnd;
	}

	public void setCreateTimeEnd(java.util.Date value) {
		this.createTimeEnd = value;
	}

	public String getCreateIp() {
		return this.createIp;
	}

	public void setCreateIp(String value) {
		this.createIp = value;
	}

	public Integer getIsDel() {
		return this.isDel;
	}

	public void setIsDel(Integer value) {
		this.isDel = value;
	}

	public java.util.Date getDeleteTimeBegin() {
		return this.deleteTimeBegin;
	}

	public void setDeleteTimeBegin(java.util.Date value) {
		this.deleteTimeBegin = value;
	}

	public java.util.Date getDeleteTimeEnd() {
		return this.deleteTimeEnd;
	}

	public void setDeleteTimeEnd(java.util.Date value) {
		this.deleteTimeEnd = value;
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

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String[] getSysUserIds() {
		return sysUserIds;
	}

	public void setSysUserIds(String[] sysUserIds) {
		this.sysUserIds = sysUserIds;
	}

	public AbUsersInfoQuery getHjsUsersInfoQuery() {
		return hjsUsersInfoQuery;
	}

	public void setHjsUsersInfoQuery(AbUsersInfoQuery hjsUsersInfoQuery) {
		this.hjsUsersInfoQuery = hjsUsersInfoQuery;
	}

	public List<AbUsersLogQuery> getHjsUsersLogsQuery() {
		return hjsUsersLogsQuery;
	}

	public void setHjsUsersLogsQuery(List<AbUsersLogQuery> hjsUsersLogsQuery) {
		this.hjsUsersLogsQuery = hjsUsersLogsQuery;
	}

	public List<AbSysRoleQuery> getRolesQuery() {
		return rolesQuery;
	}

	public void setRolesQuery(List<AbSysRoleQuery> rolesQuery) {
		this.rolesQuery = rolesQuery;
	}

	public AbUsersOptQuery getHjsUsersOptQuery() {
		return hjsUsersOptQuery;
	}

	public void setHjsUsersOptQuery(AbUsersOptQuery hjsUsersOptQuery) {
		this.hjsUsersOptQuery = hjsUsersOptQuery;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

	public Integer getPasswordLevel() {
		return passwordLevel;
	}

	public void setPasswordLevel(Integer passwordLevel) {
		this.passwordLevel = passwordLevel;
	}
	
	public Integer getIsUpdatedUsername() {
		return this.isUpdatedUsername;
	}
	
	public void setIsUpdatedUsername(Integer value) {
		this.isUpdatedUsername = value;
	}
}
