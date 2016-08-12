/**    
 * @filename IDCheckUtils.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月27日     
 */
package com.cifex.framework.utils.validate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**      
 * 身份证验证工具类 
 * @author zeng.fangfang    
 * @date 2015年8月27日   
 */
public class IDCheckUtils {

	private final static String BIRTH_DATE_FORMAT = "yyyyMMdd"; // 身份证号码中的出生日期的格式
	private final static Date MINIMAL_BIRTH_DATE = new Date(-2209017600000L); // 身份证的最小出生日期,1900年1月1日
	private final static int NEW_CARD_NUMBER_LENGTH = 18;
	private final static int OLD_CARD_NUMBER_LENGTH = 15;
	private final static char[] VERIFY_CODE = { '1', '0', 'X', '9', '8', '7',
			'6', '5', '4', '3', '2' }; // 18位身份证中最后一位校验码
	private final static int[] VERIFY_CODE_WEIGHT = { 7, 9, 10, 5, 8, 4, 2, 1,
			6, 3, 7, 9, 10, 5, 8, 4, 2 };// 18位身份证中，各个数字的生成校验码时的权值

	/**
	 * 验证身份证号码合法性
	 * @param cardNum 身份证 号码
	 * @return true合法 or false不合法 
	 */
	public static boolean validCard(String cardNum) {

		if (cardNum == null || cardNum.equals("")) {
			return false;
		}

		if (OLD_CARD_NUMBER_LENGTH == cardNum.length()) {
			cardNum = contertToNewCardNumber(cardNum);
		}

		boolean result = true;
		result = result && (null != cardNum); // 身份证号不能为空

		result = result && NEW_CARD_NUMBER_LENGTH == cardNum.length(); // 身份证号长度是18(新证)

		// 身份证号的前17位必须是阿拉伯数字
		for (int i = 0; result && i < NEW_CARD_NUMBER_LENGTH - 1; i++) {
			char ch = cardNum.charAt(i);
			result = result && ch >= '0' && ch <= '9';
		}
		
		// 身份证号的第18位校验正确
		result = result && (calculateVerifyCode(cardNum) == cardNum.charAt(NEW_CARD_NUMBER_LENGTH - 1));

		// 出生日期不能晚于当前时间，并且不能早于1900年
		
		
		String birthdayPart = cardNum.substring(6, 14);
		
		Date birthDate = null;
		try {
			birthDate = createBirthDateParser().parse(birthdayPart);
		} catch (ParseException e) {
			e.printStackTrace();
			
			return false;
		}
		
		result = result && null != birthDate;
		result = result && birthDate.before(new Date());
		result = result && birthDate.after(MINIMAL_BIRTH_DATE);
		

	    String realBirthdayPart = createBirthDateParser().format(birthDate);
	    result = result && (birthdayPart.equals(realBirthdayPart));
		
		return  Boolean.valueOf(result);

	}

	/**
	 * 把15位身份证号码转换到18位身份证号码<br>
	 * 15位身份证号码与18位身份证号码的区别为：<br>
	 * 1、15位身份证号码中，"出生年份"字段是2位，转换时需要补入"19"，表示20世纪<br>
	 * 2、15位身份证无最后一位校验码。18位身份证中，校验码根据根据前17位生成
	 * 
	 * @param cardNumber
	 * @return
	 */
	private static String contertToNewCardNumber(String oldCardNumber) {
		StringBuilder buf = new StringBuilder(NEW_CARD_NUMBER_LENGTH);
		buf.append(oldCardNumber.substring(0, 6));
		buf.append("19");
		buf.append(oldCardNumber.substring(6));
		buf.append(calculateVerifyCode(buf));
		return buf.toString();
	}

