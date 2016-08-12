/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.cifex.transfer.model.dto;
import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsBorrowProject extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -3406663565943962766L;
	//alias
	public static final String TABLE_ALIAS = "HjsBorrowProject";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户ID ，提交该申请的用户或企业";
	public static final String ALIAS_PNAME = "项目名称/标题";
	public static final String ALIAS_PROJECT_TYPE = "项目类型 CONFIGID=24";
	public static final String ALIAS_BORROW_AMOUNT_MIN = "最少贷款金额";
	public static final String ALIAS_BORROW_AMOUNT_MAX = "最大贷款金额";
	public static final String ALIAS_BORROW_SDATE = "最小贷款期限";
	public static final String ALIAS_BORROW_EDATE = "最大贷款期限";
	public static final String ALIAS_PROJECT_REMARK = "项目说明";
	public static final String ALIAS_PROJECT_APR = "项目利率（单位为%）";
	public static final String ALIAS_OTHER_REMARK = "其他说明";
	public static final String ALIAS_IS_DEL = "是否逻辑删除(yes =1 no =0)";
	public static final String ALIAS_DELETE_TIME = "删除时间";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_UPDATE_TIME = "更新时间";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_PROJECT_POINT="项目特点";
	public static final String ALIAS_LOAN_TYPE="贷款主体类型";
	public static final String ALIAS_LOAN_ID="借款主体对应的ID";
	public static final String ALIAS_BORROW_USR_CUST_ID="冗余借款人客户号";
	//date formats
	public static final String FORMAT_DELETE_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 用户ID ，提交该申请的用户或企业       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 项目名称/标题       db_column: P_NAME 
     */	
	private String pname;
    /**
     * 项目类型 CONFIGID=24       db_column: PROJECT_TYPE 
     */	
	private Integer projectType;
    /**
     * 最少贷款金额       db_column: BORROW_AMOUNT_MIN 
     */	
	private java.math.BigDecimal borrowAmountMin;
    /**
     * 最大贷款金额       db_column: BORROW_AMOUNT_MAX 
     */	
	private java.math.BigDecimal borrowAmountMax;


    /**
     * 最小贷款期限       db_column: BORROW_SDATE 
     */	
	private Integer borrowSdate;
    /**
     * 最大贷款期限       db_column: BORROW_EDATE 
     */	
	private Integer borrowEdate;
    /**
     * 项目说明       db_column: PROJECT_REMARK 
     */	
	private String projectRemark;
    /**
     * 项目利率（单位为%）       db_column: PROJECT_APR 
     */	
	private Double projectApr;
    /**
     * 其他说明       db_column: OTHER_REMARK 
     */	
	private String otherRemark;
    /**
     * 是否逻辑删除(yes =1 no =0)       db_column: IS_DEL 
     */	
	private Integer isDel;
    /**
     * 删除时间       db_column: DELETE_TIME 
     */	
	private java.util.Date deleteTime;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 更新时间       db_column: UPDATE_TIME 
     */	
	private java.util.Date updateTime;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
	private String  projectPoint;//项目特点
	private Integer loanType;//贷款主体类型(01=企业主；02=上班族；03=个体户；04=自由职业者)
    private String borrowUseCustId;
    
	//columns END
    
	public Integer getLoanType() {
		return loanType;
	}

	public String getBorrowUseCustId() {
		return borrowUseCustId;
	}

	public void setBorrowUseCustId(String borrowUseCustId) {
		this.borrowUseCustId = borrowUseCustId;
	}

	public void setLoanType(Integer loanType) {
		this.loanType = loanType;
	}

	public HjsBorrowProject(){
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

	public HjsBorrowProject(
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
	public void setPname(String value) {
		this.pname = value;
	}
	
	public String getPname() {
		return this.pname;
	}
	public void setProjectType(Integer value) {
		this.projectType = value;
	}
	
	public Integer getProjectType() {
		return this.projectType;
	}

	public void setBorrowSdate(Integer value) {
		this.borrowSdate = value;
	}
	
	public Integer getBorrowSdate() {
		return this.borrowSdate;
	}
	public void setBorrowEdate(Integer value) {
		this.borrowEdate = value;
	}
	
	public Integer getBorrowEdate() {
		return this.borrowEdate;
	}
	public void setProjectRemark(String value) {
		this.projectRemark = value;
	}
	
	public String getProjectRemark() {
		return this.projectRemark;
	}
	public void setProjectApr(Double value) {
		this.projectApr = value;
	}
	
	public Double getProjectApr() {
		return this.projectApr;
	}
	public void setOtherRemark(String value) {
		this.otherRemark = value;
	}
	
	public String getOtherRemark() {
		return this.otherRemark;
	}
	public void setIsDel(Integer value) {
		this.isDel = value;
	}
	
	public Integer getIsDel() {
		return this.isDel;
	}
	public String getDeleteTimeString() {
		return DateConvertUtils.format(getDeleteTime(), FORMAT_DELETE_TIME);
	}
	public void setDeleteTimeString(String value) {
		setDeleteTime(DateConvertUtils.parse(value, FORMAT_DELETE_TIME,java.util.Date.class));
	}
	
	public void setDeleteTime(java.util.Date value) {
		this.deleteTime = value;
	}
	
	public java.util.Date getDeleteTime() {
		return this.deleteTime;
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
	public String getUpdateTimeString() {
		return DateConvertUtils.format(getUpdateTime(), FORMAT_UPDATE_TIME);
	}
	public void setUpdateTimeString(String value) {
		setUpdateTime(DateConvertUtils.parse(value, FORMAT_UPDATE_TIME,java.util.Date.class));
	}
	
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Pname",getPname())
			.append("ProjectType",getProjectType())
			.append("BorrowAmountMin",getBorrowAmountMin())
			.append("BorrowAmountMax",getBorrowAmountMax())
            .append("BorrowSdate",getBorrowSdate())
			.append("BorrowEdate",getBorrowEdate())
			.append("ProjectRemark",getProjectRemark())
			.append("ProjectApr",getProjectApr())
			.append("OtherRemark",getOtherRemark())
			.append("IsDel",getIsDel())
			.append("DeleteTime",getDeleteTime())
			.append("CreateTime",getCreateTime())
			.append("UpdateTime",getUpdateTime())
			.append("OptId",getOptId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsBorrowProject == false) return false;
		if(this == obj) return true;
		HjsBorrowProject other = (HjsBorrowProject)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

