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

public class HjsUsersVouch extends BaseEntity implements Serializable{
	
	private static final long serialVersionUID = -7421161617411624607L;
	//alias
	public static final String TABLE_ALIAS = "HjsUsersVouch";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_USER_ID = "统一登录ID";
	public static final String ALIAS_VOUCH_NAME = "担保公司名称";
	public static final String ALIAS_ZHIZHAO = "营业执照";
	public static final String ALIAS_ZUZHIDAIMA = "组织机构代码";
	public static final String ALIAS_SHUIWUHAO = "税务登记号";
	public static final String ALIAS_REG_TIME = "公司注册时间";
	public static final String ALIAS_TEAM = "管理团队介绍";
	public static final String ALIAS_SCOPE = "经营范围";
	public static final String ALIAS_DESCR = "公司简介";
	public static final String ALIAS_ADDRESS = "公司地址";
	public static final String ALIAS_CONTACT_NAME = "联系人";
	public static final String ALIAS_CONTACE_TEL = "联系电话";
	public static final String ALIAS_REG_MONEY = "公司注册资金";
	public static final String ALIAS_SUB_DESC = "下属公司介绍";
	public static final String ALIAS_LAST_TIME = "最后登录时间";
	public static final String ALIAS_LAST_IP = "最后IP";
	
	//date formats
	public static final String FORMAT_REG_TIME = DATE_FORMAT;
	public static final String FORMAT_LAST_TIME = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * ID       db_column: ID 
     */	
	private Integer id;
    /**
     * 统一登录ID       db_column: USER_ID 
     */	
	private Integer userId;
    /**
     * 担保公司名称       db_column: VOUCH_NAME 
     */	
	private String vouchName;
    /**
     * 营业执照       db_column: ZHIZHAO 
     */	
	private String zhizhao;
    /**
     * 组织机构代码       db_column: ZUZHIDAIMA 
     */	
	private String zuzhidaima;
    /**
     * 税务登记号       db_column: SHUIWUHAO 
     */	
	private String shuiwuhao;
    /**
     * 公司注册时间       db_column: REG_TIME 
     */	
	private java.util.Date regTime;
    /**
     * 管理团队介绍       db_column: TEAM 
     */	
	private String team;
    /**
     * 经营范围       db_column: SCOPE 
     */	
	private String scope;
    /**
     * 公司简介       db_column: DESCR 
     */	
	private String descr;
    /**
     * 公司地址       db_column: ADDRESS 
     */	
	private String address;
    /**
     * 联系人       db_column: CONTACT_NAME 
     */	
	private String contactName;
    /**
     * 联系电话       db_column: CONTACE_TEL 
     */	
	private String contaceTel;
    /**
     * 公司注册资金       db_column: REG_MONEY 
     */	
	private Integer regMoney;
    /**
     * 下属公司介绍       db_column: SUB_DESC 
     */	
	private String subDesc;
    /**
     * 最后登录时间       db_column: LAST_TIME 
     */	
	private java.util.Date lastTime;
    /**
     * 最后IP       db_column: LAST_IP 
     */	
	private String lastIp;
	//columns END

	public HjsUsersVouch(){
	}

	public HjsUsersVouch(
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
	public void setVouchName(String value) {
		this.vouchName = value;
	}
	
	public String getVouchName() {
		return this.vouchName;
	}
	public void setZhizhao(String value) {
		this.zhizhao = value;
	}
	
	public String getZhizhao() {
		return this.zhizhao;
	}
	public void setZuzhidaima(String value) {
		this.zuzhidaima = value;
	}
	
	public String getZuzhidaima() {
		return this.zuzhidaima;
	}
	public void setShuiwuhao(String value) {
		this.shuiwuhao = value;
	}
	
	public String getShuiwuhao() {
		return this.shuiwuhao;
	}
	public String getRegTimeString() {
		return DateConvertUtils.format(getRegTime(), FORMAT_REG_TIME);
	}
	public void setRegTimeString(String value) {
		setRegTime(DateConvertUtils.parse(value, FORMAT_REG_TIME,java.util.Date.class));
	}
	
	public void setRegTime(java.util.Date value) {
		this.regTime = value;
	}
	
	public java.util.Date getRegTime() {
		return this.regTime;
	}
	public void setTeam(String value) {
		this.team = value;
	}
	
	public String getTeam() {
		return this.team;
	}
	public void setScope(String value) {
		this.scope = value;
	}
	
	public String getScope() {
		return this.scope;
	}
	public void setDescr(String value) {
		this.descr = value;
	}
	
	public String getDescr() {
		return this.descr;
	}
	public void setAddress(String value) {
		this.address = value;
	}
	
	public String getAddress() {
		return this.address;
	}
	public void setContactName(String value) {
		this.contactName = value;
	}
	
	public String getContactName() {
		return this.contactName;
	}
	public void setContaceTel(String value) {
		this.contaceTel = value;
	}
	
	public String getContaceTel() {
		return this.contaceTel;
	}
	public void setRegMoney(Integer value) {
		this.regMoney = value;
	}
	
	public Integer getRegMoney() {
		return this.regMoney;
	}
	public void setSubDesc(String value) {
		this.subDesc = value;
	}
	
	public String getSubDesc() {
		return this.subDesc;
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

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getUserId())
			.append("VouchName",getVouchName())
			.append("Zhizhao",getZhizhao())
			.append("Zuzhidaima",getZuzhidaima())
			.append("Shuiwuhao",getShuiwuhao())
			.append("RegTime",getRegTime())
			.append("Team",getTeam())
			.append("Scope",getScope())
			.append("Descr",getDescr())
			.append("Address",getAddress())
			.append("ContactName",getContactName())
			.append("ContaceTel",getContaceTel())
			.append("RegMoney",getRegMoney())
			.append("SubDesc",getSubDesc())
			.append("LastTime",getLastTime())
			.append("LastIp",getLastIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof HjsUsersVouch == false) return false;
		if(this == obj) return true;
		HjsUsersVouch other = (HjsUsersVouch)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

