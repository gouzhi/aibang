package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsUsersMessageQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID      
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -4937182205054198190L;
	/** id */
	private Integer id;
	/** 消息类型 CONFIG=28 */
	private Integer type;
	/** 状态  CONFIGID=29 */
	private Integer status;
	/** 发送者ID */
	private Integer sendLoginid;
	/** 接受者ID */
	private Integer receiveLoginid;
	/** 消息题目 */
	private String msgTitle;
	/** 消息内容 */
	private String contents;
	/** 父消息ID */
	private Integer parentId;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	private Integer[] statusArray;
	private Integer isread;
	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	
	public void setType(Integer value) {
		this.type = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getSendLoginid() {
		return this.sendLoginid;
	}
	
	public void setSendLoginid(Integer value) {
		this.sendLoginid = value;
	}
	
	public Integer getReceiveLoginid() {
		return this.receiveLoginid;
	}
	
	public void setReceiveLoginid(Integer value) {
		this.receiveLoginid = value;
	}
	
	public String getMsgTitle() {
		return this.msgTitle;
	}
	
	public void setMsgTitle(String value) {
		this.msgTitle = value;
	}
	
	public String getContents() {
		return this.contents;
	}
	
	public void setContents(String value) {
		this.contents = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	
	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(Integer value) {
		this.optId = value;
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

	public Integer[] getStatusArray() {
		return statusArray;
	}

	public void setStatusArray(Integer[] statusArray) {
		this.statusArray = statusArray;
	}

	public Integer getIsread() {
		return isread;
	}

	public void setIsread(Integer isread) {
		this.isread = isread;
	}
}

