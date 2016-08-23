package com.aibang.transfer.model.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

public class HjsBorrowProjectQuery extends BaseQuery implements Serializable {

	private static final long serialVersionUID = 5900826297070515782L;
	/** ID */
	private Integer id;
	/** 用户ID ，提交该申请的用户或企业 */
	private Integer userId;
	/** 项目名称/标题 */
	private String pname;
	/** 项目类型 CONFIGID=24 */
	private Integer projectType;
	/** 最少贷款金额 */
	private java.math.BigDecimal borrowAmountMin;
	/** 最大贷款金额 */
	private java.math.BigDecimal borrowAmountMax;
	/** 最小贷款期限 */
	private Integer borrowSdate;
	/** 最大贷款期限 */
	private Integer borrowEdate;
	/** 项目说明 */
	private String projectRemark;
	/** 项目利率（单位为%） */
	private Double projectApr;
	/** 其他说明 */
	private String otherRemark;
	/** 是否逻辑删除(yes =1 no =0) */
	private Integer isDel;
	/** 删除时间 */
	private java.util.Date deleteTimeBegin;
	private java.util.Date deleteTimeEnd;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 更新时间 */
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	private String  projectPoint;//项目特点
	private String pnametOrPoint;//查询时使用(项目名称或项目特点查询)
	private Integer loanType;//贷款主体类型(01=企业主；02=上班族；03=个体户；04=自由职业者)
    private String projectName;//项目名称(后台验证使用)
    private String borrowUseCustId;
    
	public String getBorrowUseCustId() {
		return borrowUseCustId;
	}

	public void setBorrowUseCustId(String borrowUseCustId) {
		this.borrowUseCustId = borrowUseCustId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getLoanType() {
		return loanType;
	}

	public void setLoanType(Integer loanType) {
		this.loanType = loanType;
	}

	public String getPnametOrPoint() {
		return pnametOrPoint;
	}

	public void setPnametOrPoint(String pnametOrPoint) {
		this.pnametOrPoint = pnametOrPoint;
	}

	public String getProjectPoint() {
		return projectPoint;
	}

	public void setProjectPoint(String projectPoint) {
		this.projectPoint = projectPoint;
	}

	public java.math.BigDecimal getBorrowAmountMin() {
		return borrowAmountMin;
	}

	public void setBorrowAmountMin(java.math.BigDecimal borrowAmountMin) {
		this.borrowAmountMin = borrowAmountMin;
	}

	public java.math.BigDecimal getBorrowAmountMax() {
		return borrowAmountMax;
	}

	public void setBorrowAmountMax(java.math.BigDecimal borrowAmountMax) {
		this.borrowAmountMax = borrowAmountMax;
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

	public String getPname() {
		return this.pname;
	}

	public void setPname(String value) {
		this.pname = value;
	}

	public Integer getProjectType() {
		return this.projectType;
	}

	public void setProjectType(Integer value) {
		this.projectType = value;
	}

	
	public Integer getBorrowSdate() {
		return this.borrowSdate;
	}

	public void setBorrowSdate(Integer value) {
		this.borrowSdate = value;
	}

	public Integer getBorrowEdate() {
		return this.borrowEdate;
	}

	public void setBorrowEdate(Integer value) {
		this.borrowEdate = value;
	}

	public String getProjectRemark() {
		return this.projectRemark;
	}

	public void setProjectRemark(String value) {
		this.projectRemark = value;
	}

	public Double getProjectApr() {
		return this.projectApr;
	}

	public void setProjectApr(Double value) {
		this.projectApr = value;
	}

	public String getOtherRemark() {
		return this.otherRemark;
	}

	public void setOtherRemark(String value) {
		this.otherRemark = value;
	}

	public Integer getIsDel() {
		return this.isDel;
	}

	public void setIsDel(Integer value) {
		this.isDel = value;
	}

	public java.util.Date getDeleteTimeBegin() {
		return this.deleteTimeBegin;
	}

	public void setDeleteTimeBegin(java.util.Date value) {
		this.deleteTimeBegin = value;
	}

	public java.util.Date getDeleteTimeEnd() {
		return this.deleteTimeEnd;
	}

	public void setDeleteTimeEnd(java.util.Date value) {
		this.deleteTimeEnd = value;
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

	public Integer getOptId() {
		return this.optId;
	}

	public void setOptId(Integer value) {
		this.optId = value;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}
}
