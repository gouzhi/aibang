/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.aibang.transfer.model.dto;
import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.DateConvertUtils;
import com.aibang.transfer.model.BaseEntity;

public class HjsUsersLog extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = 5175045908173511991L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersLog";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "USER_ID";
	public static final String ALIAS_TYPE_ID = "TYPE";
	public static final String ALIAS_RESULT = "OPERATING";
	public static final String ALIAS_CONTENT = "CONTENT";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * USER_ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * TYPE       db_column: TYPE_ID 
     */	
	private Integer typeId;
    /**
     * OPERATING       db_column: RESULT 
     */	
	private Integer result;
    /**
     * CONTENT       db_column: CONTENT 
     */	
	private String content;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsUsersLog(){
	}

	public HjsUsersLog(
		Integer id
	){
		this.id = id;
	}

	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	public void setResult(Integer value) {
		this.result = value;
	}
	
	public Integer getResult() {
		return this.result;
	}
	public void setContent(String value) {
		this.content = value;
	}
	
	public String getContent() {
		return this.content;
	}
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
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
			.append("UserId",getUserId())
			.append("TypeId",getTypeId())
			.append("Result",getResult())
			.append("Content",getContent())
			.append("CreateIp",getCreateIp())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsUsersLog == false) return false;
		if(this == obj) return true;
		HjsUsersLog other = (HjsUsersLog)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

