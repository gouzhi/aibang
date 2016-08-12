package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActDrawQuery extends BaseQuery implements Serializable {
    

	/** ID */
	private java.lang.Integer id;
	/** 活动基表ID */
	private java.lang.Integer actId;
	/** 抽奖基数 */
	private java.lang.Integer baseNum;
	/** 限制类型   每人总次数:1 每人每天次数2。  和每人总次数二选一使用 */
	private java.lang.Integer limitType;
	/** 每人总次数:1   和每人总次数二选一使用 */
	private java.lang.Integer personLimit;
	/** 每人每天次数2。 和每人总次数二选一使用 */
	private java.lang.Integer dayLimit;
	/** 操作员ID。界面录入时需填写 */
	private java.lang.Integer optId;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

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
	
	public java.lang.Integer getBaseNum() {
		return this.baseNum;
	}
	
	public void setBaseNum(java.lang.Integer value) {
		this.baseNum = value;
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
	
	public java.lang.Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(java.lang.Integer value) {
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

