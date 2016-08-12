/**    
 * @filename ValidateUtils.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月17日     
 */
package com.cifex.framework.utils.validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

/**    
 * @classname ValidateUtils    
 * @description 验证工具类 
 * @author zeng.fangfang    
 * @date 2015年8月17日   
 */
public class ValidateUtils {
	
	/**
	 * 邮箱正则
	 */
	private static final String EMAILREGEX = "^([\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
	/**
	 * ip正则
	 */
	private static final String IPREGEX = "(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)";
	/**
	 * URL正则
	 */
	private static final String URLREGEX = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
	/**
	 * 电话号码（座机）正则
	 */
	private static final String TELEPHONEREGEX = "^(\\d{3,4}-)?\\d{6,8}$";
	/**
	 * 密码验证正则
	 */
	private static final String PASSWORDREGEX = "^( !_)( !.* _$)[a-zA-Z0-9_]{6,20}$";
	/**
	 * 验证邮政编码正则
	 */
	private static final String POSTALCODEREGEX = "^[0-9]{6}$";
	/**
	 * 手机号码正则
	 */                                     
	//private static final String MOBILEREGEX = "^(0|86|17951|\\+86|\\+86\\s|\\+86 )?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$";
	private static final String MOBILEREGEX = "^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$";

	/**
	 * 身份证号码 正则
	 */
	private static final String IDCARDREGEX = "(^\\d{15}$)|(^\\d{17}([0-9]|X)$)";
	/**
	 * 两位小数 正则
	 */
	private static final String DECIMALREGEX = "^[0-9]+(.[0-9]{2})?$";
	/**
	 * 时间验证的YYYY-MM-DD 00:00:00
	 */
	private static final String DATEHHYMDHMSREGEX = "^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\\d):[0-5]?\\d:[0-5]?\\d$";
	/**
	 * 时间验证的YYYY-MM-DD
	 */
	private static final String DATEYMDREGEX = "^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$";
	/**
	 * 数字验证
	 */
	private static final String NUMBERREGEX = "^[0-9]*$";
	/**
	 * 非零的正整数
	 */
	private static final String INTNUMBERREGEX = "^\\+?[1-9][0-9]*$";
	/**
	 * 大写字母
	 */
	private static final String UPCHARREGEX = "^[A-Z]+$";
	/**
	 * 小写字母
	 */
	private static final String LOWCHARREGEX = "^[a-z]+$";
	/**
	 * 字母
	 */
	private static final String LETTERREGEX = "^[A-Za-z]+$";
	/**
	 * 中文
	 */
	private static final String CHINESEREGEX = "^[\u4e00-\u9fa5],{0,}$";
	
