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

public class HjsAccountUsers extends BaseEntity implements Serializable{
	 
	private static final long serialVersionUID = -1586239964335681077L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountUsers";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_TYPE = "类型/configid=22";
	public static final String ALIAS_MONEY = "操作金额";
	public static final String ALIAS_INCOME = "收入";
	public static final String ALIAS_EXPEND = "支出";
	public static final String ALIAS_BALANCE = "账户余额";
	public static final String ALIAS_AVL_BALANCE = "可用余额";
	public static final String ALIAS_FROST = "冻结明细，解冻时输入负数";
	public static final String ALIAS_FROST_TOTAL = "冻结(重要:可用余额=账户余额-冻结/账户余额和可用余额均不可为负数即：账户余额必须>=冻结)2";
	public static final String ALIAS_AWAIT = "待收/明细，实际收款时输入负数";
	public static final String ALIAS_AWAIT_TOTAL = "总待收(解冻支出时同时生成待收金额)4";
	public static final String ALIAS_TOTAL = "账户总额（总资产）=余额+待收";
	public static final String ALIAS_INCOME_TOTAL = "总收入";
	public static final String ALIAS_EXPEND_TOTAL = "总支出";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_TO_USERID = "对方用户ID/系统帐户为空";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	
	//date formats
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
     * 类型/configid=22       db_column: TYPE 
     */	
	private Integer type;
    /**
     * 操作金额       db_column: MONEY 
     */	
	private BigDecimal money=new BigDecimal("0.0");
    /**
     * 收入       db_column: INCOME 
     */	
	private BigDecimal income=new BigDecimal("0.0");
    /**
     * 支出       db_column: EXPEND 
     */	
	private BigDecimal expend=new BigDecimal("0.0");
    /**
     * 账户余额       db_column: BALANCE 
     */	
	private BigDecimal balance=new BigDecimal("0.0");
    /**
     * 可用余额       db_column: AVL_BALANCE 
     */	
	private BigDecimal avlBalance=new BigDecimal("0.0");
    /**
     * 冻结明细，解冻时输入负数       db_column: FROST 
     */	
	private BigDecimal frost=new BigDecimal("0.0");
    /**
     * 冻结(重要:可用余额=账户余额-冻结/账户余额和可用余额均不可为负数即：账户余额必须>=冻结)2       db_column: FROST_TOTAL 
     */	
	private BigDecimal frostTotal=new BigDecimal("0.0");
    /**
     * 待收/明细，实际收款时输入负数       db_column: AWAIT 
     */	
	private BigDecimal await=new BigDecimal("0.0");
    /**
     * 总待收(解冻支出时同时生成待收金额)4       db_column: AWAIT_TOTAL 
     */	
	private BigDecimal awaitTotal=new BigDecimal("0.0");
    /**
     * 账户总额（总资产）=余额+待收       db_column: TOTAL 
     */	
	private BigDecimal total=new BigDecimal("0.0");
    /**
     * 总收入       db_column: INCOME_TOTAL 
     */	
	private BigDecimal incomeTotal=new BigDecimal("0.0");
    /**
     * 总支出       db_column: EXPEND_TOTAL 
     */	
	private BigDecimal expendTotal=new BigDecimal("0.0");
    /**
     * 备注       db_column: REMARK 
     */	
	private String remark;
    /**
     * 对方用户ID/系统帐户为空       db_column: TO_USERID 
     */	
	private Integer toUserid;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END
    /**
     * 原始业务单据ID/哪个业务单据产生的该往来记录，便于追溯
     */
	private Integer sourceId;
	/**
	 * 总待收利息(解冻支出时同时生成待收金额)
	 */
	private BigDecimal awaitTotalInterest=new BigDecimal("0.0");
	/**
	 * 总待收本金(解冻支出时同时生成待收金额)
	 */
	private BigDecimal awaitTotalCapital=new BigDecimal("0.0");
	/**
	 * 待收利息
	 */
	private BigDecimal awaitInterest=new BigDecimal("0.0");
	/**
	 * 待收本金
	 */
	private BigDecimal awaitCapital=new BigDecimal("0.0");
	
	
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

	public HjsAccountUsers(){
	}

	public HjsAccountUsers(
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
	public void setType(Integer value) {
		this.type = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	public void setMoney(BigDecimal value) {
		this.money = value;
	}
	
	public BigDecimal getMoney() {
		return this.money;
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
	public void setFrostTotal(BigDecimal value) {
		this.frostTotal = value;
	}
	
	public BigDecimal getFrostTotal() {
		return this.frostTotal;
	}
	public void setAwait(BigDecimal value) {
		this.await = value;
	}
	
	public BigDecimal getAwait() {
		return this.await;
	}
	public void setAwaitTotal(BigDecimal value) {
		this.awaitTotal = value;
	}
	
	public BigDecimal getAwaitTotal() {
		return this.awaitTotal;
	}
	public void setTotal(BigDecimal value) {
		this.total = value;
	}
	
	public BigDecimal getTotal() {
		return this.total;
	}
	public void setIncomeTotal(BigDecimal value) {
		this.incomeTotal = value;
	}
	
	public BigDecimal getIncomeTotal() {
		return this.incomeTotal;
	}
	public void setExpendTotal(BigDecimal value) {
		this.expendTotal = value;
	}
	
	public BigDecimal getExpendTotal() {
		return this.expendTotal;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	public void setToUserid(Integer value) {
		this.toUserid = value;
	}
	
	public Integer getToUserid() {
		return this.toUserid;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	public void setCreateIp(String value) {
		this.createIp = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Type",getType())
			.append("Money",getMoney())
			.append("Income",getIncome())
			.append("Expend",getExpend())
			.append("Balance",getBalance())
			.append("AvlBalance",getAvlBalance())
			.append("Frost",getFrost())
			.append("FrostTotal",getFrostTotal())
			.append("Await",getAwait())
			.append("AwaitTotal",getAwaitTotal())
			.append("Total",getTotal())
			.append("IncomeTotal",getIncomeTotal())
			.append("ExpendTotal",getExpendTotal())
			.append("Remark",getRemark())
			.append("ToUserid",getToUserid())
			.append("OptId",getOptId())
			.append("CreateIp",getCreateIp())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsAccountUsers == false) return false;
		if(this == obj) return true;
		HjsAccountUsers other = (HjsAccountUsers)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public Integer getSourceId() {
		return sourceId;
	}

	public void setSourceId(Integer sourceId) {
		this.sourceId = sourceId;
	}
}

