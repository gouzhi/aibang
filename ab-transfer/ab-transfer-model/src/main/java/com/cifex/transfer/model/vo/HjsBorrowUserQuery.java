package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.page.BaseQuery;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class HjsBorrowUserQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 4901528211949472375L;
	/** ID */
	private Integer id;
	/** 借款产品ID */
	private Integer borrowId;
	/** 项目ID/个人申请表ID */
	private Integer projectId;
	/** 借款用户ID(冗余) */
	private Integer userId;
	/** 借款金额/子表借款金额总和=产品表总借款金额/ 一期一对一，故产品表总金额 */
	private BigDecimal uaccount;
	/** 管理费 */
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
	
	/** 放款到资金池金额 */
	private java.math.BigDecimal poolAccount;
	/** 资金池金额代取时间 */
	private java.util.Date poolOutTimeBegin;
	private java.util.Date poolOutTimeEnd;
	/** 资金池金额状态  0 未取现 1 已取现 */
	private java.lang.Integer poolState;
	/** 取现时备注 */
	private java.lang.String poolMemo;
	

	public java.math.BigDecimal getPoolAccount() {
		return poolAccount;
	}

	public void setPoolAccount(java.math.BigDecimal poolAccount) {
		this.poolAccount = poolAccount;
	}

	public java.util.Date getPoolOutTimeBegin() {
		return poolOutTimeBegin;
	}

	public void setPoolOutTimeBegin(java.util.Date poolOutTimeBegin) {
		this.poolOutTimeBegin = poolOutTimeBegin;
	}

	public java.util.Date getPoolOutTimeEnd() {
		return poolOutTimeEnd;
	}

	public void setPoolOutTimeEnd(java.util.Date poolOutTimeEnd) {
		this.poolOutTimeEnd = poolOutTimeEnd;
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

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getBorrowId() {
		return this.borrowId;
	}
	
	public void setBorrowId(Integer value) {
		this.borrowId = value;
	}
	
	public Integer getProjectId() {
		return this.projectId;
	}
	
	public void setProjectId(Integer value) {
		this.projectId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public BigDecimal getUaccount() {
		return this.uaccount;
	}
	
	public void setUaccount(BigDecimal value) {
		this.uaccount = value;
	}
	
	public BigDecimal getUfee() {
		return this.ufee;
	}
	
	public void setUfee(BigDecimal value) {
		this.ufee = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
}

