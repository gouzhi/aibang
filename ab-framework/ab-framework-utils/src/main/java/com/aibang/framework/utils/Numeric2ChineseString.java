 

package com.aibang.framework.utils;
/**
 * 数值转中文
 * @classname Numeric2ChineseString    
 * @description 数值转中文 
 * @author liuj    
 * @date 2015年10月12日
 */
public class Numeric2ChineseString {
    private static final String[] UNITS = new String[] { "千", "百", "十", ""};

    private static final char[] NUM_CHARS = new char[] { '一', '二', '三', '四', '五', '六', '七', '八', '九' };

    private static final char NUM_ZERO = '零';

    /**
     * 将一位数字转换为一位中文数字; eg: 1 返回 一;
     * @methodname numberCharArab2CN  
     * @discription 将一位数字转换为一位中文数字; eg: 1 返回 一; 
     * @param arabNumber
     * @return char
     * @author liuj
     * @date 2015年10月12日
     */
    public static char numberCharArab2CN(char arabNumber) {

        if (arabNumber == '0') {
            return NUM_ZERO;
        }

        if (arabNumber > '0' && arabNumber <= '9') {
            return NUM_CHARS[arabNumber - '0' - 1];
        }

        return arabNumber;
    }
    /**
     * 将数值转中文
     * @methodname numberArab2ChineseString  
     * @discription 将数值转中文 
     * @param num 数值
     * @return String 中文
     * @author liuj
     * @date 2015年10月12日
     */
    public static String numberArab2ChineseString(int num) {
        char[] numChars = (num + "").toCharArray();

        String tempStr = "";

        int inc = UNITS.length - numChars.length;

        for (int i = 0; i < numChars.length; i++) {
            if (numChars[i] != '0') {
                tempStr += numberCharArab2CN(numChars[i]) + UNITS[i + inc];
            } else {
                tempStr += numberCharArab2CN(numChars[i]);
            }
        }

        tempStr = tempStr.replaceAll(NUM_ZERO + "+", NUM_ZERO + "");

        tempStr = tempStr.replaceAll(NUM_ZERO + "$", "");

        return tempStr;
    }
    
    private Numeric2ChineseString() {
		super();
	}
    
}
