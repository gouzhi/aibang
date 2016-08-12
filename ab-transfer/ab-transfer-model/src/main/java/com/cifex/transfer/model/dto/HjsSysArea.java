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

public class HjsSysArea extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = 5399714429609573073L;
	//alias
	public static final String TABLE_ALIAS = "HjsSysArea";
	public static final String ALIAS_ID = "自增ID";
	public static final String ALIAS_AREA_NAME = "名称";
	public static final String ALIAS_PY_NAME = "拼音";
	public static final String ALIAS_PARENT_ID = "父ID";
	public static final String ALIAS_ALL_PARENTID = "所有父ID/逗隔开";
	public static final String ALIAS_ORDER_ID = "同级的排序ID";
	public static final String ALIAS_LAYER = "层级/1开始";
	public static final String ALIAS_IS_DEL = "是否逻辑删除0：否";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 自增ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 名称       db_column: AREA_NAME 
     */	
	private String areaName;
    /**
     * 拼音       db_column: PY_NAME 
     */	
	private String pyName;
    /**
     * 父ID       db_column: PARENT_ID 
     */	
	private Integer parentId;
    /**
     * 所有父ID/逗隔开       db_column: ALL_PARENTID 
     */	
	private String allParentid;
    /**
     * 同级的排序ID       db_column: ORDER_ID 
     */	
	private Integer orderId;
    /**
     * 层级/1开始       db_column: LAYER 
     */	
	private Integer layer;
    /**
     * 是否逻辑删除0：否       db_column: IS_DEL 
     */	
	private Integer isDel;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsSysArea(){
	}

	public HjsSysArea(
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
	public void setAreaName(String value) {
		this.areaName = value;
	}
	
	public String getAreaName() {
		return this.areaName;
	}
	public void setPyName(String value) {
		this.pyName = value;
	}
	
	public String getPyName() {
		return this.pyName;
	}
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	public void setAllParentid(String value) {
		this.allParentid = value;
	}
	
	public String getAllParentid() {
		return this.allParentid;
	}
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
	
	public Integer getOrderId() {
		return this.orderId;
	}
	public void setLayer(Integer value) {
		this.layer = value;
	}
	
	public Integer getLayer() {
		return this.layer;
	}
	public void setIsDel(Integer value) {
		this.isDel = value;
	}
	
	public Integer getIsDel() {
		return this.isDel;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("AreaName",getAreaName())
			.append("PyName",getPyName())
			.append("ParentId",getParentId())
			.append("AllParentid",getAllParentid())
			.append("OrderId",getOrderId())
			.append("Layer",getLayer())
			.append("IsDel",getIsDel())
			.append("OptId",getOptId())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsSysArea == false) return false;
		if(this == obj) return true;
		HjsSysArea other = (HjsSysArea)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

