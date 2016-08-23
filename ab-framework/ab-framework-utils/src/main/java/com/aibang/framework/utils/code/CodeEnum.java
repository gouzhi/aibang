package com.aibang.framework.utils.code;

/**
 * 编码类型枚举  
 * ?_ (JK:借款,CP:产品,ZJ:资金)
 * #_?_(LX:类型,ZT:主体,HKLX:还款类型)
 * #_#_? text 拼音首字母
 * @classname CodeEnum  编码类型枚举    
 * @description 编码类型 
 * @author liuj    
 * @date 2015年10月16日
 */
public enum CodeEnum implements ICodeEnum {
     
	/*借款类型*/
	JK_LX_JYDK("01","经营贷款"),
	JK_LX_XYDK("02","信用贷款"),
	JK_LX_XFDK("03","消费贷款"),
	JK_LX_DYDK("04","抵押贷款"),
	JK_LX_DBDK("05","担保贷款"),
	/*借款主体*/
	JK_ZT_QYZ("01","企业主"),
	JK_ZT_SBZ("02","上班族"),
	JK_ZT_GTH("03","个体户"),
	JK_ZT_ZYZYZ("04","自由职业者"),
    /*产品类型*/
	CP_LX_DBJK("01","担保借款"),
	/*还款类型*/
	CP_HKLX_DBJK("01","到期还本付息"),
	/*资金交易类型*/
	ZJ_LX_CZ("01","充值"),
	ZJ_LX_CZSXF("02","充值手续费"),
	ZJ_LX_TXDJ("03","提现冻结"),
	ZJ_LX_TX("04","提现"),
	ZJ_LX_TBDJ("05","投标冻结"),
	ZJ_LX_TZCG("06","投资成功"),
	ZJ_LX_TZCH("07","投资撤回"),
	ZJ_LX_JKCG("08","借款成功/开始计息"),
	ZJ_LX_JKRHK("09","借款人还款"),
	ZJ_LX_TZRSK("10","投资人收款"),
	ZJ_LX_JYCHF("11","交易撮合费"),
	ZJ_LX_TXSXF("12","提现手续费"),
	ZJ_LX_JKYQFX("13","借款逾期罚息"),
	ZJ_LX_PTHBCZ("14","平台红包充值"),
	ZJ_LX_PTZSHB("15","平台赠送红包"),
	ZJ_LX_THBDPT("16","退红包到平台"),
	ZJ_LX_XJFY("17","现金返佣"),
	ZJ_LX_PTCZ("18","平台充值"),
	/*活动类型*/
	HD_LX_ZCCX("01","注册促销"),
	/*活动红包*/
	HD_HB_XJQ("01","现金券"),
	HD_HB_FYXJ("02","返佣现金");
	
	
	
	private String code;

    private String text;

    CodeEnum(String code, String text) {
        this.setCode(code);
        this.setText(text);
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
