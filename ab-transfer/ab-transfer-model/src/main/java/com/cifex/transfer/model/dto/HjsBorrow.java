/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.cifex.transfer.model.dto;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

public class HjsBorrow extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -1907614140659189879L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrow";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_VOUCH_ID = "担保机构ID";
	public static final String ALIAS_VOUCH_REMARK = "担保信息";
	public static final String ALIAS_PORJECT_REMARK = "项目信息";
	public static final String ALIAS_BORROW_USER_REMARK = "借款企业信息";
	public static final String ALIAS_BNAME = "借款产品名称/标题";
	public static final String ALIAS_STATUS = "状态/下架 0/上架1/暂停2";
	public static final String ALIAS_BORROW_TYPE = "借款类型 CONFIGID=8";
	public static final String ALIAS_BORROW_TARGET = "借款对象 CONFIGID=9";
	public static final String ALIAS_BORROW_USE = "借款用途 CONFIGID=10";
	public static final String ALIAS_ACCOUNT = "借款总额=借款人子表的借款金额的总和";
	public static final String ALIAS_BORROW_PERIOD = "借款期限：天数（30天显示为1个月。锦尚为月）";
	public static final String ALIAS_BORROW_APR = "借款年化利率（单位为%）";
	public static final String ALIAS_BPIC = "借款产品图标";
	public static final String ALIAS_BORROW_CONTENTS = "借款描述";
	public static final String ALIAS_HITS = "点击率";
	public static final String ALIAS_COMMENT_COUNT = "评论次数";
	public static final String ALIAS_ORDER_ID = "前台排序ID";
	public static final String ALIAS_TENDER_ACCOUNT_MIN = "投标最低限额";
	public static final String ALIAS_TENDER_ACCOUNT_MAX = "投标最高限额";
	public static final String ALIAS_TENDER_ACCOUNT_STEP = "投标递增金额（步长）";
	public static final String ALIAS_TENDER_START_TIME = "投标开始时间";
	public static final String ALIAS_TENDER_END_TIME = "投标结束时间";
	public static final String ALIAS_TENDER_SCALE = "投标进度 : （已借到金额/借款总额*100）";
	public static final String ALIAS_TENDER_TIMES = "已投标的次数";
	public static final String ALIAS_TENDER_FEE_RATIO = "投标管理费用比率";
	public static final String ALIAS_TENDER_FEE = "投标管理费用";
	public static final String ALIAS_REPAY_TYPE = "还款方式/计息方式/ CONFIGID=11";
	public static final String ALIAS_BORROW_ACCOUNT_YES = "已借到金额/已投标金额";
	public static final String ALIAS_BORROW_ACCOUNT_WAIT = "未借到金额";
	public static final String ALIAS_BORROW_START_TIME = "计息开始时间/借款开始时间（＋借款期限等于借款期间）";
	public static final String ALIAS_REPAY_TIME_YES = "实际还款时间";
	public static final String ALIAS_REPAY_ACCOUNT_ALL = "还款总额";
	public static final String ALIAS_REPAY_ACCOUNT_INTEREST = "还款总利息";
	public static final String ALIAS_REPAY_ACCOUNT_CAPITAL = "还款总本金";
	public static final String ALIAS_REPAY_ACCOUNT_YES = "已还总额";
	public static final String ALIAS_REPAY_ACCOUNT_INTEREST_YES = "已还利息";
	public static final String ALIAS_REPAY_ACCOUNT_CAPITAL_YES = "已还本金";
	public static final String ALIAS_REPAY_ACCOUNT_WAIT = "未还总额";
	public static final String ALIAS_REPAY_ACCOUNT_INTEREST_WAIT = "未还利息";
	public static final String ALIAS_REPAY_ACCOUNT_CAPITAL_WAIT = "未还本金";
	public static final String ALIAS_WIND_CONTROL = "风控说明";
	public static final String ALIAS_CONTRACT_URL = "合同";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_VERIFY_STATUS = "当前审核状态/CONFIGID=23";
	public static final String ALIAS_VERIFY_REMARK = "审核备注";
	public static final String ALIAS_VERIFY_ID = "审核人ID";
	public static final String ALIAS_VERIFY_TIME = "审核时间";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_AREA_CODE = "地区编码——汇付地区编码";
	//date formats
	public static final String FORMAT_TENDER_START_TIME = DATE_FORMAT;
	public static final String FORMAT_TENDER_END_TIME = DATE_FORMAT;
	public static final String FORMAT_BORROW_START_TIME = DATE_FORMAT;
	public static final String FORMAT_REPAY_TIME_YES = DATE_FORMAT;
	public static final String FORMAT_VERIFY_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 担保机构ID       db_column: VOUCH_ID 
     */	
	private Integer vouchId;
    /**
     * 担保信息       db_column: VOUCH_REMARK 
     */	
	private String vouchRemark;
    /**
     * 项目信息       db_column: PORJECT_REMARK 
     */	
	private String porjectRemark;
    /**
     * 借款企业信息       db_column: BORROW_USER_REMARK 
     */	
	private String borrowUserRemark;
    /**
     * 借款产品名称/标题       db_column: B_NAME 
     */	
	private String bname;
    /**
     * 状态/下架 0/上架1/暂停2       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 借款类型 CONFIGID=8       db_column: BORROW_TYPE 
     */	
	private Integer borrowType;
    /**
     * 借款对象 CONFIGID=9       db_column: BORROW_TARGET 
     */	
	private Integer borrowTarget;
    /**
     * 借款用途 CONFIGID=10       db_column: BORROW_USE 
     */	
	private Integer borrowUse;
    /**
     * 借款总额=借款人子表的借款金额的总和       db_column: ACCOUNT 
     */	
	private java.math.BigDecimal account;
    /**
     * 借款期限：月数（30天显示为1个月。锦尚为月）       db_column: BORROW_PERIOD 
     */	
	private Integer borrowPeriod;
    /**
     * 借款年化利率（单位为%）       db_column: BORROW_APR 
     */	
	private Double borrowApr;
    /**
     * 借款产品图标       db_column: B_PIC 
     */	
	private String bpic;
    /**
     * 借款描述       db_column: BORROW_CONTENTS 
     */	
	private String borrowContents;
    /**
     * 点击率       db_column: HITS 
     */	
	private Integer hits;
    /**
     * 评论次数       db_column: COMMENT_COUNT 
     */	
	private Integer commentCount;
    /**
     * 前台排序ID       db_column: ORDER_ID 
     */	
	private Integer orderId;
    /**
     * 投标最低限额       db_column: TENDER_ACCOUNT_MIN 
     */	
	private java.math.BigDecimal tenderAccountMin;
    /**
     * 投标最高限额       db_column: TENDER_ACCOUNT_MAX 
     */	
	private java.math.BigDecimal tenderAccountMax;
    /**
     * 投标递增金额（步长）       db_column: TENDER_ACCOUNT_STEP 
     */	
	private java.math.BigDecimal tenderAccountStep;
    /**
     * 投标开始时间       db_column: TENDER_START_TIME 
     */	
	private java.util.Date tenderStartTime;
    /**
     * 投标结束时间       db_column: TENDER_END_TIME 
     */	
	private java.util.Date tenderEndTime;
    /**
     * 投标进度 : （已借到金额/借款总额*100）       db_column: TENDER_SCALE 
     */	
	private Integer tenderScale;
    /**
     * 已投标的次数       db_column: TENDER_TIMES 
     */	
	private Integer tenderTimes;
    /**
     * 投标管理费用比率       db_column: TENDER_FEE_RATIO 
     */	
	private java.math.BigDecimal tenderFeeRatio;
    /**
     * 投标管理费用       db_column: TENDER_FEE 
     */	
	private java.math.BigDecimal tenderFee;
    /**
     * 还款方式/计息方式/ CONFIGID=11       db_column: REPAY_TYPE 
     */	
	private Integer repayType;
    /**
     * 已借到金额/已投标金额       db_column: BORROW_ACCOUNT_YES 
     */	
	private java.math.BigDecimal borrowAccountYes;
    /**
     * 未借到金额       db_column: BORROW_ACCOUNT_WAIT 
     */	
	private java.math.BigDecimal borrowAccountWait;
    /**
     * 计息开始时间/借款开始时间（＋借款期限等于借款期间）       db_column: BORROW_START_TIME 
     */	
	private java.util.Date borrowStartTime;
    /**
     * 实际还款时间       db_column: REPAY_TIME_YES 
     */	
	private java.util.Date repayTimeYes;
    /**
     * 还款总额       db_column: REPAY_ACCOUNT_ALL 
     */	
	private java.math.BigDecimal repayAccountAll;
    /**
     * 还款总利息       db_column: REPAY_ACCOUNT_INTEREST 
     */	
	private java.math.BigDecimal repayAccountInterest;
    /**
     * 还款总本金       db_column: REPAY_ACCOUNT_CAPITAL 
     */	
	private java.math.BigDecimal repayAccountCapital;
    /**
     * 已还总额       db_column: REPAY_ACCOUNT_YES 
     */	
	private java.math.BigDecimal repayAccountYes;
    /**
     * 已还利息       db_column: REPAY_ACCOUNT_INTEREST_YES 
     */	
	private java.math.BigDecimal repayAccountInterestYes;
    /**
     * 已还本金       db_column: REPAY_ACCOUNT_CAPITAL_YES 
     */	
	private java.math.BigDecimal repayAccountCapitalYes;
    /**
     * 未还总额       db_column: REPAY_ACCOUNT_WAIT 
     */	
	private java.math.BigDecimal repayAccountWait;
    /**
     * 未还利息       db_column: REPAY_ACCOUNT_INTEREST_WAIT 
     */	
	private java.math.BigDecimal repayAccountInterestWait;
    /**
     * 未还本金       db_column: REPAY_ACCOUNT_CAPITAL_WAIT 
     */	
	private java.math.BigDecimal repayAccountCapitalWait;
    /**
     * 风控说明       db_column: WIND_CONTROL 
     */	
	private String windControl;
	
	/**
	 * 合同     db_column: CONTRACT_URL 
	 */
	private String contractUrl;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 当前审核状态/CONFIGID=23       db_column: VERIFY_STATUS 
     */	
	private Integer verifyStatus;
    /**
     * 审核备注       db_column: VERIFY_REMARK 
     */	
	private String verifyRemark;
    /**
     * 审核人ID       db_column: VERIFY_ID 
     */	
	private Integer verifyId;
    /**
     * 审核时间       db_column: VERIFY_TIME 
     */	
	private java.util.Date verifyTime;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	private String areaCode;//地区编码;
	/**
	 * 合同生成状态  0未生成 1已生成 2生成失败：部分失败置为失败       db_column: CONTRACT_STATUS
	 */
	private java.lang.Integer contractStatus;
	/**
	 * 投资人签章状态   0未签章 1已签章 2签章失败  部分失败置为失败       db_column: TENDER_SIGN_STATUS
	 */
	private java.lang.Integer tenderSignStatus;
	/**
	 * 借款人签章状态  0未签章 1已签章 2签章失败  部分失败置为失败       db_column: BORROWER_SIGN_STATUS
	 */
	private java.lang.Integer borrowerSignStatus;
	/**
	 * 平台签章状态   0未签章 1已签章 2签章失败  部分失败置为失败       db_column: SYSTEM_SIGN_STATUS
	 */
	private java.lang.Integer systemSignStatus;
	/**
	 * 归档状态   0未归档 1已归档 2归档失败  部分失败置为失败       db_column: FILE_STATUS
	 */
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
	//columns END
    
	public HjsBorrow(){
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public HjsBorrow(
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
	public void setVouchId(Integer value) {
		this.vouchId = value;
	}
	
	public Integer getVouchId() {
		return this.vouchId;
	}
	public void setVouchRemark(String value) {
		this.vouchRemark = value;
	}
	
	public String getVouchRemark() {
		return this.vouchRemark;
	}
	public void setPorjectRemark(String value) {
		this.porjectRemark = value;
	}
	
	public String getPorjectRemark() {
		return this.porjectRemark;
	}
	public void setBorrowUserRemark(String value) {
		this.borrowUserRemark = value;
	}
	
	public String getBorrowUserRemark() {
		return this.borrowUserRemark;
	}
	public void setBname(String value) {
		this.bname = value;
	}
	
	public String getBname() {
		return this.bname;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setBorrowType(Integer value) {
		this.borrowType = value;
	}
	
	public Integer getBorrowType() {
		return this.borrowType;
	}
	public void setBorrowTarget(Integer value) {
		this.borrowTarget = value;
	}
	
	public Integer getBorrowTarget() {
		return this.borrowTarget;
	}
	public void setBorrowUse(Integer value) {
		this.borrowUse = value;
	}
	
	public Integer getBorrowUse() {
		return this.borrowUse;
	}
	public void setAccount(java.math.BigDecimal value) {
		this.account = value;
	}
	
	public java.math.BigDecimal getAccount() {
		return this.account;
	}
	public void setBorrowPeriod(Integer value) {
		this.borrowPeriod = value;
	}
	
	public Integer getBorrowPeriod() {
		return this.borrowPeriod;
	}
	public void setBorrowApr(Double value) {
		this.borrowApr = value;
	}
	
	public Double getBorrowApr() {
		return this.borrowApr;
	}
	public void setBpic(String value) {
		this.bpic = value;
	}
	
	public String getBpic() {
		return this.bpic;
	}
	public void setBorrowContents(String value) {
		this.borrowContents = value;
	}
	
	public String getBorrowContents() {
		return this.borrowContents;
	}
	public void setHits(Integer value) {
		this.hits = value;
	}
	
	public Integer getHits() {
		return this.hits;
	}
	public void setCommentCount(Integer value) {
		this.commentCount = value;
	}
	
	public Integer getCommentCount() {
		return this.commentCount;
	}
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
	
	public Integer getOrderId() {
		return this.orderId;
	}
	public void setTenderAccountMin(java.math.BigDecimal value) {
		this.tenderAccountMin = value;
	}
	
	public java.math.BigDecimal getTenderAccountMin() {
		return this.tenderAccountMin;
	}
	public void setTenderAccountMax(java.math.BigDecimal value) {
		this.tenderAccountMax = value;
	}
	
	public java.math.BigDecimal getTenderAccountMax() {
		return this.tenderAccountMax;
	}
	public void setTenderAccountStep(java.math.BigDecimal value) {
		this.tenderAccountStep = value;
	}
	
	public java.math.BigDecimal getTenderAccountStep() {
		return this.tenderAccountStep;
	}
	public String getTenderStartTimeString() {
		return DateConvertUtils.format(getTenderStartTime(), FORMAT_TENDER_START_TIME);
	}
	public void setTenderStartTimeString(String value) {
		setTenderStartTime(DateConvertUtils.parse(value, FORMAT_TENDER_START_TIME,java.util.Date.class));
	}
	
	public void setTenderStartTime(java.util.Date value) {
		this.tenderStartTime = value;
	}
	
	public java.util.Date getTenderStartTime() {
		return this.tenderStartTime;
	}
	public String getTenderEndTimeString() {
		return DateConvertUtils.format(getTenderEndTime(), FORMAT_TENDER_END_TIME);
	}
	public void setTenderEndTimeString(String value) {
		setTenderEndTime(DateConvertUtils.parse(value, FORMAT_TENDER_END_TIME,java.util.Date.class));
	}
	
	public void setTenderEndTime(java.util.Date value) {
		this.tenderEndTime = value;
	}
	
	public java.util.Date getTenderEndTime() {
		return this.tenderEndTime;
	}
	public void setTenderScale(Integer value) {
		this.tenderScale = value;
	}
	
	public Integer getTenderScale() {
		return this.tenderScale;
	}
	public void setTenderTimes(Integer value) {
		this.tenderTimes = value;
	}
	
	public Integer getTenderTimes() {
		return this.tenderTimes;
	}
	public void setTenderFeeRatio(java.math.BigDecimal value) {
		this.tenderFeeRatio = value;
	}
	
	public java.math.BigDecimal getTenderFeeRatio() {
		return this.tenderFeeRatio;
	}
	public void setTenderFee(java.math.BigDecimal value) {
		this.tenderFee = value;
	}
	
	public java.math.BigDecimal getTenderFee() {
		return this.tenderFee;
	}
	public void setRepayType(Integer value) {
		this.repayType = value;
	}
	
	public Integer getRepayType() {
		return this.repayType;
	}
	public void setBorrowAccountYes(java.math.BigDecimal value) {
		this.borrowAccountYes = value;
	}
	
	public java.math.BigDecimal getBorrowAccountYes() {
		return this.borrowAccountYes;
	}
	public void setBorrowAccountWait(java.math.BigDecimal value) {
		this.borrowAccountWait = value;
	}
	
	public java.math.BigDecimal getBorrowAccountWait() {
		return this.borrowAccountWait;
	}
	public String getBorrowStartTimeString() {
		return DateConvertUtils.format(getBorrowStartTime(), FORMAT_BORROW_START_TIME);
	}
	public void setBorrowStartTimeString(String value) {
		setBorrowStartTime(DateConvertUtils.parse(value, FORMAT_BORROW_START_TIME,java.util.Date.class));
	}
	
	public void setBorrowStartTime(java.util.Date value) {
		this.borrowStartTime = value;
	}
	
	public java.util.Date getBorrowStartTime() {
		return this.borrowStartTime;
	}
	public String getRepayTimeYesString() {
		return DateConvertUtils.format(getRepayTimeYes(), FORMAT_REPAY_TIME_YES);
	}
	public void setRepayTimeYesString(String value) {
		setRepayTimeYes(DateConvertUtils.parse(value, FORMAT_REPAY_TIME_YES,java.util.Date.class));
	}
	
	public void setRepayTimeYes(java.util.Date value) {
		this.repayTimeYes = value;
	}
	
	public java.util.Date getRepayTimeYes() {
		return this.repayTimeYes;
	}
	public void setRepayAccountAll(java.math.BigDecimal value) {
		this.repayAccountAll = value;
	}
	
	public java.math.BigDecimal getRepayAccountAll() {
		return this.repayAccountAll;
	}
	public void setRepayAccountInterest(java.math.BigDecimal value) {
		this.repayAccountInterest = value;
	}
	
	public java.math.BigDecimal getRepayAccountInterest() {
		return this.repayAccountInterest;
	}
	public void setRepayAccountCapital(java.math.BigDecimal value) {
		this.repayAccountCapital = value;
	}
	
	public java.math.BigDecimal getRepayAccountCapital() {
		return this.repayAccountCapital;
	}
	public void setRepayAccountYes(java.math.BigDecimal value) {
		this.repayAccountYes = value;
	}
	
	public java.math.BigDecimal getRepayAccountYes() {
		return this.repayAccountYes;
	}
	public void setRepayAccountInterestYes(java.math.BigDecimal value) {
		this.repayAccountInterestYes = value;
	}
	
	public java.math.BigDecimal getRepayAccountInterestYes() {
		return this.repayAccountInterestYes;
	}
	public void setRepayAccountCapitalYes(java.math.BigDecimal value) {
		this.repayAccountCapitalYes = value;
	}
	
	public java.math.BigDecimal getRepayAccountCapitalYes() {
		return this.repayAccountCapitalYes;
	}
	public void setRepayAccountWait(java.math.BigDecimal value) {
		this.repayAccountWait = value;
	}
	
	public java.math.BigDecimal getRepayAccountWait() {
		return this.repayAccountWait;
	}
	public void setRepayAccountInterestWait(java.math.BigDecimal value) {
		this.repayAccountInterestWait = value;
	}
	
	public java.math.BigDecimal getRepayAccountInterestWait() {
		return this.repayAccountInterestWait;
	}
	public void setRepayAccountCapitalWait(java.math.BigDecimal value) {
		this.repayAccountCapitalWait = value;
	}
	
	public java.math.BigDecimal getRepayAccountCapitalWait() {
		return this.repayAccountCapitalWait;
	}
	public void setWindControl(String value) {
		this.windControl = value;
	}
	
	public String getWindControl() {
		return this.windControl;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	public void setVerifyStatus(Integer value) {
		this.verifyStatus = value;
	}
	
	public Integer getVerifyStatus() {
		return this.verifyStatus;
	}
	public void setVerifyRemark(String value) {
		this.verifyRemark = value;
	}
	
	public String getVerifyRemark() {
		return this.verifyRemark;
	}
	public void setVerifyId(Integer value) {
		this.verifyId = value;
	}
	
	public Integer getVerifyId() {
		return this.verifyId;
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
			.append("VouchId",getVouchId())
			.append("VouchRemark",getVouchRemark())
			.append("PorjectRemark",getPorjectRemark())
			.append("BorrowUserRemark",getBorrowUserRemark())
			.append("Bname",getBname())
			.append("Status",getStatus())
			.append("BorrowType",getBorrowType())
			.append("BorrowTarget",getBorrowTarget())
			.append("BorrowUse",getBorrowUse())
			.append("Account",getAccount())
			.append("BorrowPeriod",getBorrowPeriod())
			.append("BorrowApr",getBorrowApr())
			.append("Bpic",getBpic())
			.append("BorrowContents",getBorrowContents())
			.append("Hits",getHits())
			.append("CommentCount",getCommentCount())
			.append("OrderId",getOrderId())
			.append("TenderAccountMin",getTenderAccountMin())
			.append("TenderAccountMax",getTenderAccountMax())
			.append("TenderAccountStep",getTenderAccountStep())
			.append("TenderStartTime",getTenderStartTime())
			.append("TenderEndTime",getTenderEndTime())
			.append("TenderScale",getTenderScale())
			.append("TenderTimes",getTenderTimes())
			.append("TenderFeeRatio",getTenderFeeRatio())
			.append("TenderFee",getTenderFee())
			.append("RepayType",getRepayType())
			.append("BorrowAccountYes",getBorrowAccountYes())
			.append("BorrowAccountWait",getBorrowAccountWait())
			.append("BorrowStartTime",getBorrowStartTime())
			.append("RepayTimeYes",getRepayTimeYes())
			.append("RepayAccountAll",getRepayAccountAll())
			.append("RepayAccountInterest",getRepayAccountInterest())
			.append("RepayAccountCapital",getRepayAccountCapital())
			.append("RepayAccountYes",getRepayAccountYes())
			.append("RepayAccountInterestYes",getRepayAccountInterestYes())
			.append("RepayAccountCapitalYes",getRepayAccountCapitalYes())
			.append("RepayAccountWait",getRepayAccountWait())
			.append("RepayAccountInterestWait",getRepayAccountInterestWait())
			.append("RepayAccountCapitalWait",getRepayAccountCapitalWait())
			.append("WindControl",getWindControl())
			.append("contractUrl",getContractUrl())
			.append("OptId",getOptId())
			.append("VerifyStatus",getVerifyStatus())
			.append("VerifyRemark",getVerifyRemark())
			.append("VerifyId",getVerifyId())
			.append("VerifyTime",getVerifyTime())
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
		if(obj instanceof HjsBorrow == false) return false;
		if(this == obj) return true;
		HjsBorrow other = (HjsBorrow)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public String getContractUrl() {
		return contractUrl;
	}

	public void setContractUrl(String contractUrl) {
		this.contractUrl = contractUrl;
	}
}

