package com.aibang.transfer.model.vo;
import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;


public class HjsBorrowQuery extends BaseQuery implements Serializable {
    
	
	private static final long serialVersionUID = -6906028259115072958L;
	/** ID */
	private Integer id;
	/** 担保机构ID */
	private Integer vouchId;
	/** 担保信息 */
	private String vouchRemark;
	/** 项目信息 */
	private String porjectRemark;
	/** 借款企业信息 */
	private String borrowUserRemark;
	/** 借款产品名称/标题 */
	private String bname;
	/** 状态/下架 0/上架1/暂停2 */
	private Integer status;
	/** 借款类型 CONFIGID=8 */
	private Integer borrowType;
	/** 借款对象 CONFIGID=9 */
	private Integer borrowTarget;
	/** 借款用途 CONFIGID=10 */
	private Integer borrowUse;
	/** 借款总额=借款人子表的借款金额的总和 */
	private java.math.BigDecimal account;
	/** 借款期限：天数（30天显示为1个月。锦尚为月） */
	private Integer borrowPeriod;
	/** 借款年化利率（单位为%） */
	private Double borrowApr;
	/** 借款产品图标 */
	private String bpic;
	/** 借款描述 */
	private String borrowContents;
	/** 点击率 */
	private Integer hits;
	/** 评论次数 */
	private Integer commentCount;
	/** 前台排序ID */
	private Integer orderId;
	/** 投标最低限额 */
	private java.math.BigDecimal tenderAccountMin;
	/** 投标最高限额 */
	private java.math.BigDecimal tenderAccountMax;
	/** 投标递增金额（步长） */
	private java.math.BigDecimal tenderAccountStep;
	/** 投标开始时间 */
	private java.util.Date tenderStartTimeBegin;
	private java.util.Date tenderStartTimeEnd;
	/** 投标结束时间 */
	private java.util.Date tenderEndTimeBegin;
	private java.util.Date tenderEndTimeEnd;
	/** 投标进度 : （已借到金额/借款总额*100） */
	private Integer tenderScale;
	/** 已投标的次数 */
	private Integer tenderTimes;
	/** 投标管理费用比率 */
	private java.math.BigDecimal tenderFeeRatio;
	/** 投标管理费用 */
	private java.math.BigDecimal tenderFee;
	/** 还款方式/计息方式/ CONFIGID=11 */
	private Integer repayType;
	/** 已借到金额/已投标金额 */
	private java.math.BigDecimal borrowAccountYes;
	/** 未借到金额 */
	private java.math.BigDecimal borrowAccountWait;
	/** 计息开始时间/借款开始时间（＋借款期限等于借款期间） */
	private java.util.Date borrowStartTimeBegin;
	private java.util.Date borrowStartTimeEnd;
	/** 实际还款时间 */
	private java.util.Date repayTimeYesBegin;
	private java.util.Date repayTimeYesEnd;
	/** 还款总额 */
	private java.math.BigDecimal repayAccountAll;
	/** 还款总利息 */
	private java.math.BigDecimal repayAccountInterest;
	/** 还款总本金 */
	private java.math.BigDecimal repayAccountCapital;
	/** 已还总额 */
	private java.math.BigDecimal repayAccountYes;
	/** 已还利息 */
	private java.math.BigDecimal repayAccountInterestYes;
	/** 已还本金 */
	private java.math.BigDecimal repayAccountCapitalYes;
	/** 未还总额 */
	private java.math.BigDecimal repayAccountWait;
	/** 未还利息 */
	private java.math.BigDecimal repayAccountInterestWait;
	/** 未还本金 */
	private java.math.BigDecimal repayAccountCapitalWait; 
	/** 风控说明 */
	private String windControl;
	/** 合同*/
	private String contractUrl;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 当前审核状态/CONFIGID=23 */
	private Integer verifyStatus;
	/** 审核备注 */
	private String verifyRemark;
	/** 审核人ID */
	private Integer verifyId;
	/** 审核时间 */
	private java.util.Date verifyTimeBegin;
	private java.util.Date verifyTimeEnd;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	private Double borrowAprMin;//最小年化收益率(前台查询产品列表使用)
	private Double borrowAprMax;//最大年化收益率(前台查询产品列表使用)
	private Double tenderAccountMinMin;//最小投资金额(前台查询产品列表使用)
	private Double tenderAccountMinMax;//最大投资金额(前台查询产品列表使用)
	private Integer borrowPeriodMin;//最小投资期限(前台查询产品列表使用)
	private Integer borrowPeriodMax;//最大投资期限(前台查询产品列表使用)
	private Integer sortTag;//前台排序使用标记；//1:默认排序；2.按投资金额排序，3.按投资周期排序
	//保存前台已选择的条件
	private Integer tenderMaxScale; //投资产品进度最大值
    private String borrowAprContext;
    private String borrowPeriodContext;
    private String verifyStatusContext;
    private String tenderAccountContext;
    private Integer[]  verifyStatuss;//投资状态Ids
    private Integer[] investEnd;//投资结束
    private String productName;//用于判断产品名称是否已经存在
    private String auditResult;
    private String fullFlowScale;
    private Integer[]  verifyStatuBg;
    private Integer[] ids;
	/** 合同生成状态  0未生成 1已生成 2生成失败：部分失败置为失败 */
	private java.lang.Integer contractStatus;
	/** 投资人签章状态   0未签章 1已签章 2签章失败  部分失败置为失败 */
	private java.lang.Integer tenderSignStatus;
	/** 借款人签章状态  0未签章 1已签章 2签章失败  部分失败置为失败 */
	private java.lang.Integer borrowerSignStatus;
	/** 平台签章状态   0未签章 1已签章 2签章失败  部分失败置为失败 */
	private java.lang.Integer systemSignStatus;
	/** 归档状态   0未归档 1已归档 2归档失败  部分失败置为失败 */
	private java.lang.Integer fileStatus;

