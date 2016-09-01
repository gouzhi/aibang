package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class AbApproveSmsSendlogQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -3709600170598586576L;
	/** ID */
	private Integer id;
	/** 类型/configid=20 */
	private Integer typeId;
	/** 用户ID */
	private Integer userId;
	/** 手机号码 */
	private String phone;
	/** 内容 */
	private String contents;
	/** 发送状态1发送/0未发送 */
	private Integer status;
	/** 发送返回值 */
	private String sendReturn;
	/** 发送时间 */
	private java.util.Date sendTimeBegin;
	private java.util.Date sendTimeEnd;
	/** 创建时间 */
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
	
	public Integer getTypeId() {
		return this.typeId;
	}
	
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public String getPhone() {
		return this.phone;
	}
	
	public void setPhone(String value) {
		this.phone = value;
	}
	
	public String getContents() {
		return this.contents;
	}
	
	public void setContents(String value) {
		this.contents = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public String getSendReturn() {
		return this.sendReturn;
	}
	
	public void setSendReturn(String value) {
		this.sendReturn = value;
	}
	
	public java.util.Date getSendTimeBegin() {
		return this.sendTimeBegin;
	}
	
	public void setSendTimeBegin(java.util.Date value) {
		this.sendTimeBegin = value;
	}	
	
	public java.util.Date getSendTimeEnd() {
		return this.sendTimeEnd;
	}
	
	public void setSendTimeEnd(java.util.Date value) {
		this.sendTimeEnd = value;
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
}

