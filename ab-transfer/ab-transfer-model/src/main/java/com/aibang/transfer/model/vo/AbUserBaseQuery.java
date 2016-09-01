package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;
import java.math.BigDecimal;


public class AbUserBaseQuery extends BaseQuery implements Serializable {
    
 
	private static final long serialVersionUID = 3015120708918985175L;
	/** ID */
	private Integer id;
	/** CONFIGID=26/账户类型 */
	private Integer typeId;
	/** 创建者登录用户名 */
	private String username;
	/** 密码 */
	private String payPassword;
	/** 账户总额=余额+待收 */
	private BigDecimal total;
	/** 账户余额=可用+冻结 */
	private BigDecimal balance;
	/** 可用余额 */
	private BigDecimal avlBalance;
	/** 冻结总额 */
	private BigDecimal frost;
	/** 待收总额 */
	private BigDecimal await;
	/** 投资总次数 */
	private Integer tenderNum;
	/** 投资总额 */
	private BigDecimal tenderAccount;
	/** 总收入 */
	private BigDecimal income;
	/** 总支出 */
	private BigDecimal expend;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	/** 更新时间 */
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	/** 更新时IP */
	private String updateIp;
	/** 操作员ID  后台界面录入时需填写 */
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
	 * 会员
	 */
	private Integer userId;
	/**
	 * 汇付会员号
	 */
	private String usrCustId;
	/** 是否新手  默认是新手:1    否，不是新手:0  */
	private Integer isNew;
	
	/** 法大大客户编号-CA证书客户编号 */
	private String fadadaCaId;
	
	
	
	public String getFadadaCaId() {
		return fadadaCaId;
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
	
	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	
	public void setTypeId(Integer value) {
		this.typeId = value;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String value) {
		this.username = value;
	}
	
	public String getPayPassword() {
		return this.payPassword;
	}
	
	public void setPayPassword(String value) {
		this.payPassword = value;
	}
	
	public BigDecimal getTotal() {
		return this.total;
	}
	
	public void setTotal(BigDecimal value) {
		this.total = value;
	}
	
	public BigDecimal getBalance() {
		return this.balance;
	}
	
	public void setBalance(BigDecimal value) {
		this.balance = value;
	}
	
	public BigDecimal getAvlBalance() {
		return this.avlBalance;
	}
	
	public void setAvlBalance(BigDecimal value) {
		this.avlBalance = value;
	}
	
	public BigDecimal getFrost() {
		return this.frost;
	}
	
	public void setFrost(BigDecimal value) {
		this.frost = value;
	}
	
	public BigDecimal getAwait() {
		return this.await;
	}
	
	public void setAwait(BigDecimal value) {
		this.await = value;
	}
	
	public Integer getTenderNum() {
		return this.tenderNum;
	}
	
	public void setTenderNum(Integer value) {
		this.tenderNum = value;
	}
	
	public BigDecimal getTenderAccount() {
		return this.tenderAccount;
	}
	
	public void setTenderAccount(BigDecimal value) {
		this.tenderAccount = value;
	}
	
	public BigDecimal getIncome() {
		return this.income;
	}
	
	public void setIncome(BigDecimal value) {
		this.income = value;
	}
	
	public BigDecimal getExpend() {
		return this.expend;
	}
	
	public void setExpend(BigDecimal value) {
		this.expend = value;
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
	
	public java.util.Date getUpdateTimeBegin() {
		return this.updateTimeBegin;
	}
	
	public void setUpdateTimeBegin(java.util.Date value) {
		this.updateTimeBegin = value;
	}	
	
	public java.util.Date getUpdateTimeEnd() {
		return this.updateTimeEnd;
	}
	
	public void setUpdateTimeEnd(java.util.Date value) {
		this.updateTimeEnd = value;
	}
	
	public String getUpdateIp() {
		return this.updateIp;
	}
	
	public void setUpdateIp(String value) {
		this.updateIp = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(Integer value) {
		this.optId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	/**
	 * 关键字搜索
	 */
	private String context;
	
	public String getContext() {
		return context;
	}
	
	public void setContext(String context) {
		this.context = context;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}