	/**
	 * @methodname isStringEmpty  
	 * @discription 空值判断 
	 * @param value 值
	 * @return boolean true：如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isStringEmpty(final String value){
		return StringUtils.isEmpty(value);
	}
	
	/**
	 * @methodname isStringNotEmpty  
	 * @discription 空值判断 
	 * @param value 值
	 * @return boolean true：如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isStringNotEmpty(final String value){
		return !isStringEmpty(value);
	}
	
	
	/**
	 * @methodname isEmail  
	 * @discription 验证邮箱 
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isEmail(final String value){
		return match(EMAILREGEX, value);
	}
	
	/**
	 * @methodname isIp  
	 * @discription 验证IP
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isIp(final String value){
		String regex = "^" + IPREGEX + "\\." + IPREGEX + "\\." + IPREGEX + "\\." + IPREGEX + "$";
		return match(regex, value);
	}
	
	/**
	 * @methodname isUrl  
	 * @discription 验证URL
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isUrl(final String value){
		return match(URLREGEX, value);
	}
	
	/**
	 * @methodname isTelephone  
	 * @discription 验证电话号码（座机）
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isTelephone(final String value){
		return match(TELEPHONEREGEX, value);
	}
	
	/**
	 * @methodname isPassword  
	 * @discription 验证密码(只有字母、数字和下划线且不能以下划线开头和结尾,长度6-20)
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isPassword(final String value){
		return match(PASSWORDREGEX, value);
	}
	
	/**
	 * @methodname isPostalcode  
	 * @discription 验证输入邮政编号
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isPostalcode(final String value){
		return match(POSTALCODEREGEX, value);
	}
	
	/**
	 * @methodname isMobile  
	 * @discription 验证手机号
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isMobile(final String value){
		return match(MOBILEREGEX, value);
	}
	
	/**
	 * @methodname isIDcard  
	 * @discription 验证身份证号
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isIDcard(final String value) {
		return match(IDCARDREGEX, value);
	}
	
	/**
	 * @methodname isDecimal  
	 * @discription 验证两位小数
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isDecimal(final String value){
		return match(DECIMALREGEX, value);
	}

	/**
	 * @methodname isDateYMDHMS  
	 * @discription 严格验证时间日期YYYY-MM-DD 00:00:00 
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isDateYMDHMS(final String value){
		return match(DATEHHYMDHMSREGEX, value);
	}
	
	/**
	 * @methodname isDateYMD  
	 * @discription 严格验证时间日期YYYY-MM-DD
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isDateYMD(final String value){
		return match(DATEYMDREGEX, value);
	}
	
	/**
	 * @methodname isNumber  
	 * @discription 验证数字输入 
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isNumber(final String value) {
		return match(NUMBERREGEX, value);
	}
	
	/**
	 * @methodname isIntNumber  
	 * @discription 验证非零的正整数
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isIntNumber(final String value){
		return match(INTNUMBERREGEX, value);
	}
	
	/**
	 * @methodname isUpChar  
	 * @discription 验证大写字母
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isUpChar(final String value){
		return match(UPCHARREGEX, value);
	}
	
	/**
	 * @methodname isLowChar  
	 * @discription 验证小写字母
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isLowChar(final String value){
		return match(LOWCHARREGEX, value);
	}
	
	/**
	 * @methodname isLetter  
	 * @discription 验证验证输入字母 
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isLetter(final String value){
		return match(LETTERREGEX, value);
	}
	
	/**
	 * @methodname isChinese  
	 * @discription 是否为中文 
	 * @param value 待验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isChinese(final String value){
		return match(CHINESEREGEX, value);
	}
	
	/**
	 * @methodname match  
	 * @discription 通用的正则表达式匹配工具 
	 * @param regex 正则表达式
	 * @param value 需要验证的字符串
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	private static boolean match(String regex, String value) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(value);
		return matcher.matches();
	}
	
	/**
	 * @methodname: isCreditCard
	 * @Description:<p>通过Luhn算法来验证通过。 </p>
	    <p>该校验的过程： </p>
		<p>1、从卡号最后一位数字开始，逆向将奇数位(1、3、5等等)相加。 </p>
		<p>2、从卡号最后一位数字开始，逆向将偶数位数字，先乘以2（如果乘积为两位数，则将其减去9），再求和。 </p>
		<p>3、将奇数位总和加上偶数位总和，结果应该可以被10整除。 </p>
		<p>例如，卡号是：5432123456788881 </p>
		<p>则奇数、偶数位（用红色标出）分布：5432123456788881 </p>
		<p>奇数位和=35 </p>
		<p>偶数位乘以2（有些要减去9）的结果：1 6 2 6 1 5 7 7，求和=35。 </p>
		<p>最后35+35=70 可以被10整除，认定校验通过。 </p>
		<p>请编写一个程序，从键盘输入卡号，然后判断是否校验通过。通过显示：“成功”，否则显示“失败”。 </p>
		<p>比如，用户输入：356827027232780 </p>
		<p>程序输出：成功  </p>
	 * @param nonCheckedcardNum 信用卡号 
	 * @return int
	 * @author: zeng.fangfang
	 * @date 2015年8月17日
	 */
	private static int getCreditCardCode(String nonCheckedcardNum){
		int odd = 0;  
        int even = 0;  
        int t = 0;  
        char[] c = nonCheckedcardNum.toCharArray();  
        if(c.length%2==0){  // 如果位数为偶数个,则第一个数从偶数开始算起  
            for(int i=0;i<c.length;i++){  
                t = c[i]-'0';  
                if(i%2!=0){  
                    odd += t;  
                }else{       // 第一个数加入到偶数  
                    if(t*2>=10) even += t*2-9;  
                    else even += t*2;  
                }  
            }  
        }else{       // 如果位数为奇数个,则第一个数从奇数开始算起  
            for(int i=0;i<c.length;i++){  
                t = c[i]-'0';  
                if(i%2==0){ // 第一个数加入到奇数  
                    odd += t;  
                }else{  
                    if(t*2>=10)even += t*2-9;  
                    else even += t*2;  
                }  
            }  
        }  
        return odd+even;    // 返回奇数位总和加上偶数位总和  
	}
	
