package com.cifex.web.move.site.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2015/10/13.
 */
@Controller
@RequestMapping(value="/test")
public class Test{
    @RequestMapping(value="/login")
    public String toLogin()throws Exception{

        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa");


        return "";
    }
}
