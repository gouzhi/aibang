package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.page.BaseQuery;

import java.io.Serializable;
import java.math.BigDecimal;


public class HjsAccountUsersQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -7070920098691480860L;
	/** ID */
	private Integer id;
	/** 用户ID */
	private Integer userId;
	/** 类型/configid=22 */
	private Integer type;
	/** 操作金额 */
	private BigDecimal money;
	/** 收入 */
	private BigDecimal income;
	/** 支出 */
	private BigDecimal expend;
	/** 是否有收入支出金额变化*/
	private Boolean hasMoneyChange;
	/** 账户余额 */
	private BigDecimal balance;
	/** 可用余额 */
	private BigDecimal avlBalance;
	/** 冻结明细，解冻时输入负数 */
	private BigDecimal frost;
	/** 冻结(重要:可用余额=账户余额-冻结/账户余额和可用余额均不可为负数即：账户余额必须>=冻结)2 */
	private BigDecimal frostTotal;
	/** 待收/明细，实际收款时输入负数 */
	private BigDecimal await;
	/** 总待收(解冻支出时同时生成待收金额)4 */
	private BigDecimal awaitTotal;
	/** 账户总额（总资产）=余额+待收 */
	private BigDecimal total;
	/** 总收入 */
	private BigDecimal incomeTotal;
	/** 总支出 */
	private BigDecimal expendTotal;
	/** 备注 */
	private String remark;
	/** 对方用户ID/系统帐户为空 */
	private Integer toUserid;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 创建时IP */
	private String createIp;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/**类型逗号分隔*/
	private String typesString;
	/**
	 * 总待收利息(解冻支出时同时生成待收金额)
	 */
	private BigDecimal awaitTotalInterest;
	/**
	 * 总待收本金(解冻支出时同时生成待收金额)
	 */
	private BigDecimal awaitTotalCapital;
	/**
	 * 待收利息
	 */
	private BigDecimal awaitInterest;
	/**
	 * 待收本金
	 */
	private BigDecimal awaitCapital;
 
	
	public BigDecimal getAwaitTotalInterest() {
		return awaitTotalInterest;
	}

	public void setAwaitTotalInterest(BigDecimal awaitTotalInterest) {
		this.awaitTotalInterest = awaitTotalInterest;
	}

	public BigDecimal getAwaitTotalCapital() {
		return awaitTotalCapital;
	}

	public void setAwaitTotalCapital(BigDecimal awaitTotalCapital) {
		this.awaitTotalCapital = awaitTotalCapital;
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

	/**
     * 原始业务单据ID/哪个业务单据产生的该往来记录，便于追溯
     */
	private Integer sourceId;
	
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
	
	public Integer getType() {
		return this.type;
	}
	
	public void setType(Integer value) {
		this.type = value;
	}
	
	public BigDecimal getMoney() {
		return this.money;
	}
	
	public void setMoney(BigDecimal value) {
		this.money = value;
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
	
	public BigDecimal getFrostTotal() {
		return this.frostTotal;
	}
	
	public void setFrostTotal(BigDecimal value) {
		this.frostTotal = value;
	}
	
	public BigDecimal getAwait() {
		return this.await;
	}
	
	public void setAwait(BigDecimal value) {
		this.await = value;
	}
	
	public BigDecimal getAwaitTotal() {
		return this.awaitTotal;
	}
	
	public void setAwaitTotal(BigDecimal value) {
		this.awaitTotal = value;
	}
	
	public BigDecimal getTotal() {
		return this.total;
	}
	
	public void setTotal(BigDecimal value) {
		this.total = value;
	}
	
	public BigDecimal getIncomeTotal() {
		return this.incomeTotal;
	}
	
	public void setIncomeTotal(BigDecimal value) {
		this.incomeTotal = value;
	}
	
	public BigDecimal getExpendTotal() {
		return this.expendTotal;
	}
	
	public void setExpendTotal(BigDecimal value) {
		this.expendTotal = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public Integer getToUserid() {
		return this.toUserid;
	}
	
	public void setToUserid(Integer value) {
		this.toUserid = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
	}
	
	public void setCreateIp(String value) {
		this.createIp = value;
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

	public Integer getSourceId() {
		return sourceId;
	}

	public void setSourceId(Integer sourceId) {
		this.sourceId = sourceId;
	}

	public String getTypesString() {
		return typesString;
	}

	public void setTypesString(String typesString) {
		this.typesString = typesString;
	}

	public Boolean getHasMoneyChange() {
		return hasMoneyChange;
	}

	public void setHasMoneyChange(Boolean hasMoneyChange) {
		this.hasMoneyChange = hasMoneyChange;
	}

	 
}

	
