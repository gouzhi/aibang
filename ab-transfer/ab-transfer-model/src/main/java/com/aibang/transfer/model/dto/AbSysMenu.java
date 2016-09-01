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

public class AbSysMenu extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = 7007055362183369387L;
	//alias
	public static final String TABLE_ALIAS = "HjsSysMenu";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_MENU_NAME = "菜单名称";
	public static final String ALIAS_TYPE_ID = "类型 1 平台菜单 2 个人中菜单";
	public static final String ALIAS_PARENT_ID = "父ID";
	public static final String ALIAS_MENU_URL = "链接地址";
	public static final String ALIAS_ORDER_ID = "序号";
	public static final String ALIAS_MENU_ICON = "图标";
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
     * 菜单名称       db_column: MENU_NAME 
     */	
	private String menuName;
    /**
     * 类型 1 平台菜单 2 个人中菜单       db_column: TYPE_ID 
     */	
	private Integer typeId;
    /**
     * 父ID       db_column: PARENT_ID 
     */	
	private Integer parentId;
    /**
     * 链接地址       db_column: MENU_URL 
     */	
	private String menuUrl;
    /**
     * 序号       db_column: ORDER_ID 
     */	
	private Integer orderId;
    /**
     * 图标       db_column: MENU_ICON 
     */	
	private String menuIcon;
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
	
	private String target;
	/**
	 * 父类菜单
	 */
	private AbSysMenu parentMenu;
	/**
	 * 子菜单列表
	 */
	private List<AbSysMenu> subMenu;
	/**
	 * 是否有子菜单
	 */
	private boolean hasMenu = false;

	public AbSysMenu(){
	}

	public AbSysMenu(
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
	public void setMenuName(String value) {
		this.menuName = value;
	}
	
	public String getMenuName() {
		return this.menuName;
	}
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	public void setMenuUrl(String value) {
		this.menuUrl = value;
	}
	
	public String getMenuUrl() {
		return this.menuUrl;
	}
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
	
	public Integer getOrderId() {
		return this.orderId;
	}
	public void setMenuIcon(String value) {
		this.menuIcon = value;
	}
	
	public String getMenuIcon() {
		return this.menuIcon;
	}
	public void setIsDel(Integer value) {
		this.isDel = value;
	}
	
	public Integer getIsDel() {
		return this.isDel;
	}
	public void setVersion(Integer value) {
		this.version = value;
	}
	
	public Integer getVersion() {
		return this.version;
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
	

	public AbSysMenu getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(AbSysMenu parentMenu) {
		this.parentMenu = parentMenu;
	}

	public List<AbSysMenu> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(List<AbSysMenu> subMenu) {
		this.subMenu = subMenu;
	}

	public boolean isHasMenu() {
		return hasMenu;
	}

	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}
	

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("MenuName",getMenuName())
			.append("TypeId",getTypeId())
			.append("ParentId",getParentId())
			.append("MenuUrl",getMenuUrl())
			.append("OrderId",getOrderId())
			.append("MenuIcon",getMenuIcon())
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
		if(obj instanceof AbSysMenu == false) return false;
		if(this == obj) return true;
		AbSysMenu other = (AbSysMenu)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
	
}

