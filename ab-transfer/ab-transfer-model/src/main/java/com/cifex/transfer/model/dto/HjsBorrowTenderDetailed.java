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
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsBorrowTenderDetailed extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -354835593714700687L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowTenderDetailed";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_BORROW_ID = "借款产品ID";
	public static final String ALIAS_TENDER_ID = "投标ID";
	public static final String ALIAS_HJS_BORROW_USER_ID = "借款（人）表ID——即汇付标的信息项目ID";
	public static final String ALIAS_STATUS = "状态 configid=";
	public static final String ALIAS_TENDER_USER_ID = "投资人ID";
	public static final String ALIAS_BORROW_USER_ID = "借款人ID";
	public static final String ALIAS_TENDER_USR_CUST_ID = "投资人客户号";
	public static final String ALIAS_BORROW_USR_CUST_ID = "借款人客户号";
	public static final String ALIAS_REPAY_TYPE = "收款还款类型";
	public static final String ALIAS_REPAY_PERIOD = "收款还款周期";
	public static final String ALIAS_ACCT_ID = "红包出账账户";
	public static final String ALIAS_ACCOUNT = "交易金额";
	public static final String ALIAS_BONUS_VALUE = "使用红包金额";
	public static final String ALIAS_BORROW_APR = "借款利率";
	public static final String ALIAS_BORROW_APR_MAX = "最大借款利率";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_U_FEE = "管理费";
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
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
     * 投标ID       db_column: TENDER_ID 
     */	
	private Integer tenderId;
    /**
     * 借款（人）表ID——即汇付标的信息项目ID       db_column: HJS_BORROW_USER_ID 
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
     * 投资人客户号       db_column: TENDER_USR_CUST_ID 
     */	
	private String tenderUsrCustId;
    /**
     * 借款人客户号       db_column: BORROW_USR_CUST_ID 
     */	
	private String borrowUsrCustId;
    /**
     * 收款还款类型       db_column: REPAY_TYPE 
     */	
	private Integer repayType;
    /**
     * 收款还款周期       db_column: REPAY_PERIOD 
     */	
	private Integer repayPeriod;
    /**
     * 红包出账账户       db_column: ACCT_ID 
     */	
	private String acctId;
    /**
     * 交易金额       db_column: ACCOUNT 
     */	
	private BigDecimal account;
    /**
     * 使用红包金额       db_column: BONUS_VALUE 
     */	
	private BigDecimal bonusValue;
    /**
     * 借款利率       db_column: BORROW_APR 
     */	
	private double borrowApr;
    /**
     * 最大借款利率       db_column: BORROW_APR_MAX 
     */	
	private double borrowAprMax;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	/**
	 *管理费
	 */
	private BigDecimal uFee;

	public BigDecimal getuFee() {
		return uFee;
	}

	public void setuFee(BigDecimal uFee) {
		this.uFee = uFee;
	}
	//columns END

	public HjsBorrowTenderDetailed(){
	}

	public HjsBorrowTenderDetailed(
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
	public void setTenderId(Integer value) {
		this.tenderId = value;
	}
	
	public Integer getTenderId() {
		return this.tenderId;
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
	public void setRepayType(Integer value) {
		this.repayType = value;
	}
	
	public Integer getRepayType() {
		return this.repayType;
	}
	public void setRepayPeriod(Integer value) {
		this.repayPeriod = value;
	}
	
	public Integer getRepayPeriod() {
		return this.repayPeriod;
	}
	public void setAcctId(String value) {
		this.acctId = value;
	}
	
	public String getAcctId() {
		return this.acctId;
	}
	public void setAccount(BigDecimal value) {
		this.account = value;
	}
	
	public BigDecimal getAccount() {
		return this.account;
	}
	public void setBonusValue(BigDecimal value) {
		this.bonusValue = value;
	}
	
	public BigDecimal getBonusValue() {
		return this.bonusValue;
	}

	

	public String getCreateTimeString() {
		return DateConvertUtils.format(getCreateTime(), FORMAT_CREATE_TIME);
	}
	public void setCreateTimeString(String value) {
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,Date.class));
	}
	
	public void setCreateTime(Date value) {
		this.createTime = value;
	}
	
	public Date getCreateTime() {
		return this.createTime;
	}
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
	}

	public double getBorrowApr() {
		return borrowApr;
	}

	public void setBorrowApr(double borrowApr) {
		this.borrowApr = borrowApr;
	}

	public double getBorrowAprMax() {
		return borrowAprMax;
	}

	public void setBorrowAprMax(double borrowAprMax) {
		this.borrowAprMax = borrowAprMax;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("BorrowId",getBorrowId())
			.append("TenderId",getTenderId())
			.append("HjsBorrowUserId",getHjsBorrowUserId())
			.append("Status",getStatus())
			.append("TenderUserId",getTenderUserId())
			.append("BorrowUserId",getBorrowUserId())
			.append("TenderUsrCustId",getTenderUsrCustId())
			.append("BorrowUsrCustId",getBorrowUsrCustId())
			.append("RepayType",getRepayType())
			.append("RepayPeriod",getRepayPeriod())
			.append("AcctId",getAcctId())
			.append("Account",getAccount())
			.append("BonusValue",getBonusValue())
			.append("BorrowApr",getBorrowApr())
			.append("BorrowAprMax",getBorrowAprMax())
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
		if(obj instanceof HjsBorrowTenderDetailed == false) return false;
		if(this == obj) return true;
		HjsBorrowTenderDetailed other = (HjsBorrowTenderDetailed)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

