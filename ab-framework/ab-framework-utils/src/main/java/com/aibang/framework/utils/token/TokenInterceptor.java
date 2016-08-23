package com.aibang.framework.utils.token;

import java.lang.reflect.Method;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 令牌拦截器
 * @classname TokenInterceptor    
 * @description 令牌拦截器 
 * @author liuj    
 * @date 2016年1月18日
 *  Spring MVC的配置文件里加入：  
 *  <mvc:annotation-driven/>	 
 *  <aop:aspectj-autoproxy proxy-target-class="true"></aop:aspectj-autoproxy>
 *  <mvc:interceptors> 
 *     <!-- 配置Token拦截器，防止用户重复提交数据 -->
 *     < mvc:interceptor>
 *         < mvc:mapping path = "/**" />
 *         < bean class = "com.cifex.framework.utils.token.TokenInterceptor" />
 *	   </ mvc:interceptor>
 *  </mvc:interceptors>
 *  在需要生成token的controller上增加@Token(save=true)，
 *  而在需要检查重复提交的controller上添加@Token(remove=true)就可以了。
 *  页面加入：<input type="hidden" name="token" value="${token}"/>
 */
public class TokenInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            //Token annotation= AnnotationUtils.findAnnotation(handlerMethod.getMethod(), Token.class);
            Method method=handlerMethod.getMethod();
            Token annotation=method.getAnnotation(Token.class);
            if (annotation != null ) {
                boolean needSaveSession = annotation.save();
                if (needSaveSession) {
                    request.getSession(false).setAttribute( "token" , UUID.randomUUID().toString());
                }
                boolean needRemoveSession = annotation.remove();
                if (needRemoveSession) {
                    if (isRepeatSubmit(request)) {
                        return false ;
                    }
                    request.getSession(false).removeAttribute( "token" );
                }
            }
            return true ;
        } else {
            return super.preHandle(request, response, handler);
        }
    }

    private boolean isRepeatSubmit(HttpServletRequest request) {
        String serverToken = (String) request.getSession( false ).getAttribute( "token" );
        if (serverToken == null ) {
            return true ;
        }
        String clinetToken = request.getParameter( "token" );
        if (clinetToken == null ) {
            return true ;
        }
        if (!serverToken.equals(clinetToken)) {
            return true ;
        }
        return false ;
    }
}
