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

public class HjsAccountLog extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -8859531417209907287L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountLog";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_TYPE_NO = "交易类型/configid=22";
	public static final String ALIAS_MONEY = "操作金额";
	public static final String ALIAS_USER_ID = "用户ID（主体，发起方）/ 系统角色则空";
	public static final String ALIAS_TO_USERID = "对方用户ID/ 系统角色则空";
	public static final String ALIAS_REMARK = "备注说明";
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
     * 交易类型/configid=22       db_column: TYPE_NO 
     */	
	private Integer typeNo;
    /**
     * 操作金额       db_column: MONEY 
     */	
	private java.math.BigDecimal money;
    /**
     * 用户ID（主体，发起方）/ 系统角色则空       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 对方用户ID/ 系统角色则空       db_column: TO_USERID 
     */	
	private Integer toUserid;
    /**
     * 备注说明       db_column: REMARK 
     */	
	private String remark;
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

	public HjsAccountLog(){
	}

	public HjsAccountLog(
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
	public void setTypeNo(Integer value) {
		this.typeNo = value;
	}
	
	public Integer getTypeNo() {
		return this.typeNo;
	}
	public void setMoney(java.math.BigDecimal value) {
		this.money = value;
	}
	
	public java.math.BigDecimal getMoney() {
		return this.money;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setToUserid(Integer value) {
		this.toUserid = value;
	}
	
	public Integer getToUserid() {
		return this.toUserid;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
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
			.append("TypeNo",getTypeNo())
			.append("Money",getMoney())
			.append("UserId",getUserId())
			.append("ToUserid",getToUserid())
			.append("Remark",getRemark())
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
		if(obj instanceof HjsAccountLog == false) return false;
		if(this == obj) return true;
		HjsAccountLog other = (HjsAccountLog)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

