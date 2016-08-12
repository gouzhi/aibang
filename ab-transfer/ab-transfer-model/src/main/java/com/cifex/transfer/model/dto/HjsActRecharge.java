/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.cifex.transfer.model.dto;
import java.io.Serializable;
import java.util.Date;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity; 

public class HjsActRecharge extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID      
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -6658118359346725539L;
	//alias
	public static final String TABLE_ALIAS = "HjsActRecharge";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_RECHARGE_NAME = "红包名称";
	public static final String ALIAS_RECHARGE_TYPE = "充值类型configid=41";
	public static final String ALIAS_RECHARGE_CODE = "充值编码";
	public static final String ALIAS_VALUE = "充值金额";
	public static final String ALIAS_ACT_URL = "活动URL";
	public static final String ALIAS_OPT_ID = "操作员ID";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 红包名称       db_column: RECHARGE_NAME 
     */	
	private String rechargeName;
    /**
     * 充值类型configid=41       db_column: RECHARGE_TYPE 
     */	
	private Integer rechargeType;
    /**
     * 充值编码       db_column: RECHARGE_CODE 
     */	
	private String rechargeCode;
    /**
     * 充值金额       db_column: VALUE 
     */	
	private java.math.BigDecimal value;
    /**
     * 活动URL       db_column: ACT_URL 
     */	
	private String actUrl;
    /**
     * 操作员ID       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	//columns END

	public HjsActRecharge(){
	}

	public HjsActRecharge(
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
	public void setRechargeName(String value) {
		this.rechargeName = value;
	}
	
	public String getRechargeName() {
		return this.rechargeName;
	}
	public void setRechargeType(Integer value) {
		this.rechargeType = value;
	}
	
	public Integer getRechargeType() {
		return this.rechargeType;
	}
	public void setRechargeCode(String value) {
		this.rechargeCode = value;
	}
	
	public String getRechargeCode() {
		return this.rechargeCode;
	}
	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}
	
	public java.math.BigDecimal getValue() {
		return this.value;
	}
	public void setActUrl(String value) {
		this.actUrl = value;
	}
	
	public String getActUrl() {
		return this.actUrl;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	public String getCreateTimeString() {
		return DateConvertUtils.format(getCreateTime(), FORMAT_CREATE_TIME);
	}
	public void setCreateTimeString(String value) {
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,Date.class));
	}
	
	public void setCreateTime(Date value) {
		this.createTime = value;
	}
	
	public Date getCreateTime() {
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
			.append("RechargeName",getRechargeName())
			.append("RechargeType",getRechargeType())
			.append("RechargeCode",getRechargeCode())
			.append("Value",getValue())
			.append("ActUrl",getActUrl())
			.append("OptId",getOptId())
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
		if(obj instanceof HjsActRecharge == false) return false;
		if(this == obj) return true;
		HjsActRecharge other = (HjsActRecharge)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

