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

public class HjsApproveRealname extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -5940364925540125859L;
	//alias
	public static final String TABLE_ALIAS = "HjsApproveRealname";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "USER_ID";
	public static final String ALIAS_REALNAME = "真实姓名";
	public static final String ALIAS_CARD_ID = "身份证号";
	public static final String ALIAS_STATUS = "认证状态 0未审核1审核成功-1审核失败";
	public static final String ALIAS_SEX = "性别 0女1男";
	public static final String ALIAS_CARD_PIC = "身份证图片地址";
	public static final String ALIAS_CARD_PIC1 = "身份证图片1";
	public static final String ALIAS_CARD_PIC2 = "身份证图片2";
	public static final String ALIAS_VERIFY_USERID = "人工审核人ID";
	public static final String ALIAS_VERIFY_MEMO = "审核备注";
	public static final String ALIAS_VERIFY_TIME = "审核时间";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_CREATE_IP = "创建时IP";
	
	//date formats
	public static final String FORMAT_VERIFY_TIME = DATE_FORMAT;
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
     * 真实姓名       db_column: REALNAME 
     */	
	private String realname;
    /**
     * 身份证号       db_column: CARD_ID 
     */	
	private String cardId;
    /**
     * 认证状态 0未审核1审核成功-1审核失败       db_column: STATUS 
     */	
	private Integer status;
    /**
     * 性别 0女1男       db_column: SEX 
     */	
	private Integer sex;
    /**
     * 身份证图片地址       db_column: CARD_PIC 
     */	
	private String cardPic;
    /**
     * 身份证图片1       db_column: CARD_PIC1 
     */	
	private String cardPic1;
    /**
     * 身份证图片2       db_column: CARD_PIC2 
     */	
	private String cardPic2;
    /**
     * 人工审核人ID       db_column: VERIFY_USERID 
     */	
	private Integer verifyUserid;
    /**
     * 审核备注       db_column: VERIFY_MEMO 
     */	
	private String verifyMemo;
    /**
     * 审核时间       db_column: VERIFY_TIME 
     */	
	private java.util.Date verifyTime;
    /**
     * 创建时间       db_column: CREATE_TIME 
     */	
	private java.util.Date createTime;
    /**
     * 创建时IP       db_column: CREATE_IP 
     */	
	private String createIp;
	//columns END
	/**
	 * 关联用户对象
	 */
	private HjsUser hjsUser;

	public HjsUser getHjsUser() {
		return hjsUser;
	}

	public void setHjsUser(HjsUser hjsUser) {
		this.hjsUser = hjsUser;
	}

	public HjsApproveRealname(){
	}

	public HjsApproveRealname(
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
	public void setRealname(String value) {
		this.realname = value;
	}
	
	public String getRealname() {
		return this.realname;
	}
	public void setCardId(String value) {
		this.cardId = value;
	}
	
	public String getCardId() {
		return this.cardId;
	}
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	public void setCardPic(String value) {
		this.cardPic = value;
	}
	
	public String getCardPic() {
		return this.cardPic;
	}
	public void setCardPic1(String value) {
		this.cardPic1 = value;
	}
	
	public String getCardPic1() {
		return this.cardPic1;
	}
	public void setCardPic2(String value) {
		this.cardPic2 = value;
	}
	
	public String getCardPic2() {
		return this.cardPic2;
	}
	public void setVerifyUserid(Integer value) {
		this.verifyUserid = value;
	}
	
	public Integer getVerifyUserid() {
		return this.verifyUserid;
	}
	public void setVerifyMemo(String value) {
		this.verifyMemo = value;
	}
	
	public String getVerifyMemo() {
		return this.verifyMemo;
	}
	public String getVerifyTimeString() {
		return DateConvertUtils.format(getVerifyTime(), FORMAT_VERIFY_TIME);
	}
	public void setVerifyTimeString(String value) {
		setVerifyTime(DateConvertUtils.parse(value, FORMAT_VERIFY_TIME,java.util.Date.class));
	}
	
	public void setVerifyTime(java.util.Date value) {
		this.verifyTime = value;
	}
	
	public java.util.Date getVerifyTime() {
		return this.verifyTime;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("Realname",getRealname())
			.append("CardId",getCardId())
			.append("Status",getStatus())
			.append("Sex",getSex())
			.append("CardPic",getCardPic())
			.append("CardPic1",getCardPic1())
			.append("CardPic2",getCardPic2())
			.append("VerifyUserid",getVerifyUserid())
			.append("VerifyMemo",getVerifyMemo())
			.append("VerifyTime",getVerifyTime())
			.append("CreateTime",getCreateTime())
			.append("CreateIp",getCreateIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsApproveRealname == false) return false;
		if(this == obj) return true;
		HjsApproveRealname other = (HjsApproveRealname)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

