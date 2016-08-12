package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsBorrowRepayRecoverDetailedQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 766689051502082698L;
	/** ID */
	private Integer id;
	/** 投资明细ID */
	private Integer tenderDetailedId;
	/** 投标ID */
	private Integer tenderId;
	/** 借款产品ID */
	private Integer borrowId;
	/** 借款单ID——即hjs_borrow_user表ID——即汇付项目ID */
	private Integer hjsBorrowUserId;
	/** 状态 configid= */
	private Integer status;
	/** 投资人ID */
	private Integer tenderUserId;
	/** 借款人ID */
	private Integer borrowUserId;
	/** 投资人客户号——入账账户 */
	private String tenderUsrCustId;
	/** 借款人客户号——出账账户 */
	private String borrowUsrCustId;
	/** 实际本金 */
	private java.math.BigDecimal accountCapital;
	/** 实际利息 */
	private java.math.BigDecimal accountInterest;
	/** 交易金额 */
	private java.math.BigDecimal account;
	/** 手续费金额/管理费 */
	private java.math.BigDecimal ufee;
	/** 收款单ID */
	private Integer borrowRecoverId;
	/** 还款单ID */
	private Integer borrowRepayId;
	/** 还款时间 */
	private java.util.Date recoverTimeBegin;
	private java.util.Date recoverTimeEnd;
	/** 实际还款时间 */
	private String recoverTimeYes;
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
	
	public Integer getTenderDetailedId() {
		return this.tenderDetailedId;
	}
	
	public void setTenderDetailedId(Integer value) {
		this.tenderDetailedId = value;
	}
	
	public Integer getTenderId() {
		return this.tenderId;
	}
	
	public void setTenderId(Integer value) {
		this.tenderId = value;
	}
	
	public Integer getBorrowId() {
		return this.borrowId;
	}
	
	public void setBorrowId(Integer value) {
		this.borrowId = value;
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
	
	public java.math.BigDecimal getAccountCapital() {
		return this.accountCapital;
	}
	
	public void setAccountCapital(java.math.BigDecimal value) {
		this.accountCapital = value;
	}
	
	public java.math.BigDecimal getAccountInterest() {
		return this.accountInterest;
	}
	
	public void setAccountInterest(java.math.BigDecimal value) {
		this.accountInterest = value;
	}
	
	public java.math.BigDecimal getAccount() {
		return this.account;
	}
	
	public void setAccount(java.math.BigDecimal value) {
		this.account = value;
	}
	
	public java.math.BigDecimal getUfee() {
		return this.ufee;
	}
	
	public void setUfee(java.math.BigDecimal value) {
		this.ufee = value;
	}
	
	public Integer getBorrowRecoverId() {
		return this.borrowRecoverId;
	}
	
	public void setBorrowRecoverId(Integer value) {
		this.borrowRecoverId = value;
	}
	
	public Integer getBorrowRepayId() {
		return this.borrowRepayId;
	}
	
	public void setBorrowRepayId(Integer value) {
		this.borrowRepayId = value;
	}
	
	public java.util.Date getRecoverTimeBegin() {
		return this.recoverTimeBegin;
	}
	
	public void setRecoverTimeBegin(java.util.Date value) {
		this.recoverTimeBegin = value;
	}	
	
	public java.util.Date getRecoverTimeEnd() {
		return this.recoverTimeEnd;
	}
	
	public void setRecoverTimeEnd(java.util.Date value) {
		this.recoverTimeEnd = value;
	}
	
	public String getRecoverTimeYes() {
		return this.recoverTimeYes;
	}
	
	public void setRecoverTimeYes(String value) {
		this.recoverTimeYes = value;
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

