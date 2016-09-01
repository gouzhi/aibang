/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.aibang.transfer.model.dto;
import java.io.Serializable;
import java.math.BigDecimal;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.DateConvertUtils;
import com.aibang.transfer.model.BaseEntity;

public class AbUserBase extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -3499890055080352700L;
	//alias
	public static final String TABLE_ALIAS = "HjsUserBase";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_TYPE_ID = "CONFIGID=26/账户类型";
	public static final String ALIAS_USERNAME = "创建者登录用户名";
	public static final String ALIAS_PAY_PASSWORD = "密码";
	public static final String ALIAS_TOTAL = "账户总额=余额+待收";
	public static final String ALIAS_BALANCE = "账户余额=可用+冻结";
	public static final String ALIAS_AVL_BALANCE = "可用余额";
	public static final String ALIAS_FROST = "冻结总额";
	public static final String ALIAS_AWAIT = "待收总额";
	public static final String ALIAS_TENDER_NUM = "投资总次数";
	public static final String ALIAS_TENDER_ACCOUNT = "投资总额";
	public static final String ALIAS_INCOME = "总收入";
	public static final String ALIAS_EXPEND = "总支出";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_UPDATE_TIME = "更新时间";
	public static final String ALIAS_UPDATE_IP = "更新时IP";
	public static final String ALIAS_OPT_ID = "操作员ID  后台界面录入时需填写";
	public static final String ALIAS_USR_CUST_ID = "汇付客户号";
	public static final String ALIAS_IS_NEW = "是否新手  默认是新手:1    否，不是新手:0 ";
	public static final String ALIAS_FADADA_CA_ID = "法大大客户编号-CA证书客户编号";
	public static final String ALIAS_AUTHOR_END_DATE = "授权截至日期";
	public static final String ALIAS_AUTHOR_TRADE_ID = "授权交易号";
	public static final String ALIAS_AUTHOR_CONTRACT_ID = "授权合同号";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;
	public static final String FORMAT_AUTHOR_END_DATE = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * CONFIGID=26/账户类型       db_column: TYPE_ID 
     */	
	private Integer typeId;
    /**
     * 创建者登录用户名       db_column: USERNAME 
     */	
	private String username;
    /**
     * 密码       db_column: PAY_PASSWORD 
     */	
	private String payPassword;
    /**
     * 账户总额=余额+待收       db_column: TOTAL 
     */	
	private BigDecimal total;
    /**
     * 账户余额=可用+冻结       db_column: BALANCE 
     */	
	private BigDecimal balance;
    /**
     * 可用余额       db_column: AVL_BALANCE 
     */	
	private BigDecimal avlBalance;
    /**
     * 冻结总额       db_column: FROST 
     */	
	private BigDecimal frost;
    /**
     * 待收总额       db_column: AWAIT 
     */	
	private BigDecimal await;
    /**
     * 投资总次数       db_column: TENDER_NUM 
     */	
	private Integer tenderNum;
    /**
     * 投资总额       db_column: TENDER_ACCOUNT 
     */	
	private BigDecimal tenderAccount;
    /**
     * 总收入       db_column: INCOME 
     */	
	private BigDecimal income;
    /**
     * 总支出       db_column: EXPEND 
     */	
	private BigDecimal expend;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 更新时间       db_column: UPDATE_TIME 
     */	
	private java.util.Date updateTime;
    /**
     * 更新时IP       db_column: UPDATE_IP 
     */	
	private String updateIp;
    /**
     * 操作员ID  后台界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
	/**
	 * 待收利息总额
	 */
	private BigDecimal awaitInterest;
	/**
	 * 待收本金总额
	 */
	private BigDecimal awaitCapital;
	/**
	 * 汇付客户号
	 */
	private String usrCustId;
	/**
     * 是否新手  默认是新手:1    否，不是新手:0        db_column: IS_NEW 
     */	
	private Integer isNew = 1;
	
	 /**
     * 法大大客户编号-CA证书客户编号       db_column: FADADA_CA_ID 
     */	
	private String fadadaCaId;
	
    /**
     * 授权截至日期       db_column: AUTHOR_END_DATE 
     */	
	private java.util.Date authorEndDate;
    /**
     * 授权交易号       db_column: AUTHOR_TRADE_ID 
     */	
	private String authorTradeId;
    /**
     * 授权合同号       db_column: AUTHOR_CONTRACT_ID 
     */	
	private String authorContractId;
	
	//columns END
	
	
	public String getFadadaCaId() {
		return fadadaCaId;
	}

	public java.util.Date getAuthorEndDate() {
		return authorEndDate;
	}

	public void setAuthorEndDate(java.util.Date authorEndDate) {
		this.authorEndDate = authorEndDate;
	}

	public String getAuthorTradeId() {
		return authorTradeId;
	}

	public void setAuthorTradeId(String authorTradeId) {
		this.authorTradeId = authorTradeId;
	}

	public String getAuthorContractId() {
		return authorContractId;
	}

	public void setAuthorContractId(String authorContractId) {
		this.authorContractId = authorContractId;
	}

	public void setFadadaCaId(String fadadaCaId) {
		this.fadadaCaId = fadadaCaId;
	}

	public Integer getIsNew() {
		return isNew;
	}

	public void setIsNew(Integer isNew) {
		this.isNew = isNew;
	}

	public String getUsrCustId() {
		return usrCustId;
	}

	public void setUsrCustId(String usrCustId) {
		this.usrCustId = usrCustId;
	}

	public BigDecimal getAwaitInterest() {
		return awaitInterest;
	}

	public void setAwaitInterest(BigDecimal awaitInterest) {
		this.awaitInterest = awaitInterest;
	}

	public BigDecimal getAwaitCapital() {
		return awaitCapital;
	}

	public void setAwaitCapital(BigDecimal awaitCapital) {
		this.awaitCapital = awaitCapital;
	}

	public AbUserBase(){
	}

	public AbUserBase(
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
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	public void setUsername(String value) {
		this.username = value;
	}
	
	public String getUsername() {
		return this.username;
	}
	public void setPayPassword(String value) {
		this.payPassword = value;
	}
	
	public String getPayPassword() {
		return this.payPassword;
	}
	public void setTotal(BigDecimal value) {
		this.total = value;
	}
	
	public BigDecimal getTotal() {
		return this.total;
	}
	public void setBalance(BigDecimal value) {
		this.balance = value;
	}
	
	public BigDecimal getBalance() {
		return this.balance;
	}
	public void setAvlBalance(BigDecimal value) {
		this.avlBalance = value;
	}
	
	public BigDecimal getAvlBalance() {
		return this.avlBalance;
	}
	public void setFrost(BigDecimal value) {
		this.frost = value;
	}
	
	public BigDecimal getFrost() {
		return this.frost;
	}
	public void setAwait(BigDecimal value) {
		this.await = value;
	}
	
	public BigDecimal getAwait() {
		return this.await;
	}
	public void setTenderNum(Integer value) {
		this.tenderNum = value;
	}
	
	public Integer getTenderNum() {
		return this.tenderNum;
	}
	public void setTenderAccount(BigDecimal value) {
		this.tenderAccount = value;
	}
	
	public BigDecimal getTenderAccount() {
		return this.tenderAccount;
	}
	public void setIncome(BigDecimal value) {
		this.income = value;
	}
	
	public BigDecimal getIncome() {
		return this.income;
	}
	public void setExpend(BigDecimal value) {
		this.expend = value;
	}
	
	public BigDecimal getExpend() {
		return this.expend;
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
	public String getUpdateTimeString() {
		return DateConvertUtils.format(getUpdateTime(), FORMAT_UPDATE_TIME);
	}
	public void setUpdateTimeString(String value) {
		setUpdateTime(DateConvertUtils.parse(value, FORMAT_UPDATE_TIME,java.util.Date.class));
	}
	
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}
	public void setUpdateIp(String value) {
		this.updateIp = value;
	}
	
	public String getUpdateIp() {
		return this.updateIp;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("TypeId",getTypeId())
			.append("Username",getUsername())
			.append("PayPassword",getPayPassword())
			.append("Total",getTotal())
			.append("Balance",getBalance())
			.append("AvlBalance",getAvlBalance())
			.append("Frost",getFrost())
			.append("Await",getAwait())
			.append("TenderNum",getTenderNum())
			.append("TenderAccount",getTenderAccount())
			.append("Income",getIncome())
			.append("Expend",getExpend())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.append("UpdateTime",getUpdateTime())
			.append("UpdateIp",getUpdateIp())
			.append("OptId",getOptId())
			.append("AwaitInterest",getAwaitInterest())
			.append("AwaitCapital",getAwaitCapital())
			.append("UsrCustId",getUsrCustId())
			.append("IsNew",getIsNew())
			.append("FadadaCaId",getFadadaCaId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof AbUserBase == false) return false;
		if(this == obj) return true;
		AbUserBase other = (AbUserBase)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

