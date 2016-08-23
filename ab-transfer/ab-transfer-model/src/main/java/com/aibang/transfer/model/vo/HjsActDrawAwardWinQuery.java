package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActDrawAwardWinQuery extends BaseQuery implements Serializable {
    

	/** ID */
	private java.lang.Integer id;
	/** 用户参与统计表ID */
	private java.lang.Integer drawUserId;
	/** 用户ID */
	private java.lang.Integer userId;
	/** 转盘奖项表ID */
	private java.lang.Integer awardId;
	/** 获奖奖品类型/冗余1：红包  2：实物 */
	private java.lang.Integer awardType;
	/** 红包信息表ID ，  红包表ID */
	private java.lang.Integer bonusId;
	/** 红包信息表ID ，  红包名称 */
	private java.lang.String bonusName;
	/** 奖品信息表ID ，实物表ID */
	private java.lang.Integer goodsId;
	/** 奖品信息表ID ，实物表ID2 */
	private java.lang.String goodsName;
	/** 活动表ID（冗余） */
	private java.lang.Integer actId;
	/** 用户手机号（冗余） */
	private java.lang.String userMobile;
	/** 中奖日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

	public java.lang.Integer getId() {
		return this.id;
	}
	
	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getDrawUserId() {
		return this.drawUserId;
	}
	
	public void setDrawUserId(java.lang.Integer value) {
		this.drawUserId = value;
	}
	
	public java.lang.Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(java.lang.Integer value) {
		this.userId = value;
	}
	
	public java.lang.Integer getAwardId() {
		return this.awardId;
	}
	
	public void setAwardId(java.lang.Integer value) {
		this.awardId = value;
	}
	
	public java.lang.Integer getAwardType() {
		return this.awardType;
	}
	
	public void setAwardType(java.lang.Integer value) {
		this.awardType = value;
	}
	
	public java.lang.Integer getBonusId() {
		return this.bonusId;
	}
	
	public void setBonusId(java.lang.Integer value) {
		this.bonusId = value;
	}
	
	public java.lang.String getBonusName() {
		return this.bonusName;
	}
	
	public void setBonusName(java.lang.String value) {
		this.bonusName = value;
	}
	
	public java.lang.Integer getGoodsId() {
		return this.goodsId;
	}
	
	public void setGoodsId(java.lang.Integer value) {
		this.goodsId = value;
	}
	
	public java.lang.String getGoodsName() {
		return this.goodsName;
	}
	
	public void setGoodsName(java.lang.String value) {
		this.goodsName = value;
	}
	
	public java.lang.Integer getActId() {
		return this.actId;
	}
	
	public void setActId(java.lang.Integer value) {
		this.actId = value;
	}
	
	public java.lang.String getUserMobile() {
		return this.userMobile;
	}
	
	public void setUserMobile(java.lang.String value) {
		this.userMobile = value;
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

