package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class HjsAccountRechargeQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 7977803571062161306L;
	/** ID */
	private Integer id;
	/** USER_ID */
	private Integer userId;
	/** 对接交易流水号 */
	private String tradeId;
	/** 充值类型/CONFIGID=3 */
	private String type;
	/** 充值状态/CONGIID=4 */
	private Integer status;
	/** 充值金额 */
	private java.math.BigDecimal money;
	/** 费用 */
	private java.math.BigDecimal fee;
	/** 实际充值金额 */
	private java.math.BigDecimal balance;
	/** 支付机构/hjs_payment :ID */
	private Integer paymentId;
	/** 充值返回结果 */
	private String returnContent;
	/** 备注说明 */
	private String remark;
	/** 人工审核用户ID */
	private Integer verifyUserid;
	/** 人工审核时间 */
	private java.util.Date verifyTimeBegin;
	private java.util.Date verifyTimeEnd;
	/** 审核备注 */
	private String verifyRemark;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	/** 汇付银行代码 */
	private String bankId;

	/**
	 * 关键词搜索
	 */
	private String context;
	
	private Integer[] statusArray;
	
	public Integer[] getStatusArray() {
		return statusArray;
	}

	public void setStatusArray(Integer[] statusArray) {
		this.statusArray = statusArray;
	}

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public String getTradeId() {
		return this.tradeId;
	}
	
	public void setTradeId(String value) {
		this.tradeId = value;
	}
	
	public String getType() {
		return this.type;
	}
	
	public void setType(String value) {
		this.type = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public java.math.BigDecimal getMoney() {
		return this.money;
	}
	
	public void setMoney(java.math.BigDecimal value) {
		this.money = value;
	}
	
	public java.math.BigDecimal getFee() {
		return this.fee;
	}
	
	public void setFee(java.math.BigDecimal value) {
		this.fee = value;
	}
	
	public java.math.BigDecimal getBalance() {
		return this.balance;
	}
	
	public void setBalance(java.math.BigDecimal value) {
		this.balance = value;
	}
	
	public Integer getPaymentId() {
		return this.paymentId;
	}
	
	public void setPaymentId(Integer value) {
		this.paymentId = value;
	}
	
	public String getReturnContent() {
		return this.returnContent;
	}
	
	public void setReturnContent(String value) {
		this.returnContent = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
	}
	
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	
	public java.util.Date getVerifyTimeBegin() {
		return this.verifyTimeBegin;
	}
	
	public void setVerifyTimeBegin(java.util.Date value) {
		this.verifyTimeBegin = value;
	}	
	
	public java.util.Date getVerifyTimeEnd() {
		return this.verifyTimeEnd;
	}
	
	public void setVerifyTimeEnd(java.util.Date value) {
		this.verifyTimeEnd = value;
	}
	
	public String getVerifyRemark() {
		return this.verifyRemark;
	}
	
	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
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

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
}

