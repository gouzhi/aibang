package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class AbSysConfigQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -872063348408931858L;
	/** ID */
	private Integer id;
	/** 父ID */
	private Integer parentId;
	/** 名称 */
	private String cname;
	/** 编码 */
	private String code;
	/** 编码 父级编码_当前编号 */
	private String pcode;
	/** 备注 */
	private String remark;
	/** 序号 */
	private Integer orderId;
	/** 级别 */
	private Integer layer;
	/** 是否逻辑删除0：否 */
	private Integer isDel;
	/** 版本 */
	private Integer version;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 更新时间 */
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	/** 删除时间 */
	private java.util.Date deleteTimeBegin;
	private java.util.Date deleteTimeEnd;
	
	private String value1;
	private String value2;
	private String value3;

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
	
	public String getCname() {
		return this.cname;
	}
	
	public void setCname(String value) {
		this.cname = value;
	}
	
	public String getCode() {
		return this.code;
	}
	
	public void setCode(String value) {
		this.code = value;
	}
	
	public String getPcode() {
		return this.pcode;
	}
	
	public void setPcode(String value) {
		this.pcode = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setRemark(String value) {
		this.remark = value;
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
	
	public Integer getVersion() {
		return this.version;
	}
	
	public void setVersion(Integer value) {
		this.version = value;
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
}

