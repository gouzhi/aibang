package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsActDrawAwardQuery extends BaseQuery implements Serializable {
    

	/** ID */
	private java.lang.Integer id;
	/** 活动表ID */
	private java.lang.Integer actId;
	/** 奖项名称 */
	private java.lang.String awardName;
	/** 奖品类型/1：红包  2：实物 */
	private java.lang.Integer awardType;
	/** 红包信息表ID ，  红包表ID */
	private java.lang.Integer bonusId;
	/** 奖品信息表ID ，实物表ID */
	private java.lang.Integer goodsId;
	/** 奖项排序 */
	private java.lang.Integer orderNo;
	/** 奖项数量 */
	private java.lang.Integer awardNum;
	/** 奖项为红包时，该红包面值(冗余)/实物时，该商品单价（一期只做红包） */
	private java.math.BigDecimal awardValue;
	/** 奖项为红包时，该奖项总额（计算列）数量* 面值/实物时单价*数量 */
	private java.math.BigDecimal awardSum;
	/** 已领取数量：初始为0 */
	private java.lang.Integer usedNum;
	/** 奖项为红包时，该奖项已领取金额（计算列）已领取数量* 面值/实物时已领取数量*单价 */
	private java.math.BigDecimal usedSum;
	/** 未领取/剩余数量： 初始时等于奖项数量 */
	private java.lang.Integer lastNum;
	/** 奖项为红包时，该奖项未领取金额（计算列）未领取数量* 面值3 */
	private java.math.BigDecimal lastSum;
	/** 中奖范围最小值(0 和基数之间) */
	private java.lang.Integer minValue;
	/** 中奖范围最大值(0 和基数之间) */
	private java.lang.Integer maxValue;
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
	
	public java.lang.String getAwardName() {
		return this.awardName;
	}
	
	public void setAwardName(java.lang.String value) {
		this.awardName = value;
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
	
	public java.lang.Integer getGoodsId() {
		return this.goodsId;
	}
	
	public void setGoodsId(java.lang.Integer value) {
		this.goodsId = value;
	}
	
	public java.lang.Integer getOrderNo() {
		return this.orderNo;
	}
	
	public void setOrderNo(java.lang.Integer value) {
		this.orderNo = value;
	}
	
	public java.lang.Integer getAwardNum() {
		return this.awardNum;
	}
	
	public void setAwardNum(java.lang.Integer value) {
		this.awardNum = value;
	}
	
	public java.math.BigDecimal getAwardValue() {
		return this.awardValue;
	}
	
	public void setAwardValue(java.math.BigDecimal value) {
		this.awardValue = value;
	}
	
	public java.math.BigDecimal getAwardSum() {
		return this.awardSum;
	}
	
	public void setAwardSum(java.math.BigDecimal value) {
		this.awardSum = value;
	}
	
	public java.lang.Integer getUsedNum() {
		return this.usedNum;
	}
	
	public void setUsedNum(java.lang.Integer value) {
		this.usedNum = value;
	}
	
	public java.math.BigDecimal getUsedSum() {
		return this.usedSum;
	}
	
	public void setUsedSum(java.math.BigDecimal value) {
		this.usedSum = value;
	}
	
	public java.lang.Integer getLastNum() {
		return this.lastNum;
	}
	
	public void setLastNum(java.lang.Integer value) {
		this.lastNum = value;
	}
	
	public java.math.BigDecimal getLastSum() {
		return this.lastSum;
	}
	
	public void setLastSum(java.math.BigDecimal value) {
		this.lastSum = value;
	}
	
	public java.lang.Integer getMinValue() {
		return this.minValue;
	}
	
	public void setMinValue(java.lang.Integer value) {
		this.minValue = value;
	}
	
	public java.lang.Integer getMaxValue() {
		return this.maxValue;
	}
	
	public void setMaxValue(java.lang.Integer value) {
		this.maxValue = value;
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

