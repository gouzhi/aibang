/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.cifex.transfer.model.dto;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;
import java.math.BigDecimal;

public class HjsBorrowTender extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -5645183664950407237L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowTender";
	public static final String ALIAS_ID = " ";
	public static final String ALIAS_BORROW_ID = "借款产品ID";
	public static final String ALIAS_USER_ID = "投资用户ID";
	public static final String ALIAS_STATUS = "状态  CONFIGID=13";
	public static final String ALIAS_TENDER_ACCOUNT = "投标金额";
	public static final String ALIAS_RECOVER_ACCOUNT_ALL = "收益总额";
	public static final String ALIAS_RECOVER_ACCOUNT_INTEREST = "收益总利息";
	public static final String ALIAS_RECOVER_ACCOUNT_CAPITAL = "收益总本金";
	public static final String ALIAS_RECOVER_ACCOUNT_YES = "已收本息";
	public static final String ALIAS_RECOVER_ACCOUNT_INTEREST_YES = "已收利息";
	public static final String ALIAS_RECOVER_ACCOUNT_CAPITAL_YES = "已收本金";
	public static final String ALIAS_RECOVER_ACCOUNT_WAIT = "待收本息";
	public static final String ALIAS_RECOVER_ACCOUNT_INTEREST_WAIT = "待收利息";
	public static final String ALIAS_RECOVER_ACCOUNT_CAPITAL_WAIT = "待收本金";
	public static final String ALIAS_RECOVER_TIMES = "收益次数";
	public static final String ALIAS_CONTENTS = "投标说明";
	public static final String ALIAS_CONTRACT_URL="合同地址";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_TENDER_USR_CUST_ID="投资人客户号";
	public static final String ALIAS_TRX_ID="汇付平台交易唯一标识";
	public static final String ALIAS_RESP_CODE="汇付应答返回码";
	public static final String ALIAS_IS_FREEZE="是否冻结";
	public static final String ALIAS_FREEZD_ORD_ID="冻结订单号";
	public static final String ALIAS_FREEZD_TRX_ID="冻结标识";
	public static final String ALIAS_MAX_TENDER_RATE="最大投资手续费费率";
	public static final String ALIAS_TENDER_APR="投资利率";
	public static final String ALIAS_RECOVER_TYPE="收款类型";
	public static final String ALIAS_RECOVER_PERIOD="收款周期";
	public static final String ALIAS_U_FEE="管理费";
	//date formats

	public BigDecimal getuFee() {
		return uFee;
	}

	public void setuFee(BigDecimal uFee) {
		this.uFee = uFee;
	}

	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     *         db_column: ID 
     */	
	private Integer id;
    /**
     * 借款产品ID       db_column: BORROW_ID 
     */	
	private Integer borrowId;
    /**
     * 投资用户ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 状态  CONFIGID=13       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 投标金额       db_column: TENDER_ACCOUNT 
     */	
	private BigDecimal tenderAccount;
    /**
     * 收益总额       db_column: RECOVER_ACCOUNT_ALL 
     */	
	private BigDecimal recoverAccountAll;
    /**
     * 收益总利息       db_column: RECOVER_ACCOUNT_INTEREST 
     */	
	private BigDecimal recoverAccountInterest;
    /**
     * 收益总本金       db_column: RECOVER_ACCOUNT_CAPITAL 
     */	
	private BigDecimal recoverAccountCapital;
    /**
     * 已收本息       db_column: RECOVER_ACCOUNT_YES 
     */	
	private BigDecimal recoverAccountYes;
    /**
     * 已收利息       db_column: RECOVER_ACCOUNT_INTEREST_YES 
     */	
	private BigDecimal recoverAccountInterestYes;
    /**
     * 已收本金       db_column: RECOVER_ACCOUNT_CAPITAL_YES 
     */	
	private BigDecimal recoverAccountCapitalYes;
    /**
     * 待收本息       db_column: RECOVER_ACCOUNT_WAIT 
     */	
	private BigDecimal recoverAccountWait;
    /**
     * 待收利息       db_column: RECOVER_ACCOUNT_INTEREST_WAIT 
     */	
	private BigDecimal recoverAccountInterestWait;
    /**
     * 待收本金       db_column: RECOVER_ACCOUNT_CAPITAL_WAIT 
     */	
	private BigDecimal recoverAccountCapitalWait;
    /**
     * 收益次数       db_column: RECOVER_TIMES 
     */	
	private Integer recoverTimes;
    /**
     * 投标说明       db_column: CONTENTS 
     */	
	private String contents;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	//columns END

	/**
	 * 合同地址 
	 */
	private String contractUrl;
	/**
	 * 投资人客户号
	 */
	private String tenderUsrCustId;
	/**
	 * 汇付平台交易唯一标识
	 */
	private String trxId;
	/**
	 * 汇付应答返回码
	 */
	private String respCode;
	/**
	 * 是否冻结
	 */
	private String isFreeze;
	/**
	 * 冻结订单号
	 */
	private String FreezdOrdId;
	/**
	 * 冻结标识
	 */
	private String freezdTrxId;
	/**
	 * 最大投资手续费费率
	 */
	private double maxTenderRate;
	/**
	 * 投资利率
	 */
	private double tenderApr;
	/**
	 * 收款类型
	 */
	private Integer recoverType;
	/**
	 * 收款周期
	 */
	private Integer recoverPeriod;
	/**
	 * 管理费
	 */
	private BigDecimal uFee;

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
	private Integer borrowerSignStatus;
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

	public Integer getBorrowerSignStatus() {
		return borrowerSignStatus;
	}

	public void setBorrowerSignStatus(Integer borrowerSignStatus) {
		this.borrowerSignStatus = borrowerSignStatus;
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

	public String getContractUrl() {
		return contractUrl;
	}

	public void setContractUrl(String contractUrl) {
		this.contractUrl = contractUrl;
	}

	public HjsBorrowTender(){
	}

	public HjsBorrowTender(
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
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setTenderAccount(BigDecimal value) {
		this.tenderAccount = value;
	}
	
	public BigDecimal getTenderAccount() {
		return this.tenderAccount;
	}
	public void setRecoverAccountAll(BigDecimal value) {
		this.recoverAccountAll = value;
	}
	
	public BigDecimal getRecoverAccountAll() {
		return this.recoverAccountAll;
	}
	public void setRecoverAccountInterest(BigDecimal value) {
		this.recoverAccountInterest = value;
	}
	
	public BigDecimal getRecoverAccountInterest() {
		return this.recoverAccountInterest;
	}
	public void setRecoverAccountCapital(BigDecimal value) {
		this.recoverAccountCapital = value;
	}
	
	public BigDecimal getRecoverAccountCapital() {
		return this.recoverAccountCapital;
	}
	public void setRecoverAccountYes(BigDecimal value) {
		this.recoverAccountYes = value;
	}
	
	public BigDecimal getRecoverAccountYes() {
		return this.recoverAccountYes;
	}
	public void setRecoverAccountInterestYes(BigDecimal value) {
		this.recoverAccountInterestYes = value;
	}
	
	public BigDecimal getRecoverAccountInterestYes() {
		return this.recoverAccountInterestYes;
	}
	public void setRecoverAccountCapitalYes(BigDecimal value) {
		this.recoverAccountCapitalYes = value;
	}
	
	public BigDecimal getRecoverAccountCapitalYes() {
		return this.recoverAccountCapitalYes;
	}
	public void setRecoverAccountWait(BigDecimal value) {
		this.recoverAccountWait = value;
	}
	
	public BigDecimal getRecoverAccountWait() {
		return this.recoverAccountWait;
	}
	public void setRecoverAccountInterestWait(BigDecimal value) {
		this.recoverAccountInterestWait = value;
	}
	
	public BigDecimal getRecoverAccountInterestWait() {
		return this.recoverAccountInterestWait;
	}
	public void setRecoverAccountCapitalWait(BigDecimal value) {
		this.recoverAccountCapitalWait = value;
	}
	
	public BigDecimal getRecoverAccountCapitalWait() {
		return this.recoverAccountCapitalWait;
	}
	public void setRecoverTimes(Integer value) {
		this.recoverTimes = value;
	}
	
	public Integer getRecoverTimes() {
		return this.recoverTimes;
	}
	public void setContents(String value) {
		this.contents = value;
	}
	
	public String getContents() {
		return this.contents;
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
			.append("BorrowId",getBorrowId())
			.append("UserId",getUserId())
			.append("Status",getStatus())
			.append("TenderAccount",getTenderAccount())
			.append("RecoverAccountAll",getRecoverAccountAll())
			.append("RecoverAccountInterest",getRecoverAccountInterest())
			.append("RecoverAccountCapital",getRecoverAccountCapital())
			.append("RecoverAccountYes",getRecoverAccountYes())
			.append("RecoverAccountInterestYes",getRecoverAccountInterestYes())
			.append("RecoverAccountCapitalYes",getRecoverAccountCapitalYes())
			.append("RecoverAccountWait",getRecoverAccountWait())
			.append("RecoverAccountInterestWait",getRecoverAccountInterestWait())
			.append("RecoverAccountCapitalWait",getRecoverAccountCapitalWait())
			.append("RecoverTimes",getRecoverTimes())
			.append("Contents",getContents())
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
		if(obj instanceof HjsBorrowTender == false) return false;
		if(this == obj) return true;
		HjsBorrowTender other = (HjsBorrowTender)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public String getTenderUsrCustId() {
		return tenderUsrCustId;
	}

	public void setTenderUsrCustId(String tenderUsrCustId) {
		this.tenderUsrCustId = tenderUsrCustId;
	}

	public String getTrxId() {
		return trxId;
	}

	public void setTrxId(String trxId) {
		this.trxId = trxId;
	}

	public String getRespCode() {
		return respCode;
	}

	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}

	public String getIsFreeze() {
		return isFreeze;
	}

	public void setIsFreeze(String isFreeze) {
		this.isFreeze = isFreeze;
	}

	public String getFreezdOrdId() {
		return FreezdOrdId;
	}

	public void setFreezdOrdId(String freezdOrdId) {
		FreezdOrdId = freezdOrdId;
	}

	public String getFreezdTrxId() {
		return freezdTrxId; 
	}

	public void setFreezdTrxId(String freezdTrxId) {
		this.freezdTrxId = freezdTrxId;
	}

	public double getMaxTenderRate() {
		return maxTenderRate;
	}

	public void setMaxTenderRate(double maxTenderRate) {
		this.maxTenderRate = maxTenderRate;
	}

	public double getTenderApr() {
		return tenderApr;
	}

	public void setTenderApr(double tenderApr) {
		this.tenderApr = tenderApr;
	}

	public Integer getRecoverType() {
		return recoverType;
	}

	public void setRecoverType(Integer recoverType) {
		this.recoverType = recoverType;
	}

	public Integer getRecoverPeriod() {
		return recoverPeriod;
	}

	public void setRecoverPeriod(Integer recoverPeriod) {
		this.recoverPeriod = recoverPeriod;
	}
}

