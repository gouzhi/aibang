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

public class HjsAccountSystem extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 2538995762123726241L;
	//alias
	public static final String TABLE_ALIAS = "HjsAccountSystem";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_TYPE = "类型/configid=16";
	public static final String ALIAS_MONEY = "操作金额";
	public static final String ALIAS_REMARK = "摘要";
	public static final String ALIAS_INCOME = "收入";
	public static final String ALIAS_EXPEND = "支出";
	public static final String ALIAS_BALANCE = "余额";
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
     * 用户ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 类型/configid=16       db_column: TYPE 
     */	
	private Integer type;
    /**
     * 操作金额       db_column: MONEY 
     */	
	private Long money;
    /**
     * 摘要       db_column: REMARK 
     */	
	private String remark;
    /**
     * 收入       db_column: INCOME 
     */	
	private Long income;
    /**
     * 支出       db_column: EXPEND 
     */	
	private Long expend;
    /**
     * 余额       db_column: BALANCE 
     */	
	private Long balance;
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

	public HjsAccountSystem(){
	}

	public HjsAccountSystem(
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
	public void setType(Integer value) {
		this.type = value;
	}
	
	public Integer getType() {
		return this.type;
	}
	public void setMoney(Long value) {
		this.money = value;
	}
	
	public Long getMoney() {
		return this.money;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	public void setIncome(Long value) {
		this.income = value;
	}
	
	public Long getIncome() {
		return this.income;
	}
	public void setExpend(Long value) {
		this.expend = value;
	}
	
	public Long getExpend() {
		return this.expend;
	}
	public void setBalance(Long value) {
		this.balance = value;
	}
	
	public Long getBalance() {
		return this.balance;
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
			.append("UserId",getUserId())
			.append("Type",getType())
			.append("Money",getMoney())
			.append("Remark",getRemark())
			.append("Income",getIncome())
			.append("Expend",getExpend())
			.append("Balance",getBalance())
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
		if(obj instanceof HjsAccountSystem == false) return false;
		if(this == obj) return true;
		HjsAccountSystem other = (HjsAccountSystem)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

