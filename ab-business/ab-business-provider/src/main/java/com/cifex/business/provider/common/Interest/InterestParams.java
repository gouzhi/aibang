package com.cifex.business.provider.common.Interest;

import java.math.BigDecimal;
import java.util.Date;

public class InterestParams {
	public int type;           //借款计息类型 1 按月计息 2 按日计息
	public Date time;          //计息开始时间
	public BigDecimal account; //金额
	public double period;      //(type =1 月数) 或 (type =2日 一个月30天  一年 30*12=360天)
	public double apr;         //借款年化利率
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public BigDecimal getAccount() {
		return account;
	}
	public void setAccount(BigDecimal account) {
		this.account = account;
	}
	public double getPeriod() {
		return period;
	}
	public void setPeriod(double period) {
		this.period = period;
	}
	public double getApr() {
		return apr;
	}
	public void setApr(double apr) {
		this.apr = apr;
	}
}
