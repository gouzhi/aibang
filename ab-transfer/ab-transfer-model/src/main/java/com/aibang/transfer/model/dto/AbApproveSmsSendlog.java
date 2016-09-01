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

public class AbApproveSmsSendlog extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -5969144166622519242L;
	//alias
	public static final String TABLE_ALIAS = "HjsApproveSmsSendlog";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_TYPE_ID = "类型/configid=20";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_PHONE = "手机号码";
	public static final String ALIAS_CONTENTS = "内容";
	public static final String ALIAS_STATUS = "发送状态1发送/0未发送";
	public static final String ALIAS_SEND_RETURN = "发送返回值";
	public static final String ALIAS_SEND_TIME = "发送时间";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_SEND_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 类型/configid=20       db_column: TYPE_ID 
     */	
	private Integer typeId;
    /**
     * 用户ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 手机号码       db_column: PHONE 
     */	
	private String phone;
    /**
     * 内容       db_column: CONTENTS 
     */	
	private String contents;
    /**
     * 发送状态1发送/0未发送       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 发送返回值       db_column: SEND_RETURN 
     */	
	private String sendReturn;
    /**
     * 发送时间       db_column: SEND_TIME 
     */	
	private java.util.Date sendTime;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	//columns END

	public AbApproveSmsSendlog(){
	}

	public AbApproveSmsSendlog(
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
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setPhone(String value) {
		this.phone = value;
	}
	
	public String getPhone() {
		return this.phone;
	}
	public void setContents(String value) {
		this.contents = value;
	}
	
	public String getContents() {
		return this.contents;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setSendReturn(String value) {
		this.sendReturn = value;
	}
	
	public String getSendReturn() {
		return this.sendReturn;
	}
	public String getSendTimeString() {
		return DateConvertUtils.format(getSendTime(), FORMAT_SEND_TIME);
	}
	public void setSendTimeString(String value) {
		setSendTime(DateConvertUtils.parse(value, FORMAT_SEND_TIME,java.util.Date.class));
	}
	
	public void setSendTime(java.util.Date value) {
		this.sendTime = value;
	}
	
	public java.util.Date getSendTime() {
		return this.sendTime;
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
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("TypeId",getTypeId())
			.append("UserId",getUserId())
			.append("Phone",getPhone())
			.append("Contents",getContents())
			.append("Status",getStatus())
			.append("SendReturn",getSendReturn())
			.append("SendTime",getSendTime())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof AbApproveSmsSendlog == false) return false;
		if(this == obj) return true;
		AbApproveSmsSendlog other = (AbApproveSmsSendlog)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

