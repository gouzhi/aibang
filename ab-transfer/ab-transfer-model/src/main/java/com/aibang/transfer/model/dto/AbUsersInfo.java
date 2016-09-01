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

public class AbUsersInfo extends BaseEntity implements Serializable{
	
	
	private static final long serialVersionUID = -3617877940670925220L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersInfo";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "关联的用户基表ID";
	public static final String ALIAS_LOGIN_ID = "关联的用户基表ID2";
	public static final String ALIAS_AREAID = "AREA";
	public static final String ALIAS_NINAME = "NINAME";
	public static final String ALIAS_BIRTHDAY = "BIRTHDAY";
	public static final String ALIAS_SEX = "SEX";
	public static final String ALIAS_INVITE_USERID = "邀请人ID";
	public static final String ALIAS_INVITE_MONEY = "INVITE_MONEY";
	public static final String ALIAS_QUESTION = "QUESTION";
	public static final String ALIAS_ANSWER = "ANSWER";
	public static final String ALIAS_LAST_TIME = "最后登录时间";
	public static final String ALIAS_LAST_IP = "最后IP";
	public static final String ALIAS_INVITE_CODE = "本人邀请码/唯一";
	public static final String ALIAS_INTRODUCTION = "个人简介";
	public static final String ALIAS_BASEINFO_OPEN = "基本信息开放状态。0不开放，1开放";
	public static final String ALIAS_QQ = "QQ号码";
	public static final String ALIAS_BLOOD = "血型A,B,AB,O";
	public static final String ALIAS_FAITH = "信仰。1佛教，2道教，3基督教，4天主教，5伊斯兰教，6无神论";
	public static final String ALIAS_EDUCATION = "学历。1小学，2初中，3高中，4大学，5硕士，6博士";
	public static final String ALIAS_UNIVERSITY = "毕业院校";
	public static final String ALIAS_MARRIAGE = "婚姻状况。2已婚，1未婚，0未知或者保密";
	public static final String ALIAS_INFO_OPEN = "会员真实资料开放状态。0不开放，1开放";
	public static final String ALIAS_HEAD_PIC = "会员头像地址";
	public static final String ALIAS_SOURCE = "渠道来源";
	
	//date formats
	public static final String FORMAT_BIRTHDAY = DATE_FORMAT;
	public static final String FORMAT_LAST_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 关联的用户基表ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 关联的用户基表ID2       db_column: LOGIN_ID 
     */	
	private Integer loginId;
    /**
     * AREA       db_column: AREAID 
     */	
	private Integer areaid;
    /**
     * NINAME       db_column: NINAME 
     */	
	private String niname;
    /**
     * BIRTHDAY       db_column: BIRTHDAY 
     */	
	private java.util.Date birthday;
    /**
     * SEX       db_column: SEX 
     */	
	private Integer sex;
    /**
     * 邀请人ID       db_column: INVITE_USERID 
     */	
	private Integer inviteUserid;
    /**
     * INVITE_MONEY       db_column: INVITE_MONEY 
     */	
	private Long inviteMoney;
    
    /**
     * QUESTION       db_column: QUESTION 
     */	
	private String question;
    /**
     * ANSWER       db_column: ANSWER 
     */	
	private String answer;
    /**
     * 最后登录时间       db_column: LAST_TIME 
     */	
	private java.util.Date lastTime;
    /**
     * 最后IP       db_column: LAST_IP 
     */	
	private String lastIp;
	/**
     * 本人邀请码/唯一       db_column: INVITE_CODE 
     */	
	private String inviteCode;
    /**
     * 个人简介       db_column: INTRODUCTION 
     */	
	private String introduction;
    /**
     * 基本信息开放状态。0不开放，1开放       db_column: BASEINFO_OPEN 
     */	
	private Integer baseinfoOpen;
    /**
     * QQ号码       db_column: QQ 
     */	
	private String qq;
    /**
     * 血型A,B,AB,O       db_column: BLOOD 
     */	
	private String blood;
    /**
     * 信仰。1佛教，2道教，3基督教，4天主教，5伊斯兰教，6无神论       db_column: FAITH 
     */	
	private Integer faith;
    /**
     * 学历。1小学，2初中，3高中，4大学，5硕士，6博士       db_column: EDUCATION 
     */	
	private Integer education;
    /**
     * 毕业院校       db_column: UNIVERSITY 
     */	
	private String university;
    /**
     * 婚姻状况。2已婚，1未婚，0未知或者保密       db_column: MARRIAGE 
     */	
	private Integer marriage;
    /**
     * 会员真实资料开放状态。0不开放，1开放       db_column: INFO_OPEN 
     */	
	private Integer infoOpen;
    /**
     * 会员头像地址       db_column: HEAD_PIC 
     */	
	private String headPic;
	/**
	 * 渠道来源     db_column: SOURCE
	 */
	private String source;
	//columns END
	/**
	 * 会员登录信息
	 */
	private AbUser abUser;
	/**
	 * 会员账户信息
	 */
	private AbUserBase abUserBase;
	/**
	 * 会员区域信息
	 */
	private AbSysArea abSysArea;
	/**
	 * 会员黑名单信息
	 */
	private AbUsersBlack abUsersBlack;
	
