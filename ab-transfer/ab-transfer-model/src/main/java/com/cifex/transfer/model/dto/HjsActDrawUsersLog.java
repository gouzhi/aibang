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

public class HjsActDrawUsersLog extends BaseEntity implements Serializable{
	
	//alias
	public static final String TABLE_ALIAS = "HjsActDrawUsersLog";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_ACT_ID = "活动表ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_USER_VALUE = "用户取值";
	public static final String ALIAS_IS_WIN = "是否中奖 ：  1中  0未中";
	public static final String ALIAS_CREATE_TIME = "投注日期";
	
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
     * 用户ID       db_column: USER_ID 
     */	
	private java.lang.Integer userId;
    /**
     * 用户取值       db_column: USER_VALUE 
     */	
	private java.lang.Integer userValue;
    /**
     * 是否中奖 ：  1中  0未中       db_column: IS_WIN 
     */	
	private java.lang.Integer isWin;
    /**
     * 投注日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsActDrawUsersLog(){
	}

	public HjsActDrawUsersLog(
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
	public void setUserValue(java.lang.Integer value) {
		this.userValue = value;
	}
	
	public java.lang.Integer getUserValue() {
		return this.userValue;
	}
	public void setIsWin(java.lang.Integer value) {
		this.isWin = value;
	}
	
	public java.lang.Integer getIsWin() {
		return this.isWin;
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
			.append("UserId",getUserId())
			.append("UserValue",getUserValue())
			.append("IsWin",getIsWin())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActDrawUsersLog == false) return false;
		if(this == obj) return true;
		HjsActDrawUsersLog other = (HjsActDrawUsersLog)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

