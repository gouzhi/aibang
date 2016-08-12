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

public class HjsAccountPayment extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -7735237785089571256L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountPayment";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_PNAME = "支付机构名称";
	public static final String ALIAS_DESCRIPTION = "机构简介";
	public static final String ALIAS_ORDER_ID = "排序";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_REMARK = "备注";
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
     * 支付机构名称       db_column: P_NAME 
     */	
	private String pname;
    /**
     * 机构简介       db_column: DESCRIPTION 
     */	
	private String description;
    /**
     * 排序       db_column: ORDER_ID 
     */	
	private Integer orderId;
    /**
     * 状态       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 备注       db_column: REMARK 
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

	public HjsAccountPayment(){
	}

	public HjsAccountPayment(
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
	public void setPname(String value) {
		this.pname = value;
	}
	
	public String getPname() {
		return this.pname;
	}
	public void setDescription(String value) {
		this.description = value;
	}
	
	public String getDescription() {
		return this.description;
	}
	public void setOrderId(Integer value) {
		this.orderId = value;
	}
	
	public Integer getOrderId() {
		return this.orderId;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
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
			.append("Pname",getPname())
			.append("Description",getDescription())
			.append("OrderId",getOrderId())
			.append("Status",getStatus())
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
		if(obj instanceof HjsAccountPayment == false) return false;
		if(this == obj) return true;
		HjsAccountPayment other = (HjsAccountPayment)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

