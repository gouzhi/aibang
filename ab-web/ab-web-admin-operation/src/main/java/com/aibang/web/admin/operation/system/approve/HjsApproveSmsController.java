
package com.aibang.web.admin.operation.system.approve;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibang.business.api.system.approve.AbApproveSmsService;
import com.aibang.framework.exception.BaseException;
import com.aibang.framework.utils.page.Page;
import com.aibang.framework.utils.validate.ValidateUtils;
import com.aibang.transfer.model.dto.AbApproveSms;
import com.aibang.transfer.model.vo.AbApproveSmsQuery;
import com.aibang.web.admin.operation.base.AdminController;
import com.alibaba.dubbo.rpc.RpcException;

/**
 * 手机认证
 * @author zhangyong    
 * @date 2015年9月2日
 */
@Controller
@RequestMapping(value="/hjsapprovesms")
public class HjsApproveSmsController extends AdminController {
	
	@Resource(name="hjsApproveSmsService")
	private AbApproveSmsService hjsApproveSmsService;
	
	private String display(String pageName)
	{
		return  "system/approve/sms/"+pageName;
	}
	/**
	 * 后台手机认证管理列表
	 * @param model
	 * @param query
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月2日
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/list")
	public String listRealName(ModelMap model,AbApproveSmsQuery query){
		query.setSortColumns("tb.CREATE_TIME DESC");
		Page rnPage = hjsApproveSmsService.findPage(query);
		model.addAttribute("checkname",query.getUsername());
		model.addAttribute("checkTimeBegin",query.getVerifyTimeBegin());
		model.addAttribute("checkTimeEnd",query.getVerifyTimeEnd());
		model.addAttribute("page",rnPage);
		return display("sms_list");
	}
	/**
	 * 加载用户实名认证审核页
	 * @param model
	 * @param id
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	@RequestMapping(value="/toaudit")
	public String goAudit(ModelMap model,String id){
		AbApproveSms hjsApproveSms = hjsApproveSmsService.getById(Integer.parseInt(id));
		model.addAttribute("info",hjsApproveSms);
		return display("sms_audit");
	}
	/**
	 * 用户实名认证审核
	 * @param model
	 * @param realName void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	@RequestMapping(value="/audit")
	@ResponseBody
	public String audit(ModelMap model,AbApproveSms sms,HttpServletRequest request){
		//判断选择审核状态
		if (ValidateUtils.isStringEmpty(sms.getStatus()+"")){
			return "请选择审核操作";
		}
		sms.setVerifyTime(new Date());
		sms.setVerifyUserid(getLoginUser().getId());
		String msg="success";
		try {
			hjsApproveSmsService.auditSms(sms);//审核
		} 
		catch(RpcException e){
			msg=e.getMessage();
		}
		catch(BaseException e){
			msg=e.getMessage();
		}
		catch(Exception e){
			msg=e.getMessage();
		}
		model.addAttribute("message",msg);
		return "200";
	}
 
	
	 
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
