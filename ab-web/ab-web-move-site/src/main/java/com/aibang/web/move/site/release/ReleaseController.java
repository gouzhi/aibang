package com.aibang.web.move.site.release;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibang.web.move.site.base.UserController;

/**
 * 发布操作
 * @author bobo
 * @date 2016年10月12日
 */
@Controller
@RequestMapping(value="/ab/app/release")
public class ReleaseController extends UserController{
	
	 /**
	 *跳转找客户页面
	 * @return String
	 */
	@RequestMapping(value="/toFindCustomer")
	private String toFindCustomer(ModelMap model){
		
		return "release/main";
	}
     /**
	 * 猜你喜欢
	 * @return String
	 */
	@RequestMapping(value="/guesYouLike")
	@ResponseBody
	private String guesYouLike(ModelMap model){
		
		return "";
	}
	
}
