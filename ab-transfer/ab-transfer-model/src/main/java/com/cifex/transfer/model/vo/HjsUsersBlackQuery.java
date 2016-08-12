package com.cifex.transfer.model.vo;
import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.page.BaseQuery;


public class HjsUsersBlackQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -5184280311819128002L;
	/** ID */
	private Integer id;
	/** USER_ID */
	private Integer userId;
	/** CODE */
	private String memo;
	/** 创建时IP */
	private String createIp;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 操作员ID。界面录入时需填写 */
	private Integer optId;
	/** 限制返佣  0/1 */
	private Integer charge;
	/** 限制投标  0/1 */
	private Integer limiteTender;
	/**
	 * 关联用户登录账户信息
	 */
	private HjsUserQuery hjsUserQuery;
	
	public HjsUserQuery getHjsUserQuery() {
		return hjsUserQuery;
	}

	public void setHjsUserQuery(HjsUserQuery hjsUserQuery) {
		this.hjsUserQuery = hjsUserQuery;
	}

	/**
	 * 搜索相关名称
	 */
	private String checkName;	

	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
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
	
	public String getMemo() {
		return this.memo;
	}
	
	public void setMemo(String value) {
		this.memo = value;
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
	
	public Integer getOptId() {
		return this.optId;
	}
	
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getCharge() {
		return this.charge;
	}
	
	public void setCharge(Integer value) {
		this.charge = value;
	}
	
	public Integer getLimiteTender() {
		return this.limiteTender;
	}
	
	public void setLimiteTender(Integer value) {
		this.limiteTender = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
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

