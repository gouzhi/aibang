package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActBonusUsersLogQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID      
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -531679153485908768L;
	/** ID */
	private Integer id;
	/** 红包ID */
	private Integer bonusUserId;
	/** 用户ID */
	private Integer userId;
	/** 使用面值 */
	private java.math.BigDecimal useredValue;
	/** 投标记录ID */              
	private Integer tenderSourceId;
	/** 状态/1使用，  -1退 */
	private Integer status;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getBonusUserId() {
		return this.bonusUserId;
	}
	
	public void setBonusUserId(Integer value) {
		this.bonusUserId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	
	
	public java.math.BigDecimal getUseredValue() {
		return useredValue;
	}

	public void setUseredValue(java.math.BigDecimal useredValue) {
		this.useredValue = useredValue;
	}

	public Integer getTenderSourceId() {
		return this.tenderSourceId;
	}
	
	public void setTenderSourceId(Integer value) {
		this.tenderSourceId = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
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
	
	public String getCreateIp() {
		return this.createIp;
	}
	
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	/**
	 * 关键字搜索
	 */
	private String context;
	
	public String getContext() {
		return context;
	}
	
	public void setContext(String context) {
		this.context = context;
	}
}

