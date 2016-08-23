package com.aibang.transfer.model.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;
import java.math.BigDecimal;

public class HjsActBonusUsersQuery extends BaseQuery implements Serializable {

	private static final long serialVersionUID = 5592881480602322626L;
	/** ID */
	private Integer id;
	/** 用户帐户ID user_base */
	private Integer userId;
	/** （下级的邀请用户帐户ID user_base） */
	private Integer inviteUserId;
	/** 活动ID */
	private Integer actId;
	/** 红包ID */
	private Integer bonusId;
	/** 面值 */
	private java.math.BigDecimal value;
	/** 来源/摘要 */
	private String actSource;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 状态/CONFIGID=34 */
	private Integer status;
	/** 过期时间 */
	private java.util.Date expireTimeBegin;
	private java.util.Date expireTimeEnd;
	/** 创建日期 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	/** 奖励或返佣编码 */
	private String buCode;
	/** 手动红包ID/hjs_act_bonus_users_manual */
	private java.lang.Integer manualId;


	private Integer type;

	
	private Integer phone;
	
	public java.lang.Integer getManualId() {
		return this.manualId;
	}
	
	public void setManualId(java.lang.Integer value) {
		this.manualId = value;
	}
	
	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	private java.util.Date nowDate;
	/**
	 * 使用类型
	 */
	private String useType;

	public String getUseType() {
		return useType;
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	/**
	 * 投资金额
	 */
	private BigDecimal tenderAmount;


	public BigDecimal getTenderAmount() {
		return tenderAmount;
	}

	public void setTenderAmount(BigDecimal tenderAmount) {
		this.tenderAmount = tenderAmount;
	}

	public java.util.Date getNowDate() {
		return nowDate;
	}

	public void setNowDate(java.util.Date nowDate) {
		this.nowDate = nowDate;
	}

	/**
	 * type
	 * 
	 * @return the type
	 */

	public Integer getType() {
		return type;
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}

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

	public Integer getInviteUserId() {
		return this.inviteUserId;
	}

	public void setInviteUserId(Integer value) {
		this.inviteUserId = value;
	}

	public Integer getActId() {
		return this.actId;
	}

	public void setActId(Integer value) {
		this.actId = value;
	}

	public Integer getBonusId() {
		return this.bonusId;
	}

	public void setBonusId(Integer value) {
		this.bonusId = value;
	}

	public java.math.BigDecimal getValue() {
		return this.value;
	}

	public void setValue(java.math.BigDecimal value) {
		this.value = value;
	}

	public String getActSource() {
		return this.actSource;
	}

	public void setActSource(String value) {
		this.actSource = value;
	}

	public Integer getOptId() {
		return this.optId;
	}

	public void setOptId(Integer value) {
		this.optId = value;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer value) {
		this.status = value;
	}

	public java.util.Date getExpireTimeBegin() {
		return this.expireTimeBegin;
	}

	public void setExpireTimeBegin(java.util.Date value) {
		this.expireTimeBegin = value;
	}

	public java.util.Date getExpireTimeEnd() {
		return this.expireTimeEnd;
	}

	public void setExpireTimeEnd(java.util.Date value) {
		this.expireTimeEnd = value;
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

	public String getCreateIp() {
		return this.createIp;
	}

	public void setCreateIp(String value) {
		this.createIp = value;
	}

	public String getBuCode() {
		return this.buCode;
	}

	public void setBuCode(String value) {
		this.buCode = value;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

	/**
	 * 关键字搜索
	 */
	private String context;

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
}
