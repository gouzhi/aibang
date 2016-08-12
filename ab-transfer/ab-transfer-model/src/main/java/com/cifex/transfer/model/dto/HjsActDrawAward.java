/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2016
 */


package com.cifex.transfer.model.dto;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsActDrawAward extends BaseEntity implements Serializable{
	
	//alias
	public static final String TABLE_ALIAS = "HjsActDrawAward";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_ACT_ID = "活动表ID";
	public static final String ALIAS_AWARD_NAME = "奖项名称";
	public static final String ALIAS_AWARD_TYPE = "奖品类型/1：红包  2：实物";
	public static final String ALIAS_BONUS_ID = "红包信息表ID ，  红包表ID";
	public static final String ALIAS_GOODS_ID = "奖品信息表ID ，实物表ID";
	public static final String ALIAS_ORDER_NO = "奖项排序";
	public static final String ALIAS_AWARD_NUM = "奖项数量";
	public static final String ALIAS_AWARD_VALUE = "奖项为红包时，该红包面值(冗余)/实物时，该商品单价（一期只做红包）";
	public static final String ALIAS_AWARD_SUM = "奖项为红包时，该奖项总额（计算列）数量* 面值/实物时单价*数量";
	public static final String ALIAS_USED_NUM = "已领取数量：初始为0";
	public static final String ALIAS_USED_SUM = "奖项为红包时，该奖项已领取金额（计算列）已领取数量* 面值/实物时已领取数量*单价";
	public static final String ALIAS_LAST_NUM = "未领取/剩余数量： 初始时等于奖项数量";
	public static final String ALIAS_LAST_SUM = "奖项为红包时，该奖项未领取金额（计算列）未领取数量* 面值3";
	public static final String ALIAS_MIN_VALUE = "中奖范围最小值(0 和基数之间)";
	public static final String ALIAS_MAX_VALUE = "中奖范围最大值(0 和基数之间)";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private java.lang.Integer id;
    /**
     * 活动表ID       db_column: ACT_ID 
     */	
	private java.lang.Integer actId;
    /**
     * 奖项名称       db_column: AWARD_NAME 
     */	
	private java.lang.String awardName;
    /**
     * 奖品类型/1：红包  2：实物       db_column: AWARD_TYPE 
     */	
	private java.lang.Integer awardType;
    /**
     * 红包信息表ID ，  红包表ID       db_column: BONUS_ID 
     */	
	private java.lang.Integer bonusId;
    /**
     * 奖品信息表ID ，实物表ID       db_column: GOODS_ID 
     */	
	private java.lang.Integer goodsId;
    /**
     * 奖项排序       db_column: ORDER_NO 
     */	
	private java.lang.Integer orderNo;
    /**
     * 奖项数量       db_column: AWARD_NUM 
     */	
	private java.lang.Integer awardNum;
    /**
     * 奖项为红包时，该红包面值(冗余)/实物时，该商品单价（一期只做红包）       db_column: AWARD_VALUE 
     */	
	private java.math.BigDecimal awardValue;
    /**
     * 奖项为红包时，该奖项总额（计算列）数量* 面值/实物时单价*数量       db_column: AWARD_SUM 
     */	
	private java.math.BigDecimal awardSum;
    /**
     * 已领取数量：初始为0       db_column: USED_NUM 
     */	
	private java.lang.Integer usedNum;
    /**
     * 奖项为红包时，该奖项已领取金额（计算列）已领取数量* 面值/实物时已领取数量*单价       db_column: USED_SUM 
     */	
	private java.math.BigDecimal usedSum;
    /**
     * 未领取/剩余数量： 初始时等于奖项数量       db_column: LAST_NUM 
     */	
	private java.lang.Integer lastNum;
    /**
     * 奖项为红包时，该奖项未领取金额（计算列）未领取数量* 面值3       db_column: LAST_SUM 
     */	
	private java.math.BigDecimal lastSum;
    /**
     * 中奖范围最小值(0 和基数之间)       db_column: MIN_VALUE 
     */	
	private java.lang.Integer minValue;
    /**
     * 中奖范围最大值(0 和基数之间)       db_column: MAX_VALUE 
     */	
	private java.lang.Integer maxValue;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private java.lang.Integer optId;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsActDrawAward(){
	}

	public HjsActDrawAward(
		java.lang.Integer id
	){
		this.id = id;
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}
	public void setActId(java.lang.Integer value) {
		this.actId = value;
	}
	
	public java.lang.Integer getActId() {
		return this.actId;
	}
	public void setAwardName(java.lang.String value) {
		this.awardName = value;
	}
	
	public java.lang.String getAwardName() {
		return this.awardName;
	}
	public void setAwardType(java.lang.Integer value) {
		this.awardType = value;
	}
	
	public java.lang.Integer getAwardType() {
		return this.awardType;
	}
	public void setBonusId(java.lang.Integer value) {
		this.bonusId = value;
	}
	
	public java.lang.Integer getBonusId() {
		return this.bonusId;
	}
	public void setGoodsId(java.lang.Integer value) {
		this.goodsId = value;
	}
	
	public java.lang.Integer getGoodsId() {
		return this.goodsId;
	}
	public void setOrderNo(java.lang.Integer value) {
		this.orderNo = value;
	}
	
	public java.lang.Integer getOrderNo() {
		return this.orderNo;
	}
	public void setAwardNum(java.lang.Integer value) {
		this.awardNum = value;
	}
	
	public java.lang.Integer getAwardNum() {
		return this.awardNum;
	}
	public void setAwardValue(java.math.BigDecimal value) {
		this.awardValue = value;
	}
	
	public java.math.BigDecimal getAwardValue() {
		return this.awardValue;
	}
	public void setAwardSum(java.math.BigDecimal value) {
		this.awardSum = value;
	}
	
	public java.math.BigDecimal getAwardSum() {
		return this.awardSum;
	}
	public void setUsedNum(java.lang.Integer value) {
		this.usedNum = value;
	}
	
	public java.lang.Integer getUsedNum() {
		return this.usedNum;
	}
	public void setUsedSum(java.math.BigDecimal value) {
		this.usedSum = value;
	}
	
	public java.math.BigDecimal getUsedSum() {
		return this.usedSum;
	}
	public void setLastNum(java.lang.Integer value) {
		this.lastNum = value;
	}
	
	public java.lang.Integer getLastNum() {
		return this.lastNum;
	}
	public void setLastSum(java.math.BigDecimal value) {
		this.lastSum = value;
	}
	
	public java.math.BigDecimal getLastSum() {
		return this.lastSum;
	}
	public void setMinValue(java.lang.Integer value) {
		this.minValue = value;
	}
	
	public java.lang.Integer getMinValue() {
		return this.minValue;
	}
	public void setMaxValue(java.lang.Integer value) {
		this.maxValue = value;
	}
	
	public java.lang.Integer getMaxValue() {
		return this.maxValue;
	}
	public void setOptId(java.lang.Integer value) {
		this.optId = value;
	}
	
	public java.lang.Integer getOptId() {
		return this.optId;
	}
	public String getCreateTimeString() {
		return DateConvertUtils.format(getCreateTime(), FORMAT_CREATE_TIME);
	}
	public void setCreateTimeString(String value) {
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,java.util.Date.class));
	}
	
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("ActId",getActId())
			.append("AwardName",getAwardName())
			.append("AwardType",getAwardType())
			.append("BonusId",getBonusId())
			.append("GoodsId",getGoodsId())
			.append("OrderNo",getOrderNo())
			.append("AwardNum",getAwardNum())
			.append("AwardValue",getAwardValue())
			.append("AwardSum",getAwardSum())
			.append("UsedNum",getUsedNum())
			.append("UsedSum",getUsedSum())
			.append("LastNum",getLastNum())
			.append("LastSum",getLastSum())
			.append("MinValue",getMinValue())
			.append("MaxValue",getMaxValue())
			.append("OptId",getOptId())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActDrawAward == false) return false;
		if(this == obj) return true;
		HjsActDrawAward other = (HjsActDrawAward)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

