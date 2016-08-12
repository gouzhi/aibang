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

public class HjsSysConfig extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -7527681505464241513L;
	//alias
	public static final String TABLE_ALIAS = "HjsSysConfig";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_PARENT_ID = "父ID";
	public static final String ALIAS_CNAME = "名称";
	public static final String ALIAS_CODE = "编码";
	public static final String ALIAS_PCODE = "编码 父级编码_当前编号";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_ORDER_ID = "序号";
	public static final String ALIAS_LAYER = "级别";
	public static final String ALIAS_IS_DEL = "是否逻辑删除0：否";
	public static final String ALIAS_VERSION = "版本";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_UPDATE_TIME = "更新时间";
	public static final String ALIAS_DELETE_TIME = "删除时间";
	public static final String ALIAS_VALUE1 = "值1";
	
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
     * 名称       db_column: CNAME 
     */	
	private String cname;
    /**
     * 编码       db_column: CODE 
     */	
	private String code;
    /**
     * 编码 父级编码_当前编号       db_column: P_CODE 
     */	
	private String pcode;
    /**
     * 备注       db_column: REMARK 
     */	
	private String remark;
    /**
     * 序号       db_column: ORDER_ID 
     */	
	private Integer orderId;
    /**
     * 级别       db_column: LAYER 
     */	
	private Integer layer;
    /**
     * 是否逻辑删除0：否       db_column: IS_DEL 
     */	
	private Integer isDel;
    /**
     * 版本       db_column: VERSION 
     */	
	private Integer version;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
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
	 *值1
	 */
	private String value1;
	/**
	 *值2
	 */
	private String value2;
	/**
	 *值3
	 */
	private String value3;

	
	//columns END

	public String getValue1() {
		return value1;
	}

	public void setValue1(String value1) {
		this.value1 = value1;
	}

	public String getValue2() {
		return value2;
	}

	public void setValue2(String value2) {
		this.value2 = value2;
	}

	public String getValue3() {
		return value3;
	}

	public void setValue3(String value3) {
		this.value3 = value3;
	}

	public HjsSysConfig(){
	}

	public HjsSysConfig(
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
	public void setCname(String value) {
		this.cname = value;
	}
	
	public String getCname() {
		return this.cname;
	}
	public void setCode(String value) {
		this.code = value;
	}
	
	public String getCode() {
		return this.code;
	}
	public void setPcode(String value) {
		this.pcode = value;
	}
	
	public String getPcode() {
		return this.pcode;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
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
	public void setVersion(Integer value) {
		this.version = value;
	}
	
	public Integer getVersion() {
		return this.version;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("ParentId",getParentId())
			.append("Cname",getCname())
			.append("Code",getCode())
			.append("Pcode",getPcode())
			.append("Remark",getRemark())
			.append("OrderId",getOrderId())
			.append("Layer",getLayer())
			.append("IsDel",getIsDel())
			.append("Version",getVersion())
			.append("OptId",getOptId())
			.append("CreateTime",getCreateTime())
			.append("UpdateTime",getUpdateTime())
			.append("DeleteTime",getDeleteTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsSysConfig == false) return false;
		if(this == obj) return true;
		HjsSysConfig other = (HjsSysConfig)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

