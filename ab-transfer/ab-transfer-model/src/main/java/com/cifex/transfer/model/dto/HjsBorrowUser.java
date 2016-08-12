/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.cifex.transfer.model.dto;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.transfer.model.BaseEntity; 

public class HjsBorrowUser extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = 8243439577016075012L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowUser";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_BORROW_ID = "借款产品ID";
	public static final String ALIAS_PROJECT_ID = "项目ID/个人申请表ID";
	public static final String ALIAS_USER_ID = "借款用户ID(冗余)";
	public static final String ALIAS_UACCOUNT = "借款金额/子表借款金额总和=产品表总借款金额/ 一期一对一，故产品表总金额";
	public static final String ALIAS_UFEE = "管理费";
	public static final String ALIAS_BORROW_USR_CUST_ID = "借款人客户号";
	public static final String ALIAS_BORROW_APR = "借款利率";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_REPAY_ACCOUNT_INTEREST = "预计利息";
	public static final String ALIAS_REPAY_TYPE = "还款类型";
	public static final String ALIAS_REPAY_PERIOD = "还款周期";
	public static final String ALIAS_REPAY_ACCOUNT_ALL = "还款总额";//date formats
	public static final String ALIAS_REPAY_ACCOUNT_YES = "已还款";
	public static final String ALIAS_REPAY_ACCOUNT_WAIT = "剩余还款";
	public static final String ALIAS_REPAY_ACCOUNT_INTEREST_YES = "已还利息";
	public static final String ALIAS_REPAY_ACCOUNT_CAPITAL_YES = "已还本金";
	public static final String ALIAS_REPAY_INTEREST_WAIT = "待还利息";
	public static final String ALIAS_REPAY_CAPITAL_WAIT = "待还本金";
	public static final String ALIAS_REPAY_TIMES = "还款次数";
	public static final String ALIAS_CREATE_TIME = "创时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_POOL_ACCOUNT = "放款到资金池金额";
	public static final String ALIAS_POOL_OUT_TIME = "资金池金额代取时间";
	public static final String ALIAS_POOL_STATE = "资金池金额状态  0 未取现 1 已取现";
	public static final String ALIAS_POOL_MEMO = "取现时备注";
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
     * 项目ID/个人申请表ID       db_column: PROJECT_ID 
     */	
	private Integer projectId;
    /**
     * 借款用户ID(冗余)       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 借款金额/子表借款金额总和=产品表总借款金额/ 一期一对一，故产品表总金额       db_column: U_ACCOUNT 
     */	
	private BigDecimal uaccount;
    /**
     * 管理费       db_column: U_FEE 
     */	
	private BigDecimal ufee;
	private String borrowUsrCustId;
	private Double borrowApr;
	private Integer status;
	private BigDecimal repayAccountInterest;
	private Integer repayType;
	private Integer repayPeriod;
	private BigDecimal repayAccountAll;
	private BigDecimal repayAccountYes;
	private BigDecimal repayAccountWait;
	private BigDecimal repayAccountInterestYes;
	
	private BigDecimal repayAccountCapitalYes;
	private BigDecimal repayInterestWait;
	private BigDecimal repayCapitalWait;
	private Integer repayTimes;
	private Date createTime;
	private String createIp;
	  /**
     * 放款到资金池金额       db_column: POOL_ACCOUNT 
     */	
	private java.math.BigDecimal poolAccount;
    /**
     * 资金池金额代取时间       db_column: POOL_OUT_TIME 
     */	
	private java.util.Date poolOutTime;
    /**
     * 资金池金额状态  0 未取现 1 已取现       db_column: POOL_STATE 
     */	
	private java.lang.Integer poolState;
    /**
     * 取现时备注       db_column: POOL_MEMO 
     */	
	private java.lang.String poolMemo;
	//columns END
    
	public HjsBorrowUser(){
	}

	

	public java.math.BigDecimal getPoolAccount() {
		return poolAccount;
	}



	public void setPoolAccount(java.math.BigDecimal poolAccount) {
		this.poolAccount = poolAccount;
	}



	public java.util.Date getPoolOutTime() {
		return poolOutTime;
	}



	public void setPoolOutTime(java.util.Date poolOutTime) {
		this.poolOutTime = poolOutTime;
	}



	public java.lang.Integer getPoolState() {
		return poolState;
	}



	public void setPoolState(java.lang.Integer poolState) {
		this.poolState = poolState;
	}



	public java.lang.String getPoolMemo() {
		return poolMemo;
	}



	public void setPoolMemo(java.lang.String poolMemo) {
		this.poolMemo = poolMemo;
	}



	public Double getBorrowApr() {
		return borrowApr;
	}



	public void setBorrowApr(Double borrowApr) {
		this.borrowApr = borrowApr;
	}



	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public BigDecimal getRepayAccountInterest() {
		return repayAccountInterest;
	}

	public void setRepayAccountInterest(BigDecimal repayAccountInterest) {
		this.repayAccountInterest = repayAccountInterest;
	}

	public Integer getRepayType() {
		return repayType;
	}

	public void setRepayType(Integer repayType) {
		this.repayType = repayType;
	}

	public Integer getRepayPeriod() {
		return repayPeriod;
	}

	public void setRepayPeriod(Integer repayPeriod) {
		this.repayPeriod = repayPeriod;
	}

	public BigDecimal getRepayAccountAll() {
		return repayAccountAll;
	}

	public void setRepayAccountAll(BigDecimal repayAccountAll) {
		this.repayAccountAll = repayAccountAll;
	}

	public BigDecimal getRepayAccountYes() {
		return repayAccountYes;
	}

	public void setRepayAccountYes(BigDecimal repayAccountYes) {
		this.repayAccountYes = repayAccountYes;
	}

	public BigDecimal getRepayAccountWait() {
		return repayAccountWait;
	}

	public void setRepayAccountWait(BigDecimal repayAccountWait) {
		this.repayAccountWait = repayAccountWait;
	}

	public BigDecimal getRepayAccountInterestYes() {
		return repayAccountInterestYes;
	}

	public void setRepayAccountInterestYes(BigDecimal repayAccountInterestYes) {
		this.repayAccountInterestYes = repayAccountInterestYes;
	}

	public BigDecimal getRepayAccountCapitalYes() {
		return repayAccountCapitalYes;
	}

	public void setRepayAccountCapitalYes(BigDecimal repayAccountCapitalYes) {
		this.repayAccountCapitalYes = repayAccountCapitalYes;
	}

	public BigDecimal getRepayInterestWait() {
		return repayInterestWait;
	}

	public void setRepayInterestWait(BigDecimal repayInterestWait) {
		this.repayInterestWait = repayInterestWait;
	}

	public BigDecimal getRepayCapitalWait() {
		return repayCapitalWait;
	}

	public void setRepayCapitalWait(BigDecimal repayCapitalWait) {
		this.repayCapitalWait = repayCapitalWait;
	}

	public Integer getRepayTimes() {
		return repayTimes;
	}

	public void setRepayTimes(Integer repayTimes) {
		this.repayTimes = repayTimes;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateIp() {
		return createIp;
	}

	public void setCreateIp(String createIp) {
		this.createIp = createIp;
	}

	public String getBorrowUsrCustId() {
		return borrowUsrCustId;
	}

	public void setBorrowUsrCustId(String borrowUsrCustId) {
		this.borrowUsrCustId = borrowUsrCustId;
	}

	public HjsBorrowUser(
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
	public void setProjectId(Integer value) {
		this.projectId = value;
	}
	
	public Integer getProjectId() {
		return this.projectId;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setUaccount(BigDecimal value) {
		this.uaccount = value;
	}
	
	public BigDecimal getUaccount() {
		return this.uaccount;
	}
	public void setUfee(BigDecimal value) {
		this.ufee = value;
	}
	
	public BigDecimal getUfee() {
		return this.ufee;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("BorrowId",getBorrowId())
			.append("ProjectId",getProjectId())
			.append("UserId",getUserId())
			.append("Uaccount",getUaccount())
			.append("Ufee",getUfee())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsBorrowUser == false) return false;
		if(this == obj) return true;
		HjsBorrowUser other = (HjsBorrowUser)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

