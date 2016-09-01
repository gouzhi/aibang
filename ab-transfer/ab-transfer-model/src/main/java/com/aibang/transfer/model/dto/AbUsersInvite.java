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

public class AbUsersInvite extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 2076453304548685030L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersInvite";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_INVITE_TYPE = "类型 CONFIG_ID=42";
	public static final String ALIAS_USER_ID = "被邀请人";
	public static final String ALIAS_INVITE_USER_ID = "上级邀请人";
	public static final String ALIAS_INVITE_CODE = "上级邀请人的邀请码";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 类型 CONFIG_ID=42       db_column: INVITE_TYPE 
     */	
	private Integer inviteType;
    /**
     * 被邀请人       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 上级邀请人       db_column: INVITE_USER_ID 
     */	
	private Integer inviteUserId;
    /**
     * 上级邀请人的邀请码       db_column: INVITE_CODE 
     */	
	private String inviteCode;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	//columns END
	/**
	 * 邀请人账户信息
	 */
	private AbUserBase inviteBase;

	public AbUserBase getInviteBase() {
		return inviteBase;
	}

	public void setInviteBase(AbUserBase inviteBase) {
		this.inviteBase = inviteBase;
	}

	public AbUsersInvite(){
	}

	public AbUsersInvite(
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
	public void setInviteType(Integer value) {
		this.inviteType = value;
	}
	
	public Integer getInviteType() {
		return this.inviteType;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setInviteUserId(Integer value) {
		this.inviteUserId = value;
	}
	
	public Integer getInviteUserId() {
		return this.inviteUserId;
	}
	public void setInviteCode(String value) {
		this.inviteCode = value;
	}
	
	public String getInviteCode() {
		return this.inviteCode;
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
			.append("InviteType",getInviteType())
			.append("UserId",getUserId())
			.append("InviteUserId",getInviteUserId())
			.append("InviteCode",getInviteCode())
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
		if(obj instanceof AbUsersInvite == false) return false;
		if(this == obj) return true;
		AbUsersInvite other = (AbUsersInvite)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

