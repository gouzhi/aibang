package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActDrawUsersQuery extends BaseQuery implements Serializable {
    

	/** ID */
	private java.lang.Integer id;
	/** 活动表ID */
	private java.lang.Integer actId;
	/** 用户ID */
	private java.lang.Integer userId;
	/** 该用户参与该活动总次数 */
	private java.lang.Integer joinSum;
	/** 限制类型   每人总次数:1// 每人每天次数：2。  和每人总次数二选一使用 */
	private java.lang.Integer limitType;
	/** 每人总次数:1   和每人总次数二选一使用 */
	private java.lang.Integer personLimit;
	/** 每人每天次数2。 和每人总次数二选一使用 */
	private java.lang.Integer dayLimit;
	/** 日期：总次数约束： 每人每活动一条// 每人每天约束：每人每天一条记录 */
	private java.util.Date joinTimeBegin;
	private java.util.Date joinTimeEnd;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getActId() {
		return this.actId;
	}
	
	public void setActId(java.lang.Integer value) {
		this.actId = value;
	}
	
	public java.lang.Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(java.lang.Integer value) {
		this.userId = value;
	}
	
	public java.lang.Integer getJoinSum() {
		return this.joinSum;
	}
	
	public void setJoinSum(java.lang.Integer value) {
		this.joinSum = value;
	}
	
	public java.lang.Integer getLimitType() {
		return this.limitType;
	}
	
	public void setLimitType(java.lang.Integer value) {
		this.limitType = value;
	}
	
	public java.lang.Integer getPersonLimit() {
		return this.personLimit;
	}
	
	public void setPersonLimit(java.lang.Integer value) {
		this.personLimit = value;
	}
	
	public java.lang.Integer getDayLimit() {
		return this.dayLimit;
	}
	
	public void setDayLimit(java.lang.Integer value) {
		this.dayLimit = value;
	}
	
	public java.util.Date getJoinTimeBegin() {
		return this.joinTimeBegin;
	}
	
	public void setJoinTimeBegin(java.util.Date value) {
		this.joinTimeBegin = value;
	}	
	
	public java.util.Date getJoinTimeEnd() {
		return this.joinTimeEnd;
	}
	
	public void setJoinTimeEnd(java.util.Date value) {
		this.joinTimeEnd = value;
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

