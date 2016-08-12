package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.page.BaseQuery;
import java.io.Serializable;


public class HjsApproveSmsQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 6434761312333906857L;
	/** ID */
	private Integer id;
	/** 用户ID */
	private Integer userId;
	/** 认证状态 0未审核1审核成功-1审核失败 */
	private Integer status;
	/** 类型 */
	private Integer type;
	/** 手机号码 */
	private String phone;
	/** 验证码 */
	private Integer credit;
	/** 人工审核人ID */
	private Integer verifyUserid;
	/** 审核备注 */
	private String verifyMemo;
	/** 审核时间 */
	private java.util.Date verifyTime;
	private java.util.Date verifyTimeBegin;
	private java.util.Date verifyTimeEnd;
	/** 审核备注 */
	private String verifyRemark;
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
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	
	public void setType(Integer value) {
		this.type = value;
	}
	
	public String getPhone() {
		return this.phone;
	}
	
	public void setPhone(String value) {
		this.phone = value;
	}
	
	public Integer getCredit() {
		return this.credit;
	}
	
	public void setCredit(Integer value) {
		this.credit = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
	}
	
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	

	public String getVerifyMemo() {
		return verifyMemo;
	}

	public void setVerifyMemo(String verifyMemo) {
		this.verifyMemo = verifyMemo;
	}

	
	public java.util.Date getVerifyTime() {
		return verifyTime;
	}

	public void setVerifyTime(java.util.Date verifyTime) {
		this.verifyTime = verifyTime;
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

	public String getVerifyRemark() {
		return this.verifyRemark;
	}
	
	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
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

