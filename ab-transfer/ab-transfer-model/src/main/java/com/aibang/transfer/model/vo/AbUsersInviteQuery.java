package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class AbUsersInviteQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -3874932710590932978L;
	/** ID */
	private Integer id;
	/** 类型 CONFIG_ID=42 */
	private Integer inviteType;
	/** 被邀请人 */
	private Integer userId;
	/** 上级邀请人 */
	private Integer inviteUserId;
	/** 上级邀请人的邀请码 */
	private String inviteCode;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getInviteType() {
		return this.inviteType;
	}
	
	public void setInviteType(Integer value) {
		this.inviteType = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getInviteUserId() {
		return this.inviteUserId;
	}
	
	public void setInviteUserId(Integer value) {
		this.inviteUserId = value;
	}
	
	public String getInviteCode() {
		return this.inviteCode;
	}
	
	public void setInviteCode(String value) {
		this.inviteCode = value;
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
	
	public String getCreateIp() {
		return this.createIp;
	}
	
	public void setCreateIp(String value) {
		this.createIp = value;
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

