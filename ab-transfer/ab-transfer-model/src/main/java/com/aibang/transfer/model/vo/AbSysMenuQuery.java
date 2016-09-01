package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class AbSysMenuQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 5699017987615803764L;
	/** ID */
	private Integer id;
	/** 菜单名称 */
	private String menuName;
	/** 类型 1 平台菜单 2 个人中菜单 */
	private Integer typeId;
	/** 父ID */
	private Integer parentId;
	/** 链接地址 */
	private String menuUrl;
	/** 序号 */
	private Integer orderId;
	/** 图标 */
	private String menuIcon;
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
	
	public String getMenuName() {
		return this.menuName;
	}
	
	public void setMenuName(String value) {
		this.menuName = value;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public String getMenuUrl() {
		return this.menuUrl;
	}
	
	public void setMenuUrl(String value) {
		this.menuUrl = value;
	}
	
	public Integer getOrderId() {
		return this.orderId;
	}
	
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
	
	public String getMenuIcon() {
		return this.menuIcon;
	}
	
	public void setMenuIcon(String value) {
		this.menuIcon = value;
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

