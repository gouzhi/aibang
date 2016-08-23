package com.aibang.web.admin.operation.system.config;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibang.business.api.system.config.HjsSysConfigService;
import com.aibang.framework.utils.PageData;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysConfig;
import com.aibang.transfer.model.vo.HjsSysConfigQuery;
import com.aibang.web.admin.operation.base.AdminController;
/**
 * 配置控制层
 * @author zhangyong    
 * @date 2015年8月21日
 */
@Controller
@RequestMapping(value="/config")
public class ConfigController extends AdminController{
	
	@Resource(name="hjsSysConfigService")
	private HjsSysConfigService hjsSysConfigService;
	private String display(String pageName)
	{
		return  "system/config/"+pageName;
	}
	/**
	 * 保存添加配置
	 * @param hsd
	 * @param out
	 * @return
	 * @throws Exception ModelAndView
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	@RequestMapping(value="/add")
	public String save(ModelMap model,HjsSysConfig hsd ,PrintWriter out,HttpServletRequest request) throws Exception{
		String PARENT_ID = hsd.getParentId()+"";	
		//判断父类ID是否为空 进行不同的处理
		if(null != PARENT_ID && "0".equals(PARENT_ID)){
			hsd.setLayer(1);
			hsd.setPcode(hsd.getCode());
		}else{
			HjsSysConfig pdp = hjsSysConfigService.getById(hsd.getParentId());
			hsd.setLayer(pdp.getLayer() + 1);
			hsd.setPcode(pdp.getCode() + "_" + hsd.getCode());
		}
		hsd.setIsDel(0);
		hsd.setCreateTime(new Date());
		hsd.setOptId(getLoginUser().getId());
		hsd.setVersion(0);
		hjsSysConfigService.saveObj(hsd);		
		model.addAttribute("msg","success");
		return "save_result";
		
	}
	/**
	 * 保存修改配置
	 * @param hsd
	 * @param out
	 * @return
	 * @throws Exception ModelAndView
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	@RequestMapping(value="/edit")
	public String edit(ModelMap model,HjsSysConfig hsd ,PrintWriter out,HttpServletRequest request) throws Exception{
		String PARENT_ID = hsd.getParentId()+"";	
		//判断父类ID是否为空 进行不同的处理
		if(null != PARENT_ID && "0".equals(PARENT_ID)){
			hsd.setLayer(1);
			hsd.setPcode(hsd.getCode());
		}else{
			HjsSysConfig pdp = hjsSysConfigService.getById(hsd.getParentId());
			hsd.setLayer(pdp.getLayer() + 1);
			hsd.setPcode(pdp.getCode() + "_" + hsd.getCode());
		}
		hsd.setIsDel(0);
		hsd.setUpdateTime(new Date());
		hsd.setOptId(getLoginUser().getId());
		hsd.setVersion(0);
		hjsSysConfigService.update(hsd);	
		model.addAttribute("msg","success");
		return "save_result";
		
	}
	List<HjsSysConfig> szdList;
	
	/**
	 * 配置信息列表
	 * @param hsdq
	 * @return
	 * @throws Exception ModelAndView
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping
	public String list(ModelMap model,HjsSysConfigQuery hsdq)throws Exception{
		//判断parentid不为空 null 0
		if(null != hsdq.getParentId() && !"".equals(hsdq.getParentId()+"") && !"0".equals(hsdq.getParentId()+"")){				 
			model.addAttribute("pdp", hjsSysConfigService.getById(hsdq.getParentId()));			
			//头部导航
			szdList = new ArrayList<HjsSysConfig>();
			this.getZDname(hsdq.getParentId()+"");	//	逆序
			Collections.reverse(szdList);
			
		}else{
			szdList = new ArrayList<HjsSysConfig>();
			hsdq.setParentId(0);
		}		
		String NAME = hsdq.getCname();
		if(null != NAME && !"".equals(NAME)){
			NAME = NAME.trim();
			hsdq.setCname(NAME);
		}
		hsdq.setPageSize(5);
		
		Page page = hjsSysConfigService.findPage(hsdq);
		model.addAttribute("varList", hjsSysConfigService.findPage(hsdq).getResult());
		model.addAttribute("varsList", szdList);
		model.addAttribute("pd", hsdq);
		model.addAttribute("page",page);		
		return display("zd_list");
	}
	
	/**|
	 * 递归加载配置信息
	 * @param PARENT_ID void
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	public void getZDname(String PARENT_ID) {
		logBefore(logger, "递归");
		try {
			HjsSysConfig hsd = hjsSysConfigService.getById(Integer.parseInt(PARENT_ID));
			if(hsd != null){
				szdList.add(hsd);
				String PARENT_IDs = hsd.getParentId()+"";
				this.getZDname(PARENT_IDs);
			}
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
	}
	
	/**
	 * 加载添加配置页面
	 * @param pd
	 * @return ModelAndView
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	@RequestMapping(value="/toAdd")
	public String toAdd(ModelMap model,HjsSysConfig pd){
		try{
			model.addAttribute("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return display("zd_add");
	}
	
	
	
	/**
	 * 加载修改配置信息页面
	 * @param hsdq
	 * @return
	 * @throws Exception ModelAndView
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	@RequestMapping(value="/toEdit")
	public String toEdit( ModelMap model,HjsSysConfigQuery hsdq )throws Exception{
		HjsSysConfig pd = hjsSysConfigService.getById(hsdq.getId());
		if(hjsSysConfigService.findCount(hsdq) != 0){
			model.addAttribute("msg", "no");
		}else{
			model.addAttribute("msg", "ok");
		}
		model.addAttribute("pd", pd);
		return display("zd_edit");
	}
	
	
	/**
	 * 判断编码是否存在
	 * @param hsdq
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/has")
	public void has(HjsSysConfigQuery hsdq,PrintWriter out){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(hjsSysConfigService.findBmCount(hsdq) != null){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 删除配置信息（逻辑）
	 * @param hsd
	 * @return Object
	 * @author zhangyong
	 * @date 2015年8月21日
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(HjsSysConfig hsd){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "";
		try{
			HjsSysConfigQuery hsdq = new HjsSysConfigQuery();
			hsdq.setId(hsd.getId());
			//判断配置是否唯一
			if(hjsSysConfigService.findCount(hsdq) != 0){
				errInfo = "false";
			}else{
				hsd.setDeleteTime(new Date());
				hjsSysConfigService.remove(hsd);
				errInfo = "success";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return map;
		
	}

}
