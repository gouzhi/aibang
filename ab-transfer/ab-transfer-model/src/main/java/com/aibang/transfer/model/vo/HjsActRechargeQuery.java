package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActRechargeQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID      
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -9019779888061753708L;
	/** ID */
	private Integer id;
	/** 红包名称 */
	private String rechargeName;
	/** 充值类型configid=41 */
	private Integer rechargeType;
	/** 充值编码 */
	private String rechargeCode;
	/** 充值金额 */
	private java.math.BigDecimal value;
	/** 活动URL */
	private String actUrl;
	/** 操作员ID */
	private Integer optId;
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
	
	public String getRechargeName() {
		return this.rechargeName;
	}
	
	public void setRechargeName(String value) {
		this.rechargeName = value;
	}
	
	public Integer getRechargeType() {
		return this.rechargeType;
	}
	
	public void setRechargeType(Integer value) {
		this.rechargeType = value;
	}
	
	public String getRechargeCode() {
		return this.rechargeCode;
	}
	
	public void setRechargeCode(String value) {
		this.rechargeCode = value;
	}
	
	public java.math.BigDecimal getValue() {
		return this.value;
	}
	
	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}
	
	public String getActUrl() {
		return this.actUrl;
	}
	
	public void setActUrl(String value) {
		this.actUrl = value;
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

