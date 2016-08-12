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

public class HjsActBonusUsers extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 2206914171210099997L;
	//alias
	public static final String TABLE_ALIAS = "HjsActBonusUsers";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "用户帐户ID    user_base";
	public static final String ALIAS_INVITE_USER_ID = "（下级的邀请用户帐户ID    user_base） ";
	public static final String ALIAS_ACT_ID = "活动ID";
	public static final String ALIAS_BONUS_ID = "红包ID";
	public static final String ALIAS_VALUE = "面值";
	public static final String ALIAS_ACT_SOURCE = "来源/摘要";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_STATUS = "状态/CONFIGID=34";
	public static final String ALIAS_EXPIRE_TIME = "过期时间";
	public static final String ALIAS_CREATE_TIME = "创建日期";
	public static final String ALIAS_CREATE_IP = "创建时IP";

	public static final String ALIAS_BU_CODE = "奖励或返佣编码";
	public static final String ALIAS_MANUAL_ID = "手动红包ID/hjs_act_bonus_users_manual";
	
	//date formats
	public static final String FORMAT_EXPIRE_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 用户帐户ID    user_base       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * （下级的邀请用户帐户ID    user_base）        db_column: INVITE_USER_ID 
     */	
	private Integer inviteUserId;
    /**
     * 活动ID       db_column: ACT_ID 
     */	
	private Integer actId;
    /**
     * 红包ID       db_column: BONUS_ID 
     */	
	private Integer bonusId;
    /**
     * 面值       db_column: VALUE 
     */	
	private java.math.BigDecimal value;
    /**
     * 来源/摘要       db_column: ACT_SOURCE 
     */	
	private String actSource;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 状态/CONFIGID=34       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 过期时间       db_column: EXPIRE_TIME 
     */	
	private java.util.Date expireTime;
    /**
     * 创建日期       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 奖励或返佣编码       db_column: BU_CODE 
     */	
	private String buCode;
	//columns END
	
	/**
     * 手动红包ID/hjs_act_bonus_users_manual       db_column: MANUAL_ID
     */	
	private java.lang.Integer manualId;

	public HjsActBonusUsers(){
	}

	public HjsActBonusUsers(
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
	public void setInviteUserId(Integer value) {
		this.inviteUserId = value;
	}
	
	public Integer getInviteUserId() {
		return this.inviteUserId;
	}
	public void setActId(Integer value) {
		this.actId = value;
	}
	
	public Integer getActId() {
		return this.actId;
	}
	public void setBonusId(Integer value) {
		this.bonusId = value;
	}
	
	public Integer getBonusId() {
		return this.bonusId;
	}
	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}
	
	public java.math.BigDecimal getValue() {
		return this.value;
	}
	public void setActSource(String value) {
		this.actSource = value;
	}
	
	public String getActSource() {
		return this.actSource;
	}
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public String getExpireTimeString() {
		return DateConvertUtils.format(getExpireTime(), FORMAT_EXPIRE_TIME);
	}
	public void setExpireTimeString(String value) {
		setExpireTime(DateConvertUtils.parse(value, FORMAT_EXPIRE_TIME,java.util.Date.class));
	}
	
	public void setExpireTime(java.util.Date value) {
		this.expireTime = value;
	}
	
	public java.util.Date getExpireTime() {
		return this.expireTime;
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
	public void setBuCode(String value) {
		this.buCode = value;
	}
	
	public String getBuCode() {
		return this.buCode;
	}

	public java.lang.Integer getManualId() {
		return this.manualId;
	}
	
	public void setManualId(java.lang.Integer manualId) {
		this.manualId = manualId;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("InviteUserId",getInviteUserId())
			.append("ActId",getActId())
			.append("BonusId",getBonusId())
			.append("Value",getValue())
			.append("ActSource",getActSource())
			.append("OptId",getOptId())
			.append("Status",getStatus())
			.append("ExpireTime",getExpireTime())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.append("BuCode",getBuCode())
			.append("ManualId",getManualId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsActBonusUsers == false) return false;
		if(this == obj) return true;
		HjsActBonusUsers other = (HjsActBonusUsers)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

