/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2013 - 2015
 */

package com.cifex.transfer.model.dto;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;





import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity;

import java.util.*;


 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


public class HjsSysService extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "HjsSysService";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_SERVICE_NAME = "服务名称";
	public static final String ALIAS_SERVICE_NAMESPACE = "服务命名空间";
	public static final String ALIAS_PARENT_ID = "parentId";
	public static final String ALIAS_SERVICE_ORDER = "序号";
	public static final String ALIAS_SERVICE_TYPE = "类型 1 平台服务 2 用户服务 3 通用服务 ";
	public static final String ALIAS_IS_DEL = "isDel";
	public static final String ALIAS_VERSION = "version";
	public static final String ALIAS_CREATE_TIME = "createTime";
	public static final String ALIAS_UPDATE_TIME = "updateTime";
	public static final String ALIAS_DELETE_TIME = "deleteTime";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;
	public static final String FORMAT_DELETE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */	
	
	private Integer id;
    /**
     * 服务名称       db_column: SERVICE_NAME 
     */	
	private String serviceName;
    /**
     * 服务命名空间       db_column: SERVICE_NAMESPACE 
     */	
	private String serviceNamespace;
    /**
     * parentId       db_column: PARENT_ID
     * 父类ID 
     */	
	
	private Integer parentId;
    /**
     * 序号       db_column: SERVICE_ORDER 
     */	
	private String serviceOrder;
    /**
     * 类型 1 平台服务 2 用户服务 3 通用服务        db_column: SERVICE_TYPE 
     */	
	private String serviceType;
    /**
     * isDel       db_column: IS_DEL
     * 删除标识 1：已删除 0：未删除 默认0 
     */	
	
	private Integer isDel;
    /**
     * version       db_column: VERSION
     * 版本号 
     */	
	
	private Integer version;
    /**
     * createTime       db_column: CREATE_TIME
     * 创建时间 
     */	
	
	private Date createTime;
    /**
     * updateTime       db_column: UPDATE_TIME
     * 修改时间 
     */	
	
	private Date updateTime;
    /**
     * deleteTime       db_column: DELETE_TIME
     * 删除时间 
     */	
	
	private Date deleteTime;
	
	/**
	 * 父类服务
	 */
	private HjsSysMenu parentService;
	/**
	 * 子服务列表
	 */
	private List<HjsSysService> subService;
	/**
	 * 是否有子服务
	 */
	private boolean hasService = false;
	
	//columns END

	/**
	 * 服务图标
	 */
	private String serviceIcon;
	
	public HjsSysService(){
	}

	public HjsSysService(
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
	public void setServiceName(String value) {
		this.serviceName = value;
	}
	
	public String getServiceName() {
		return this.serviceName;
	}
	public void setServiceNamespace(String value) {
		this.serviceNamespace = value;
	}
	
	public String getServiceNamespace() {
		return this.serviceNamespace;
	}
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	public void setServiceOrder(String value) {
		this.serviceOrder = value;
	}
	
	public String getServiceOrder() {
		return this.serviceOrder;
	}
	public void setServiceType(String value) {
		this.serviceType = value;
	}
	
	public String getServiceType() {
		return this.serviceType;
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
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,Date.class));
	}
	
	public void setCreateTime(Date value) {
		this.createTime = value;
	}
	
	public Date getCreateTime() {
		return this.createTime;
	}
	public String getUpdateTimeString() {
		return DateConvertUtils.format(getUpdateTime(), FORMAT_UPDATE_TIME);
	}
	public void setUpdateTimeString(String value) {
		setUpdateTime(DateConvertUtils.parse(value, FORMAT_UPDATE_TIME,Date.class));
	}
	
	public void setUpdateTime(Date value) {
		this.updateTime = value;
	}
	
	public Date getUpdateTime() {
		return this.updateTime;
	}
	public String getDeleteTimeString() {
		return DateConvertUtils.format(getDeleteTime(), FORMAT_DELETE_TIME);
	}
	public void setDeleteTimeString(String value) {
		setDeleteTime(DateConvertUtils.parse(value, FORMAT_DELETE_TIME,Date.class));
	}
	
	public void setDeleteTime(Date value) {
		this.deleteTime = value;
	}
	
	public Date getDeleteTime() {
		return this.deleteTime;
	}

	public HjsSysMenu getParentService() {
		return parentService;
	}

	public void setParentService(HjsSysMenu parentService) {
		this.parentService = parentService;
	}

	public List<HjsSysService> getSubService() {
		return subService;
	}

	public void setSubService(List<HjsSysService> subService) {
		this.subService = subService;
	}

	public boolean isHasService() {
		return hasService;
	}

	public void setHasService(boolean hasService) {
		this.hasService = hasService;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("ServiceName",getServiceName())
			.append("ServiceNamespace",getServiceNamespace())
			.append("ParentId",getParentId())
			.append("ServiceOrder",getServiceOrder())
			.append("ServiceType",getServiceType())
			.append("IsDel",getIsDel())
			.append("Version",getVersion())
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
		if(obj instanceof HjsSysService == false) return false;
		if(this == obj) return true;
		HjsSysService other = (HjsSysService)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public String getServiceIcon() {
		return serviceIcon;
	}

	public void setServiceIcon(String serviceIcon) {
		this.serviceIcon = serviceIcon;
	}
}

