package com.aibang.web.admin.operation.system.funduser;
//package com.cifex.web.admin.operation.system.funduser;
//
//import java.io.IOException;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.cifex.business.api.fund.system.funds.HjsFundFundsinfoService;
//import com.cifex.business.api.fund.system.trade.HjsFundTradeService;
//import com.cifex.business.api.fund.system.user.HjsFundUserAccountlogService;
//import com.cifex.business.api.fund.system.user.HjsFundUserinfoService;
//import com.cifex.framework.utils.page.Page;
//import com.cifex.framework.utils.page.PageRequest;
//import com.cifex.transfer.model.fund.dto.HjsFundUserinfo;
//import com.cifex.transfer.model.fund.vo.HjsFundUserinfoQuery;
//import com.cifex.web.admin.operation.base.AdminController;
//
///**
// * 基金账户管理类
// * @author maoruxin
// * @date 2016年4月27日
// */
//@Controller
//@RequestMapping(value="/hjsFundAccount")
//public class HjsFundAccountController extends AdminController{
//
//	@Resource(name="hjsFundFundsinfoService")
//	private HjsFundFundsinfoService hjsFundFundsinfoService;
//
//	@Resource(name="hjsFundTradeService")
//	private HjsFundTradeService hjsFundTradeService;
//
//	@Resource(name="hjsFundUserAccountlogService")
//	private HjsFundUserAccountlogService hjsFundUserAccountlogService;
//
//	@Resource(name="hjsFundUserinfoService")
//	private HjsFundUserinfoService hjsFundUserinfoService;
//
//	private String display(String pageName)
//	{
//		return  "system/fund/account/"+pageName;
//	}
//
//
//	@RequestMapping(value = "/goQuery")
//	public String goQuery(ModelMap model){
//		model.addAttribute("hjsFundUserinfo", new HjsFundUserinfo());
//		model.addAttribute("page", new Page(new PageRequest(1,10),0));
//		return display("fundAccount");
//	}
//
//	/**
//	 * 查询 我的基金
//	 * @return ModelAndView
//	 * @author maoruxin
//	 * @throws IOException
//	 * @date 2016年4月27日
//	 */
//	@RequestMapping(value = "/queryTradeShares")
//	public String queryTradeShares(ModelMap model,@RequestParam(defaultValue = "1") Integer pageNumber,
//				@RequestParam(defaultValue = "10") Integer pageSize,
//				@RequestParam(required = true)String mobile,
//				@RequestParam(required = true)String identity) throws IOException{
//		HjsFundUserinfo hjsFundUserinfo = null;
//		HjsFundUserinfoQuery query = new HjsFundUserinfoQuery();
//		query.setIdentity(identity);
//		query.setMobile(mobile);
//		List<HjsFundUserinfo> hjsFundUserinfoList = hjsFundUserinfoService.findList(query);
//		if(hjsFundUserinfoList!=null && hjsFundUserinfoList.size()>0){
//			hjsFundUserinfo = hjsFundUserinfoList.get(0);
//		}
//		Page page = hjsFundTradeService.queryShares(mobile, identity, pageNumber, pageSize);
//		Map assets = hjsFundUserAccountlogService.queryAssets(mobile, identity);
//		model.addAttribute("hjsFundUserinfo", hjsFundUserinfo);
//		model.addAttribute("page", page);
//		model.addAttribute("assets",assets);
//		return display("fundAccount");
//	}
//}
