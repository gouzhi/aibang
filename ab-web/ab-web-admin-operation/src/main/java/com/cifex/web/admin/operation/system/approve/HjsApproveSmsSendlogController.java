
package com.cifex.web.admin.operation.system.approve;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cifex.business.api.system.approve.HjsApproveSmsSendlogService;
import com.cifex.web.admin.operation.base.AdminController;

/** 
 * 类名称：HjsApproveSmsSendlogController
 */
@Controller
@RequestMapping(value="/hjsapprovesmssendlog")
public class HjsApproveSmsSendlogController extends AdminController {
	
	@Resource(name="hjsApproveSmsSendlogService")
	private HjsApproveSmsSendlogService hjsApproveSmsSendlogService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
