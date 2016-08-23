/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2013 - 2015
 */

package com.aibang.transfer.model.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


public class HjsSysServiceQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private Integer id;
	/** 服务名称 */
	private String serviceName;
	/** 服务命名空间 */
	private String serviceNamespace;
	/** parentId */
	private Integer parentId;
	/** 序号 */
	private String serviceOrder;
	/** 类型 1 平台服务 2 用户服务 3 通用服务  */
	private String serviceType;
	/** isDel */
	private Integer isDel;
	/** version */
	private Integer version;
	/** createTime 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** updateTime 修改时间*/
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	/** deleteTime 删除时间*/
	private java.util.Date deleteTimeBegin;
	private java.util.Date deleteTimeEnd;

	/**
	 * 服务图标
	 */
	private String serviceIcon;
	
	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public String getServiceName() {
		return this.serviceName;
	}
	
	public void setServiceName(String value) {
		this.serviceName = value;
	}
	
	public String getServiceNamespace() {
		return this.serviceNamespace;
	}
	
	public void setServiceNamespace(String value) {
		this.serviceNamespace = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public String getServiceOrder() {
		return this.serviceOrder;
	}
	
	public void setServiceOrder(String value) {
		this.serviceOrder = value;
	}
	
	public String getServiceType() {
		return this.serviceType;
	}
	
	public void setServiceType(String value) {
		this.serviceType = value;
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
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getServiceIcon() {
		return serviceIcon;
	}

	public void setServiceIcon(String serviceIcon) {
		this.serviceIcon = serviceIcon;
	}
	
}

