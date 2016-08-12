/**    
 * @filename LoanContract.java     
 * @version www.cifex.com.cn    
 * @String 2015年9月16日     
 */
package com.cifex.framework.utils.contract;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**    
 * 合同模板  
 * @author zeng.fangfang    
 * @String 2015年9月16日   
 */
public class LoanContract implements Serializable{

	/**    
	 * serialVersionUID      
	 * @since Ver 1.1    
	 */    
	private static final long serialVersionUID = -5920851446797445430L;
	
	private String contractCode;//合同编号
	private String partyAUserName;//甲方（出借人）名字
	private String partyAName;//甲方华金所用户名
	private String idCardA;//甲方（出借人）身份证
	private String businessLicence;//甲方营业执照
	private String organizationCode;//组织代码证书
	private String partyBUserName;//乙方 （借入者）名字
	private String partyBName;//甲方华金所用户名
	private String idCardB;//乙方（借入者）身份证号
	private String phoneB;//乙方（借入者）手机号

	public String getPhoneB() {
		return phoneB;
	}

	public void setPhoneB(String phoneB) {
		this.phoneB = phoneB;
	}

	private BigDecimal loanMoney;//甲方借款总金额（人民币 元） 阿拉伯数字
	private String loanMoneyCapital;//甲方借款总金额大写
	private BigDecimal lendMoney;//乙方出借金额（人民币 元） 阿拉伯数字
	private String lendMoneyCapital;//乙方出借金额大写
	private Integer borrowTimeType;//借款期限类型（1天 2月）
	private Integer borrowTime;//借款期限(月份天数)
	private double rate;//借款年利润
	private Integer bonaType;//还款方式
	private String dateTime;//协议签署日期(借款日期)
	private String monthBack;//还款日期
	private String monthStart;//起息日
	private String behoof;//借款用途
	private String monthLoan;//放款日期
	private String monthEnd;//到期日
	private String monthReceive;//乙方预期收款期
	private String enterpriceResgisterNo;//企业登记号
	private String enterpriceName;//债务人
	private BigDecimal recoverAccountWait;//待收本息
	private String recoverAccountWaitCapital;//待收本息金额大写
	private String businessAddr;//乙方所在地
	private String legalPerson;//法人
	private String projectRemark;//项目说明
	private Date currentTime;//生成pdf时间

	public Date getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(Date currentTime) {
		this.currentTime = currentTime;
	}

	public String getProjectRemark() {
		return projectRemark;
	}

	public void setProjectRemark(String projectRemark) {
		this.projectRemark = projectRemark;
	}

	public String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getBusinessAddr() {
		return businessAddr;
	}

	public void setBusinessAddr(String businessAddr) {
		this.businessAddr = businessAddr;
	}

	public void setBonaType(Integer bonaType) {
		this.bonaType = bonaType;
	}

	public BigDecimal getRecoverAccountWait() {
		return recoverAccountWait;
	}

	public void setRecoverAccountWait(BigDecimal recoverAccountWait) {
		this.recoverAccountWait = recoverAccountWait;
	}

	public String getRecoverAccountWaitCapital() {
		return recoverAccountWaitCapital;
	}

	public void setRecoverAccountWaitCapital(String recoverAccountWaitCapital) {
		this.recoverAccountWaitCapital = recoverAccountWaitCapital;
	}

	public String getEnterpriceName() {
		return enterpriceName;
	}

	public void setEnterpriceName(String enterpriceName) {
		this.enterpriceName = enterpriceName;
	}

	public String getEnterpriceResgisterNo() {
		return enterpriceResgisterNo;
	}

	public void setEnterpriceResgisterNo(String enterpriceResgisterNo) {
		this.enterpriceResgisterNo = enterpriceResgisterNo;
	}

	public String getMonthEnd() {
		return monthEnd;
	}

	public void setMonthEnd(String monthEnd) {
		this.monthEnd = monthEnd;
	}

	public String getMonthReceive() {
		return monthReceive;
	}

	public void setMonthReceive(String monthReceive) {
		this.monthReceive = monthReceive;
	}

