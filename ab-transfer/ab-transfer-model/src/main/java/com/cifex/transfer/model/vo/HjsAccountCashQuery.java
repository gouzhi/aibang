package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.page.BaseQuery;
import java.io.Serializable;


public class HjsAccountCashQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -7576999901360241728L;
	/** ID */
	private Integer id;
	/** 用户ID */
	private Integer userId;
	/** 状态0提交1成功 2失败 */
	private Integer status;
	/** 银行表ID/hjs_account_bank */
	private Integer bankId;
	/** 对接交易流水号 */
	private String tradeId;
	/** 银行名称 */
	private String bank;
	/** 银行账户 */
	private String bankAccount;
	/** 提现金额 */
	private java.math.BigDecimal total;
	/** 实际到账金额 */
	private java.math.BigDecimal credited;
	/** 手续费 */
	private java.math.BigDecimal fee;
	/** 人工审核时审核员 */
	private Integer verifyUserid;
	/** VERIFY_TIME */
	private java.util.Date verifyTimeBegin;
	private java.util.Date verifyTimeEnd;
	/** VERIFY_REMARK */
	private String verifyRemark;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
    /**
     * 关键字搜索
     */
	private String context;
	
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
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getBankId() {
		return this.bankId;
	}
	
	public void setBankId(Integer value) {
		this.bankId = value;
	}
	
	public String getTradeId() {
		return this.tradeId;
	}
	
	public void setTradeId(String value) {
		this.tradeId = value;
	}
	
	public String getBank() {
		return this.bank;
	}
	
	public void setBank(String value) {
		this.bank = value;
	}
	
	public String getBankAccount() {
		return this.bankAccount;
	}
	
	public void setBankAccount(String value) {
		this.bankAccount = value;
	}
	
	public java.math.BigDecimal getTotal() {
		return this.total;
	}
	
	public void setTotal(java.math.BigDecimal value) {
		this.total = value;
	}
	
	public java.math.BigDecimal getCredited() {
		return this.credited;
	}
	
	public void setCredited(java.math.BigDecimal value) {
		this.credited = value;
	}
	
	public java.math.BigDecimal getFee() {
		return this.fee;
	}
	
	public void setFee(java.math.BigDecimal value) {
		this.fee = value;
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

