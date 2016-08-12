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

public class HjsAccountRecharge extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -7950002312517413230L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountRecharge";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "USER_ID";
	public static final String ALIAS_TRADE_ID = "对接交易流水号";
	public static final String ALIAS_TYPE = "充值类型/CONFIGID=3";
	public static final String ALIAS_STATUS = "充值状态/CONGIID=4";
	public static final String ALIAS_MONEY = "充值金额";
	public static final String ALIAS_FEE = "费用";
	public static final String ALIAS_BALANCE = "实际充值金额";
	public static final String ALIAS_PAYMENT_ID = "支付机构/hjs_payment :ID";
	public static final String ALIAS_RETURN_CONTENT = "充值返回结果";
	public static final String ALIAS_REMARK = "备注说明";
	public static final String ALIAS_VERIFY_USERID = "人工审核用户ID";
	public static final String ALIAS_VERIFY_TIME = "人工审核时间";
	public static final String ALIAS_VERIFY_REMARK = "审核备注";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_BANK_ID="汇付银行代码";
	
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
     * USER_ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 对接交易流水号       db_column: TRADE_ID 
     */	
	private String tradeId;
    /**
     * 充值类型/CONFIGID=3       db_column: TYPE 
     */	
	private Integer type;
    /**
     * 充值状态/CONGIID=4       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 充值金额       db_column: MONEY 
     */	
	private java.math.BigDecimal money;
    /**
     * 费用       db_column: FEE 
     */	
	private java.math.BigDecimal fee;
    /**
     * 实际充值金额       db_column: BALANCE 
     */	
	private java.math.BigDecimal balance;
    /**
     * 支付机构/hjs_payment :ID       db_column: PAYMENT_ID 
     */	
	private Integer paymentId;
    /**
     * 充值返回结果       db_column: RETURN_CONTENT 
     */	
	private String returnContent;
    /**
     * 备注说明       db_column: REMARK 
     */	
	private String remark;
    /**
     * 人工审核用户ID       db_column: VERIFY_USERID 
     */	
	private Integer verifyUserid;
    /**
     * 人工审核时间       db_column: VERIFY_TIME 
     */	
	private java.util.Date verifyTime;
    /**
     * 审核备注       db_column: VERIFY_REMARK 
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
	//columns END

	private String bankId;
	
	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public HjsAccountRecharge(){
	}

	public HjsAccountRecharge(
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
	public void setTradeId(String value) {
		this.tradeId = value;
	}
	
	public String getTradeId() {
		return this.tradeId;
	}
	public void setType(Integer value) {
		this.type = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setMoney(java.math.BigDecimal value) {
		this.money = value;
	}
	
	public java.math.BigDecimal getMoney() {
		return this.money;
	}
	public void setFee(java.math.BigDecimal value) {
		this.fee = value;
	}
	
	public java.math.BigDecimal getFee() {
		return this.fee;
	}
	public void setBalance(java.math.BigDecimal value) {
		this.balance = value;
	}
	
	public java.math.BigDecimal getBalance() {
		return this.balance;
	}
	public void setPaymentId(Integer value) {
		this.paymentId = value;
	}
	
	public Integer getPaymentId() {
		return this.paymentId;
	}
	public void setReturnContent(String value) {
		this.returnContent = value;
	}
	
	public String getReturnContent() {
		return this.returnContent;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
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
			.append("TradeId",getTradeId())
			.append("Type",getType())
			.append("Status",getStatus())
			.append("Money",getMoney())
			.append("Fee",getFee())
			.append("Balance",getBalance())
			.append("PaymentId",getPaymentId())
			.append("ReturnContent",getReturnContent())
			.append("Remark",getRemark())
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
		if(obj instanceof HjsAccountRecharge == false) return false;
		if(this == obj) return true;
		HjsAccountRecharge other = (HjsAccountRecharge)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

