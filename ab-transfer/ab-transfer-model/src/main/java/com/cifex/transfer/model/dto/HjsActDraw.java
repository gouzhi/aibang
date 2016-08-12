/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2016
 */


package com.cifex.transfer.model.dto;


import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity;

public class HjsActDraw extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = 145255188104915549L;
	//alias
	public static final String TABLE_ALIAS = "HjsActDraw";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_ACT_ID = "活动基表ID";
	public static final String ALIAS_BASE_NUM = "抽奖基数";
	public static final String ALIAS_LIMIT_TYPE = "限制类型   每人总次数:1 每人每天次数2。  和每人总次数二选一使用";
	public static final String ALIAS_PERSON_LIMIT = "每人总次数:1   和每人总次数二选一使用";
	public static final String ALIAS_DAY_LIMIT = "每人每天次数2。 和每人总次数二选一使用";
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
     * 活动基表ID       db_column: ACT_ID 
     */	
	private java.lang.Integer actId;
    /**
     * 抽奖基数       db_column: BASE_NUM 
     */	
	private java.lang.Integer baseNum;
    /**
     * 限制类型   每人总次数:1 每人每天次数2。  和每人总次数二选一使用       db_column: LIMIT_TYPE 
     */	
	private java.lang.Integer limitType;
    /**
     * 每人总次数:1   和每人总次数二选一使用       db_column: PERSON_LIMIT 
     */	
	private java.lang.Integer personLimit;
    /**
     * 每人每天次数2。 和每人总次数二选一使用       db_column: DAY_LIMIT 
     */	
	private java.lang.Integer dayLimit;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private java.lang.Integer optId;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsActDraw(){
	}

	public HjsActDraw(
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
	public void setBaseNum(java.lang.Integer value) {
		this.baseNum = value;
	}
	
	public java.lang.Integer getBaseNum() {
		return this.baseNum;
	}
	public void setLimitType(java.lang.Integer value) {
		this.limitType = value;
	}
	
	public java.lang.Integer getLimitType() {
		return this.limitType;
	}
	public void setPersonLimit(java.lang.Integer value) {
		this.personLimit = value;
	}
	
	public java.lang.Integer getPersonLimit() {
		return this.personLimit;
	}
	public void setDayLimit(java.lang.Integer value) {
		this.dayLimit = value;
	}
	
	public java.lang.Integer getDayLimit() {
		return this.dayLimit;
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
			.append("BaseNum",getBaseNum())
			.append("LimitType",getLimitType())
			.append("PersonLimit",getPersonLimit())
			.append("DayLimit",getDayLimit())
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
		if(obj instanceof HjsActDraw == false) return false;
		if(this == obj) return true;
		HjsActDraw other = (HjsActDraw)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

