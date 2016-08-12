package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.page.BaseQuery;
import java.io.Serializable;


public class HjsAccountSystemQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 5115059611510721271L;
	/** ID */
	private Integer id;
	/** 用户ID */
	private Integer userId;
	/** 类型/configid=16 */
	private Integer type;
	/** 操作金额 */
	private Long money;
	/** 摘要 */
	private String remark;
	/** 收入 */
	private Long income;
	/** 支出 */
	private Long expend;
	/** 余额 */
	private Long balance;
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
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	
	public void setType(Integer value) {
		this.type = value;
	}
	
	public Long getMoney() {
		return this.money;
	}
	
	public void setMoney(Long value) {
		this.money = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public Long getIncome() {
		return this.income;
	}
	
	public void setIncome(Long value) {
		this.income = value;
	}
	
	public Long getExpend() {
		return this.expend;
	}
	
	public void setExpend(Long value) {
		this.expend = value;
	}
	
	public Long getBalance() {
		return this.balance;
	}
	
	public void setBalance(Long value) {
		this.balance = value;
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

