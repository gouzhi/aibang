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

public class AbUsersMessage extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID      
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -586576927616863922L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersMessage";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_TYPE = "消息类型 CONFIG=28";
	public static final String ALIAS_STATUS = "状态  CONFIGID=29";
	public static final String ALIAS_SEND_LoginID = "发送者ID";
	public static final String ALIAS_RECEIVE_LoginID = "接受者ID";
	public static final String ALIAS_MSG_TITLE = "消息题目";
	public static final String ALIAS_CONTENTS = "消息内容";
	public static final String ALIAS_PARENT_ID = "父消息ID";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */	
	private Integer id;
    /**
     * 消息类型 CONFIG=28       db_column: TYPE 
     */	
	private Integer type;
    /**
     * 状态  CONFIGID=29       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 发送者ID       db_column: SEND_LoginID 
     */	
	private Integer sendLoginid;
    /**
     * 接受者ID       db_column: RECEIVE_LoginID 
     */	
	private Integer receiveLoginid;
    /**
     * 消息题目       db_column: MSG_TITLE 
     */	
	private String msgTitle;
    /**
     * 消息内容       db_column: CONTENTS 
     */	
	private String contents;
    /**
     * 父消息ID       db_column: PARENT_ID 
     */	
	private Integer parentId;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public AbUsersMessage(){
	}

	public AbUsersMessage(
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
	public void setType(Integer value) {
		this.type = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setSendLoginid(Integer value) {
		this.sendLoginid = value;
	}
	
	public Integer getSendLoginid() {
		return this.sendLoginid;
	}
	public void setReceiveLoginid(Integer value) {
		this.receiveLoginid = value;
	}
	
	public Integer getReceiveLoginid() {
		return this.receiveLoginid;
	}
	public void setMsgTitle(String value) {
		this.msgTitle = value;
	}
	
	public String getMsgTitle() {
		return this.msgTitle;
	}
	public void setContents(String value) {
		this.contents = value;
	}
	
	public String getContents() {
		return this.contents;
	}
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
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
			.append("Type",getType())
			.append("Status",getStatus())
			.append("SendLoginid",getSendLoginid())
			.append("ReceiveLoginid",getReceiveLoginid())
			.append("MsgTitle",getMsgTitle())
			.append("Contents",getContents())
			.append("ParentId",getParentId())
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
		if(obj instanceof AbUsersMessage == false) return false;
		if(this == obj) return true;
		AbUsersMessage other = (AbUsersMessage)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

