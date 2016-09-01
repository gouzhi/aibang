package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class AbApproveEmailActiveQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -3614414404304013297L;
	/** ID */
	private Integer id;
	/** 用户ID */
	private Integer userId;
	/** 邮箱地址 */
	private String email;
	/** 激活状态 0未激活1激活 */
	private Integer status;
	/** 人工审核人ID */
	private Integer verifyUserid;
	/** 审核备注 */
	private String verifyMemo;
	/** 审核时间 */
	private java.util.Date verifyTimeBegin;
	private java.util.Date verifyTimeEnd;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String value) {
		this.email = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
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

	public Integer getVerifyUserid() {
		return verifyUserid;
	}

	public void setVerifyUserid(Integer verifyUserid) {
		this.verifyUserid = verifyUserid;
	}

	public String getVerifyMemo() {
		return verifyMemo;
	}

	public void setVerifyMemo(String verifyMemo) {
		this.verifyMemo = verifyMemo;
	}

	public java.util.Date getVerifyTimeBegin() {
		return verifyTimeBegin;
	}

	public void setVerifyTimeBegin(java.util.Date verifyTimeBegin) {
		this.verifyTimeBegin = verifyTimeBegin;
	}

	public java.util.Date getVerifyTimeEnd() {
		return verifyTimeEnd;
	}

	public void setVerifyTimeEnd(java.util.Date verifyTimeEnd) {
		this.verifyTimeEnd = verifyTimeEnd;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
}

