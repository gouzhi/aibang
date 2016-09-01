
package com.aibang.web.admin.operation.system.approve;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aibang.business.api.system.approve.AbApproveSmsSendlogService;
import com.aibang.web.admin.operation.base.AdminController;

/** 
 * 类名称：HjsApproveSmsSendlogController
 */
@Controller
@RequestMapping(value="/hjsapprovesmssendlog")
public class HjsApproveSmsSendlogController extends AdminController {
	
	@Resource(name="hjsApproveSmsSendlogService")
	private AbApproveSmsSendlogService hjsApproveSmsSendlogService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
