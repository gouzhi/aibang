package com.aibang.web.admin.operation.system.user;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aibang.business.api.system.approve.AbApproveRealnameService;
import com.aibang.business.api.system.user.AbUsersInfoService;
import com.aibang.framework.activemq.SendMessage;
import com.aibang.framework.utils.BankName;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.JSONUtils;
import com.aibang.framework.utils.ip.Utils;
import com.aibang.framework.utils.page.Page;
import com.aibang.framework.utils.validate.ValidateUtils;
import com.aibang.transfer.model.dto.AbApproveRealname;
import com.aibang.transfer.model.dto.AbUsersInfo;
import com.aibang.transfer.model.vo.AbUsersInfoQuery;
import com.aibang.web.admin.operation.base.AdminController;

@Controller
@RequestMapping(value="/usersInfo")
public class HjsUsersInfoController extends AdminController {
	@Resource(name="hjsUsersInfoService")
	AbUsersInfoService hjsUsersInfoService;
	@Resource(name="hjsApproveRealnameService")
	AbApproveRealnameService hjsApproveRealnameService;
	@Autowired
    private Destination queueDestinationRegist;
    @Autowired
    @Qualifier("activemqSendMessage")
    private SendMessage activemqSendMessage;
	private String display(String pageName)
	{
		return  "system/usersInfo/"+pageName;
	} 
	/**
	 * 后台获取会员信息列表
	 * @param userInfo
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/listU")
	public String listUsersInfo(ModelMap model,AbUsersInfoQuery userInfo){

		userInfo.setSortColumns("u.CREATE_TIME DESC");
		Page pd = hjsUsersInfoService.getUsersInfo(userInfo);
		
		/**
		 * 判断用户是否在黑名单中
		 */
		if(pd.getResult()!=null&&pd.getResult().size()>0){
			List infoList=pd.getResult();
			for(int i=0;i<infoList.size();i++){
				AbUsersInfo ui = (AbUsersInfo)infoList.get(i);
			}			
		}
		Integer status = 0;
		if(userInfo.getStatus()!=null){
			status = userInfo.getStatus();
		}
		model.addAttribute("checkStatus",userInfo.getCheckStatus());
		model.addAttribute("checkphone",userInfo.getPhone());
		model.addAttribute("checkname",userInfo.getUsername());
		model.addAttribute("checkTimeBegin",userInfo.getLastTimeBegin());
		model.addAttribute("checkTimeEnd",userInfo.getLastTimeEnd());
		model.addAttribute("status",status);
		model.addAttribute("page", pd);
		model.addAttribute("currentDate", new Date());
		model.addAttribute(Const.SESSION_QX,this.getHC());	//按钮权限
		return display("usersInfo_list");
	}
	/**
	 * 加载会员添加页面
	 * @param model
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@RequestMapping(value="/toAdd")
	public String toAdd(ModelMap model){
		return display("usersInfo_add");
	}
	/**
	 * 添加会员
	 * @param model
	 * @param usersInfo
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@RequestMapping(value="/add")
	public String add(ModelMap model,AbUsersInfo usersInfo,HttpServletRequest request,HttpServletResponse response){
		//数据入库验证
		if (ValidateUtils.isStringEmpty(usersInfo.getAbUser().getUsername())){
			error("请填写用户登录名", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(usersInfo.getAbUser().getPassword())){
			error("请填写登陆密码", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(usersInfo.getAbUser().getPhone())){
			error("请填写用户手机号", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(usersInfo.getAbUserBase().getPayPassword())){
			error("请填写用户支付密码", request, response);
			return null;
		}
		//用户账户设置
		usersInfo.getAbUserBase().setCreateIp(Utils.getCdnIpAddr(request));
		usersInfo.getAbUserBase().setCreateTime(new Date());
		usersInfo.getAbUserBase().setOptId(getLoginUser().getId());
		usersInfo.getAbUserBase().setTypeId(3);
		usersInfo.getAbUserBase().setUsername(usersInfo.getAbUser().getUsername());
		usersInfo.getAbUserBase().setPayPassword(new SimpleHash("SHA-1",usersInfo.getAbUser().getUsername(),usersInfo.getAbUserBase().getPayPassword()).toString());
		//用户登陆信息设置
		usersInfo.getAbUser().setCreateIp(Utils.getCdnIpAddr(request));
		usersInfo.getAbUser().setCreateTime(new Date());
		usersInfo.getAbUser().setOptId(getLoginUser().getId());
		usersInfo.getAbUser().setTypeId(3);
		usersInfo.getAbUser().setStatus(1);
		usersInfo.getAbUser().setIsDel(0);
		usersInfo.getAbUser().setEmailStatus(0);
		usersInfo.getAbUser().setPhoneStatus(0);
		usersInfo.getAbUser().setRealNameStatus(0);
		usersInfo.getAbUser().setPassword(new SimpleHash("SHA-1",usersInfo.getAbUser().getUsername(),usersInfo.getAbUser().getPassword()).toString());
		
		usersInfo.setLastTime(new Date());
		usersInfo = hjsUsersInfoService.addAbUsersInfo(usersInfo);
		
		Map<String, Object> paras = new HashMap<>();
		paras.put("userid", usersInfo.getUserId());
		paras.put("userloginid",usersInfo.getLoginId());
		paras.put("username", usersInfo.getAbUser().getPhone());
		if(usersInfo.getInviteUserid() != null){
			paras.put("inviteUserid", usersInfo.getInviteUserid());
		}
		paras.put("ip", Utils.getCdnIpAddr(request));
		JSONObject jsonObject = JSONUtils.toJSONObject(paras);
		String jsonString = JSONUtils.toJSONString(jsonObject);
		activemqSendMessage.sendMessage(queueDestinationRegist, jsonString);
		
		//注册红包
		//hjsActBonusUsersService.saveActBonusUsers(usersInfo.getAbUserBase().getId(), usersInfo.getInviteUserid(), Utils.getCdnIpAddr(request));
		
		success("添加会员成功", request, response);
		return toAdd(model);
	}
	/**
	 * 加载修改会员信息页面
	 * @param model
	 * @param usersInfoQuery
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@RequestMapping(value="/toEdit")
	public String toEdit(ModelMap model,AbUsersInfoQuery usersInfoQuery){
		model.addAttribute("pd",hjsUsersInfoService.getEditUsersInfo(usersInfoQuery));
		return display("usersInfo_edit");
	}
	/**
	 * 后台修改会员信息
	 * @param model
	 * @param usersInfo
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@RequestMapping(value="/edit")
	public String Edit(ModelMap model,AbUsersInfo usersInfo,HttpServletRequest request,HttpServletResponse response){
		//入库验证
		if (ValidateUtils.isStringEmpty(usersInfo.getAbUser().getUsername())){
			error("请填写用户登录名", request, response);
			return null;
		}
		AbUsersInfoQuery usersInfoQuery = new AbUsersInfoQuery();
		usersInfoQuery.setId(usersInfo.getId());
		AbUsersInfo editUsersInfo = hjsUsersInfoService.getEditUsersInfo(usersInfoQuery);
		//用户登录信息设置
		editUsersInfo.getAbUser().setUsername(usersInfo.getAbUser().getUsername());
		if(usersInfo.getAbUser().getPassword()!=null&&!usersInfo.getAbUser().getPassword().equals("")){			
			editUsersInfo.getAbUser().setPassword(new SimpleHash("SHA-1",usersInfo.getAbUser().getUsername(),usersInfo.getAbUser().getPassword()).toString());
		}
		editUsersInfo.getAbUser().setPhone(usersInfo.getAbUser().getPhone());
		editUsersInfo.getAbUser().setStatus(usersInfo.getAbUser().getStatus());
		editUsersInfo.getAbUser().setOptId(getLoginUser().getId());
		//用户账户设置
		if(usersInfo.getAbUserBase().getPayPassword()!=null&&!usersInfo.getAbUserBase().getPayPassword().equals("")){			
			editUsersInfo.getAbUserBase().setPayPassword(new SimpleHash("SHA-1",usersInfo.getAbUser().getUsername(),usersInfo.getAbUserBase().getPayPassword()).toString());
		}
		editUsersInfo.getAbUserBase().setUpdateTime(new Date());
		editUsersInfo.getAbUserBase().setUpdateIp(Utils.getCdnIpAddr(request));
		editUsersInfo.getAbUserBase().setOptId(getLoginUser().getId());
		hjsUsersInfoService.editUsersInfo(editUsersInfo);
		success("修改会员成功", request, response);
		return toEdit(model, usersInfoQuery);
	}
	/**
	 * 加载会员详细页
	 * @param model
	 * @param usersInfoQuery
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@RequestMapping(value="/detail")
	public String detailUsersInfo(ModelMap model,AbUsersInfoQuery usersInfoQuery){
		AbUsersInfo usersInfo = hjsUsersInfoService.getEditUsersInfo(usersInfoQuery);//账户信息
		AbApproveRealname realName = hjsApproveRealnameService.getByLoginId(usersInfo.getLoginId());//实名信息
		
		//判断是否绑定银行
		if(!ValidateUtils.isStringEmpty(usersInfo.getAbUser().getNrpUsrId())){
			Map<String,Object> bankMap = null;
			String cardId = "";//汇付绑定银行卡号
			String BankId = "";//银行代号
			String bankName = "";//银行名称
			if(bankMap!=null&&!bankMap.isEmpty()){
				cardId = bankMap.get("CardId").toString();
				BankId = bankMap.get("BankId").toString();
				bankName = BankName.getName(BankId);//根据银行代号获取银行名称
				model.addAttribute("bankName",bankName);
				model.addAttribute("account",cardId);
			}else{
				model.addAttribute("hasBank",false);
			}
		}else{
			model.addAttribute("bankName","");
			model.addAttribute("account","");
		}
		
		model.addAttribute("usersInfo",usersInfo);
		model.addAttribute("rn",realName);
		return display("usersInfo_detail");
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
