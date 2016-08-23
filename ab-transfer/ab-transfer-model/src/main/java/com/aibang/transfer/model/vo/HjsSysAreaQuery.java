package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsSysAreaQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -5693452844370166004L;
	/** 自增ID */
	private Integer id;
	/** 名称 */
	private String areaName;
	/** 拼音 */
	private String pyName;
	/** 父ID */
	private Integer parentId;
	/** 所有父ID/逗隔开 */
	private String allParentid;
	/** 同级的排序ID */
	private Integer orderId;
	/** 层级/1开始 */
	private Integer layer;
	/** 是否逻辑删除0：否 */
	private Integer isDel;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public String getAreaName() {
		return this.areaName;
	}
	
	public void setAreaName(String value) {
		this.areaName = value;
	}
	
	public String getPyName() {
		return this.pyName;
	}
	
	public void setPyName(String value) {
		this.pyName = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public String getAllParentid() {
		return this.allParentid;
	}
	
	public void setAllParentid(String value) {
		this.allParentid = value;
	}
	
	public Integer getOrderId() {
		return this.orderId;
	}
	
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
	
	public Integer getLayer() {
		return this.layer;
	}
	
	public void setLayer(Integer value) {
		this.layer = value;
	}
	
	public Integer getIsDel() {
		return this.isDel;
	}
	
	public void setIsDel(Integer value) {
		this.isDel = value;
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
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
}

