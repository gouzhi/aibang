package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsBorrowTenderQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -8757957034991903295L;
	/**   */
	private Integer id;
	/** 借款产品ID */
	private Integer borrowId;
	/** 投资用户ID */
	private Integer userId;
	/** 状态  CONFIGID=13 */
	private Integer status;
	/** 投标金额 */
	private java.math.BigDecimal tenderAccount;
	/** 收益总额 */
	private java.math.BigDecimal recoverAccountAll;
	/** 收益总利息 */
	private java.math.BigDecimal recoverAccountInterest;
	/** 收益总本金 */
	private java.math.BigDecimal recoverAccountCapital;
	/** 已收本息 */
	private java.math.BigDecimal recoverAccountYes;
	/** 已收利息 */
	private java.math.BigDecimal recoverAccountInterestYes;
	/** 已收本金 */
	private java.math.BigDecimal recoverAccountCapitalYes;
	/** 待收本息 */
	private java.math.BigDecimal recoverAccountWait;
	/** 待收利息 */
	private java.math.BigDecimal recoverAccountInterestWait;
	/** 待收本金 */
	private java.math.BigDecimal recoverAccountCapitalWait;
	/** 收益次数 */
	private Integer recoverTimes;
	/** 投标说明 */
	private String contents;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
    private String bname;
    /** 产品审核状态*/
	private Integer[] verifyStatus ;
	/**投标进度*/
	private Integer tenderScale;
	/**
	 * 合同地址 
	 */
	private String contractUrl;
	/** 收款时间  */
	private java.util.Date recoverTimeEnd;
	private java.util.Date recoverTimeBegin;
	/**用户名或产品名称（查询使用）*/
	private String userNameOrBname;

	private Integer tag;//订单状态（查询使用）
	private Integer[] tenderStatus;//订单状态
	
	private Integer optId;//异常处理操作人员ID(解冻汇付操作)  -1系统   0  admin
	private java.util.Date optTime;//异常处理时间;
	/**
	 * 合同生成状态  0未生成 1已生成 2生成失败
	 */
	private Integer contractStatus;
	/**
	 * 投资人签章状态   0未签章 1已签章 2签章失败
	 */
	private Integer tenderSignStatus;
	/**
	 * 借款人签章状态  0未签章 1已签章 2签章失败
	 */
	private Integer borrowSignStatus;
	/**
	 * 平台签章状态   0未签章 1已签章 2签章失败
	 */
	private Integer systemSignStatus;
	/**
	 * 归档状态   0未归档 1已归档 2归档失败
	 */
	private Integer fileStatus;
	/**
	 * 下载URL
	 */
	private String downloadUrl;
	/**
	 * 查看URL
	 */
	private String viewpdfUrl;

	public Integer getContractStatus() {
		return contractStatus;
	}

	public void setContractStatus(Integer contractStatus) {
		this.contractStatus = contractStatus;
	}

	public Integer getTenderSignStatus() {
		return tenderSignStatus;
	}

	public void setTenderSignStatus(Integer tenderSignStatus) {
		this.tenderSignStatus = tenderSignStatus;
	}

	public Integer getBorrowSignStatus() {
		return borrowSignStatus;
	}

	public void setBorrowSignStatus(Integer borrowSignStatus) {
		this.borrowSignStatus = borrowSignStatus;
	}

	public Integer getSystemSignStatus() {
		return systemSignStatus;
	}

	public void setSystemSignStatus(Integer systemSignStatus) {
		this.systemSignStatus = systemSignStatus;
	}

	public Integer getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(Integer fileStatus) {
		this.fileStatus = fileStatus;
	}

	public String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}

	public String getViewpdfUrl() {
		return viewpdfUrl;
	}

	public void setViewpdfUrl(String viewpdfUrl) {
		this.viewpdfUrl = viewpdfUrl;
	}

	public Integer getOptId() {
		return optId;
	}

	public void setOptId(Integer optId) {
		this.optId = optId;
	}

	public java.util.Date getOptTime() {
		return optTime;
	}

	public void setOptTime(java.util.Date optTime) {
		this.optTime = optTime;
	}

	public Integer[] getTenderStatus() {
		return tenderStatus;
	}

	public void setTenderStatus(Integer[] tenderStatus) {
		this.tenderStatus = tenderStatus;
	}

	public Integer getTag() {
		return tag;
	}

	public void setTag(Integer tag) {
		this.tag = tag;
	}



	public String getUserNameOrBname() {
		return userNameOrBname;
	}

	public void setUserNameOrBname(String userNameOrBname) {
		this.userNameOrBname = userNameOrBname;
	}

	public java.util.Date getRecoverTimeEnd() {
		return recoverTimeEnd;
	}

	public void setRecoverTimeEnd(java.util.Date recoverTimeEnd) {
		this.recoverTimeEnd = recoverTimeEnd;
	}

	public java.util.Date getRecoverTimeBegin() {
		return recoverTimeBegin;
	}

	public void setRecoverTimeBegin(java.util.Date recoverTimeBegin) {
		this.recoverTimeBegin = recoverTimeBegin;
	}

	public String getContractUrl() {
		return contractUrl;
	}

	public void setContractUrl(String contractUrl) {
		this.contractUrl = contractUrl;
	}
	public Integer getTenderScale() {
		return tenderScale;
	}

	public void setTenderScale(Integer tenderScale) {
		this.tenderScale = tenderScale;
	}

	public Integer[] getVerifyStatus() {
		return verifyStatus;
	}

	public void setVerifyStatus(Integer[]  verifyStatus) {
		this.verifyStatus = verifyStatus;
	}


	private Integer repayType;
	/** 产品审核状态*/
	private Integer verifyStatusArray[];
	
	
	public Integer getRepayType() {
		return repayType;
	}

	public void setRepayType(Integer repayType) {
		this.repayType = repayType;
	}



	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

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
	
	public java.math.BigDecimal getTenderAccount() {
		return this.tenderAccount;
	}
	
	public void setTenderAccount(java.math.BigDecimal value) {
		this.tenderAccount = value;
	}
	
	public java.math.BigDecimal getRecoverAccountAll() {
		return this.recoverAccountAll;
	}
	
	public void setRecoverAccountAll(java.math.BigDecimal value) {
		this.recoverAccountAll = value;
	}
	
	public java.math.BigDecimal getRecoverAccountInterest() {
		return this.recoverAccountInterest;
	}
	
	public void setRecoverAccountInterest(java.math.BigDecimal value) {
		this.recoverAccountInterest = value;
	}
	
	public java.math.BigDecimal getRecoverAccountCapital() {
		return this.recoverAccountCapital;
	}
	
	public void setRecoverAccountCapital(java.math.BigDecimal value) {
		this.recoverAccountCapital = value;
	}
	
	public java.math.BigDecimal getRecoverAccountYes() {
		return this.recoverAccountYes;
	}
	
	public void setRecoverAccountYes(java.math.BigDecimal value) {
		this.recoverAccountYes = value;
	}
	
	public java.math.BigDecimal getRecoverAccountInterestYes() {
		return this.recoverAccountInterestYes;
	}
	
	public void setRecoverAccountInterestYes(java.math.BigDecimal value) {
		this.recoverAccountInterestYes = value;
	}
	
	public java.math.BigDecimal getRecoverAccountCapitalYes() {
		return this.recoverAccountCapitalYes;
	}
	
	public void setRecoverAccountCapitalYes(java.math.BigDecimal value) {
		this.recoverAccountCapitalYes = value;
	}
	
	public java.math.BigDecimal getRecoverAccountWait() {
		return this.recoverAccountWait;
	}
	
	public void setRecoverAccountWait(java.math.BigDecimal value) {
		this.recoverAccountWait = value;
	}
	
	public java.math.BigDecimal getRecoverAccountInterestWait() {
		return this.recoverAccountInterestWait;
	}
	
	public void setRecoverAccountInterestWait(java.math.BigDecimal value) {
		this.recoverAccountInterestWait = value;
	}
	
	public java.math.BigDecimal getRecoverAccountCapitalWait() {
		return this.recoverAccountCapitalWait;
	}
	
	public void setRecoverAccountCapitalWait(java.math.BigDecimal value) {
		this.recoverAccountCapitalWait = value;
	}
	
	public Integer getRecoverTimes() {
		return this.recoverTimes;
	}
	
	public void setRecoverTimes(Integer value) {
		this.recoverTimes = value;
	}
	
	public String getContents() {
		return this.contents;
	}
	
	public void setContents(String value) {
		this.contents = value;
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

	public Integer[] getVerifyStatusArray() {
		return verifyStatusArray;
	}

	public void setVerifyStatusArray(Integer verifyStatusArray[]) {
		this.verifyStatusArray = verifyStatusArray;
	}
}

