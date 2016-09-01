package com.aibang.transfer.model.vo;
import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;


public class AbUsersAddQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -5884879556359211234L;
	/** ID */
	private Integer id;
	/** 地区ID */
	private Integer areaid;
	/** 帐户ID */
	private Integer userId;
	/** 收货联系人名称 */
	private String realname;
	/** 联系人电话 */
	private String tel;
	/** 联系人邮编 */
	private String post;
	/** 联系人地址 */
	private String addr;
	/** 备注 */
	private String remark;
	/** 录入时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getAreaid() {
		return this.areaid;
	}
	
	public void setAreaid(Integer value) {
		this.areaid = value;
	}
	
	public Integer getUserId() {
		return this.userId;
	}
	
	public void setUserId(Integer value) {
		this.userId = value;
	}
	
	public String getRealname() {
		return this.realname;
	}
	
	public void setRealname(String value) {
		this.realname = value;
	}
	
	public String getTel() {
		return this.tel;
	}
	
	public void setTel(String value) {
		this.tel = value;
	}
	
	public String getPost() {
		return this.post;
	}
	
	public void setPost(String value) {
		this.post = value;
	}
	
	public String getAddr() {
		return this.addr;
	}
	
	public void setAddr(String value) {
		this.addr = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setRemark(String value) {
		this.remark = value;
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

