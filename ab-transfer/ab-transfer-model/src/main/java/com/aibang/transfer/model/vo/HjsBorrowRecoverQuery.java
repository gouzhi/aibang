package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;
import java.math.BigDecimal;


public class HjsBorrowRecoverQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -5818660402468255740L;
	/** ID */
	private Integer id;
	/** 状态 configid=15 */
	private Integer status;
	/** 收款人ID */
	private Integer userId;
	/** 投标ID */
	private Integer tenderId;
	/** 借款产品ID（冗余） */
	private Integer borrowId;
	/** 收款时间 */
	private java.util.Date recoverTimeBegin;
	private java.util.Date recoverTimeEnd;
	/** 收款期/第几期 */
	private Integer recoverPeriod;
	/** 应收金额 */
	private BigDecimal recoverAccount;
	/** 应收利息 */
	private BigDecimal recoverInterest;
	/** 应收本金 */
	private BigDecimal recoverCapital;
	/** 实际收款时间 */
	private java.util.Date recoverYestimeBegin;
	private java.util.Date recoverYestimeEnd;
	/** 已收总额 */
	private BigDecimal recoverAccountYes;
	/** 已收利息 */
	private BigDecimal recoverInterestYes;
	/** 已收本金 */
	private BigDecimal recoverCapitalYes;
	/** 逾期天数 */
	private Integer lateDays;
	/** 逾期罚利息 */
	private BigDecimal lateInterest;
	/** 逾期罚金应收总额 */
	private BigDecimal lateForfeit;
	/** 逾期罚金实际收入总额 */
	private BigDecimal lateForfeitAct;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	/** 审核状态*/
	 private Integer verifyStatus;
	/**
     * 管理费 
     */	
	private BigDecimal uFee;
	
	public Integer getVerifyStatus() {
		return verifyStatus;
	}

	public void setVerifyStatus(Integer verifyStatus) {
		this.verifyStatus = verifyStatus;
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
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
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
	
	public Integer getRecoverPeriod() {
		return this.recoverPeriod;
	}
	
	public void setRecoverPeriod(Integer value) {
		this.recoverPeriod = value;
	}
	
	public BigDecimal getRecoverAccount() {
		return this.recoverAccount;
	}
	
	public void setRecoverAccount(BigDecimal value) {
		this.recoverAccount = value;
	}
	
	public BigDecimal getRecoverInterest() {
		return this.recoverInterest;
	}
	
	public void setRecoverInterest(BigDecimal value) {
		this.recoverInterest = value;
	}
	
	public BigDecimal getRecoverCapital() {
		return this.recoverCapital;
	}
	
	public void setRecoverCapital(BigDecimal value) {
		this.recoverCapital = value;
	}
	
	public java.util.Date getRecoverYestimeBegin() {
		return this.recoverYestimeBegin;
	}
	
	public void setRecoverYestimeBegin(java.util.Date value) {
		this.recoverYestimeBegin = value;
	}	
	
	public java.util.Date getRecoverYestimeEnd() {
		return this.recoverYestimeEnd;
	}
	
	public void setRecoverYestimeEnd(java.util.Date value) {
		this.recoverYestimeEnd = value;
	}
	
	public BigDecimal getRecoverAccountYes() {
		return this.recoverAccountYes;
	}
	
	public void setRecoverAccountYes(BigDecimal value) {
		this.recoverAccountYes = value;
	}
	
	public BigDecimal getRecoverInterestYes() {
		return this.recoverInterestYes;
	}
	
	public void setRecoverInterestYes(BigDecimal value) {
		this.recoverInterestYes = value;
	}
	
	public BigDecimal getRecoverCapitalYes() {
		return this.recoverCapitalYes;
	}
	
	public void setRecoverCapitalYes(BigDecimal value) {
		this.recoverCapitalYes = value;
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

	public BigDecimal getuFee() {
		return uFee;
	}

	public void setuFee(BigDecimal uFee) {
		this.uFee = uFee;
	}
}

