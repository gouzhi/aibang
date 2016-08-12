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

public class HjsBorrowRepayRecoverDetailed extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 3090140354150854803L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowRepayRecoverDetailed";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_TENDER_DETAILED_ID = "投资明细ID";
	public static final String ALIAS_TENDER_ID = "投标ID";
	public static final String ALIAS_BORROW_ID = "借款产品ID";
	public static final String ALIAS_HJS_BORROW_USER_ID = "借款单ID——即hjs_borrow_user表ID——即汇付项目ID";
	public static final String ALIAS_STATUS = "状态 configid=";
	public static final String ALIAS_TENDER_USER_ID = "投资人ID";
	public static final String ALIAS_BORROW_USER_ID = "借款人ID";
	public static final String ALIAS_TENDER_USR_CUST_ID = "投资人客户号——入账账户";
	public static final String ALIAS_BORROW_USR_CUST_ID = "借款人客户号——出账账户";
	public static final String ALIAS_ACCOUNT_CAPITAL = "实际本金";
	public static final String ALIAS_ACCOUNT_INTEREST = "实际利息";
	public static final String ALIAS_ACCOUNT = "交易金额";
	public static final String ALIAS_UFEE = "手续费金额/管理费";
	public static final String ALIAS_BORROW_RECOVER_ID = "收款单ID";
	public static final String ALIAS_BORROW_REPAY_ID = "还款单ID";
	public static final String ALIAS_RECOVER_TIME = "还款时间";
	public static final String ALIAS_RECOVER_TIME_YES = "实际还款时间";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_RECOVER_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 投资明细ID       db_column: TENDER_DETAILED_ID 
     */	
	private Integer tenderDetailedId;
    /**
     * 投标ID       db_column: TENDER_ID 
     */	
	private Integer tenderId;
    /**
     * 借款产品ID       db_column: BORROW_ID 
     */	
	private Integer borrowId;
    /**
     * 借款单ID——即hjs_borrow_user表ID——即汇付项目ID       db_column: HJS_BORROW_USER_ID 
     */	
	private Integer hjsBorrowUserId;
    /**
     * 状态 configid=       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 投资人ID       db_column: TENDER_USER_ID 
     */	
	private Integer tenderUserId;
    /**
     * 借款人ID       db_column: BORROW_USER_ID 
     */	
	private Integer borrowUserId;
    /**
     * 投资人客户号——入账账户       db_column: TENDER_USR_CUST_ID 
     */	
	private String tenderUsrCustId;
    /**
     * 借款人客户号——出账账户       db_column: BORROW_USR_CUST_ID 
     */	
	private String borrowUsrCustId;
    /**
     * 实际本金       db_column: ACCOUNT_CAPITAL 
     */	
	private java.math.BigDecimal accountCapital;
    /**
     * 实际利息       db_column: ACCOUNT_INTEREST 
     */	
	private java.math.BigDecimal accountInterest;
    /**
     * 交易金额       db_column: ACCOUNT 
     */	
	private java.math.BigDecimal account;
    /**
     * 手续费金额/管理费       db_column: U_FEE 
     */	
	private java.math.BigDecimal ufee;
    /**
     * 收款单ID       db_column: BORROW_RECOVER_ID 
     */	
	private Integer borrowRecoverId;
    /**
     * 还款单ID       db_column: BORROW_REPAY_ID 
     */	
	private Integer borrowRepayId;
    /**
     * 还款时间       db_column: RECOVER_TIME 
     */	
	private java.util.Date recoverTime;
    /**
     * 实际还款时间       db_column: RECOVER_TIME_YES 
     */	
	private java.util.Date recoverTimeYes;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	//columns END

	public HjsBorrowRepayRecoverDetailed(){
	}

	public HjsBorrowRepayRecoverDetailed(
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
	public void setTenderDetailedId(Integer value) {
		this.tenderDetailedId = value;
	}
	
	public Integer getTenderDetailedId() {
		return this.tenderDetailedId;
	}
	public void setTenderId(Integer value) {
		this.tenderId = value;
	}
	
	public Integer getTenderId() {
		return this.tenderId;
	}
	public void setBorrowId(Integer value) {
		this.borrowId = value;
	}
	
	public Integer getBorrowId() {
		return this.borrowId;
	}
	public void setHjsBorrowUserId(Integer value) {
		this.hjsBorrowUserId = value;
	}
	
	public Integer getHjsBorrowUserId() {
		return this.hjsBorrowUserId;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setTenderUserId(Integer value) {
		this.tenderUserId = value;
	}
	
	public Integer getTenderUserId() {
		return this.tenderUserId;
	}
	public void setBorrowUserId(Integer value) {
		this.borrowUserId = value;
	}
	
	public Integer getBorrowUserId() {
		return this.borrowUserId;
	}
	public void setTenderUsrCustId(String value) {
		this.tenderUsrCustId = value;
	}
	
	public String getTenderUsrCustId() {
		return this.tenderUsrCustId;
	}
	public void setBorrowUsrCustId(String value) {
		this.borrowUsrCustId = value;
	}
	
	public String getBorrowUsrCustId() {
		return this.borrowUsrCustId;
	}
	public void setAccountCapital(java.math.BigDecimal value) {
		this.accountCapital = value;
	}
	
	public java.math.BigDecimal getAccountCapital() {
		return this.accountCapital;
	}
	public void setAccountInterest(java.math.BigDecimal value) {
		this.accountInterest = value;
	}
	
	public java.math.BigDecimal getAccountInterest() {
		return this.accountInterest;
	}
	public void setAccount(java.math.BigDecimal value) {
		this.account = value;
	}
	
	public java.math.BigDecimal getAccount() {
		return this.account;
	}
	public void setUfee(java.math.BigDecimal value) {
		this.ufee = value;
	}
	
	public java.math.BigDecimal getUfee() {
		return this.ufee;
	}
	public void setBorrowRecoverId(Integer value) {
		this.borrowRecoverId = value;
	}
	
	public Integer getBorrowRecoverId() {
		return this.borrowRecoverId;
	}
	public void setBorrowRepayId(Integer value) {
		this.borrowRepayId = value;
	}
	
	public Integer getBorrowRepayId() {
		return this.borrowRepayId;
	}
	public String getRecoverTimeString() {
		return DateConvertUtils.format(getRecoverTime(), FORMAT_RECOVER_TIME);
	}
	public void setRecoverTimeString(String value) {
		setRecoverTime(DateConvertUtils.parse(value, FORMAT_RECOVER_TIME,java.util.Date.class));
	}
	
	public void setRecoverTime(java.util.Date value) {
		this.recoverTime = value;
	}
	
	public java.util.Date getRecoverTime() {
		return this.recoverTime;
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
			.append("TenderDetailedId",getTenderDetailedId())
			.append("TenderId",getTenderId())
			.append("BorrowId",getBorrowId())
			.append("HjsBorrowUserId",getHjsBorrowUserId())
			.append("Status",getStatus())
			.append("TenderUserId",getTenderUserId())
			.append("BorrowUserId",getBorrowUserId())
			.append("TenderUsrCustId",getTenderUsrCustId())
			.append("BorrowUsrCustId",getBorrowUsrCustId())
			.append("AccountCapital",getAccountCapital())
			.append("AccountInterest",getAccountInterest())
			.append("Account",getAccount())
			.append("Ufee",getUfee())
			.append("BorrowRecoverId",getBorrowRecoverId())
			.append("BorrowRepayId",getBorrowRepayId())
			.append("RecoverTime",getRecoverTime())
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
		if(obj instanceof HjsBorrowRepayRecoverDetailed == false) return false;
		if(this == obj) return true;
		HjsBorrowRepayRecoverDetailed other = (HjsBorrowRepayRecoverDetailed)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public java.util.Date getRecoverTimeYes() {
		return recoverTimeYes;
	}

	public void setRecoverTimeYes(java.util.Date recoverTimeYes) {
		this.recoverTimeYes = recoverTimeYes;
	}
}