	private BigDecimal borrowAmountMin;
	private BigDecimal borrowAmountMax;
	private String borrowAmountMinCapital;
	private String borrowAmountMaxCapital;

	public String getBorrowAmountMinCapital() {
		return borrowAmountMinCapital;
	}

	public void setBorrowAmountMinCapital(String borrowAmountMinCapital) {
		this.borrowAmountMinCapital = borrowAmountMinCapital;
	}

	public String getBorrowAmountMaxCapital() {
		return borrowAmountMaxCapital;
	}

	public void setBorrowAmountMaxCapital(String borrowAmountMaxCapital) {
		this.borrowAmountMaxCapital = borrowAmountMaxCapital;
	}

	public BigDecimal getBorrowAmountMin() {
		return borrowAmountMin;
	}

	public void setBorrowAmountMin(BigDecimal borrowAmountMin) {
		this.borrowAmountMin = borrowAmountMin;
	}

	public BigDecimal getBorrowAmountMax() {
		return borrowAmountMax;
	}

	public void setBorrowAmountMax(BigDecimal borrowAmountMax) {
		this.borrowAmountMax = borrowAmountMax;
	}

	public String getMonthLoan() {
		return monthLoan;
	}

	public void setMonthLoan(String monthLoan) {
		this.monthLoan = monthLoan;
	}

	public String getMonthStart() {
		return monthStart;
	}

	public void setMonthStart(String monthStart) {
		this.monthStart = monthStart;
	}

	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getIdCardA() {
		return idCardA;
	}
	public void setIdCardA(String idCardA) {
		this.idCardA = idCardA;
	}
	public String getIdCardB() {
		return idCardB;
	}
	public void setIdCardB(String idCardB) {
		this.idCardB = idCardB;
	}
	public BigDecimal getLoanMoney() {
		return loanMoney;
	}
	public void setLoanMoney(BigDecimal loanMoney) {
		this.loanMoney = loanMoney;
	}
	public Integer getBorrowTimeType() {
		return borrowTimeType;
	}
	public void setBorrowTimeType(Integer borrowTimeType) {
		this.borrowTimeType = borrowTimeType;
	}
	public Integer getBorrowTime() {
		return borrowTime;
	}
	public void setBorrowTime(Integer borrowTime) {
		this.borrowTime = borrowTime;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getBonaType() {
		return bonaType;
	}
	public void setBonaType(int bonaType) {
		this.bonaType = bonaType;
	}
	public String getMonthBack() {
		return monthBack;
	}
	public void setMonthBack(String monthBack) {
		this.monthBack = monthBack;
	}
	public String getBehoof() {
		return behoof;
	}
	public void setBehoof(String behoof) {
		this.behoof = behoof;
	}
	public BigDecimal getLendMoney() {
		return lendMoney;
	}
	public void setLendMoney(BigDecimal lendMoney) {
		this.lendMoney = lendMoney;
	}
	public String getLendMoneyCapital() {
		return lendMoneyCapital;
	}
	public void setLendMoneyCapital(String lendMoneyCapital) {
		this.lendMoneyCapital = lendMoneyCapital;
	}
	public String getPartyAUserName() {
		return partyAUserName;
	}
	public void setPartyAUserName(String partyAUserName) {
		this.partyAUserName = partyAUserName;
	}
	public String getPartyBUserName() {
		return partyBUserName;
	}
	public void setPartyBUserName(String partyBUserName) {
		this.partyBUserName = partyBUserName;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getPartyAName() {
		return partyAName;
	}
	public void setPartyAName(String partyAName) {
		this.partyAName = partyAName;
	}
	public String getPartyBName() {
		return partyBName;
	}
	public void setPartyBName(String partyBName) {
		this.partyBName = partyBName;
	}
	public String getBusinessLicence() {
		return businessLicence;
	}
	public void setBusinessLicence(String businessLicence) {
		this.businessLicence = businessLicence;
	}
	public String getOrganizationCode() {
		return organizationCode;
	}
	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}
	public String getLoanMoneyCapital() {
		return loanMoneyCapital;
	}
	public void setLoanMoneyCapital(String loanMoneyCapital) {
		this.loanMoneyCapital = loanMoneyCapital;
	}
}
