package com.cifex.web.task;

import com.cifex.business.api.system.user.HjsUserService;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.web.task.util.SpringContextUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * Created by jiwenku on 2015/8/13.
 */
@Controller
public class TestController {
//    @Resource(name="userService")
//    @Reference(interfaceClass=UserService.class,interfaceName="com.cifex.business.api.system.user.UserService")
//    private UserService userService;

//    @Resource(name="userService")
//    private UserService userService1;
//    @Reference(interfaceClass=UserService.class,interfaceName="com.cifex.business.api.system.user.UserService")
//    private UserService userService2;

    private HjsUserService userService = (HjsUserService) SpringContextUtil.getBean("userService");
    @SuppressWarnings("unused")
	private HjsUserService userService2 = (HjsUserService) SpringContextUtil.getBean("userService");

    @RequestMapping(value="/addtest")
    public String addtest()throws Exception{
        HjsUser user = new HjsUser();
        user.setUsername("ttt111");
        user.setPassword("ttt111");
        user.setCreateIp("111");
        user.setCreateTime(new Date());
        user.setEmail("emai");
        user.setPhone("11");
        userService.saveObj(user);
        System.out.println("test   contorller");
        System.out.println("test   contorller");
        System.out.println("test   contorller");


        return null;
    }
    @RequestMapping(value="/findtest")
    public String findtest()throws Exception{
        System.out.println("test   contorller");
        System.out.println("test   contorller");
        System.out.println("test   contorller");
        return null;
    }
}
