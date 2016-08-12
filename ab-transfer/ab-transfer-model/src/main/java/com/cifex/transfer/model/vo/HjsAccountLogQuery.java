package com.cifex.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import com.cifex.framework.utils.page.BaseQuery;
import java.io.Serializable;


public class HjsAccountLogQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 2173565379800876193L;
	/** ID */
	private Integer id;
	/** 交易类型/configid=22 */
	private Integer typeNo;
	/** 操作金额 */
	private java.math.BigDecimal money;
	/** 用户ID（主体，发起方）/ 系统角色则空 */
	private Integer userId;
	/** 对方用户ID/ 系统角色则空 */
	private Integer toUserid;
	/** 备注说明 */
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
	
	public Integer getTypeNo() {
		return this.typeNo;
	}
	
	public void setTypeNo(Integer value) {
		this.typeNo = value;
	}
	
	public java.math.BigDecimal getMoney() {
		return this.money;
	}
	
	public void setMoney(java.math.BigDecimal value) {
		this.money = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getToUserid() {
		return this.toUserid;
	}
	
	public void setToUserid(Integer value) {
		this.toUserid = value;
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

