package com.cifex.web.admin.operation.system.upload;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class TestController {

	@RequestMapping("addmessage")
	public String addmessage(){
		return "system/tools/addmessage";
	}
}
