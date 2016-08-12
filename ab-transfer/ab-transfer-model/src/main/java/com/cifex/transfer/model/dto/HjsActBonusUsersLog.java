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

public class HjsActBonusUsersLog extends BaseEntity implements Serializable{
	
	/**    
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 6617092020447389370L;
	//alias
	public static final String TABLE_ALIAS = "HjsActBonusUsersLog";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_BONUS_USER_ID = "红包ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_USERD_VALUE = "使用面值";
	public static final String ALIAS_TENDER_SOURCE_ID = "投标记录ID";
	public static final String ALIAS_STATUS = "状态/1使用，  -1退";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_ACCT_ID = "出账子账号";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 红包ID       db_column: BONUS_USER_ID 
     */	
	private Integer bonusUserId;
    /**
     * 用户ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 使用面值       db_column: USERD_VALUE 
     */	
	private java.math.BigDecimal useredValue;
    /**
     * 投标记录ID       db_column: TENDER_SOURCE_ID 
     */	
	private Integer tenderSourceId;
    /**
     * 状态/1使用，  -1退       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	/**
	 * 出账子账号
	 */
	private String acctId;

	public String getAcctId() {
		return acctId;
	}

	public void setAcctId(String acctId) {
		this.acctId = acctId;
	}
	//columns END

	public HjsActBonusUsersLog(){
	}

	public HjsActBonusUsersLog(
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
	public void setBonusUserId(Integer value) {
		this.bonusUserId = value;
	}
	
	public Integer getBonusUserId() {
		return this.bonusUserId;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	 
	public void setTenderSourceId(Integer value) {
		this.tenderSourceId = value;
	}
	
	public Integer getTenderSourceId() {
		return this.tenderSourceId;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
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
			.append("BonusUserId",getBonusUserId())
			.append("UserId",getUserId())
			.append("useredValue",getUseredValue())
			.append("TenderSourceId",getTenderSourceId())
			.append("Status",getStatus())
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
		if(obj instanceof HjsActBonusUsersLog == false) return false;
		if(this == obj) return true;
		HjsActBonusUsersLog other = (HjsActBonusUsersLog)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}

	public java.math.BigDecimal getUseredValue() {
		return useredValue;
	}

	public void setUseredValue(java.math.BigDecimal useredValue) {
		this.useredValue = useredValue;
	}
}

