/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.cifex.transfer.model.dto;
import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsBorrowAudit extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -1898236394576989131L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowAudit";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_BORROW_ID = "借款产品ID";
	public static final String ALIAS_VERIFY_USERID = "审核人ID";
	public static final String ALIAS_VERIFY_REMARK = "审核备注";
	public static final String ALIAS_VERIFY_STATUS = "审核状态/configid=23/ba";
	public static final String ALIAS_VERIFY_TIME = "审核时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_VERIFY_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 借款产品ID       db_column: BORROW_ID 
     */	
	private Integer borrowId;
    /**
     * 审核人ID       db_column: VERIFY_USERID 
     */	
	private Integer verifyUserid;
    /**
     * 审核备注       db_column: VERIFY_REMARK 
     */	
	private String verifyRemark;
    /**
     * 审核状态/configid=23/ba       db_column: VERIFY_STATUS 
     */	
	private Integer verifyStatus;
    /**
     * 审核时间       db_column: VERIFY_TIME 
     */	
	private java.util.Date verifyTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	//columns END

	public HjsBorrowAudit(){
	}

	public HjsBorrowAudit(
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
	public void setBorrowId(Integer value) {
		this.borrowId = value;
	}
	
	public Integer getBorrowId() {
		return this.borrowId;
	}
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
	}
	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
	}
	
	public String getVerifyRemark() {
		return this.verifyRemark;
	}
	public void setVerifyStatus(Integer value) {
		this.verifyStatus = value;
	}
	
	public Integer getVerifyStatus() {
		return this.verifyStatus;
	}
	public String getVerifyTimeString() {
		return DateConvertUtils.format(getVerifyTime(), FORMAT_VERIFY_TIME);
	}
	public void setVerifyTimeString(String value) {
		setVerifyTime(DateConvertUtils.parse(value, FORMAT_VERIFY_TIME,java.util.Date.class));
	}
	
	public void setVerifyTime(java.util.Date value) {
		this.verifyTime = value;
	}
	
	public java.util.Date getVerifyTime() {
		return this.verifyTime;
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
			.append("BorrowId",getBorrowId())
			.append("VerifyUserid",getVerifyUserid())
			.append("VerifyRemark",getVerifyRemark())
			.append("VerifyStatus",getVerifyStatus())
			.append("VerifyTime",getVerifyTime())
			.append("CreateIp",getCreateIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsBorrowAudit == false) return false;
		if(this == obj) return true;
		HjsBorrowAudit other = (HjsBorrowAudit)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

