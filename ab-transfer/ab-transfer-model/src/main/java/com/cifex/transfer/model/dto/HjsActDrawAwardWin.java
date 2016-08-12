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

public class HjsActDrawAwardWin extends BaseEntity implements Serializable{
	
	//alias
	public static final String TABLE_ALIAS = "HjsActDrawAwardWin";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_DRAW_USER_ID = "用户参与统计表ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_AWARD_ID = "转盘奖项表ID";
	public static final String ALIAS_AWARD_TYPE = "获奖奖品类型/冗余1：红包  2：实物";
	public static final String ALIAS_BONUS_ID = "红包信息表ID ，  红包表ID";
	public static final String ALIAS_BONUS_NAME = "红包信息表ID ，  红包名称";
	public static final String ALIAS_GOODS_ID = "奖品信息表ID ，实物表ID";
	public static final String ALIAS_GOODS_NAME = "奖品信息表ID ，实物表ID2";
	public static final String ALIAS_ACT_ID = "活动表ID（冗余）";
	public static final String ALIAS_USER_MOBILE = "用户手机号（冗余）";
	public static final String ALIAS_CREATE_TIME = "中奖日期";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private java.lang.Integer id;
    /**
     * 用户参与统计表ID       db_column: DRAW_USER_ID 
     */	
	private java.lang.Integer drawUserId;
    /**
     * 用户ID       db_column: USER_ID 
     */	
	private java.lang.Integer userId;
    /**
     * 转盘奖项表ID       db_column: AWARD_ID 
     */	
	private java.lang.Integer awardId;
    /**
     * 获奖奖品类型/冗余1：红包  2：实物       db_column: AWARD_TYPE 
     */	
	private java.lang.Integer awardType;
    /**
     * 红包信息表ID ，  红包表ID       db_column: BONUS_ID 
     */	
	private java.lang.Integer bonusId;
    /**
     * 红包信息表ID ，  红包名称       db_column: BONUS_NAME 
     */	
	private java.lang.String bonusName;
    /**
     * 奖品信息表ID ，实物表ID       db_column: GOODS_ID 
     */	
	private java.lang.Integer goodsId;
    /**
     * 奖品信息表ID ，实物表ID2       db_column: GOODS_NAME 
     */	
	private java.lang.String goodsName;
    /**
     * 活动表ID（冗余）       db_column: ACT_ID 
     */	
	private java.lang.Integer actId;
    /**
     * 用户手机号（冗余）       db_column: USER_MOBILE 
     */	
	private java.lang.String userMobile;
    /**
     * 中奖日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsActDrawAwardWin(){
	}

	public HjsActDrawAwardWin(
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
	public void setDrawUserId(java.lang.Integer value) {
		this.drawUserId = value;
	}
	
	public java.lang.Integer getDrawUserId() {
		return this.drawUserId;
	}
	public void setUserId(java.lang.Integer value) {
		this.userId = value;
	}
	
	public java.lang.Integer getUserId() {
		return this.userId;
	}
	public void setAwardId(java.lang.Integer value) {
		this.awardId = value;
	}
	
	public java.lang.Integer getAwardId() {
		return this.awardId;
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
	public void setBonusName(java.lang.String value) {
		this.bonusName = value;
	}
	
	public java.lang.String getBonusName() {
		return this.bonusName;
	}
	public void setGoodsId(java.lang.Integer value) {
		this.goodsId = value;
	}
	
	public java.lang.Integer getGoodsId() {
		return this.goodsId;
	}
	public void setGoodsName(java.lang.String value) {
		this.goodsName = value;
	}
	
	public java.lang.String getGoodsName() {
		return this.goodsName;
	}
	public void setActId(java.lang.Integer value) {
		this.actId = value;
	}
	
	public java.lang.Integer getActId() {
		return this.actId;
	}
	public void setUserMobile(java.lang.String value) {
		this.userMobile = value;
	}
	
	public java.lang.String getUserMobile() {
		return this.userMobile;
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
			.append("DrawUserId",getDrawUserId())
			.append("UserId",getUserId())
			.append("AwardId",getAwardId())
			.append("AwardType",getAwardType())
			.append("BonusId",getBonusId())
			.append("BonusName",getBonusName())
			.append("GoodsId",getGoodsId())
			.append("GoodsName",getGoodsName())
			.append("ActId",getActId())
			.append("UserMobile",getUserMobile())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActDrawAwardWin == false) return false;
		if(this == obj) return true;
		HjsActDrawAwardWin other = (HjsActDrawAwardWin)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

