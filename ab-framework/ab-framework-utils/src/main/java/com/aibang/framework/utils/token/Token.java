package com.aibang.framework.utils.token;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * token 注解
 * @classname Token    
 * @description 注解 
 * @author liuj    
 * @date 2016年1月18日
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Token {
 
     boolean save() default false ;
 
     boolean remove() default false ;
}