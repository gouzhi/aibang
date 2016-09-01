package com.aibang.transfer.model.vo;
import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.aibang.framework.utils.page.BaseQuery;
import com.aibang.transfer.model.dto.AbSysArea;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUserBase;


public class AbUsersInfoQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	private static final long serialVersionUID = -1435190181450013509L;
	/** ID */
	private Integer id;
	/** 关联的用户基表ID */
	private Integer userId;
	/** 关联的用户基表ID2 */
	private Integer loginId;
	/** AREA */
	private Integer areaid;
	/** NINAME */
	private String niname;
	/** BIRTHDAY */
	private java.util.Date birthdayBegin;
	private java.util.Date birthdayEnd;
	/** SEX */
	private Integer sex;
	/** 邀请人ID */
	private Integer inviteUserid;
	/** INVITE_MONEY */
	private Long inviteMoney;
	/** QUESTION */
	private String question;
	/** ANSWER */
	private String answer;
	/** 最后登录时间 */
	private java.util.Date lastTimeBegin;
	private java.util.Date lastTimeEnd;
	/** 最后IP */
	private String lastIp;
	/** 本人邀请码/唯一 */
	private String inviteCode;
	/** 个人简介 */
	private String introduction;
	/** 基本信息开放状态。0不开放，1开放 */
	private Integer baseinfoOpen;
	/** QQ号码 */
	private String qq;
	/** 血型A,B,AB,O */
	private String blood;
	/** 信仰。1佛教，2道教，3基督教，4天主教，5伊斯兰教，6无神论 */
	private Integer faith;
	/** 学历。1小学，2初中，3高中，4大学，5硕士，6博士 */
	private Integer education;
	/** 毕业院校 */
	private String university;
	/** 婚姻状况。2已婚，1未婚，0未知或者保密 */
	private Integer marriage;
	/** 会员真实资料开放状态。0不开放，1开放 */
	private Integer infoOpen;
	/** 会员头像地址 */
	private String headPic;
	/** 渠道来源*/
	private String source;
	/**
	 * 用户登陆基本信息
	 */
	private AbUser hjsUser;
	/**
	 * 用户账户
	 */
	private AbUserBase hjsUserBase;
	private AbSysArea hjsSysArea;
	/**
	 *登录名（查询相关）
	 */
	private String username;
	/**
	 * 筛选状态 0 默认 1已投资 2有冻结
	 */
	private Integer checkStatus;
	/*
	 * 用户电话
	 */
	private String phone;
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}
	/**
	 * 会员状态0默认 1有效 2停用 3受限
	 */
	private Integer status;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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
	
	public Integer getLoginId() {
		return this.loginId;
	}
	
	public void setLoginId(Integer value) {
		this.loginId = value;
	}
	
	public Integer getAreaid() {
		return this.areaid;
	}
	
	public void setAreaid(Integer value) {
		this.areaid = value;
	}
	
	public String getNiname() {
		return this.niname;
	}
	
	public void setNiname(String value) {
		this.niname = value;
	}
	
	public java.util.Date getBirthdayBegin() {
		return this.birthdayBegin;
	}
	
	public void setBirthdayBegin(java.util.Date value) {
		this.birthdayBegin = value;
	}	
	
	public java.util.Date getBirthdayEnd() {
		return this.birthdayEnd;
	}
	
	public void setBirthdayEnd(java.util.Date value) {
		this.birthdayEnd = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	
	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public Integer getInviteUserid() {
		return this.inviteUserid;
	}
	
	public void setInviteUserid(Integer value) {
		this.inviteUserid = value;
	}
	
	public Long getInviteMoney() {
		return this.inviteMoney;
	}
	
	public void setInviteMoney(Long value) {
		this.inviteMoney = value;
	}
	
	public String getQuestion() {
		return this.question;
	}
	
	public void setQuestion(String value) {
		this.question = value;
	}
	
	public String getAnswer() {
		return this.answer;
	}
	
	public void setAnswer(String value) {
		this.answer = value;
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

	public String getInviteCode() {
		return inviteCode;
	}

	public void setInviteCode(String inviteCode) {
		this.inviteCode = inviteCode;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getBaseinfoOpen() {
		return baseinfoOpen;
	}

	public void setBaseinfoOpen(Integer baseinfoOpen) {
		this.baseinfoOpen = baseinfoOpen;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getBlood() {
		return blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
	}

	public Integer getFaith() {
		return faith;
	}

	public void setFaith(Integer faith) {
		this.faith = faith;
	}

	public Integer getEducation() {
		return education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public Integer getMarriage() {
		return marriage;
	}

	public void setMarriage(Integer marriage) {
		this.marriage = marriage;
	}

	public Integer getInfoOpen() {
		return infoOpen;
	}

	public void setInfoOpen(Integer infoOpen) {
		this.infoOpen = infoOpen;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}	

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public AbUser getHjsUser() {
		return hjsUser;
	}

	public void setHjsUser(AbUser hjsUser) {
		this.hjsUser = hjsUser;
	}

	public AbUserBase getHjsUserBase() {
		return hjsUserBase;
	}

	public void setHjsUserBase(AbUserBase hjsUserBase) {
		this.hjsUserBase = hjsUserBase;
	}

	public AbSysArea getHjsSysArea() {
		return hjsSysArea;
	}

	public void setHjsSysArea(AbSysArea hjsSysArea) {
		this.hjsSysArea = hjsSysArea;
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

