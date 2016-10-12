package com.aibang.web.move.site.base;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


//首页控制类
@Controller
public class IndexController extends UserController{
	
	private String display(String pageName) {
		return "common/" + pageName;
	}
	
	//跳转到首页
	@RequestMapping(value = "/toIndex",method=RequestMethod.GET)
	public String toIndex() { 
		return display("index");
	}
	
	//跳转到发现
	@RequestMapping(value = "/toFind",method=RequestMethod.GET)
	public String toFind() { 
		return display("find");
	}
	
	
	
	//跳转到发布
	@RequestMapping(value = "/toRelease",method=RequestMethod.GET)
	public String toRelease() { 
		return display("release");
	}
	
	//跳转到信息
	@RequestMapping(value = "/toInfo",method=RequestMethod.GET)
	public String toInfo() { 
		return display("info");
	}
	
	//首页轮播信息查询
	@RequestMapping(value = "/indexBanner",method=RequestMethod.GET)
	@ResponseBody
	public String indexBanner() { 
		return "{\"code\":\"00\",\"msg\":\"3\",\"content\":[{\"imgPath\":\"http://dfasdfad.com/23fasdf13/safasdfasdf.jpg\",\"remark\":\"欢迎QQ家具入住\",},{\"imgPath\":\"http://dfasdfad.com/2313/safasdf3423asdf.jpg\",\"remark\":\"欢迎WW家具入住\",},{\"imgPath\":\"http://dfasdfad.com/2313/safasdfasdf.jpg\",\"remark\":\"欢迎XX家具入住\",}]}";
	}
	//首页交易信息查询
	@RequestMapping(value = "/indexDeal",method=RequestMethod.GET)
	@ResponseBody
	public String indexDeal() { 
		return "{\"code\":\"00\",\"msg\":\"3\",\"content\":[{\"title\":\"张三收购玉米\",\"type\":\"1\",\"infoId\":\"1dfadfasdf34123\",\"userType\":\"1\",\"createTime\":\"2016-09-30\"},{\"title\":\"张二收购玉米\",\"type\":\"1\",\"infoId\":\"1dfadfasdf34123\",\"userType\":\"1\",\"createTime\":\"2016-09-30\"},{\"title\":\"张一收购玉米\",\"type\":\"1\",\"infoId\":\"1dfadfasdf34123\",\"userType\":\"1\",\"createTime\":\"2016-09-30\"},{\"title\":\"李四出售玉米\",\"type\":\"2\",\"infoId\":\"1dfadf234123asdf34123\",\"userType\":\"2\",\"createTime\":\"2016-09-29\"},{\"title\":\"李三出售玉米\",\"type\":\"2\",\"infoId\":\"1dfadfasdf3452345234123\",\"userType\":\"2\",\"createTime\":\"2016-09-29\"},{\"title\":\"李二出售玉米\",\"type\":\"2\",\"infoId\":\"1dfadfasdf23412334123\",\"userType\":\"2\",\"createTime\":\"2016-09-29\"}]}";
	}
	
}
