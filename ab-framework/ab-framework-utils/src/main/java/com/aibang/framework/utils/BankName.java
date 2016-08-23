package com.aibang.framework.utils;
/**
 * 开户银行代号对应银行名称枚举
 * @author zhangyong    
 * @date 2015年11月19日
 */
public enum BankName {
	
	ICBC("ICBC","工商银行"),ABC("ABC","农业银行"),
	CMB("CMB","招商银行"),CCB("CCB","建设银行"),
	BCCB("BCCB","北京银行"),BJRCB("BJRCB","北京农村商业银行"),
	BOC("BOC","中国银行"),BOCOM("BOCOM","交通银行"),
	CMBC("CMBC","民生银行"),BOS("BOS","上海银行"),
	CBHB("CBHB","渤海银行"),CEB("CEB","光大银行"),
	CIB("CIB","兴业银行"),CITIC("CITIC","中信银行"),
	CZB("CZB","浙商银行"),GDB("GDB","广发银行"),
	HKBEA("HKBEA","东亚银行"),HXB("HXB","华夏银行"),
	HZCB("HZCB","杭州银行"),NJCB("NJCB","南京银行"),
	PINGAN("PINGAN","平安银行"),PSBC("PSBC","邮政储蓄银行"),
	SDB("SDB","深发银行"),SPDB("SPDB","浦发银行"),
	SRCB("SRCB","上海农村商业银行");
	
	private String name;
	private String index;
	private BankName(String index,String name){
		this.index = index;
		this.name = name;
	}
	/**
	 * 通过代号得到名称
	 * @param index 开户银行代号
	 * @return String
	 * @author zhangyong
	 * @date 2015年11月19日
	 */
	public static String getName(String index){
		for(BankName bn:BankName.values()){
			if(bn.getIndex().equals(index)){
				return bn.name;
			}
		}
		return null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}
	
	public static void main(String[] args){
		
		System.out.println("-------------"+BankName.getName("ABC"));
	}

}