	public Integer getContractStatus() {
		return contractStatus;
	}

	public void setContractStatus(Integer contractStatus) {
		this.contractStatus = contractStatus;
	}

	public Integer getTenderSignStatus() {
		return tenderSignStatus;
	}

	public void setTenderSignStatus(Integer tenderSignStatus) {
		this.tenderSignStatus = tenderSignStatus;
	}

	public Integer getBorrowerSignStatus() {
		return borrowerSignStatus;
	}

	public void setBorrowerSignStatus(Integer borrowerSignStatus) {
		this.borrowerSignStatus = borrowerSignStatus;
	}

	public Integer getSystemSignStatus() {
		return systemSignStatus;
	}

	public void setSystemSignStatus(Integer systemSignStatus) {
		this.systemSignStatus = systemSignStatus;
	}

	public Integer getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(Integer fileStatus) {
		this.fileStatus = fileStatus;
	}

	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

	public Integer[] getVerifyStatuBg() {
		return verifyStatuBg;
	}

	public void setVerifyStatuBg(Integer[] verifyStatuBg) {
		this.verifyStatuBg = verifyStatuBg;
	}

	public String getAuditResult() {
		return auditResult;
	}

	public void setAuditResult(String auditResult) {
		this.auditResult = auditResult;
	}

	public String getFullFlowScale() {
		return fullFlowScale;
	}

