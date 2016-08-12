/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.cifex.transfer.model.dto;
import java.io.Serializable;
import java.math.BigDecimal;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsBorrowRecover extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -5376292624065426755L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowRecover";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_STATUS = "状态 configid=15";
	public static final String ALIAS_USER_ID = "收款人ID";
	public static final String ALIAS_TENDER_ID = "投标ID";
	public static final String ALIAS_BORROW_ID = "借款产品ID（冗余）";
	public static final String ALIAS_RECOVER_TIME = "收款时间";
	public static final String ALIAS_RECOVER_PERIOD = "收款期/第几期";
	public static final String ALIAS_RECOVER_ACCOUNT = "应收金额";
	public static final String ALIAS_RECOVER_INTEREST = "应收利息";
	public static final String ALIAS_RECOVER_CAPITAL = "应收本金";
	public static final String ALIAS_RECOVER_YESTIME = "实际收款时间";
	public static final String ALIAS_RECOVER_ACCOUNT_YES = "已收总额";
	public static final String ALIAS_RECOVER_INTEREST_YES = "已收利息";
	public static final String ALIAS_RECOVER_CAPITAL_YES = "已收本金";
	public static final String ALIAS_LATE_DAYS = "逾期天数";
	public static final String ALIAS_LATE_INTEREST = "逾期罚利息";
	public static final String ALIAS_LATE_FORFEIT = "逾期罚金应收总额";
	public static final String ALIAS_LATE_FORFEIT_ACT = "逾期罚金实际收入总额";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_RECOVER_TIME = DATE_FORMAT;
	public static final String FORMAT_RECOVER_YESTIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 状态 configid=15       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 收款人ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 投标ID       db_column: TENDER_ID 
     */	
	private Integer tenderId;
    /**
     * 借款产品ID（冗余）       db_column: BORROW_ID 
     */	
	private Integer borrowId;
    /**
     * 收款时间       db_column: RECOVER_TIME 
     */	
	private java.util.Date recoverTime;
    /**
     * 收款期/第几期       db_column: RECOVER_PERIOD 
     */	
	private Integer recoverPeriod;
    /**
     * 应收金额       db_column: RECOVER_ACCOUNT 
     */	
	private BigDecimal recoverAccount=new BigDecimal("0.0");
    /**
     * 应收利息       db_column: RECOVER_INTEREST 
     */	
	private BigDecimal recoverInterest=new BigDecimal("0.0");
    /**
     * 应收本金       db_column: RECOVER_CAPITAL 
     */	
	private BigDecimal recoverCapital=new BigDecimal("0.0");
    /**
     * 实际收款时间       db_column: RECOVER_YESTIME 
     */	
	private java.util.Date recoverYestime;
    /**
     * 已收总额       db_column: RECOVER_ACCOUNT_YES 
     */	
	private BigDecimal recoverAccountYes=new BigDecimal("0.0");
    /**
     * 已收利息       db_column: RECOVER_INTEREST_YES 
     */	
	private BigDecimal recoverInterestYes=new BigDecimal("0.0");
    /**
     * 已收本金       db_column: RECOVER_CAPITAL_YES 
     */	
	private BigDecimal recoverCapitalYes=new BigDecimal("0.0");
    /**
     * 逾期天数       db_column: LATE_DAYS 
     */	
	private Integer lateDays;
    /**
     * 逾期罚利息       db_column: LATE_INTEREST 
     */	
	private BigDecimal lateInterest=new BigDecimal("0.0");
    /**
     * 逾期罚金应收总额       db_column: LATE_FORFEIT 
     */	
	private BigDecimal lateForfeit=new BigDecimal("0.0");
    /**
     * 逾期罚金实际收入总额       db_column: LATE_FORFEIT_ACT 
     */	
	private BigDecimal lateForfeitAct=new BigDecimal("0.0");
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	/**
     * 管理费 
     */	
	private BigDecimal uFee=new BigDecimal("0.0");
	//columns END

	public HjsBorrowRecover(){
	}

	public HjsBorrowRecover(
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
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
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
	public void setRecoverPeriod(Integer value) {
		this.recoverPeriod = value;
	}
	
	public Integer getRecoverPeriod() {
		return this.recoverPeriod;
	}
	public void setRecoverAccount(BigDecimal value) {
		this.recoverAccount = value;
	}
	
	public BigDecimal getRecoverAccount() {
		return this.recoverAccount;
	}
	public void setRecoverInterest(BigDecimal value) {
		this.recoverInterest = value;
	}
	
	public BigDecimal getRecoverInterest() {
		return this.recoverInterest;
	}
	public void setRecoverCapital(BigDecimal value) {
		this.recoverCapital = value;
	}
	
	public BigDecimal getRecoverCapital() {
		return this.recoverCapital;
	}
	public String getRecoverYestimeString() {
		return DateConvertUtils.format(getRecoverYestime(), FORMAT_RECOVER_YESTIME);
	}
	public void setRecoverYestimeString(String value) {
		setRecoverYestime(DateConvertUtils.parse(value, FORMAT_RECOVER_YESTIME,java.util.Date.class));
	}
	
	public void setRecoverYestime(java.util.Date value) {
		this.recoverYestime = value;
	}
	
	public java.util.Date getRecoverYestime() {
		return this.recoverYestime;
	}
	public void setRecoverAccountYes(BigDecimal value) {
		this.recoverAccountYes = value;
	}
	
	public BigDecimal getRecoverAccountYes() {
		return this.recoverAccountYes;
	}
	public void setRecoverInterestYes(BigDecimal value) {
		this.recoverInterestYes = value;
	}
	
	public BigDecimal getRecoverInterestYes() {
		return this.recoverInterestYes;
	}
	public void setRecoverCapitalYes(BigDecimal value) {
		this.recoverCapitalYes = value;
	}
	
	public BigDecimal getRecoverCapitalYes() {
		return this.recoverCapitalYes;
	}
	public void setLateDays(Integer value) {
		this.lateDays = value;
	}
	
	public Integer getLateDays() {
		return this.lateDays;
	}
	public void setLateInterest(BigDecimal value) {
		this.lateInterest = value;
	}
	
	public BigDecimal getLateInterest() {
		return this.lateInterest;
	}
	public void setLateForfeit(BigDecimal value) {
		this.lateForfeit = value;
	}
	
	public BigDecimal getLateForfeit() {
		return this.lateForfeit;
	}
	public void setLateForfeitAct(BigDecimal value) {
		this.lateForfeitAct = value;
	}
	
	public BigDecimal getLateForfeitAct() {
		return this.lateForfeitAct;
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
			.append("Status",getStatus())
			.append("UserId",getUserId())
			.append("TenderId",getTenderId())
			.append("BorrowId",getBorrowId())
			.append("RecoverTime",getRecoverTime())
			.append("RecoverPeriod",getRecoverPeriod())
			.append("RecoverAccount",getRecoverAccount())
			.append("RecoverInterest",getRecoverInterest())
			.append("RecoverCapital",getRecoverCapital())
			.append("RecoverYestime",getRecoverYestime())
			.append("RecoverAccountYes",getRecoverAccountYes())
			.append("RecoverInterestYes",getRecoverInterestYes())
			.append("RecoverCapitalYes",getRecoverCapitalYes())
			.append("LateDays",getLateDays())
			.append("LateInterest",getLateInterest())
			.append("LateForfeit",getLateForfeit())
			.append("LateForfeitAct",getLateForfeitAct())
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
		if(obj instanceof HjsBorrowRecover == false) return false;
		if(this == obj) return true;
		HjsBorrowRecover other = (HjsBorrowRecover)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public BigDecimal getuFee() {
		return uFee;
	}

	public void setuFee(BigDecimal uFee) {
		this.uFee = uFee;
	}
}

