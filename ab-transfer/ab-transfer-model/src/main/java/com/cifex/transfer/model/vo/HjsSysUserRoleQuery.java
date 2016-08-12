package com.cifex.transfer.model.vo;

import java.io.Serializable;

import com.cifex.framework.utils.page.BaseQuery;


public class HjsSysUserRoleQuery extends BaseQuery implements Serializable{

	private static final long serialVersionUID = 3148176768559230877L;
	
	/**
	 * id       db_column: ID
	 */
	private Integer id;
	/**
	 * userId       db_column: USER_ID
	 */
	private Integer userId;
	/**
	 * roleId       db_column: ROLE_ID
	 */
	private Integer roleId;
	/**
	 * isDel       db_column: IS_DEL
	 */
	private Integer isDel;
	/**
	 * varsion       db_column: VERSION
	 */
	private Integer version;
	/**
	 * createTime       db_column: CREATE_TIME
	 */
	private java.util.Date createTime;
	/**
	 * updateTime       db_column: UPDATE_TIME
	 */
	private java.util.Date updateTime;
	/**
	 * deleteTime       db_column: DELETE_TIME
	 */
	private java.util.Date deleteTime;
	/**
	 * 用户ID数组，用于查询
	 */
	private String[] sysUserIds;
	public String[] getSysUserIds() {
		return sysUserIds;
	}
	public void setSysUserIds(String[] sysUserIds) {
		this.sysUserIds = sysUserIds;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getIsDel() {
		return isDel;
	}
	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}
	
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	public java.util.Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}
	public java.util.Date getDeleteTime() {
		return deleteTime;
	}
	public void setDeleteTime(java.util.Date deleteTime) {
		this.deleteTime = deleteTime;
	}
	
}
