package com.cifex.business.provider.common.Interest;

import java.math.BigDecimal;
import java.util.Date;

public class InterestResult {
	public BigDecimal accountAll;      //本息
	
	public BigDecimal accountInterest; //利息
	
	public BigDecimal accountCapital;  //本金
	
	public BigDecimal accountOther;
	
	
	public BigDecimal repayMonth;  //月还本息
	
	public Date repayTime;         //还款时间

	public BigDecimal getAccountAll() {
		return accountAll;
	}

	public void setAccountAll(BigDecimal accountAll) {
		this.accountAll = accountAll;
	}

	public BigDecimal getAccountInterest() {
		return accountInterest;
	}

	public void setAccountInterest(BigDecimal accountInterest) {
		this.accountInterest = accountInterest;
	}

	public BigDecimal getAccountCapital() {
		return accountCapital;
	}

	public void setAccountCapital(BigDecimal accountCapital) {
		this.accountCapital = accountCapital;
	}

	public BigDecimal getAccountOther() {
		return accountOther;
	}

	public void setAccountOther(BigDecimal accountOther) {
		this.accountOther = accountOther;
	}

	public BigDecimal getRepayMonth() {
		return repayMonth;
	}

	public void setRepayMonth(BigDecimal repayMonth) {
		this.repayMonth = repayMonth;
	}

	public Date getRepayTime() {
		return repayTime;
	}

	public void setRepayTime(Date repayTime) {
		this.repayTime = repayTime;
	}
}
