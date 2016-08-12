package com.cifex.web.task.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by jiwenku on 2015/8/17.
 */
public class SpringContextUtil {
    private static ApplicationContext context;
    static
    {
        try
        {
            context = new ClassPathXmlApplicationContext(
                    "classpath:spring/applicationContext-dubbo.xml");
        }
        catch (RuntimeException e)
        {
            e.printStackTrace();
        }
    }

    public static Object getBean(String beanName)
    {
        return context.getBean(beanName);
    }

    public static ApplicationContext getContext()
    {
        return context;
    }
}
