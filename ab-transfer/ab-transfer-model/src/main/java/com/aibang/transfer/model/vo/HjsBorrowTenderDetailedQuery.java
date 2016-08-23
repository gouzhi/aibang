package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsBorrowTenderDetailedQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 5459305823522213057L;
	/** ID */
	private Integer id;
	/** 借款产品ID */
	private Integer borrowId;
	/** 投标ID */
	private Integer tenderId;
	/** 借款（人）表ID——即汇付标的信息项目ID */
	private Integer hjsBorrowUserId;
	/** 状态 configid= */
	private Integer status;
	/** 投资人ID */
	private Integer tenderUserId;
	/** 借款人ID */
	private Integer borrowUserId;
	/** 投资人客户号 */
	private String tenderUsrCustId;
	/** 借款人客户号 */
	private String borrowUsrCustId;
	/** 收款还款类型 */
	private Integer repayType;
	/** 收款还款周期 */
	private Integer repayPeriod;
	/** 红包出账账户 */
	private String acctId;
	/** 交易金额 */
	private java.math.BigDecimal account;
	/** 使用红包金额 */
	private java.math.BigDecimal bonusValue;
	/** 借款利率 */
	private java.math.BigDecimal borrowApr;
	/** 最大借款利率 */
	private java.math.BigDecimal borrowAprMax;
	/** 创建时间 */
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
	
	public Integer getBorrowId() {
		return this.borrowId;
	}
	
	public void setBorrowId(Integer value) {
		this.borrowId = value;
	}
	
	public Integer getTenderId() {
		return this.tenderId;
	}
	
	public void setTenderId(Integer value) {
		this.tenderId = value;
	}
	
	public Integer getHjsBorrowUserId() {
		return this.hjsBorrowUserId;
	}
	
	public void setHjsBorrowUserId(Integer value) {
		this.hjsBorrowUserId = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getTenderUserId() {
		return this.tenderUserId;
	}
	
	public void setTenderUserId(Integer value) {
		this.tenderUserId = value;
	}
	
	public Integer getBorrowUserId() {
		return this.borrowUserId;
	}
	
	public void setBorrowUserId(Integer value) {
		this.borrowUserId = value;
	}
	
	public String getTenderUsrCustId() {
		return this.tenderUsrCustId;
	}
	
	public void setTenderUsrCustId(String value) {
		this.tenderUsrCustId = value;
	}
	
	public String getBorrowUsrCustId() {
		return this.borrowUsrCustId;
	}
	
	public void setBorrowUsrCustId(String value) {
		this.borrowUsrCustId = value;
	}
	
	public Integer getRepayType() {
		return this.repayType;
	}
	
	public void setRepayType(Integer value) {
		this.repayType = value;
	}
	
	public Integer getRepayPeriod() {
		return this.repayPeriod;
	}
	
	public void setRepayPeriod(Integer value) {
		this.repayPeriod = value;
	}
	
	public String getAcctId() {
		return this.acctId;
	}
	
	public void setAcctId(String value) {
		this.acctId = value;
	}
	
	public java.math.BigDecimal getAccount() {
		return this.account;
	}
	
	public void setAccount(java.math.BigDecimal value) {
		this.account = value;
	}
	
	public java.math.BigDecimal getBonusValue() {
		return this.bonusValue;
	}
	
	public void setBonusValue(java.math.BigDecimal value) {
		this.bonusValue = value;
	}
	
	public java.math.BigDecimal getBorrowApr() {
		return this.borrowApr;
	}
	
	public void setBorrowApr(java.math.BigDecimal value) {
		this.borrowApr = value;
	}
	
	public java.math.BigDecimal getBorrowAprMax() {
		return this.borrowAprMax;
	}
	
	public void setBorrowAprMax(java.math.BigDecimal value) {
		this.borrowAprMax = value;
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

