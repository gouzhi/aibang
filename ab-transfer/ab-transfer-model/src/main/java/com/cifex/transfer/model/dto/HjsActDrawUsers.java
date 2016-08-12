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

public class HjsActDrawUsers extends BaseEntity implements Serializable{
	
	//alias
	public static final String TABLE_ALIAS = "HjsActDrawUsers";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_ACT_ID = "活动表ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_JOIN_SUM = "该用户参与该活动总次数";
	public static final String ALIAS_LIMIT_TYPE = "限制类型   每人总次数:1// 每人每天次数：2。  和每人总次数二选一使用";
	public static final String ALIAS_PERSON_LIMIT = "每人总次数:1   和每人总次数二选一使用";
	public static final String ALIAS_DAY_LIMIT = "每人每天次数2。 和每人总次数二选一使用";
	public static final String ALIAS_JOIN_TIME = "日期：总次数约束： 每人每活动一条// 每人每天约束：每人每天一条记录";
	
	//date formats
	public static final String FORMAT_JOIN_TIME = DATE_FORMAT;
	
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
     * 用户ID       db_column: USER_ID 
     */	
	private java.lang.Integer userId;
    /**
     * 该用户参与该活动总次数       db_column: JOIN_SUM 
     */	
	private java.lang.Integer joinSum;
    /**
     * 限制类型   每人总次数:1// 每人每天次数：2。  和每人总次数二选一使用       db_column: LIMIT_TYPE 
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
     * 日期：总次数约束： 每人每活动一条// 每人每天约束：每人每天一条记录       db_column: JOIN_TIME 
     */	
	private java.util.Date joinTime;
	//columns END

	public HjsActDrawUsers(){
	}

	public HjsActDrawUsers(
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
	public void setUserId(java.lang.Integer value) {
		this.userId = value;
	}
	
	public java.lang.Integer getUserId() {
		return this.userId;
	}
	public void setJoinSum(java.lang.Integer value) {
		this.joinSum = value;
	}
	
	public java.lang.Integer getJoinSum() {
		return this.joinSum;
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
	public String getJoinTimeString() {
		return DateConvertUtils.format(getJoinTime(), FORMAT_JOIN_TIME);
	}
	public void setJoinTimeString(String value) {
		setJoinTime(DateConvertUtils.parse(value, FORMAT_JOIN_TIME,java.util.Date.class));
	}
	
	public void setJoinTime(java.util.Date value) {
		this.joinTime = value;
	}
	
	public java.util.Date getJoinTime() {
		return this.joinTime;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("ActId",getActId())
			.append("UserId",getUserId())
			.append("JoinSum",getJoinSum())
			.append("LimitType",getLimitType())
			.append("PersonLimit",getPersonLimit())
			.append("DayLimit",getDayLimit())
			.append("JoinTime",getJoinTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActDrawUsers == false) return false;
		if(this == obj) return true;
		HjsActDrawUsers other = (HjsActDrawUsers)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

