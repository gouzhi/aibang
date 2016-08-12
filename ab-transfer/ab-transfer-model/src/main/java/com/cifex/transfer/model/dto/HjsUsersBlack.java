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

public class HjsUsersBlack extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -9038924410528438199L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersBlack";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "USER_ID";
	public static final String ALIAS_MEMO = "CODE";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_OPT_ID = "操作员ID。界面录入时需填写";
	public static final String ALIAS_CHARGE = "限制返佣  0/1";
	public static final String ALIAS_LIMITE_TENDER = "限制投标  0/1";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * USER_ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * CODE       db_column: MEMO 
     */	
	private String memo;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 操作员ID。界面录入时需填写       db_column: OPT_ID 
     */	
	private Integer optId;
    /**
     * 限制返佣  0/1       db_column: CHARGE 
     */	
	private Integer charge;
    /**
     * 限制投标  0/1       db_column: LIMITE_TENDER 
     */	
	private Integer limiteTender;
	//columns END
	/**
	 * 关联用户登录账户信息
	 */
	private HjsUser hjsUser;
	
	public HjsUser getHjsUser() {
		return hjsUser;
	}

	public void setHjsUser(HjsUser hjsUser) {
		this.hjsUser = hjsUser;
	}

	public HjsUsersBlack(){
	}

	public HjsUsersBlack(
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
	public void setMemo(String value) {
		this.memo = value;
	}
	
	public String getMemo() {
		return this.memo;
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
	public void setOptId(Integer value) {
		this.optId = value;
	}
	
	public Integer getOptId() {
		return this.optId;
	}
	public void setCharge(Integer value) {
		this.charge = value;
	}
	
	public Integer getCharge() {
		return this.charge;
	}
	public void setLimiteTender(Integer value) {
		this.limiteTender = value;
	}
	
	public Integer getLimiteTender() {
		return this.limiteTender;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Memo",getMemo())
			.append("CreateIp",getCreateIp())
			.append("CreateTime",getCreateTime())
			.append("OptId",getOptId())
			.append("Charge",getCharge())
			.append("LimiteTender",getLimiteTender())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsUsersBlack == false) return false;
		if(this == obj) return true;
		HjsUsersBlack other = (HjsUsersBlack)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

