/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */


package com.aibang.transfer.model.dto;
import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.DateConvertUtils;
import com.aibang.transfer.model.BaseEntity;

public class HjsUsersAdd extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 8141543257422252152L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersAdd";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_AREAID = "地区ID";
	public static final String ALIAS_USER_ID = "帐户ID";
	public static final String ALIAS_REALNAME = "收货联系人名称";
	public static final String ALIAS_TEL = "联系人电话";
	public static final String ALIAS_POST = "联系人邮编";
	public static final String ALIAS_ADDR = "联系人地址";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_CREATE_TIME = "录入时间";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 地区ID       db_column: AREAID 
     */	
	private Integer areaid;
    /**
     * 帐户ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 收货联系人名称       db_column: REALNAME 
     */	
	private String realname;
    /**
     * 联系人电话       db_column: TEL 
     */	
	private String tel;
    /**
     * 联系人邮编       db_column: POST 
     */	
	private String post;
    /**
     * 联系人地址       db_column: ADDR 
     */	
	private String addr;
    /**
     * 备注       db_column: REMARK 
     */	
	private String remark;
    /**
     * 录入时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
	//columns END

	public HjsUsersAdd(){
	}

	public HjsUsersAdd(
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
	public void setAreaid(Integer value) {
		this.areaid = value;
	}
	
	public Integer getAreaid() {
		return this.areaid;
	}
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	public void setRealname(String value) {
		this.realname = value;
	}
	
	public String getRealname() {
		return this.realname;
	}
	public void setTel(String value) {
		this.tel = value;
	}
	
	public String getTel() {
		return this.tel;
	}
	public void setPost(String value) {
		this.post = value;
	}
	
	public String getPost() {
		return this.post;
	}
	public void setAddr(String value) {
		this.addr = value;
	}
	
	public String getAddr() {
		return this.addr;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
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
			.append("Areaid",getAreaid())
			.append("UserId",getUserId())
			.append("Realname",getRealname())
			.append("Tel",getTel())
			.append("Post",getPost())
			.append("Addr",getAddr())
			.append("Remark",getRemark())
			.append("CreateTime",getCreateTime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsUsersAdd == false) return false;
		if(this == obj) return true;
		HjsUsersAdd other = (HjsUsersAdd)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

