package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;
import java.math.BigDecimal;


public class HjsBorrowRepayQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -7530289557297533686L;
	/** ID */
	private Integer id;
	/**  状态/configid=14 */
	private Integer status;
	/** 借款产品ID */
	private Integer borrowId;
	/** 借款用户ID/还款人偿还人 */
	private Integer userId;
	/** 还款期/第几期 */
	private Integer repayPeriod;
	/** 还款日期 */
	private java.util.Date repayTimeBegin;
	private java.util.Date repayTimeEnd;
	/** 实际还款日期 */
	private java.util.Date repayYestimeBegin;
	private java.util.Date repayYestimeEnd;
	/** 还款金额 */
	private BigDecimal repayAccount;
	/** 还款利息 */
	private BigDecimal repayInterest;
	/** 还款本金 */
	private BigDecimal repayCapital;
	/** 已还金额 */
	private BigDecimal repayAccountYes;
	/** 已还利息 */
	private BigDecimal repayInterestYes;
	/** 已还本金 */
	private BigDecimal repayCapitalYes;
	/** 逾期还款状态 */
	private Integer lateRepayStatus;
	/** 逾期天数 */
	private Integer lateDays;
	/** 逾期罚息 */
	private BigDecimal lateInterest;
	/** 逾期罚金总额 */
	private BigDecimal lateForfeit;
	/** 逾期罚金实际总额 */
	private BigDecimal lateForfeitAct;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	
	/**
     * 借款单ID——即hjs_borrow_user表ID
     */	
    private Integer hjsBorrowUserId;  
    /**
     * 管理费
     */	
    private BigDecimal uFee;
    /**
     *差额管理费
     */	
    private BigDecimal errorFee;

    /**
     * 还款批次
     */
    private String batchId;
	public Integer getHjsBorrowUserId() {
		return hjsBorrowUserId;
	}

	public void setHjsBorrowUserId(Integer hjsBorrowUserId) {
		this.hjsBorrowUserId = hjsBorrowUserId;
	}

	 

	public BigDecimal getuFee() {
		return uFee;
	}

	public void setuFee(BigDecimal uFee) {
		this.uFee = uFee;
	}

	public BigDecimal getErrorFee() {
		return errorFee;
	}

	public void setErrorFee(BigDecimal errorFee) {
		this.errorFee = errorFee;
	}

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getBorrowId() {
		return this.borrowId;
	}
	
	public void setBorrowId(Integer value) {
		this.borrowId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getRepayPeriod() {
		return this.repayPeriod;
	}
	
	public void setRepayPeriod(Integer value) {
		this.repayPeriod = value;
	}
	
	public java.util.Date getRepayTimeBegin() {
		return this.repayTimeBegin;
	}
	
	public void setRepayTimeBegin(java.util.Date value) {
		this.repayTimeBegin = value;
	}	
	
	public java.util.Date getRepayTimeEnd() {
		return this.repayTimeEnd;
	}
	
	public void setRepayTimeEnd(java.util.Date value) {
		this.repayTimeEnd = value;
	}
	
	public java.util.Date getRepayYestimeBegin() {
		return this.repayYestimeBegin;
	}
	
	public void setRepayYestimeBegin(java.util.Date value) {
		this.repayYestimeBegin = value;
	}	
	
	public java.util.Date getRepayYestimeEnd() {
		return this.repayYestimeEnd;
	}
	
	public void setRepayYestimeEnd(java.util.Date value) {
		this.repayYestimeEnd = value;
	}
	
	public BigDecimal getRepayAccount() {
		return this.repayAccount;
	}
	
	public void setRepayAccount(BigDecimal value) {
		this.repayAccount = value;
	}
	
	public BigDecimal getRepayInterest() {
		return this.repayInterest;
	}
	
	public void setRepayInterest(BigDecimal value) {
		this.repayInterest = value;
	}
	
	public BigDecimal getRepayCapital() {
		return this.repayCapital;
	}
	
	public void setRepayCapital(BigDecimal value) {
		this.repayCapital = value;
	}
	
	public BigDecimal getRepayAccountYes() {
		return this.repayAccountYes;
	}
	
	public void setRepayAccountYes(BigDecimal value) {
		this.repayAccountYes = value;
	}
	
	public BigDecimal getRepayInterestYes() {
		return this.repayInterestYes;
	}
	
	public void setRepayInterestYes(BigDecimal value) {
		this.repayInterestYes = value;
	}
	
	public BigDecimal getRepayCapitalYes() {
		return this.repayCapitalYes;
	}
	
	public void setRepayCapitalYes(BigDecimal value) {
		this.repayCapitalYes = value;
	}
	
	public Integer getLateRepayStatus() {
		return this.lateRepayStatus;
	}
	
	public void setLateRepayStatus(Integer value) {
		this.lateRepayStatus = value;
	}
	
	public Integer getLateDays() {
		return this.lateDays;
	}
	
	public void setLateDays(Integer value) {
		this.lateDays = value;
	}
	
	public BigDecimal getLateInterest() {
		return this.lateInterest;
	}
	
	public void setLateInterest(BigDecimal value) {
		this.lateInterest = value;
	}
	
	public BigDecimal getLateForfeit() {
		return this.lateForfeit;
	}
	
	public void setLateForfeit(BigDecimal value) {
		this.lateForfeit = value;
	}
	
	public BigDecimal getLateForfeitAct() {
		return this.lateForfeitAct;
	}
	
	public void setLateForfeitAct(BigDecimal value) {
		this.lateForfeitAct = value;
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

	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}
}