	/**
	 * 校验码（第十八位数）：
	 * 
	 * 十七位数字本体码加权求和公式 S = Sum(Ai * Wi), i = 0...16 ，先对前17位数字的权求和；
	 * Ai:表示第i位置上的身份证号码数字值 Wi:表示第i位置上的加权因子 Wi: 7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4
	 * 2; 计算模 Y = mod(S, 11)< 通过模得到对应的校验码 Y: 0 1 2 3 4 5 6 7 8 9 10 校验码: 1 0 X 9
	 * 8 7 6 5 4 3 2
	 * 
	 * @param cardNumber
	 * @return
	 */
	private static char calculateVerifyCode(CharSequence cardNumber) {
		int sum = 0;
		for (int i = 0; i < NEW_CARD_NUMBER_LENGTH - 1; i++) {
			char ch = cardNumber.charAt(i);
			sum += ((int) (ch - '0')) * VERIFY_CODE_WEIGHT[i];
		}
		return VERIFY_CODE[sum % 11];
	}
	
	
	private static SimpleDateFormat createBirthDateParser() {
		return new SimpleDateFormat(BIRTH_DATE_FORMAT);
	}
	
	/**
	 * 根据身份编号获取年龄
	 * @param idCard 身份证编号
	 * @return int 返回年龄
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static int getAgeByIdCard(String idCard) {
		int iAge = 0;
		if (idCard.length() == OLD_CARD_NUMBER_LENGTH) {
			idCard = contertToNewCardNumber(idCard);
		}
		String year = idCard.substring(6, 10);
		Calendar cal = Calendar.getInstance();
		int iCurrYear = cal.get(Calendar.YEAR);
		iAge = iCurrYear - Integer.valueOf(year);
		return iAge;
	}
	
	/**
	 * 根据身份编号获取生日
	 * @param idCard 身份编号
	 * @return String 生日(yyyyMMdd)
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static String getBirthByIdCard(String idCard) {
		Integer len = idCard.length();
		if (len < OLD_CARD_NUMBER_LENGTH) {
			return null;
		} else if (len == OLD_CARD_NUMBER_LENGTH) {
			idCard = contertToNewCardNumber(idCard);
		}
		return idCard.substring(6, 14);
	}
	
	/**
	 * 根据身份编号获取生日年
	 * @param idCard 身份编号
	 * @return Short 生日(yyyy)
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static Short getYearByIdCard(String idCard) {
		Integer len = idCard.length();
		if (len < OLD_CARD_NUMBER_LENGTH) {
			return null;
		} else if (len == OLD_CARD_NUMBER_LENGTH) {
			idCard = contertToNewCardNumber(idCard);
		}
		return Short.valueOf(idCard.substring(6, 10));
	}

	/**
	 * 根据身份编号获取生日月
	 * @param idCard 身份编号
	 * @return Short 生日(MM)
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static Short getMonthByIdCard(String idCard) {
		Integer len = idCard.length();
		if (len < OLD_CARD_NUMBER_LENGTH) {
			return null;
		} else if (len == OLD_CARD_NUMBER_LENGTH) {
			idCard = contertToNewCardNumber(idCard);
		}
		return Short.valueOf(idCard.substring(10, 12));
	}
	
	/**
	 * 根据身份编号获取生日日
	 * @param idCard 身份编号
	 * @return Short 生日(DD)
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static Short getDateByIdCard(String idCard) {
		Integer len = idCard.length();
		if (len < OLD_CARD_NUMBER_LENGTH) {
			return null;
		} else if (len == OLD_CARD_NUMBER_LENGTH) {
			idCard = contertToNewCardNumber(idCard);
		}
		return Short.valueOf(idCard.substring(12, 14));
	}
	
	/**
	 * 根据身份编号获取性别
	 * @param idCard 身份编号
	 * @return String 性别(M-男，F-女，N-未知)
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static String getGenderByIdCard(String idCard) {
		String sGender = "N";
		if (idCard.length() == OLD_CARD_NUMBER_LENGTH) {
			idCard = contertToNewCardNumber(idCard);
		}
		String sCardNum = idCard.substring(16, 17);
		if (Integer.parseInt(sCardNum) % 2 != 0) {
			sGender = "M";
		} else {
			sGender = "F";
		}
		String sex = "男";
		switch (sGender) {
		case "N":
			sex = "未知";
			break;
		case "F":
			sex = "女";
			break;
		default:
			sex = "男";
			break;
		}
		return sex;
	}
	
	/**
	 *  根据身份证号，自动获取对应的星座
	 * @param idCard 身份证编号
	 * @return String 星座
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static String getConstellationById(String idCard) {
		if (!validCard(idCard))
			return "";
		int month = IDCheckUtils.getMonthByIdCard(idCard);
		int day = IDCheckUtils.getDateByIdCard(idCard);
		String strValue = "";

		if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
			strValue = "水瓶座";
		} else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
			strValue = "双鱼座";
		} else if ((month == 3 && day > 20) || (month == 4 && day <= 19)) {
			strValue = "白羊座";
		} else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
			strValue = "金牛座";
		} else if ((month == 5 && day >= 21) || (month == 6 && day <= 21)) {
			strValue = "双子座";
		} else if ((month == 6 && day > 21) || (month == 7 && day <= 22)) {
			strValue = "巨蟹座";
		} else if ((month == 7 && day > 22) || (month == 8 && day <= 22)) {
			strValue = "狮子座";
		} else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
			strValue = "处女座";
		} else if ((month == 9 && day >= 23) || (month == 10 && day <= 23)) {
			strValue = "天秤座";
		} else if ((month == 10 && day > 23) || (month == 11 && day <= 22)) {
			strValue = "天蝎座";
		} else if ((month == 11 && day > 22) || (month == 12 && day <= 21)) {
			strValue = "射手座";
		} else if ((month == 12 && day > 21) || (month == 1 && day <= 19)) {
			strValue = "魔羯座";
		}

		return strValue;
	}
	
	/**
	 * 根据身份证号，自动获取对应的生肖
	 * @param idCard 身份证编号
	 * @return String 生肖
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static String getZodiacById(String idCard) { // 根据身份证号，自动返回对应的生肖
		if (!validCard(idCard))
			return "";

		String sSX[] = { "猪", "鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗" };
		int year = IDCheckUtils.getYearByIdCard(idCard);
		int end = 3;
		int x = (year - end) % 12;

		String retValue = "";
		retValue = sSX[x];

		return retValue;
	}
	
	/**
	 * 获取地址
	 * @param idCard
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月15日
	 */
	public static String getAddress(String idCard) {
		if (!validCard(idCard))
			return "";
		Integer len = idCard.length();
		if (len < OLD_CARD_NUMBER_LENGTH) {
			return null;
		} else if (len == OLD_CARD_NUMBER_LENGTH) {
			idCard = contertToNewCardNumber(idCard);
		}
		String address = null;
		// 加载行政区信息
		InputStream inputStream = IDCheckUtils.class.getResourceAsStream("/AreaInfo.txt");
		BufferedReader reader=new BufferedReader(new InputStreamReader(inputStream));
		Map<String,String> map = new HashMap<String,String>();
		String line;
		try {
			while((line = reader.readLine())!=null){
					map.put(line.substring(0,6), line.substring(6).trim());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		//行政区查询
        address = map.get(idCard.substring(0,6)).replace("null", "");
		return address;
	}
	
	public static void main(String[] args) {
		String idCard = "230705199212319552";
		System.out.println(IDCheckUtils.getGenderByIdCard(idCard));
		System.out.println(IDCheckUtils.getBirthByIdCard(idCard));
		System.out.println(IDCheckUtils.getMonthByIdCard(idCard));
		System.out.println(IDCheckUtils.getDateByIdCard(idCard));
		System.out.println(IDCheckUtils.getConstellationById(idCard));
		System.out.println(IDCheckUtils.getZodiacById(idCard));
		System.out.println(IDCheckUtils.getAgeByIdCard(idCard));
		System.out.println(IDCheckUtils.getAddress(idCard));
	}
}
