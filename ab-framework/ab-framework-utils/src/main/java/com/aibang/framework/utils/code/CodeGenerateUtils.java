/**    
 * @filename CodeGenerateUtils.java     
 * @version www.cifex.com.cn    
 * @date 2015年10月15日     
 */
package com.aibang.framework.utils.code;

import java.util.Date;

import com.aibang.framework.utils.DateUtils;

/**
 * 编号生成工具类
 * 
 * @author zeng.fangfang
 * @date 2015年10月15日
 */
public class CodeGenerateUtils {

	private static final String USER_CODE = "YH";
	private static final String LOAN_CODE = "JK";
	private static final String BORROW_CODE = "CP";
	private static final String ORGANIZATION_CODE = "DB";
	private static final String CAPITAL_CODE = "JY";
	private static final String ACTIVE_CODE = "AS";
	private static final String RED_CODE = "BO";


	/**
	 * 生成用户编号
	 * 
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String userCode() {
		String date = DateUtils.formatDate(new Date(), "yyMMddHHmm");
		return USER_CODE + date + RandomUtil.generateNumber(4);
	}
	
	/**
	 * 借款编号
	 * @param projectType 类型编号("01=经营贷款；02=信用贷款；03=消费贷款；04=抵押贷款；05=担保贷款")
	 * @param loanType 借款主体编号(01=企业主；02=上班族；03=个体户；04=自由职业者)
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String loanCode(Integer projectType,Integer loanType){
		return LOAN_CODE + String.format("%02d",projectType) + String.format("%02d",loanType) + RandomUtil.generateNumber(6);
	}
	
	/**
	 * 产品编号
	 * @param borrowType 类型编号（01=担保借款）
	 * @param repayType 还款方式编号（01=到期还本付息）
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String borrowCode(Integer borrowType,Integer repayType){
		return BORROW_CODE + String.format("%02d",borrowType) + String.format("%02d",repayType) + RandomUtil.generateNumber(6);
	}

	/**
	 * 担保机构编号
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String organizationCode(){
		String date = DateUtils.formatDate(new Date(), "yyMMddHHmm");
		return ORGANIZATION_CODE + date + RandomUtil.generateNumber(2);
	}
	
	/**
	 * 订单编号
	 * @param borrowCode
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String orderCode(String borrowCode){
		String date = DateUtils.formatDate(new Date(), "yyMMddHHmmssSSS");
		return borrowCode + date;
	}
	
	/**
	 * 资金记录编号
	 * @param type 类型编号(<p>01=充值；02=充值手续费；03=提现冻结；04=提现；</p>
						<p>05=投标冻结；06=投资成功；07=投资撤回；08=借款成功/开始计息</p>
						<p>09=借款人还款；10=投资人收款；11=交易撮合费；12=提现手续费</p>
						<p>13=借款逾期罚息；14=平台红包充值；15=平台赠送红包；</p>
						<p>16=退红包到平台；17=现金返佣；18=平台充值)</p>
	 * @param paymentsType 收支编号(01=收入；02=支出)
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String capitalCode(Integer type,Integer paymentsType){
		String date = DateUtils.formatDate(new Date(), "yyMMddHHmmssSSS");
		return CAPITAL_CODE + String.format("%02d", type) + String.format("%02d", paymentsType) + date;
	}
	
	/**
	 * 活动编号
	 * @param activeType 活动类型(01=注册促销)
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String activeCode(int activeType){
		return ACTIVE_CODE + String.format("%02d", activeType) + RandomUtil.generateNumber(4);
	}
	
	/**
	 * 红包编号
	 * @param redType 红包类型(01=现金券；02=返佣现金)
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String redCode(Integer redType){
		return RED_CODE + String.format("%02d", redType) + RandomUtil.generateNumber(4);
	}
	
	/**
	 * 奖励编号
	 * @param redCode
	 * @param activeCode
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static synchronized String rewardCode(String redCode,String activeCode){
		return redCode + activeCode + RandomUtil.generateNumber(6);
	}

	public static void main(String[] args) {
		System.out.println(userCode());
		System.out.println(loanCode(1, 1));
		System.out.println(borrowCode(1, 1));
		System.out.println(organizationCode());
		System.out.println(orderCode("CP0101278946"));
		System.out.println(capitalCode(1, 1));
		System.out.println(activeCode(2));
		System.out.println(redCode(1));
		System.out.println(rewardCode(redCode(1), activeCode(1)));
	}
}
