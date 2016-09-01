package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class AbSysRoleQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 5724319413420550648L;
	/** ID */
	private Integer id;
	/** 父ID */
	private Integer parentId;
	/** 角色名称 */
	private String roleName;
	/** 菜单权限/URL   _menu的ID     2的全和 */
	private String menuRights;
	/** 增加的权限 */
	private String addQx;
	/** 删除 */
	private String delQx;
	/** 编辑 */
	private String editQx;
	/** 查询 */
	private String chaQx;
	/** 审核 */
	private String auditQx;
	/** 发信权限 */
	private Integer fxQx;
	/** 服务权限 */
	private Integer fwQx;
	/** 操作权限 */
	private Integer qx1;
	/** 产品权限 */
	private Integer qx2;
	/** 预留权限 */
	private Integer qx3;
	/** 预留权限 */
	private Integer qx4;
	/** C1 */
	private Integer c1;
	/** C2 */
	private Integer c2;
	/** C3 */
	private Integer c3;
	/** C4 */
	private Integer c4;
	/** Q1 */
	private Integer q1;
	/** Q2 */
	private Integer q2;
	/** Q3 */
	private Integer q3;
	/** Q4 */
	private Integer q4;
	/** 是否逻辑删除 */
	private Integer isDel;
	/** 版本 */
	private Integer version;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 更新时间 */
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	/** 删除时间 */
	private java.util.Date deleteTimeBegin;
	private java.util.Date deleteTimeEnd;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public String getRoleName() {
		return this.roleName;
	}
	
	public void setRoleName(String value) {
		this.roleName = value;
	}
	
	public String getMenuRights() {
		return this.menuRights;
	}
	
	public void setMenuRights(String value) {
		this.menuRights = value;
	}
	
	public String getAddQx() {
		return this.addQx;
	}
	
	public void setAddQx(String value) {
		this.addQx = value;
	}
	
	public String getDelQx() {
		return this.delQx;
	}
	
	public void setDelQx(String value) {
		this.delQx = value;
	}
	
	public String getEditQx() {
		return this.editQx;
	}
	
	public void setEditQx(String value) {
		this.editQx = value;
	}
	
	public String getChaQx() {
		return this.chaQx;
	}
	
	public void setChaQx(String value) {
		this.chaQx = value;
	}
	
	public String getAuditQx() {
		return this.auditQx;
	}
	
	public void setAuditQx(String value) {
		this.auditQx = value;
	}
	
	public Integer getFxQx() {
		return this.fxQx;
	}
	
	public void setFxQx(Integer value) {
		this.fxQx = value;
	}
	
	public Integer getFwQx() {
		return this.fwQx;
	}
	
	public void setFwQx(Integer value) {
		this.fwQx = value;
	}
	
	public Integer getQx1() {
		return this.qx1;
	}
	
	public void setQx1(Integer value) {
		this.qx1 = value;
	}
	
	public Integer getQx2() {
		return this.qx2;
	}
	
	public void setQx2(Integer value) {
		this.qx2 = value;
	}
	
	public Integer getQx3() {
		return this.qx3;
	}
	
	public void setQx3(Integer value) {
		this.qx3 = value;
	}
	
	public Integer getQx4() {
		return this.qx4;
	}
	
	public void setQx4(Integer value) {
		this.qx4 = value;
	}
	
	public Integer getC1() {
		return this.c1;
	}
	
	public void setC1(Integer value) {
		this.c1 = value;
	}
	
	public Integer getC2() {
		return this.c2;
	}
	
	public void setC2(Integer value) {
		this.c2 = value;
	}
	
	public Integer getC3() {
		return this.c3;
	}
	
	public void setC3(Integer value) {
		this.c3 = value;
	}
	
	public Integer getC4() {
		return this.c4;
	}
	
	public void setC4(Integer value) {
		this.c4 = value;
	}
	
	public Integer getQ1() {
		return this.q1;
	}
	
	public void setQ1(Integer value) {
		this.q1 = value;
	}
	
	public Integer getQ2() {
		return this.q2;
	}
	
	public void setQ2(Integer value) {
		this.q2 = value;
	}
	
	public Integer getQ3() {
		return this.q3;
	}
	
	public void setQ3(Integer value) {
		this.q3 = value;
	}
	
	public Integer getQ4() {
		return this.q4;
	}
	
	public void setQ4(Integer value) {
		this.q4 = value;
	}
	
	public Integer getIsDel() {
		return this.isDel;
	}
	
	public void setIsDel(Integer value) {
		this.isDel = value;
	}
	
	public Integer getVersion() {
		return this.version;
	}
	
	public void setVersion(Integer value) {
		this.version = value;
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
	
	public java.util.Date getUpdateTimeBegin() {
		return this.updateTimeBegin;
	}
	
	public void setUpdateTimeBegin(java.util.Date value) {
		this.updateTimeBegin = value;
	}	
	
	public java.util.Date getUpdateTimeEnd() {
		return this.updateTimeEnd;
	}
	
	public void setUpdateTimeEnd(java.util.Date value) {
		this.updateTimeEnd = value;
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
	
	public Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(Integer value) {
		this.optId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
}

