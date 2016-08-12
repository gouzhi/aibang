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

public class HjsAccountCash extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -7167376301345312000L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountCash";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_STATUS = "状态0提交1成功 2失败";
	public static final String ALIAS_BANK_ID = "银行表ID/hjs_account_bank";
	public static final String ALIAS_TRADE_ID = "对接交易流水号";
	public static final String ALIAS_BANK = "银行名称";
	public static final String ALIAS_BANK_ACCOUNT = "银行账户";
	public static final String ALIAS_TOTAL = "提现金额";
	public static final String ALIAS_CREDITED = "实际到账金额";
	public static final String ALIAS_FEE = "手续费";
	public static final String ALIAS_VERIFY_USERID = "人工审核时审核员";
	public static final String ALIAS_VERIFY_TIME = "VERIFY_TIME";
	public static final String ALIAS_VERIFY_REMARK = "VERIFY_REMARK";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_REMARK = "备注";
	//date formats
	public static final String FORMAT_VERIFY_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 用户ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 状态0提交1成功 2失败       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 银行表ID/hjs_account_bank       db_column: BANK_ID 
     */	
	private Integer bankId;
    /**
     * 对接交易流水号       db_column: TRADE_ID 
     */	
	private String tradeId;
    /**
     * 银行名称       db_column: BANK 
     */	
	private String bank;
    /**
     * 银行账户       db_column: BANK_ACCOUNT 
     */	
	private String bankAccount;
    /**
     * 提现金额       db_column: TOTAL 
     */	
	private java.math.BigDecimal total;
    /**
     * 实际到账金额       db_column: CREDITED 
     */	
	private java.math.BigDecimal credited;
    /**
     * 手续费       db_column: FEE 
     */	
	private java.math.BigDecimal fee;
    /**
     * 人工审核时审核员       db_column: VERIFY_USERID 
     */	
	private Integer verifyUserid;
    /**
     * VERIFY_TIME       db_column: VERIFY_TIME 
     */	
	private java.util.Date verifyTime;
    /**
     * VERIFY_REMARK       db_column: VERIFY_REMARK 
     */	
	private String verifyRemark;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 备注       db_column: REMARK 
     */	
	private java.lang.String remark;
	
	
	//columns END

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	public HjsAccountCash(){
	}

	public HjsAccountCash(
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
	public void setBankId(Integer value) {
		this.bankId = value;
	}
	
	public Integer getBankId() {
		return this.bankId;
	}
	public void setTradeId(String value) {
		this.tradeId = value;
	}
	
	public String getTradeId() {
		return this.tradeId;
	}
	public void setBank(String value) {
		this.bank = value;
	}
	
	public String getBank() {
		return this.bank;
	}
	public void setBankAccount(String value) {
		this.bankAccount = value;
	}
	
	public String getBankAccount() {
		return this.bankAccount;
	}
	public void setTotal(java.math.BigDecimal value) {
		this.total = value;
	}
	
	public java.math.BigDecimal getTotal() {
		return this.total;
	}
	public void setCredited(java.math.BigDecimal value) {
		this.credited = value;
	}
	
	public java.math.BigDecimal getCredited() {
		return this.credited;
	}
	public void setFee(java.math.BigDecimal value) {
		this.fee = value;
	}
	
	public java.math.BigDecimal getFee() {
		return this.fee;
	}
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
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
	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
	}
	
	public String getVerifyRemark() {
		return this.verifyRemark;
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
			.append("UserId",getUserId())
			.append("Status",getStatus())
			.append("BankId",getBankId())
			.append("TradeId",getTradeId())
			.append("Bank",getBank())
			.append("BankAccount",getBankAccount())
			.append("Total",getTotal())
			.append("Credited",getCredited())
			.append("Fee",getFee())
			.append("VerifyUserid",getVerifyUserid())
			.append("VerifyTime",getVerifyTime())
			.append("VerifyRemark",getVerifyRemark())
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
		if(obj instanceof HjsAccountCash == false) return false;
		if(this == obj) return true;
		HjsAccountCash other = (HjsAccountCash)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