	public void setFullFlowScale(String fullFlowScale) {
		this.fullFlowScale = fullFlowScale;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer[] getVerifyStatuss() {
		return verifyStatuss;
	}

	public void setVerifyStatuss(Integer[] verifyStatuss) {
		this.verifyStatuss = verifyStatuss;
	}

	public Integer[] getInvestEnd() {
		return investEnd;
	}

	public void setInvestEnd(Integer[] investEnd) {
		this.investEnd = investEnd;
	}

	public String getBorrowAprContext() {
		return borrowAprContext;
	}

	public void setBorrowAprContext(String borrowAprContext) {
		this.borrowAprContext = borrowAprContext;
	}

	public String getBorrowPeriodContext() {
		return borrowPeriodContext;
	}

	public void setBorrowPeriodContext(String borrowPeriodContext) {
		this.borrowPeriodContext = borrowPeriodContext;
	}

	public String getVerifyStatusContext() {
		return verifyStatusContext;
	}

	public void setVerifyStatusContext(String verifyStatusContext) {
		this.verifyStatusContext = verifyStatusContext;
	}

	public String getTenderAccountContext() {
		return tenderAccountContext;
	}

	public void setTenderAccountContext(String tenderAccountContext) {
		this.tenderAccountContext = tenderAccountContext;
	}

	
	public Integer getSortTag() {
		return sortTag;
	}

	public void setSortTag(Integer sortTag) {
		this.sortTag = sortTag;
	}

	public Double getTenderAccountMinMin() {
		return tenderAccountMinMin;
	}

	public void setTenderAccountMinMin(Double tenderAccountMinMin) {
		this.tenderAccountMinMin = tenderAccountMinMin;
	}

	public Double getTenderAccountMinMax() {
		return tenderAccountMinMax;
	}

	public void setTenderAccountMinMax(Double tenderAccountMinMax) {
		this.tenderAccountMinMax = tenderAccountMinMax;
	}

	public Integer getBorrowPeriodMin() {
		return borrowPeriodMin;
	}

	public void setBorrowPeriodMin(Integer borrowPeriodMin) {
		this.borrowPeriodMin = borrowPeriodMin;
	}

	public Integer getBorrowPeriodMax() {
		return borrowPeriodMax;
	}

	public void setBorrowPeriodMax(Integer borrowPeriodMax) {
		this.borrowPeriodMax = borrowPeriodMax;
	}

	public Double getBorrowAprMin() {
		return borrowAprMin;
	}

	public void setBorrowAprMin(Double borrowAprMin) {
		this.borrowAprMin = borrowAprMin;
	}

	public Double getBorrowAprMax() {
		return borrowAprMax;
	}

	public void setBorrowAprMax(Double borrowAprMax) {
		this.borrowAprMax = borrowAprMax;
	}

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getVouchId() {
		return this.vouchId;
	}
	
	public void setVouchId(Integer value) {
		this.vouchId = value;
	}
	
	public String getVouchRemark() {
		return this.vouchRemark;
	}
	
	public void setVouchRemark(String value) {
		this.vouchRemark = value;
	}
	
	public String getPorjectRemark() {
		return this.porjectRemark;
	}
	
	public void setPorjectRemark(String value) {
		this.porjectRemark = value;
	}
	
	public String getBorrowUserRemark() {
		return this.borrowUserRemark;
	}
	
	public void setBorrowUserRemark(String value) {
		this.borrowUserRemark = value;
	}
	
	public String getBname() {
		return this.bname;
	}
	
	public void setBname(String value) {
		this.bname = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getBorrowType() {
		return this.borrowType;
	}
	
	public void setBorrowType(Integer value) {
		this.borrowType = value;
	}
	
	public Integer getBorrowTarget() {
		return this.borrowTarget;
	}
	
	public void setBorrowTarget(Integer value) {
		this.borrowTarget = value;
	}
	
	public Integer getBorrowUse() {
		return this.borrowUse;
	}
	
	public void setBorrowUse(Integer value) {
		this.borrowUse = value;
	}
	
	public java.math.BigDecimal getAccount() {
		return this.account;
	}
	
	public void setAccount(java.math.BigDecimal value) {
		this.account = value;
	}
	
	public Integer getBorrowPeriod() {
		return this.borrowPeriod;
	}
	
	public void setBorrowPeriod(Integer value) {
		this.borrowPeriod = value;
	}
	
	public Double getBorrowApr() {
		return this.borrowApr;
	}
	
	public void setBorrowApr(Double value) {
		this.borrowApr = value;
	}
	
	public String getBpic() {
		return this.bpic;
	}
	
	public void setBpic(String value) {
		this.bpic = value;
	}
	
	public String getBorrowContents() {
		return this.borrowContents;
	}
	
	public void setBorrowContents(String value) {
		this.borrowContents = value;
	}
	
	public Integer getHits() {
		return this.hits;
	}
	
	public void setHits(Integer value) {
		this.hits = value;
	}
	
	public Integer getCommentCount() {
		return this.commentCount;
	}
	
	public void setCommentCount(Integer value) {
		this.commentCount = value;
	}
	
	public Integer getOrderId() {
		return this.orderId;
	}
	
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
	
	public java.math.BigDecimal getTenderAccountMin() {
		return this.tenderAccountMin;
	}
	
	public void setTenderAccountMin(java.math.BigDecimal value) {
		this.tenderAccountMin = value;
	}
	
	public java.math.BigDecimal getTenderAccountMax() {
		return this.tenderAccountMax;
	}
	
	public void setTenderAccountMax(java.math.BigDecimal value) {
		this.tenderAccountMax = value;
	}
	
	public java.math.BigDecimal getTenderAccountStep() {
		return this.tenderAccountStep;
	}
	
	public void setTenderAccountStep(java.math.BigDecimal value) {
		this.tenderAccountStep = value;
	}
	
	public java.util.Date getTenderStartTimeBegin() {
		return this.tenderStartTimeBegin;
	}
	
	public void setTenderStartTimeBegin(java.util.Date value) {
		this.tenderStartTimeBegin = value;
	}	
	
	public java.util.Date getTenderStartTimeEnd() {
		return this.tenderStartTimeEnd;
	}
	
	public void setTenderStartTimeEnd(java.util.Date value) {
		this.tenderStartTimeEnd = value;
	}
	
	public java.util.Date getTenderEndTimeBegin() {
		return this.tenderEndTimeBegin;
	}
	
	public void setTenderEndTimeBegin(java.util.Date value) {
		this.tenderEndTimeBegin = value;
	}	
	
	public java.util.Date getTenderEndTimeEnd() {
		return this.tenderEndTimeEnd;
	}
	
	public void setTenderEndTimeEnd(java.util.Date value) {
		this.tenderEndTimeEnd = value;
	}
	
	public Integer getTenderScale() {
		return this.tenderScale;
	}
	
	public void setTenderScale(Integer value) {
		this.tenderScale = value;
	}
	
	public Integer getTenderTimes() {
		return this.tenderTimes;
	}
	
	public void setTenderTimes(Integer value) {
		this.tenderTimes = value;
	}
	
	public java.math.BigDecimal getTenderFeeRatio() {
		return this.tenderFeeRatio;
	}
	
	public void setTenderFeeRatio(java.math.BigDecimal value) {
		this.tenderFeeRatio = value;
	}
	
	public java.math.BigDecimal getTenderFee() {
		return this.tenderFee;
	}
	
	public void setTenderFee(java.math.BigDecimal value) {
		this.tenderFee = value;
	}
	
	public Integer getRepayType() {
		return this.repayType;
	}
	
	public void setRepayType(Integer value) {
		this.repayType = value;
	}
	
	public java.math.BigDecimal getBorrowAccountYes() {
		return this.borrowAccountYes;
	}
	
	public void setBorrowAccountYes(java.math.BigDecimal value) {
		this.borrowAccountYes = value;
	}
	
	public java.math.BigDecimal getBorrowAccountWait() {
		return this.borrowAccountWait;
	}
	
	public void setBorrowAccountWait(java.math.BigDecimal value) {
		this.borrowAccountWait = value;
	}
	
	public java.util.Date getBorrowStartTimeBegin() {
		return this.borrowStartTimeBegin;
	}
	
	public void setBorrowStartTimeBegin(java.util.Date value) {
		this.borrowStartTimeBegin = value;
	}	
	
	public java.util.Date getBorrowStartTimeEnd() {
		return this.borrowStartTimeEnd;
	}
	
	public void setBorrowStartTimeEnd(java.util.Date value) {
		this.borrowStartTimeEnd = value;
	}
	
	public java.util.Date getRepayTimeYesBegin() {
		return this.repayTimeYesBegin;
	}
	
	public void setRepayTimeYesBegin(java.util.Date value) {
		this.repayTimeYesBegin = value;
	}	
	
	public java.util.Date getRepayTimeYesEnd() {
		return this.repayTimeYesEnd;
	}
	
	public void setRepayTimeYesEnd(java.util.Date value) {
		this.repayTimeYesEnd = value;
	}
	
	public java.math.BigDecimal getRepayAccountAll() {
		return this.repayAccountAll;
	}
	
	public void setRepayAccountAll(java.math.BigDecimal value) {
		this.repayAccountAll = value;
	}
	
	public java.math.BigDecimal getRepayAccountInterest() {
		return this.repayAccountInterest;
	}
	
	public void setRepayAccountInterest(java.math.BigDecimal value) {
		this.repayAccountInterest = value;
	}
	
	public java.math.BigDecimal getRepayAccountCapital() {
		return this.repayAccountCapital;
	}
	
	public void setRepayAccountCapital(java.math.BigDecimal value) {
		this.repayAccountCapital = value;
	}
	
	public java.math.BigDecimal getRepayAccountYes() {
		return this.repayAccountYes;
	}
	
	public void setRepayAccountYes(java.math.BigDecimal value) {
		this.repayAccountYes = value;
	}
	
	public java.math.BigDecimal getRepayAccountInterestYes() {
		return this.repayAccountInterestYes;
	}
	
	public void setRepayAccountInterestYes(java.math.BigDecimal value) {
		this.repayAccountInterestYes = value;
	}
	
	public java.math.BigDecimal getRepayAccountCapitalYes() {
		return this.repayAccountCapitalYes;
	}
	
	public void setRepayAccountCapitalYes(java.math.BigDecimal value) {
		this.repayAccountCapitalYes = value;
	}
	
	public java.math.BigDecimal getRepayAccountWait() {
		return this.repayAccountWait;
	}
	
	public void setRepayAccountWait(java.math.BigDecimal value) {
		this.repayAccountWait = value;
	}
	
	public java.math.BigDecimal getRepayAccountInterestWait() {
		return this.repayAccountInterestWait;
	}
	
	public void setRepayAccountInterestWait(java.math.BigDecimal value) {
		this.repayAccountInterestWait = value;
	}
	
	public java.math.BigDecimal getRepayAccountCapitalWait() {
		return this.repayAccountCapitalWait;
	}
	
	public void setRepayAccountCapitalWait(java.math.BigDecimal value) {
		this.repayAccountCapitalWait = value;
	}
	
	public String getWindControl() {
		return this.windControl;
	}
	
	public void setWindControl(String value) {
		this.windControl = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getVerifyStatus() {
		return this.verifyStatus;
	}
	
	public void setVerifyStatus(Integer value) {
		this.verifyStatus = value;
	}
	
	public String getVerifyRemark() {
		return this.verifyRemark;
	}
	
	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
	}
	
	public Integer getVerifyId() {
		return this.verifyId;
	}
	
	public void setVerifyId(Integer value) {
		this.verifyId = value;
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

	public Integer getTenderMaxScale() {
		return tenderMaxScale;
	}

	public void setTenderMaxScale(Integer tenderMaxScale) {
		this.tenderMaxScale = tenderMaxScale;
	}
	public String getContractUrl() {
		return contractUrl;
	}

	public void setContractUrl(String contractUrl) {
		this.contractUrl = contractUrl;
	}
}

