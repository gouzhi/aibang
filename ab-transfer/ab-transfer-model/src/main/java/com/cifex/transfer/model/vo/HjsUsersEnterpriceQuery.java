package com.cifex.transfer.model.vo;
import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.page.BaseQuery;


public class HjsUsersEnterpriceQuery extends BaseQuery implements Serializable {
    

	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = 2875933364403699347L;
	/** ID */
	private Integer id;
	/** 关联的用户基表ID */
	private Integer userId;
	/** 企业/组织类型/CONFIGID=1 */
	private Integer type;
	/** 公司名称 */
	private String entName;
	/** 营业执照 */
	private String zhizhao;
	/** 组织机构代码 */
	private String zuzhidaima;
	/** 税务登记号 */
	private String shuiwuhao;
	/** 公司注册时间 */
	private java.util.Date regTimeBegin;
	private java.util.Date regTimeEnd;
	/** 管理团队介绍 */
	private String team;
	/** 经营范围 */
	private String scope;
	/** 公司简介 */
	private String descr;
	/** 公司地址 */
	private String address;
	/** 联系人 */
	private String contactName;
	/** 联系电话 */
	private String contaceTel;
	/** 公司注册资金 */
	private Integer regMoney;
	/** 下属公司介绍 */
	private String subDesc;
	/** 最后登录时间 */
	private java.util.Date lastTimeBegin;
	private java.util.Date lastTimeEnd;
	/** 最后IP */
	private String lastIp;
	/**
	 * 企业账户信息
	 */
	private HjsUserBaseQuery hjsUserBaseQuery;

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
	
	public Integer getType() {
		return this.type;
	}
	
	public void setType(Integer value) {
		this.type = value;
	}
	
	public String getEntName() {
		return this.entName;
	}
	
	public void setEntName(String value) {
		this.entName = value;
	}
	
	public String getZhizhao() {
		return this.zhizhao;
	}
	
	public void setZhizhao(String value) {
		this.zhizhao = value;
	}
	
	public String getZuzhidaima() {
		return this.zuzhidaima;
	}
	
	public void setZuzhidaima(String value) {
		this.zuzhidaima = value;
	}
	
	public String getShuiwuhao() {
		return this.shuiwuhao;
	}
	
	public void setShuiwuhao(String value) {
		this.shuiwuhao = value;
	}
	
	public java.util.Date getRegTimeBegin() {
		return this.regTimeBegin;
	}
	
	public void setRegTimeBegin(java.util.Date value) {
		this.regTimeBegin = value;
	}	
	
	public java.util.Date getRegTimeEnd() {
		return this.regTimeEnd;
	}
	
	public void setRegTimeEnd(java.util.Date value) {
		this.regTimeEnd = value;
	}
	
	public String getTeam() {
		return this.team;
	}
	
	public void setTeam(String value) {
		this.team = value;
	}
	
	public String getScope() {
		return this.scope;
	}
	
	public void setScope(String value) {
		this.scope = value;
	}
	
	public String getDescr() {
		return this.descr;
	}
	
	public void setDescr(String value) {
		this.descr = value;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public void setAddress(String value) {
		this.address = value;
	}
	
	public String getContactName() {
		return this.contactName;
	}
	
	public void setContactName(String value) {
		this.contactName = value;
	}
	
	public String getContaceTel() {
		return this.contaceTel;
	}
	
	public void setContaceTel(String value) {
		this.contaceTel = value;
	}
	
	public Integer getRegMoney() {
		return this.regMoney;
	}
	
	public void setRegMoney(Integer value) {
		this.regMoney = value;
	}
	
	public String getSubDesc() {
		return this.subDesc;
	}
	
	public void setSubDesc(String value) {
		this.subDesc = value;
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

	public HjsUserBaseQuery getHjsUserBaseQuery() {
		return hjsUserBaseQuery;
	}

	public void setHjsUserBaseQuery(HjsUserBaseQuery hjsUserBaseQuery) {
		this.hjsUserBaseQuery = hjsUserBaseQuery;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
}