	/**
	 * @methodname: isCreditCard
	 * @Description: 验证信用卡号是否正确 
	 * @param nonCheckedcardNum 信用卡号
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author: zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean isCreditCard(String nonCheckedcardNum){
		int flag = getCreditCardCode(nonCheckedcardNum);
		if(flag%10==0)return true; // 结果可以被10整除
        else return false;
	}
	
	/**
	 * @methodname: checkBankCard
	 * @Description: 校验银行卡卡号 
	 * @param cardId 银行卡号
	 * @return boolean 如果是符合的字符串,返回 <b>true </b>,否则为 <b>false </b>
	 * @author: zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static boolean checkBankCard(String cardId) {
		if(cardId.length()==19){			
		}else if(cardId.length()==16){	
		}else{
			return false;
		}
		char bit = getBankCardCheckCode(cardId.substring(0, cardId.length() - 1));
		if (bit == 'N') {
			return false;
		}
		return cardId.charAt(cardId.length() - 1) == bit;
	}

	
	/**
	 * @methodname: getBankCardCheckCode
	 * @Description: 从不含校验位的银行卡卡号采用 Luhm 校验算法获得校验位 
	 * @param nonCheckCodeCardId 银行卡号
	 * @return char
	 * @author: zeng.fangfang
	 * @date 2015年8月17日
	 */
	public static char getBankCardCheckCode(String nonCheckCodeCardId){
        if(nonCheckCodeCardId == null || nonCheckCodeCardId.trim().length() == 0
                || !nonCheckCodeCardId.matches("\\d+")) {
            //如果传的不是数据返回N
            return 'N';
        }
        char[] chs = nonCheckCodeCardId.trim().toCharArray();
        int luhmSum = 0;
        for(int i = chs.length - 1, j = 0; i >= 0; i--, j++) {
            int k = chs[i] - '0';
            if(j % 2 == 0) {
                k *= 2;
                k = k / 10 + k % 10;
            }
            luhmSum += k;           
        }
        return (luhmSum % 10 == 0) ? '0' : (char)((10 - luhmSum % 10) + '0');
    }
	
	public static void main(String[] args) {
//		System.out.println(ValidateUtils.isStringEmpty("dasdasd"));
//		System.out.println(ValidateUtils.isEmail("78917u2938@qq.com"));
//		System.out.println(ValidateUtils.isIp("172.0.0.1"));
//		System.out.println(ValidateUtils.isIDcard("370829198810121717"));
//		System.out.println(ValidateUtils.isDateYMDHMS("2014-12-28 12:00:00"));
		String phone = "15501130873";
        System.out.println("phone: " + isMobile(phone));
		String creditCardNum = "5432123456788881";
        System.out.println("creditCardNum: " + creditCardNum);
        System.out.println("check code: " + getCreditCardCode(creditCardNum));
        System.out.println("是否为信用卡:"+isCreditCard(creditCardNum));
        System.out.println("=====================================================");
        String card = "62270072001208977901";
        System.out.println("card: " + card);
        System.out.println("check code: " + getBankCardCheckCode(card));
        System.out.println("是否为银行卡:"+checkBankCard(card));
	}
}
