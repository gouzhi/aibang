package com.cifex.framework.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.regex.Pattern;
/**
 * 数字工具类
 * @classname NumberUtil    
 * @description 数字工具类 
 * @author liuj    
 * @date 2015年10月12日
 */
public final class NumberUtil {

    private static final BigDecimal hundred = BigDecimal.valueOf(100);
//    private static final BigDecimal twoHundred = BigDecimal.valueOf(200);
//    private static final BigDecimal thousand = BigDecimal.valueOf(1000);
//    private static final BigDecimal fiveThousand = BigDecimal.valueOf(5000);
    private static final BigDecimal tenThousand = BigDecimal.valueOf(10000);

    private NumberUtil() {
    }
    
    public static BigDecimal getHundred() {
    	return hundred;
    }
    
//    public static BigDecimal getTwoHundred() {
//    	return twoHundred;
//    }
    
//    public static BigDecimal getThousand() {
//    	return thousand;
//    }
    
//    public static BigDecimal getFiveThousand() {
//    	return fiveThousand;
//    }
//    
    public static BigDecimal getTenThousand() {
    	return tenThousand;
    }
    
    /**
     * 格式化金额为 万元 单位
     * @param value
     * @return
     */
    public static BigDecimal formatTenThousandUnitAmt(BigDecimal value){
    	return value.divide(getTenThousand());
    }
    /**
     * 是否为正
     * @methodname isPositive  
     * @discription 是否为正 
     * @param i
     * @return boolean
     * @author liuj
     * @date 2015年10月12日
     */
    public static boolean isPositive(Integer i) {
        return i != null && i > 0;
    }
   /**
    * 是否为正
    * @methodname isPositive  
    * @discription 是否为正 
    * @param i
    * @return boolean
    * @author liuj
    * @date 2015年10月12日
    */
    public static boolean isPositive(BigDecimal i) {
        return i != null && i.compareTo(BigDecimal.ZERO) > 0;
    }
   /**
    * 是否不为负
    * @methodname isNotNegative  
    * @discription 是否不为负 
    * @param i
    * @return boolean
    * @author liuj
    * @date 2015年10月12日
    */
    public static boolean isNotNegative(BigDecimal i) {
    	return i != null && i.compareTo(BigDecimal.ZERO) >= 0;
    }

    /**
     * 小数转百分比
     * @methodname getPercentStr  
     * @discription 小数转百分比 
     * @param value 小数
     * @param scale 保留最少几位
     * @param hasSign 是否加后缀 % 符号
     * @return String 百分率 
     * @author liuj
     * @date 2015年10月12日
     */
    public static String getPercentStr(BigDecimal value, int scale, boolean hasSign) {
        String sign = hasSign ? "%" : "";
        if (value != null) {
            BigDecimal multiply = value.multiply(hundred).stripTrailingZeros();
			if (multiply.scale() < scale) {
				multiply = multiply.setScale(scale);
			}
            return multiply.toString() + sign;
        }
        return BigDecimal.ZERO.setScale(scale).toString() + sign;
    }
   
    /**
     * 百分率转换后以 符号(.) 分离
     * @methodname getPercentSplitStr  
     * @discription 百分率转换后以 符号(.) 分离
     * @param value 小数
     * @param scale 保留最少几位
     * @return String[] 分离结果
     * @author liuj
     * @date 2015年10月12日
     */
    public static String[] getPercentSplitStr(BigDecimal value, int scale) {
        return getPercentStr(value, scale, false).split("\\.");
    }
	/**
	 * 格式化金额 保留两位小数
	 * @methodname formatMoney  
	 * @discription 格式化金额 保留两位小数 
	 * @param value 金额
	 * @param hasDecimal 后两位是否总是显示 
	 * @return String
	 * @author liuj
	 * @date 2015年10月12日
	 */
    public static String formatMoney(BigDecimal value, boolean hasDecimal) {
        if (value != null) {
            return formatMoney(value.doubleValue(), hasDecimal);
        }
        return formatMoney(0d, hasDecimal);
    }
    /**
     * 格式化金额 显示小数点后两位
     * @methodname formatMoney  
     * @discription 格式化金额 显示小数点后两位 
     * @param value 金额
     * @return String 格式化后金额
     * @author liuj
     * @date 2015年10月12日
     */
    public static String formatMoney(BigDecimal value) {
        if (value != null) {
            return formatMoney(value.doubleValue(), true);
        }
        return "0.00";
    }
    /**
     * 格式化金额 保留两位小数
     * @methodname formatMoney  
     * @discription 格式化金额 保留两位小数  
     * @param value 金额
     * @param hasDecimal 后两位是否总是显示 
     * @return String
     * @author liuj
     * @date 2015年10月12日
     */
    public static String formatMoney(Long value, boolean hasDecimal) {
        if (value != null) {
            return formatMoney(value.doubleValue(), hasDecimal);
        }
        return formatMoney(0d, hasDecimal);
    }

    
    /**
     * 格式化金额 显示小数点后两位
     * @methodname formatMoney  
     * @discription 格式化金额 显示小数点后两位 
     * @param value 金额
     * @return String 格式化后金额
     * @author liuj
     * @date 2015年10月12日
     */
    public static String formatMoney(Long value) {
        if (value != null) {
            return formatMoney(value.doubleValue(), true);
        }
        return "0.00";
    }
    /**
	 * 格式化金额 保留两位小数
	 * @methodname formatMoney  
	 * @discription 格式化金额 保留两位小数 
	 * @param value 金额
	 * @param hasDecimal 后两位是否总是显示 
	 * @return String
	 * @author liuj
	 * @date 2015年10月12日
	 */
    public static String formatMoney(Double value, boolean hasDecimal) {
        String regexp = ",###.##";
        if (hasDecimal) {
            regexp = ",##0.00";
        }
        NumberFormat formatter = new DecimalFormat(regexp);
        formatter.setRoundingMode(RoundingMode.DOWN);
        return formatter.format(value);
    }
    /**
     * 金额格式化成万以上 （千元下不显示）
     * @methodname formatLargeMoney  
     * @discription 金额格式化成万以上 （千元下不显示） 
     * @param value
     * @return String
     * @author liuj
     * @date 2015年10月12日
     */
    public static String formatLargeMoney(BigDecimal value) {
        if (value != null && BigDecimal.ZERO.compareTo(value) < 0) {
            NumberFormat formatter = new DecimalFormat(",###");
            return formatter.format(value.divide(tenThousand, 0, RoundingMode.DOWN));
        }
        return "0";
    }

