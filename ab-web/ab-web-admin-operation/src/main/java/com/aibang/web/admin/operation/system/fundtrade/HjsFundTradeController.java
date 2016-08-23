package com.aibang.web.admin.operation.system.fundtrade;
//package com.cifex.web.admin.operation.system.fundtrade;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.apache.commons.lang.StringUtils;
//import org.springframework.beans.propertyeditors.CustomDateEditor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.WebDataBinder;
//import org.springframework.web.bind.annotation.InitBinder;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.cifex.business.api.fund.system.trade.HjsFundTradeService;
//import com.cifex.framework.utils.Const;
//import com.cifex.framework.utils.DateUtils;
//import com.cifex.framework.utils.excel.export.PoiExcelView;
//import com.cifex.framework.utils.page.Page;
//import com.cifex.transfer.model.fund.vo.HjsFundTradeQuery;
//import com.cifex.web.admin.operation.base.AdminController;
///**
// * 类名称：HjsFundTradeController
// */
//@Controller
//@RequestMapping(value="/hjsfundtrade")
//public class HjsFundTradeController extends AdminController {
//
//	@Resource(name="hjsFundTradeService")
//	private HjsFundTradeService hjsFundTradeService;
//
//	private String display(String pageName)
//	{
//		return  "system/fundtrade"+pageName;
//	}
//
//	/**
//	 * 基金交易列表
//	 * @methodname list
//	 * @discription 基金交易列表
//	 * @param model
//	 * @param hjsFundTradeQuery
//	 * @return String
//	 * @author liuj
//	 * @date 2016年4月15日
//	 */
//	@RequestMapping(value="/list")
//	public ModelAndView list(HjsFundTradeQuery hjsFundTradeQuery,Integer importFlag){
//		logBefore(logger, "列表HjsFundTrade");
//		ModelAndView modelAndView = getModelAndView();
//		if(hjsFundTradeQuery.getKeyType()!=null&&!StringUtils.isBlank(hjsFundTradeQuery.getKeyContent()))
//		{
//			switch (hjsFundTradeQuery.getKeyType().intValue()) {
//				case 1://我方流水号
//					if(StringUtils.isNumeric(hjsFundTradeQuery.getKeyContent()))
//					{
//					  hjsFundTradeQuery.setId(Integer.valueOf(hjsFundTradeQuery.getKeyContent()));
//					}
//					break;
//				case 2://钱景流水号
//					hjsFundTradeQuery.setOrderno(hjsFundTradeQuery.getKeyContent());
//					break;
//				case 3://基金简称
//					hjsFundTradeQuery.setFundabbrev(hjsFundTradeQuery.getKeyContent());
//					break;
//				case 4://基金代码
//					hjsFundTradeQuery.setFundcode(hjsFundTradeQuery.getKeyContent());
//					break;
//				case 5://姓名
//					hjsFundTradeQuery.setRealname(hjsFundTradeQuery.getKeyContent());
//					break;
//				case 6://手机号
//					hjsFundTradeQuery.setMobile(hjsFundTradeQuery.getKeyContent());
//					break;
//				case 7://身份证号
//					hjsFundTradeQuery.setIdentity(hjsFundTradeQuery.getKeyContent());
//					break;
// 			}
//		}
//		hjsFundTradeQuery.setCtimeBegin(DateUtils.getStartDate(hjsFundTradeQuery.getCtimeBegin()));
//		hjsFundTradeQuery.setCtimeEnd(DateUtils.getEndDate(hjsFundTradeQuery.getCtimeEnd()));
//		hjsFundTradeQuery.setSortColumns(" ID DESC");
//		//导出EXCEL
//		if(importFlag!=null&&importFlag.intValue()==1){
//			List<Map<String, Object>> userTradeList= new ArrayList<Map<String, Object>>();
//			Map<String,Object> headerMap =new LinkedHashMap<String, Object>();
//			headerMap.put("我方流水号","ID");
//			headerMap.put("钱景流水号","ORDERNO");
//			headerMap.put("姓名","REALNAME");
//			headerMap.put("手机号","MOBILE");
//			headerMap.put("身份证号","IDENTITY");
//			headerMap.put("交易时间","CTIME");
//			headerMap.put("交易确认时间","UTIME");
//			headerMap.put("基金简称","FUNDABBREV");
//			headerMap.put("基金代码","FUNDCODE");
//			headerMap.put("净值（元）","NAV");
//			headerMap.put("交易份额","SHARES");
//			headerMap.put("交易金额（元）","SUM");
//			headerMap.put("费率","FEE");
//			headerMap.put("手续费（元）","FEE_SUM");
//			headerMap.put("交易银行","BANKNAME");
//			headerMap.put("交易卡号","CARD");
//			headerMap.put("交易类型","TRADE_TYPE");
//			headerMap.put("交易状态","STATUS");
//			userTradeList.add(headerMap);
//			List<Map<String, Object>> mapList= hjsFundTradeService.findTradeList(hjsFundTradeQuery);
//			for (Map<String, Object> map : mapList) {
//				if(map.get("TRADE_TYPE").toString().equals("0"))
//				{
//					map.put("TRADE_TYPE", "认购");
//				}
//				if(map.get("TRADE_TYPE").toString().equals("1"))
//				{
//					map.put("TRADE_TYPE", "申购");
//				}
//				if(map.get("TRADE_TYPE").toString().equals("2"))
//				{
//					map.put("TRADE_TYPE", "赎回");
//				}
//				if(map.get("STATUS").toString().equals("0"))
//				{
//					map.put("STATUS", "新提交");
//				}
//				if(map.get("STATUS").toString().equals("1"))
//				{
//					map.put("STATUS", "待确认");
//				}
//				if(map.get("STATUS").toString().equals("2"))
//				{
//					map.put("STATUS", "赎回中");
//				}
//				if(map.get("STATUS").toString().equals("3"))
//				{
//					map.put("STATUS", "成功");
//				}
//				if(map.get("STATUS").toString().equals("4"))
//				{
//					map.put("STATUS", "失败");
//				}
//				userTradeList.add(map);
//			}
//			PoiExcelView view= new PoiExcelView();
//			view.setTitle("交易记录");
//			view.setList(userTradeList);
//			view.setSheetName("用户基金交易信息");
//			//view.setExcelName("基金交易");
//			return new ModelAndView(view);
//		}
//		Page page = hjsFundTradeService.findTradePage(hjsFundTradeQuery);	//列出HjsFundTrade列表
//		modelAndView.addObject("page", page);
//		modelAndView.addObject("hjsFundTradeQuery", hjsFundTradeQuery);
//		modelAndView.addObject(Const.SESSION_QX,getHC());	//按钮权限
//		modelAndView.setViewName(display("/list"));
//		return modelAndView;
//	}
//
//
//	@InitBinder
//	public void initBinder(WebDataBinder binder){
//		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
//	}
//
//	public static void main(String[] args) {
//		System.out.println(StringUtils.isNumeric("0"));
//		 System.out.println(Integer.valueOf("-1"));
//	}
//}
