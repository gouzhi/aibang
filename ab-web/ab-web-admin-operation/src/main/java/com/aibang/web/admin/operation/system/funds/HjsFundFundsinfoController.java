package com.aibang.web.admin.operation.system.funds;
//
//package com.cifex.web.admin.operation.system.funds;
//
//
//import java.io.PrintWriter;
//import java.text.DateFormat;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.propertyeditors.CustomDateEditor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.WebDataBinder;
//import org.springframework.web.bind.annotation.InitBinder;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.alibaba.dubbo.rpc.RpcException;
//import com.cifex.business.api.fund.system.company.HjsFundCompanyService;
//import com.cifex.business.api.fund.system.funds.HjsFundFundsinfoService;
//import com.cifex.framework.common.model.ResultModel;
//import com.cifex.framework.utils.Const;
//import com.cifex.framework.utils.page.Page;
//import com.cifex.transfer.model.dto.HjsUser;
//import com.cifex.transfer.model.fund.dto.HjsFundCompany;
//import com.cifex.transfer.model.fund.dto.HjsFundFundsinfo;
//import com.cifex.transfer.model.fund.vo.HjsFundFundsinfoQuery;
//import com.cifex.web.admin.operation.base.AdminController;
//
//
//
// /** 类名称：HjsFundFundsinfoController*/
//
//@Controller
//@RequestMapping(value="/hjsfundfundsinfo")
//public class HjsFundFundsinfoController extends AdminController {
//
//	@Resource(name="hjsFundFundsinfoService")
//	private HjsFundFundsinfoService hjsFundFundsinfoService;
//	@Resource(name="hjsFundCompanyService")
//	private HjsFundCompanyService hjsFundCompanyService;
//
//	private String display(String pageName)
//	{
//		return  "system/fund/fundlist"+pageName;
//	}
//
//	/**
//	 * 跳转产品上下架页面
//	 * @return
//	 * @author liuwei
//	 * @date 2016年4月13日
//	 */
//	@RequestMapping("/upOrDown")
//	public String upOrDown(HttpServletRequest request, HttpServletResponse reponse,String fundsinfoIds,String type){
//		request.setAttribute("fundsinfoIds", fundsinfoIds);
//		request.setAttribute("type", type);
//		return "system/fund/fundlist/upanddownlist";
//	}
//	/**
//	 * 产品上下架操作
//	 * @param request
//	 * @param reponse
//	 * @param fundsinfoIds
//	 * @param type
//	 * @return
//	 * @author liuwei
//	 * @date 2016年4月13日
//	 */
//	@RequestMapping("/sureOperate")
//	@ResponseBody
//	public ResultModel<Map<String,Object>> sureOperate(HttpServletRequest request, HttpServletResponse reponse,String fundsinfoIds,String type){
//		ResultModel<Map<String,Object>> model = new ResultModel<Map<String,Object>>();
//		HjsUser loginUser = getLoginUser();
//		Integer id = loginUser.getId();//登录用户id
//		String realName = loginUser.getRealName();//用户真实姓名
//		try {
//			hjsFundFundsinfoService.productUpOrDown(id,realName,type,fundsinfoIds);
//			model.setMsg("操作成功");
//			model.setState("0");
//			return model;
//		} catch (RpcException e) {
//			// TODO: handle exception
//			model.setMsg("操作失败"+e.getMessage());
//			model.setState("1");
//			return model;
//		}catch(Exception e){
//			model.setMsg("操作失败");
//			model.setState("1");
//			return model;
//		}
//
//
//	}
//
//
//	/**
//	 * 列表
//	 * @throws ParseException
//	 */
//	@RequestMapping(value="/list")
//	public String list(HttpServletRequest request, HttpServletResponse reponse,HjsFundFundsinfoQuery hjsFundFundsinfoQuery) throws ParseException{
//		logBefore(logger, "列表HjsFundFundsinfo");
//		Date createTimeBegin = hjsFundFundsinfoQuery.getCreateTimeBegin();
//		Date createTimeEnd = hjsFundFundsinfoQuery.getCreateTimeEnd();
//		//按时间查询
//		//处理查询时间格式
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		if(createTimeBegin!=null){
//			hjsFundFundsinfoQuery.setCreateTimeBegin(format1.parse(format.format(createTimeBegin)+" 00:00:00"));
//		}
//		if(createTimeEnd!=null){
//
//			hjsFundFundsinfoQuery.setCreateTimeEnd(format1.parse(format.format(createTimeEnd)+" 23:59:59"));
//		}
//
//		Page page = hjsFundFundsinfoService.findPage(hjsFundFundsinfoQuery);	//列出HjsFundFundsinfo列表
//		List<HjsFundCompany> findNotStopCompany = hjsFundCompanyService.findNotStop();//查询显示的公司IS_STOP=1
//		request.setAttribute("page", page);
//		request.setAttribute("findNotStopCompany",findNotStopCompany);
//		request.setAttribute("hjsFundFundsinfoQuery", hjsFundFundsinfoQuery);
//		request.setAttribute(Const.SESSION_QX,getHC());	//按钮权限
//		return display("/list");
//	}
//	/**
//	 * 基金详情
//	 * @param request
//	 * @param reponse
//	 * @param id
//	 * @return String
//	 * @author liuwei
//	 * @date 2016年5月31日
//	 */
//	@RequestMapping("/fundDetail")
//	public String fundDetail(HttpServletRequest request, HttpServletResponse reponse,Integer id){
//		HjsFundFundsinfo hjsFundFundsinfo = hjsFundFundsinfoService.getById(id);
//		request.setAttribute("hjsFundFundsinfo", hjsFundFundsinfo);
//		return display("/funddetail");
//	}
//
//	@InitBinder
//	public void initBinder(WebDataBinder binder){
//		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
//	}
//}
//
