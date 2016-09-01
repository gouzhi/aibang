package com.aibang.web.task.timer;

import com.aibang.business.api.system.user.AbUserService;
import com.aibang.web.task.util.SpringContextUtil;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;



/**
 * Created by jiwenku on 2015/8/13.
 */
public class TestTimer extends QuartzJobBean{

//    @Resource(name="userService")
//    @Reference(interfaceClass=UserService.class,interfaceName="com.cifex.business.api.system.user.UserService")
//    private UserService userService;

    private AbUserService userService = (AbUserService) SpringContextUtil.getBean("userService");


    protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException
    {
        System.out.println("===timer  test==="+userService.getClass());
    }
}
