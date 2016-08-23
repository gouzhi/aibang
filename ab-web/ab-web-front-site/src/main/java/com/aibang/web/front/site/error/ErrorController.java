package com.aibang.web.front.site.error;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aibang.framework.web.controller.BaseController;

/** 
 * @ClassName: IndexController
 * @Description: 首页
 * @author liuj
 * @date 2015-7-29 下午2:22:07
 * Copyright CIFEX Corporation 2015  
 */
@Controller
@RequestMapping(value="/error")
public class ErrorController extends BaseController {
 
	@RequestMapping(value="/404")
    public String error404() {
		return "error/404";
	}
	
	
	@RequestMapping(value="/500")
    public String error500() {
		return "error/500";
	}
}