   /**
    * 格式化成 , 形式 显示没有小数
    * @methodname formatToThousands  
    * @discription 格式化成 , 形式显示没有小数 
    * @param value
    * @return String
    * @author liuj
    * @date 2015年10月12日
    */
    public static String formatToThousands(BigDecimal value) {
        if (value != null) {
            NumberFormat formatter = new DecimalFormat(",###");
            return formatter.format(value);
        }
        return "0";
    }
    /**
     * 格式化成 , 形式  保留两位小数
     * @methodname formatToThousandsWithFractionDigits  
     * @discription 格式化成 , 形式 保留两位小数  
     * @param value
     * @return String
     * @author liuj
     * @date 2015年10月12日
     */
    public static String formatToThousandsWithFractionDigits(BigDecimal value) {
        if (value != null) {
            NumberFormat formatter = new DecimalFormat(",##0.00");
            return formatter.format(value);
        }
        return "0";
    }
    /**
     * 金额转人民币大写
     * @methodname toRMB  
     * @discription 金额转人民币大写 
     * @param money 金额
     * @return String 人民币大写
     * @author liuj
     * @date 2015年10月12日
     */
    public static String toRMB(String money) {
    	return toRMB(Double.valueOf(money));
    }

    /**
     * 金额转人民币大写
     * @methodname toRMB  
     * @discription 金额转人民币大写 
     * @param money 金额
     * @return String 人民币大写
     * @author liuj
     * @date 2015年10月12日
     */
    public static String toRMB(double money) {
        char[] s1 = { '零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖' };
        char[] s4 = { '分', '角', '元', '拾', '佰', '仟', '万', '拾', '佰', '仟', '亿', '拾', '佰', '仟', '万' };
        String str = String.valueOf(Math.round(money * 100 + 0.00001));
        String result = "";

        for (int i = 0; i < str.length(); i++) {
            int n = str.charAt(str.length() - 1 - i) - '0';
            result = s1[n] + "" + s4[i] + result;
        }

        result = result.replaceAll("零仟", "零");
        result = result.replaceAll("零佰", "零");
        result = result.replaceAll("零拾", "零");
        result = result.replaceAll("零亿", "亿");
        result = result.replaceAll("零万", "万");
        result = result.replaceAll("零元", "元");
        result = result.replaceAll("零角", "零");
        result = result.replaceAll("零分", "零");

        result = result.replaceAll("零零", "零");
        result = result.replaceAll("零亿", "亿");
        result = result.replaceAll("零零", "零");
        result = result.replaceAll("零万", "万");
        result = result.replaceAll("零零", "零");
        result = result.replaceAll("零元", "元");
        result = result.replaceAll("亿万", "亿");

        result = result.replaceAll("零$", "");
        result = result.replaceAll("元$", "元整");
        result = result.replaceAll("角$", "角整");

        return result;
    }
    /**
     * 是否是数值型
     * @methodname isNumeric  
     * @discription 是否是数值型 
     * @param str 字符串
     * @return boolean
     * @author liuj
     * @date 2015年10月12日
     */
    public static boolean isNumeric(String str) {
		return isInteger(str) || isDouble(str);
	}
    /**
     * 是否是整型
     * @methodname isInteger  
     * @discription 是否是整型 
     * @param str 字符串
     * @return boolean
     * @author liuj
     * @date 2015年10月12日
     */
	public static boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}
    /**
     * 是否是双精度浮点型
     * @methodname isDouble  
     * @discription 是否是双精度浮点型 
     * @param str 字符串
     * @return boolean
     * @author liuj
     * @date 2015年10月12日
     */
	public static boolean isDouble(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[.\\d]*$");
		return pattern.matcher(str).matches();
	}
	 
}
