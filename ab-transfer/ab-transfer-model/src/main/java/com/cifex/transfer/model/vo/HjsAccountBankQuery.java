package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.page.BaseQuery;
import java.io.Serializable;


public class HjsAccountBankQuery extends BaseQuery implements Serializable {
    

	/**    
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -8836010001713826972L;
	/** ID */
	private Integer id;
	/** 银行名称 */
	private String bankName;
	/** 现金限额 */
	private java.math.BigDecimal cashMoney;
	/** 到账天数 */
	private Integer reachDay;
	/** 状态 */
	private Integer status;
	/** 备注 */
	private String remark;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 创建时IP */
	private String createIp;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public String getBankName() {
		return this.bankName;
	}
	
	public void setBankName(String value) {
		this.bankName = value;
	}
	
	public java.math.BigDecimal getCashMoney() {
		return this.cashMoney;
	}
	
	public void setCashMoney(java.math.BigDecimal value) {
		this.cashMoney = value;
	}
	
	public Integer getReachDay() {
		return this.reachDay;
	}
	
	public void setReachDay(Integer value) {
		this.reachDay = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public String getCreateIp() {
		return this.createIp;
	}
	
	public void setCreateIp(String value) {
		this.createIp = value;
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
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
}

