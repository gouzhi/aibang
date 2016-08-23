/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2013 - 2015
 */

package com.aibang.transfer.model.dto;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.DateConvertUtils;
import com.aibang.transfer.model.BaseEntity;



 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


public class HjsSysRole extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
		public static final String TABLE_ALIAS = "HjsSysRole";
		public static final String ALIAS_ID = "ID";
		public static final String ALIAS_PARENT_ID = "父ID";
		public static final String ALIAS_ROLE_NAME = "角色名称";
		public static final String ALIAS_MENU_RIGHTS = "菜单权限/URL   _menu的ID     2的全和";
		public static final String ALIAS_ADD_QX = "增加的权限";
		public static final String ALIAS_DEL_QX = "删除";
		public static final String ALIAS_EDIT_QX = "编辑";
		public static final String ALIAS_CHA_QX = "查询";
		public static final String ALIAS_AUDIT_QX = "审核";
		public static final String ALIAS_FX_QX = "发信权限";
		public static final String ALIAS_FW_QX = "服务权限";
		public static final String ALIAS_QX1 = "操作权限";
		public static final String ALIAS_QX2 = "产品权限";
		public static final String ALIAS_QX3 = "预留权限";
		public static final String ALIAS_QX4 = "预留权限";
		public static final String ALIAS_C1 = "C1";
		public static final String ALIAS_C2 = "C2";
		public static final String ALIAS_C3 = "C3";
		public static final String ALIAS_C4 = "C4";
		public static final String ALIAS_Q1 = "Q1";
		public static final String ALIAS_Q2 = "Q2";
		public static final String ALIAS_Q3 = "Q3";
		public static final String ALIAS_Q4 = "Q4";
		public static final String ALIAS_IS_DEL = "是否逻辑删除";
		public static final String ALIAS_VERSION = "版本";
		public static final String ALIAS_CREATE_TIME = "创建时间";
		public static final String ALIAS_UPDATE_TIME = "更新时间";
		public static final String ALIAS_DELETE_TIME = "删除时间";
		public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
		
		//date formats
		public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
		public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;
		public static final String FORMAT_DELETE_TIME = DATE_FORMAT;
		
		//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
		//columns START
	    /**
	     * ID       db_column: ID 
	     */	
		private Integer id;
	    /**
	     * 父ID       db_column: PARENT_ID 
	     */	
		private Integer parentId;
	    /**
	     * 角色名称       db_column: ROLE_NAME 
	     */	
		private String roleName;
	    /**
	     * 菜单权限/URL   _menu的ID     2的全和       db_column: MENU_RIGHTS 
	     */	
		private String menuRights;
	    /**
	     * 增加的权限       db_column: ADD_QX 
	     */	
		private String addQx;
	    /**
	     * 删除       db_column: DEL_QX 
	     */	
		private String delQx;
	    /**
	     * 编辑       db_column: EDIT_QX 
	     */	
		private String editQx;
	    /**
	     * 查询       db_column: CHA_QX 
	     */	
		private String chaQx;
	    /**
	     * 审核       db_column: AUDIT_QX 
	     */	
		private String auditQx;
	    /**
	     * 发信权限       db_column: FX_QX 
	     */	
		private Integer fxQx;
	    /**
	     * 服务权限       db_column: FW_QX 
	     */	
		private Integer fwQx;
	    /**
	     * 操作权限       db_column: QX1 
	     */	
		private Integer qx1;
	    /**
	     * 产品权限       db_column: QX2 
	     */	
		private Integer qx2;
	    /**
	     * 预留权限       db_column: QX3 
	     */	
		private Integer qx3;
	    /**
	     * 预留权限       db_column: QX4 
	     */	
		private Integer qx4;
	    /**
	     * C1       db_column: C1 
	     */	
		private Integer c1;
	    /**
	     * C2       db_column: C2 
	     */	
		private Integer c2;
	    /**
	     * C3       db_column: C3 
	     */	
		private Integer c3;
	    /**
	     * C4       db_column: C4 
	     */	
		private Integer c4;
	    /**
	     * Q1       db_column: Q1 
	     */	
		private Integer q1;
	    /**
	     * Q2       db_column: Q2 
	     */	
		private Integer q2;
	    /**
	     * Q3       db_column: Q3 
	     */	
		private Integer q3;
	    /**
	     * Q4       db_column: Q4 
	     */	
		private Integer q4;
	    /**
	     * 是否逻辑删除       db_column: IS_DEL 
	     */	
		private Integer isDel;
	    /**
	     * 版本       db_column: VERSION 
	     */	
		private Integer version;
	    /**
	     * 创建时间       db_column: CREATE_TIME 
	     */	
		private java.util.Date createTime;
	    /**
	     * 更新时间       db_column: UPDATE_TIME 
	     */	
		private java.util.Date updateTime;
	    /**
	     * 删除时间       db_column: DELETE_TIME 
	     */	
		private java.util.Date deleteTime;
	    /**
	     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
	     */	
		private Integer optId;
		//columns END

		public HjsSysRole(){
		}

		public HjsSysRole(
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
		public void setParentId(Integer value) {
			this.parentId = value;
		}
		
		public Integer getParentId() {
			return this.parentId;
		}
		public void setRoleName(String value) {
			this.roleName = value;
		}
		
		public String getRoleName() {
			return this.roleName;
		}
		public void setMenuRights(String value) {
			this.menuRights = value;
		}
		
		public String getMenuRights() {
			return this.menuRights;
		}
		public void setAddQx(String value) {
			this.addQx = value;
		}
		
		public String getAddQx() {
			return this.addQx;
		}
		public void setDelQx(String value) {
			this.delQx = value;
		}
		
		public String getDelQx() {
			return this.delQx;
		}
		public void setEditQx(String value) {
			this.editQx = value;
		}
		
		public String getEditQx() {
			return this.editQx;
		}
		public void setChaQx(String value) {
			this.chaQx = value;
		}
		
		public String getChaQx() {
			return this.chaQx;
		}
		public void setAuditQx(String value) {
			this.auditQx = value;
		}
		
		public String getAuditQx() {
			return this.auditQx;
		}
		public void setFxQx(Integer value) {
			this.fxQx = value;
		}
		
		public Integer getFxQx() {
			return this.fxQx;
		}
		public void setFwQx(Integer value) {
			this.fwQx = value;
		}
		
		public Integer getFwQx() {
			return this.fwQx;
		}
		public void setQx1(Integer value) {
			this.qx1 = value;
		}
		
		public Integer getQx1() {
			return this.qx1;
		}
		public void setQx2(Integer value) {
			this.qx2 = value;
		}
		
		public Integer getQx2() {
			return this.qx2;
		}
		public void setQx3(Integer value) {
			this.qx3 = value;
		}
		
		public Integer getQx3() {
			return this.qx3;
		}
		public void setQx4(Integer value) {
			this.qx4 = value;
		}
		
		public Integer getQx4() {
			return this.qx4;
		}
		public void setC1(Integer value) {
			this.c1 = value;
		}
		
		public Integer getC1() {
			return this.c1;
		}
		public void setC2(Integer value) {
			this.c2 = value;
		}
		
		public Integer getC2() {
			return this.c2;
		}
		public void setC3(Integer value) {
			this.c3 = value;
		}
		
		public Integer getC3() {
			return this.c3;
		}
		public void setC4(Integer value) {
			this.c4 = value;
		}
		
		public Integer getC4() {
			return this.c4;
		}
		public void setQ1(Integer value) {
			this.q1 = value;
		}
		
		public Integer getQ1() {
			return this.q1;
		}
		public void setQ2(Integer value) {
			this.q2 = value;
		}
		
		public Integer getQ2() {
			return this.q2;
		}
		public void setQ3(Integer value) {
			this.q3 = value;
		}
		
		public Integer getQ3() {
			return this.q3;
		}
		public void setQ4(Integer value) {
			this.q4 = value;
		}
		
		public Integer getQ4() {
			return this.q4;
		}
		public void setIsDel(Integer value) {
			this.isDel = value;
		}
		
		public Integer getIsDel() {
			return this.isDel;
		}
		
		public Integer getVersion() {
			return version;
		}

		public void setVersion(Integer version) {
			this.version = version;
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
		public void setOptId(Integer value) {
			this.optId = value;
		}
		
		public Integer getOptId() {
			return this.optId;
		}

		public String toString() {
			return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
				.append("Id",getId())
				.append("ParentId",getParentId())
				.append("RoleName",getRoleName())
				.append("MenuRights",getMenuRights())
				.append("AddQx",getAddQx())
				.append("DelQx",getDelQx())
				.append("EditQx",getEditQx())
				.append("ChaQx",getChaQx())
				.append("AuditQx",getAuditQx())
				.append("FxQx",getFxQx())
				.append("FwQx",getFwQx())
				.append("Qx1",getQx1())
				.append("Qx2",getQx2())
				.append("Qx3",getQx3())
				.append("Qx4",getQx4())
				.append("C1",getC1())
				.append("C2",getC2())
				.append("C3",getC3())
				.append("C4",getC4())
				.append("Q1",getQ1())
				.append("Q2",getQ2())
				.append("Q3",getQ3())
				.append("Q4",getQ4())
				.append("IsDel",getIsDel())
				.append("Version",getVersion())
				.append("CreateTime",getCreateTime())
				.append("UpdateTime",getUpdateTime())
				.append("DeleteTime",getDeleteTime())
				.append("OptId",getOptId())
				.toString();
		}
		
		public int hashCode() {
			return new HashCodeBuilder()
				.append(getId())
				.toHashCode();
		}
		
		public boolean equals(Object obj) {
			if(obj instanceof HjsSysRole == false) return false;
			if(this == obj) return true;
			HjsSysRole other = (HjsSysRole)obj;
			return new EqualsBuilder()
				.append(getId(),other.getId())
				.isEquals();
		}
}