	private AbUsersInvite abUsersInvite;
	
	private String username;

	public AbUsersInfo(){
	}

	public AbUsersInfo(
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
	public void setLoginId(Integer value) {
		this.loginId = value;
	}
	
	public Integer getLoginId() {
		return this.loginId;
	}
	public void setAreaid(Integer value) {
		this.areaid = value;
	}
	
	public Integer getAreaid() {
		return this.areaid;
	}
	public void setNiname(String value) {
		this.niname = value;
	}
	
	public String getNiname() {
		return this.niname;
	}
	public String getBirthdayString() {
		return DateConvertUtils.format(getBirthday(), FORMAT_BIRTHDAY);
	}
	public void setBirthdayString(String value) {
		setBirthday(DateConvertUtils.parse(value, FORMAT_BIRTHDAY,java.util.Date.class));
	}
	
	public void setBirthday(java.util.Date value) {
		this.birthday = value;
	}
	
	public java.util.Date getBirthday() {
		return this.birthday;
	}
	public void setSex(Integer value) {
		this.sex = value;
	}
	
	public Integer getSex() {
		return this.sex;
	}
	public void setInviteUserid(Integer value) {
		this.inviteUserid = value;
	}
	
	public Integer getInviteUserid() {
		return this.inviteUserid;
	}
	public void setInviteMoney(Long value) {
		this.inviteMoney = value;
	}
	
	public Long getInviteMoney() {
		return this.inviteMoney;
	}
	
	public void setQuestion(String value) {
		this.question = value;
	}
	
	public String getQuestion() {
		return this.question;
	}
	public void setAnswer(String value) {
		this.answer = value;
	}
	
	public String getAnswer() {
		return this.answer;
	}
	public String getLastTimeString() {
		return DateConvertUtils.format(getLastTime(), FORMAT_LAST_TIME);
	}
	public void setLastTimeString(String value) {
		setLastTime(DateConvertUtils.parse(value, FORMAT_LAST_TIME,java.util.Date.class));
	}
	
	public void setLastTime(java.util.Date value) {
		this.lastTime = value;
	}
	
	public java.util.Date getLastTime() {
		return this.lastTime;
	}
	public void setLastIp(String value) {
		this.lastIp = value;
	}
	
	public String getLastIp() {
		return this.lastIp;
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

	public AbUser getAbUser() {
		return abUser;
	}

	public void setAbUser(AbUser abUser) {
		this.abUser = abUser;
	}

	public AbUserBase getAbUserBase() {
		return abUserBase;
	}

	public void setAbUserBase(AbUserBase abUserBase) {
		this.abUserBase = abUserBase;
	}

	public AbSysArea getAbSysArea() {
		return abSysArea;
	}

	public void setAbSysArea(AbSysArea abSysArea) {
		this.abSysArea = abSysArea;
	}

	public AbUsersBlack getAbUsersBlack() {
		return abUsersBlack;
	}

	public void setAbUsersBlack(AbUsersBlack abUsersBlack) {
		this.abUsersBlack = abUsersBlack;
	}

	public AbUsersInvite getAbUsersInvite() {
		return abUsersInvite;
	}

	public void setAbUsersInvite(AbUsersInvite abUsersInvite) {
		this.abUsersInvite = abUsersInvite;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
		.append("Id",getId())
		.append("UserId",getUserId())
		.append("LoginId",getLoginId())
		.append("Areaid",getAreaid())
		.append("Niname",getNiname())
		.append("Birthday",getBirthday())
		.append("Sex",getSex())
		.append("InviteUserid",getInviteUserid())
		.append("InviteMoney",getInviteMoney())
		.append("Question",getQuestion())
		.append("Answer",getAnswer())
		.append("LastTime",getLastTime())
		.append("LastIp",getLastIp())
		.append("InviteCode",getInviteCode())
		.append("Introduction",getIntroduction())
		.append("BaseinfoOpen",getBaseinfoOpen())
		.append("Qq",getQq())
		.append("Blood",getBlood())
		.append("Faith",getFaith())
		.append("Education",getEducation())
		.append("University",getUniversity())
		.append("Marriage",getMarriage())
		.append("InfoOpen",getInfoOpen())
		.append("HeadPic",getHeadPic())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof AbUsersInfo == false) return false;
		if(this == obj) return true;
		AbUsersInfo other = (AbUsersInfo)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

