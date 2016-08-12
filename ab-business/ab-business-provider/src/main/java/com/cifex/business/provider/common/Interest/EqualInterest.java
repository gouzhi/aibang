package com.cifex.business.provider.common.Interest;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.util.Assert;

import com.cifex.framework.utils.Arith;
import com.cifex.framework.utils.DateUtils;

public class EqualInterest {
 
	public static List<InterestResult> calculate(InterestParams params,RoundingMode roundingMode) {
		// 借款的总金额
		if(params.getAccount()==null||params.getAccount().compareTo(new BigDecimal("0.0"))<0)
		{
			Assert.notNull(null, "金额不能小于0");
		}
		//借款的月数
		if (params.getPeriod()<0){
			Assert.notNull(null, "借款周期不能小于0");
		}
		//借款的年利率
		if (params.getApr()<0){
			Assert.notNull(null, "年利率不能小于0");
		} 
		//借款的时间
		if(params.getTime()==null)
		{
			params.setTime(new Date());
		}
		switch (params.type) {
		   case 1:
			    return EqualEnd(params, roundingMode);       //按月到期还本付息
		   case 2:
				return EqualDayEnd(params, roundingMode);    //按日到期还本付息
		  /*case 0:
				return EqualMonth(params);   //等额本息法
			case 1:
				return EqualSeason(params);  //按季等额本息法
			case 2:
				return EqualDayEnd(params);  //按天到期还款
			case 3:
				return EqualEndMonth(params); //到期还本，按月付息
			case 4:
				return EqualDeng(params);   //等本等息法*/
		
		   /*case 6:
			return EqualTiyan(params);   //体验标 */
		}
		return null;
	}
	
	/**
	 * 按月到期还本付息
	 * @methodname EqualEnd  
	 * @discription 到期付款
	 * @param params
	 * @return Object
	 * @author liuj
	 * @date 2015年9月6日
	 */
	private static List<InterestResult> EqualEnd(InterestParams params,RoundingMode roundingMode) {
		//年利率
		double year_apr=params.getApr();
		//月利率
		double month_apr = Arith.div(year_apr, 12*100);
		//利息
		BigDecimal interest=(new BigDecimal(Double.toString(month_apr)))
							.multiply(new BigDecimal(Double.toString(params.getPeriod())))
							.multiply(params.getAccount()).setScale(2, roundingMode);
		
		List<InterestResult> results=new ArrayList<InterestResult>();
		InterestResult ir=new InterestResult();
		ir.setAccountAll(params.getAccount().add(interest));
		ir.setAccountInterest(interest);
		ir.setAccountCapital(params.getAccount());
		ir.setAccountOther(params.getAccount());
		ir.setRepayMonth(params.getAccount().add(interest));
		Calendar cl = Calendar.getInstance();  
        cl.setTime(params.getTime());  
        cl.add(Calendar.MONTH, (int)params.getPeriod());  
        Date repayTime = cl.getTime();
        ir.setRepayTime(repayTime);
		results.add(ir);
		return results;
	}
	/**
	 * 按日到期还本付息
	 * @methodname EqualDayEnd  
	 * @discription 按日到期还本付息 
	 * @param params
	 * @return List<InterestResult>
	 * @author liuj
	 * @date 2015年9月8日
	 */
	private static List<InterestResult> EqualDayEnd(InterestParams params,RoundingMode roundingMode) {
		//年利率
		double year_apr=params.getApr();
		//月利率
		double month_apr = Arith.div(year_apr, 12*100);
		//日利率
		double day_apr = Arith.div(month_apr,30);
		//利息
		BigDecimal interest=(new BigDecimal(Double.toString(day_apr)))
							.multiply(new BigDecimal(Double.toString(params.getPeriod())))
							.multiply(params.getAccount()).setScale(2, roundingMode);
		
		List<InterestResult> results=new ArrayList<InterestResult>();
		InterestResult ir=new InterestResult();
		ir.setAccountAll(params.getAccount().add(interest));
		ir.setAccountInterest(interest);
		ir.setAccountCapital(params.getAccount());
		ir.setAccountOther(params.getAccount());
		ir.setRepayMonth(params.getAccount().add(interest));
		Calendar cl = Calendar.getInstance();  
        cl.setTime(params.getTime());  
        cl.add(Calendar.DAY_OF_MONTH, (int)params.getPeriod());  
        Date repayTime = cl.getTime();
        ir.setRepayTime(repayTime);
		results.add(ir);
		return results;
	}
	
	public static void main(String[] args) {
		Date date=new Date();
		Calendar cl = Calendar.getInstance();  
        cl.setTime(date);  
        cl.add(Calendar.DAY_OF_MONTH, 2);  
		System.out.println(DateUtils.defaultFormatDate(cl.getTime()));
	}
	
}
