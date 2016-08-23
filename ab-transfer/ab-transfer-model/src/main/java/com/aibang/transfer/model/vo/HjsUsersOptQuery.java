package com.aibang.transfer.model.vo;
import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;


public class HjsUsersOptQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -2635909311104484039L;
	/** ID */
	private Integer id;
	/** 统一登录ID */
	private Integer loginId;
	/** 企业ID */
	private Integer entId;
	/** 密码 */
	private String optUsername;
	/** 备注 */
	private String remark;
	/** QQ */
	private String qq;
	/** 性别 0女1男 */
	private Integer sex;
	/** 最后登录时间 */
	private java.util.Date lastTimeBegin;
	private java.util.Date lastTimeEnd;
	/** 最后IP */
	private String lastIp;
	
	private String[] loginIds;
	
	private String[] userIds;
	/**
	 * 登录名
	 */
	private String username;
	/**
	 * 用户企业信息
	 */
	private HjsUsersEnterpriceQuery hjsUsersEnterpriceQuery;
	/**
	 * 用户基表信息
	 */
	private HjsUserQuery hjsUserQuery;

	
	public HjsUserQuery getHjsUserQuery() {
		return hjsUserQuery;
	}

	public void setHjsUserQuery(HjsUserQuery hjsUserQuery) {
		this.hjsUserQuery = hjsUserQuery;
	}

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getLoginId() {
		return this.loginId;
	}
	
	public void setLoginId(Integer value) {
		this.loginId = value;
	}
	
	public Integer getEntId() {
		return this.entId;
	}
	
	public void setEntId(Integer value) {
		this.entId = value;
	}
	
	public String getOptUsername() {
		return this.optUsername;
	}
	
	public void setOptUsername(String value) {
		this.optUsername = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getQq() {
		return this.qq;
	}
	
	public void setQq(String value) {
		this.qq = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	
	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public java.util.Date getLastTimeBegin() {
		return this.lastTimeBegin;
	}
	
	public void setLastTimeBegin(java.util.Date value) {
		this.lastTimeBegin = value;
	}	
	
	public java.util.Date getLastTimeEnd() {
		return this.lastTimeEnd;
	}
	
	public void setLastTimeEnd(java.util.Date value) {
		this.lastTimeEnd = value;
	}
	
	public String getLastIp() {
		return this.lastIp;
	}
	
	public void setLastIp(String value) {
		this.lastIp = value;
	}
	

	public String[] getLoginIds() {
		return loginIds;
	}

	public void setLoginIds(String[] loginIds) {
		this.loginIds = loginIds;
	}
	

	public String[] getUserIds() {
		return userIds;
	}

	public void setUserIds(String[] userIds) {
		this.userIds = userIds;
	}

	public HjsUsersEnterpriceQuery getHjsUsersEnterpriceQuery() {
		return hjsUsersEnterpriceQuery;
	}

	public void setHjsUsersEnterpriceQuery(
			HjsUsersEnterpriceQuery hjsUsersEnterpriceQuery) {
		this.hjsUsersEnterpriceQuery = hjsUsersEnterpriceQuery;
	}
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
}

