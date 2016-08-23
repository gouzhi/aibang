
/**   
 * @Title: IndexController.java 
 * @Package com.cifex.front.controller.home 
 * @Description: 首页
 * @author liuj    
 * @date 2015-7-29 下午2:22:07 
 * Copyright CIFEX Corporation 2015   
 * 版权所有  
 * @version V1.0   
*/ 

package com.aibang.web.front.site.home;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aibang.framework.utils.FreeMarkerUtil;
import com.aibang.web.front.site.base.UserController;

import freemarker.template.TemplateException;


/** 
 * @ClassName: IndexController
 * @Description: 首页
 * @author liuj
 * @date 2015-7-29 下午2:22:07
 * Copyright CIFEX Corporation 2015  
 */
@Controller
@RequestMapping(value="/home")
public class IndexController extends UserController{
	
	/*@Autowired
	private VelocityEngine velocityEngine;*/
	
	/*@Autowired
	private SpringRedisCacheService springRedisCacheService;*/
	
	@RequestMapping(value="/index")
    public String index() {
		/*Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", "sdfdsf@163.com");
		String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "velocity/mail_template.vm", "UTF-8", model);*/
		/*String ssString=MessageStrUtil.getMessage("user.regist.success.tip", "abc");
		System.out.println(ssString);*/
		/*springRedisCacheService.set("sss", "yyyy");
		System.out.println(springRedisCacheService.get("sss"));*/
		
        return "home/index";
    }
	
	@RequestMapping(value="/head")
    public String head() {
        return "share/head";
    }

    @RequestMapping(value="/foot")
    public String foot() {
        return "share/head";
    }
     public static void main(String[] args) {
    	 
    	  Map<String, Object> model = new HashMap<String, Object>();
 		model.put("activateUrl", "sdfdsf@163.com");
    	   String msg;
		try {
			msg = FreeMarkerUtil.execute("freemarker/mail_template.ftl",
					   "UTF-8", model);
			 System.out.println(msg);
		//	int index = msg.indexOf("\n");
		} catch (IOException | TemplateException e) {
            
			e.printStackTrace();
		}

	        

	       /* return new String[] { msg.substring(0, index - 1),
	                msg.substring(index + 1) };*/
	 }
}
