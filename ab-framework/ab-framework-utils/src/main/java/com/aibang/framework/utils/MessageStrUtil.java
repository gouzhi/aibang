package com.aibang.framework.utils;

import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
/**
 * 获取 properties 信息模板引擎
 * @classname MessageStrUtil    
 * @description 获取 properties 信息模板引擎 
 * @author liuj    
 * @date 2015年9月17日
 */
public final class MessageStrUtil {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(MessageStrUtil.class);

    private static MessageSource messageSource;

    private static Locale defaultLocale = Locale.SIMPLIFIED_CHINESE;

    /**
     * 获取信息
     * @methodname getMessage  
     * @discription 获取信息 
     * @param code 名称
     * @return String 内容
     * @author liuj
     * @date 2015年9月17日
     */
    public static String getMessage(String code) {
        return getMessage(code, defaultLocale);
    }
    /**
     * 获取信息
     * @methodname getMessage  
     * @discription 获取信息 
     * @param code 名称
     * @param args 参数
     * @return String 内容
     * @author liuj
     * @date 2015年9月17日
     */
    public static String getMessage(String code, Object... args) {
        return getMessage(code, defaultLocale, args);
    }
    /**
     * 获取信息
     * @methodname getMessage  
     * @discription 获取信息  
     * @param code 名称
     * @param locale 本地化
     * @param args 参数
     * @return String 内容
     * @author liuj
     * @date 2015年9月17日
     */
    public static String getMessage(String code, Locale locale, Object... args) {
        LOGGER.debug("getMessage() invoked,  Message code: " + code);
        return messageSource.getMessage(code, args, "Unknown message, code: " + code, locale);
    }

    public static void setMessageSource(MessageSource messageSource) {
    	MessageStrUtil.messageSource = messageSource;
    }

}