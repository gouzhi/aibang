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

public class HjsBorrowRepay extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = 5195824572178651983L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowRepay";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_STATUS = " 状态/configid=14";
	public static final String ALIAS_BORROW_ID = "借款产品ID";
	public static final String ALIAS_USER_ID = "借款用户ID/还款人偿还人";
	public static final String ALIAS_REPAY_PERIOD = "还款期/第几期";
	public static final String ALIAS_REPAY_TIME = "还款日期";
	public static final String ALIAS_REPAY_YESTIME = "实际还款日期";
	public static final String ALIAS_REPAY_ACCOUNT = "还款金额";
	public static final String ALIAS_REPAY_INTEREST = "还款利息";
	public static final String ALIAS_REPAY_CAPITAL = "还款本金";
	public static final String ALIAS_REPAY_ACCOUNT_YES = "已还金额";
	public static final String ALIAS_REPAY_INTEREST_YES = "已还利息";
	public static final String ALIAS_REPAY_CAPITAL_YES = "已还本金";
	public static final String ALIAS_LATE_REPAY_STATUS = "逾期还款状态";
	public static final String ALIAS_LATE_DAYS = "逾期天数";
	public static final String ALIAS_LATE_INTEREST = "逾期罚息";
	public static final String ALIAS_LATE_FORFEIT = "逾期罚金总额";
	public static final String ALIAS_LATE_FORFEIT_ACT = "逾期罚金实际总额";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_REPAY_TIME = DATE_FORMAT;
	public static final String FORMAT_REPAY_YESTIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
 
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     *  状态/configid=14       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 借款产品ID       db_column: BORROW_ID 
     */	
	private Integer borrowId;
    /**
     * 借款用户ID/还款人偿还人       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 还款期/第几期       db_column: REPAY_PERIOD 
     */	
	private Integer repayPeriod;
    /**
     * 还款日期       db_column: REPAY_TIME 
     */	
	private java.util.Date repayTime;
    /**
     * 实际还款日期       db_column: REPAY_YESTIME 
     */	
	private java.util.Date repayYestime;
    /**
     * 还款金额       db_column: REPAY_ACCOUNT 
     */	
	private BigDecimal repayAccount=new BigDecimal("0.0");
    /**
     * 还款利息       db_column: REPAY_INTEREST 
     */	
	private BigDecimal repayInterest=new BigDecimal("0.0");
    /**
     * 还款本金       db_column: REPAY_CAPITAL 
     */	
	private BigDecimal repayCapital=new BigDecimal("0.0");
    /**
     * 已还金额       db_column: REPAY_ACCOUNT_YES 
     */	
	private BigDecimal repayAccountYes=new BigDecimal("0.0");
    /**
     * 已还利息       db_column: REPAY_INTEREST_YES 
     */	
	private BigDecimal repayInterestYes=new BigDecimal("0.0");
    /**
     * 已还本金       db_column: REPAY_CAPITAL_YES 
     */	
	private BigDecimal repayCapitalYes=new BigDecimal("0.0");
    /**
     * 逾期还款状态       db_column: LATE_REPAY_STATUS 
     */	
	private Integer lateRepayStatus;
    /**
     * 逾期天数       db_column: LATE_DAYS 
     */	
	private Integer lateDays;
    /**
     * 逾期罚息       db_column: LATE_INTEREST 
     */	
	private BigDecimal lateInterest=new BigDecimal("0.0");
    /**
     * 逾期罚金总额       db_column: LATE_FORFEIT 
     */	
	private BigDecimal lateForfeit=new BigDecimal("0.0");
    /**
     * 逾期罚金实际总额       db_column: LATE_FORFEIT_ACT 
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
     * 借款单ID——即hjs_borrow_user表ID
     */	
    private Integer hjsBorrowUserId;  
    /**
     * 管理费
     */	
    private BigDecimal uFee=new BigDecimal("0.0");
    /**
     *差额管理费
     */	
    private BigDecimal errorFee=new BigDecimal("0.0");
    /**
     * 还款批次号
     */
    private String batchId;
    
    
    
    
    //columns END
  
	public BigDecimal getuFee() {
		return uFee;
	}

	public void setuFee(BigDecimal uFee) {
		this.uFee = uFee;
	}

	public BigDecimal getErrorFee() {
		return errorFee;
	}

	public void setErrorFee(BigDecimal errorFee) {
		this.errorFee = errorFee;
	}

	public Integer getHjsBorrowUserId() {
		return hjsBorrowUserId;
	}

	public void setHjsBorrowUserId(Integer hjsBorrowUserId) {
		this.hjsBorrowUserId = hjsBorrowUserId;
	}

	 

	public HjsBorrowRepay(){
	}

	public HjsBorrowRepay(
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
	public void setRepayPeriod(Integer value) {
		this.repayPeriod = value;
	}
	
	public Integer getRepayPeriod() {
		return this.repayPeriod;
	}
	public String getRepayTimeString() {
		return DateConvertUtils.format(getRepayTime(), FORMAT_REPAY_TIME);
	}
	public void setRepayTimeString(String value) {
		setRepayTime(DateConvertUtils.parse(value, FORMAT_REPAY_TIME,java.util.Date.class));
	}
	
	public void setRepayTime(java.util.Date value) {
		this.repayTime = value;
	}
	
	public java.util.Date getRepayTime() {
		return this.repayTime;
	}
	public String getRepayYestimeString() {
		return DateConvertUtils.format(getRepayYestime(), FORMAT_REPAY_YESTIME);
	}
	public void setRepayYestimeString(String value) {
		setRepayYestime(DateConvertUtils.parse(value, FORMAT_REPAY_YESTIME,java.util.Date.class));
	}
	
	public void setRepayYestime(java.util.Date value) {
		this.repayYestime = value;
	}
	
	public java.util.Date getRepayYestime() {
		return this.repayYestime;
	}
	public void setRepayAccount(BigDecimal value) {
		this.repayAccount = value;
	}
	
	public BigDecimal getRepayAccount() {
		return this.repayAccount;
	}
	public void setRepayInterest(BigDecimal value) {
		this.repayInterest = value;
	}
	
	public BigDecimal getRepayInterest() {
		return this.repayInterest;
	}
	public void setRepayCapital(BigDecimal value) {
		this.repayCapital = value;
	}
	
	public BigDecimal getRepayCapital() {
		return this.repayCapital;
	}
	public void setRepayAccountYes(BigDecimal value) {
		this.repayAccountYes = value;
	}
	
	public BigDecimal getRepayAccountYes() {
		return this.repayAccountYes;
	}
	public void setRepayInterestYes(BigDecimal value) {
		this.repayInterestYes = value;
	}
	
	public BigDecimal getRepayInterestYes() {
		return this.repayInterestYes;
	}
	public void setRepayCapitalYes(BigDecimal value) {
		this.repayCapitalYes = value;
	}
	
	public BigDecimal getRepayCapitalYes() {
		return this.repayCapitalYes;
	}
	public void setLateRepayStatus(Integer value) {
		this.lateRepayStatus = value;
	}
	
	public Integer getLateRepayStatus() {
		return this.lateRepayStatus;
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
			.append("BorrowId",getBorrowId())
			.append("UserId",getUserId())
			.append("RepayPeriod",getRepayPeriod())
			.append("RepayTime",getRepayTime())
			.append("RepayYestime",getRepayYestime())
			.append("RepayAccount",getRepayAccount())
			.append("RepayInterest",getRepayInterest())
			.append("RepayCapital",getRepayCapital())
			.append("RepayAccountYes",getRepayAccountYes())
			.append("RepayInterestYes",getRepayInterestYes())
			.append("RepayCapitalYes",getRepayCapitalYes())
			.append("LateRepayStatus",getLateRepayStatus())
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
		if(obj instanceof HjsBorrowRepay == false) return false;
		if(this == obj) return true;
		HjsBorrowRepay other = (HjsBorrowRepay)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}
}

