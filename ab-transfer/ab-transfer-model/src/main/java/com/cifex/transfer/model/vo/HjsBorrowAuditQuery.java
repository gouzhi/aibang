package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.page.BaseQuery;
import java.io.Serializable;


public class HjsBorrowAuditQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 6760655764140094293L;
	/** ID */
	private Integer id;
	/** 借款产品ID */
	private Integer borrowId;
	/** 审核人ID */
	private Integer verifyUserid;
	/** 审核备注 */
	private String verifyRemark;
	/** 审核状态/configid=23/ba */
	private Integer verifyStatus;
	/** 审核时间 */
	private java.util.Date verifyTimeBegin;
	private java.util.Date verifyTimeEnd;
	/** 创建时IP */
	private String createIp;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getBorrowId() {
		return this.borrowId;
	}
	
	public void setBorrowId(Integer value) {
		this.borrowId = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
	}
	
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	
	public String getVerifyRemark() {
		return this.verifyRemark;
	}
	
	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
	}
	
	public Integer getVerifyStatus() {
		return this.verifyStatus;
	}
	
	public void setVerifyStatus(Integer value) {
		this.verifyStatus = value;
	}
	
	public java.util.Date getVerifyTimeBegin() {
		return this.verifyTimeBegin;
	}
	
	public void setVerifyTimeBegin(java.util.Date value) {
		this.verifyTimeBegin = value;
	}	
	
	public java.util.Date getVerifyTimeEnd() {
		return this.verifyTimeEnd;
	}
	
	public void setVerifyTimeEnd(java.util.Date value) {
		this.verifyTimeEnd = value;
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

