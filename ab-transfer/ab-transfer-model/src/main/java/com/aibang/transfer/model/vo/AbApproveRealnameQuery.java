package com.aibang.transfer.model.vo;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;

import java.io.Serializable;


public class AbApproveRealnameQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 8375329818982305674L;
	/** ID */
	private Integer id;
	/** USER_ID */
	private Integer userId;
	/** 真实姓名 */
	private String realname;
	/** 身份证号 */
	private String cardId;
	/** 认证状态 0未审核1审核成功-1审核失败 */
	private Integer status;
	/** 性别 0女1男 */
	private Integer sex;
	/** 身份证图片地址 */
	private String cardPic;
	/** 身份证图片1 */
	private String cardPic1;
	/** 身份证图片2 */
	private String cardPic2;
	/** 人工审核人ID */
	private Integer verifyUserid;
	/** 审核备注 */
	private String verifyMemo;
	/** 审核时间 */
	private java.util.Date verifyTimeBegin;
	private java.util.Date verifyTimeEnd;
	/** 创建时间 */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** 创建时IP */
	private String createIp;
	
	private String username;

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
	
	public String getRealname() {
		return this.realname;
	}
	
	public void setRealname(String value) {
		this.realname = value;
	}
	
	public String getCardId() {
		return this.cardId;
	}
	
	public void setCardId(String value) {
		this.cardId = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	
	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public String getCardPic() {
		return this.cardPic;
	}
	
	public void setCardPic(String value) {
		this.cardPic = value;
	}
	
	public String getCardPic1() {
		return this.cardPic1;
	}
	
	public void setCardPic1(String value) {
		this.cardPic1 = value;
	}
	
	public String getCardPic2() {
		return this.cardPic2;
	}
	
	public void setCardPic2(String value) {
		this.cardPic2 = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
	}
	
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	
	public String getVerifyMemo() {
		return this.verifyMemo;
	}
	
	public void setVerifyMemo(String value) {
		this.verifyMemo = value;
	}
	
	public java.util.Date getVerifyTimeBegin() {
		return this.verifyTimeBegin;
	}
	
	public void setVerifyTimeBegin(java.util.Date value) {
		this.verifyTimeBegin = value;
	}	
	
	public java.util.Date getVerifyTimeEnd() {
		return this.verifyTimeEnd;
	}
	
	public void setVerifyTimeEnd(java.util.Date value) {
		this.verifyTimeEnd = value;
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

