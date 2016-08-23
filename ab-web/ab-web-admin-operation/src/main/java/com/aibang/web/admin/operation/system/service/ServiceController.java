package com.aibang.web.admin.operation.system.service;
 

import com.aibang.web.admin.operation.base.AdminController;
/**
 * 
* @ClassName: ServiceController
* @Description: (服务相关控制类)
* @author zy
* @date 2015-7-29 下午3:21:25
* Copyright CIFEX Corporation 2015
 */
//@Controller
//@RequestMapping(value="/service")
public class ServiceController extends AdminController {
	/*
	@Resource(name="sysService")
	private SysService sysService;
	
	*//**
	 * 
	* @Title: list
	* @Description: (显示服务列表)
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 *//*
	@RequestMapping
	public ModelAndView list()throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			List<HjsSysService> serviceList = sysService.listAllParentService(getLoginUserServiceToken()).getMasterList();
			mv.addObject("serviceList", serviceList);
			mv.setViewName("system/service/service_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	*//**
	 * 
	* @Title: toAdd
	* @Description: (请求新增服务页面)
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 *//*
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			List<HjsSysService> serviceList = sysService.listAllParentService(getLoginUserServiceToken()).getMasterList();
			mv.addObject("serviceList", serviceList);
			mv.setViewName("system/service/service_add");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	*//**
	 * 
	* @Title: add
	* @Description: (保存服务信息)
	* @param @param newService
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 *//*
	@RequestMapping(value="/add")
	public ModelAndView add(HjsSysService newService)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			int PARENT_ID = 0;
			if(newService.getParentId()!=null){
				PARENT_ID = newService.getParentId();
			}
			if(PARENT_ID !=0){
				HjsSysServiceQuery sysServiceQuery=new HjsSysServiceQuery();
				HjsSysService service=new HjsSysService();
				sysServiceQuery.setId(PARENT_ID);
				service = sysService.getServiceById(sysServiceQuery).getMaster();
				newService.setServiceType(service.getServiceType());	

			}
			newService.setParentId(PARENT_ID);
			 
			HjsSysService rsm=sysService.saveService(newService).getMaster();
			mv.addObject("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		
		mv.setViewName("save_result");
		return mv;
		
	}

	*//**
	 * 
	* @Title: toEdit
	* @Description: (请求编辑服务页面)
	* @param @param serviceId
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 *//*
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(String serviceId)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			HjsSysService m=new HjsSysService();
			HjsSysServiceQuery smq=new HjsSysServiceQuery();
			smq.setId(Integer.parseInt(serviceId));
			m = sysService.getServiceById(smq).getMaster();
			HjsSysService parent = null;
			
			if(m.getParentId()!=null&&m.getParentId().intValue()!=0)
			{
				smq.setId(m.getParentId().intValue());
				parent= sysService.getServiceById(smq).getMaster();
			}
			
			List<HjsSysService> serviceList = sysService.listAllParentService(getLoginUserServiceToken()).getMasterList();
			mv.addObject("serviceList", serviceList);
			mv.addObject("service", m);
			mv.addObject("parent", parent);
			
			mv.setViewName("system/service/service_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	*//**
	 * 
	* @Title: toEditicon
	* @Description: (请求编辑服务图标页面)
	* @param @param serviceId
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 *//*
	@RequestMapping(value="/toEditicon")
	public ModelAndView toEditicon(String serviceId)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			HjsSysService m=new HjsSysService();
			HjsSysServiceQuery smq=new HjsSysServiceQuery();
			smq.setId(Integer.parseInt(serviceId));
			m = sysService.getServiceById(smq).getMaster();
			mv.addObject("service", m);
			mv.setViewName("system/service/service_icon");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	*//**
	 * 
	* @Title: editicon
	* @Description: (保存服务图标 (顶部服务))
	* @param @param service
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 *//*
	@RequestMapping(value="/editicon")
	public ModelAndView editicon(HjsSysService service)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			sysService.editicon(service);
			mv.addObject("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	*//**
	 * 
	* @Title: edit
	* @Description: (保存编辑服务)
	* @param @param service
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 *//*
	@RequestMapping(value="/edit")
	public ModelAndView edit(HjsSysService service)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			if(service.getParentId()==0){
				sysService.editType(service);
			}else
			{
				HjsSysServiceQuery query=new HjsSysServiceQuery();
				query.setId(service.getParentId());
				HjsSysService parentMenu = sysService.getServiceById(query).getMaster();
				service.setServiceType(parentMenu.getServiceType());	
			}
			
			service = sysService.edit(service).getMaster();
			mv.addObject("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}

	*//**
	 * 
	* @Title: getSub
	* @Description: (获取当前服务的所有子服务)
	* @param @param serviceId
	* @param @param response
	* @param @throws Exception
	* @return void 
	* @throws
	 *//*
	@RequestMapping(value="/sub")
	public void getSub(@RequestParam String serviceId,HttpServletResponse response)throws Exception{
		try {
			HjsSysServiceQuery serviceQuery = new HjsSysServiceQuery();
			serviceQuery.setId(Integer.parseInt(serviceId));
			List<HjsSysService> subService = sysService.listSubServiceByParentId(serviceQuery).getMasterList();
			JSONArray arr = JSONArray.fromObject(subService);
			PrintWriter out;
			
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String json = arr.toString();
			out.write(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
	}

	*//**
	 * 
	* @Title: delete
	* @Description: (删除服务)
	* @param @param serviceId
	* @param @param out
	* @param @throws Exception
	* @return void 
	* @throws
	 *//*
	@RequestMapping(value="/del")
	public void delete(@RequestParam String serviceId,PrintWriter out)throws Exception{
		
		try{
			HjsSysServiceQuery sysServiceQuery = new HjsSysServiceQuery();
			sysServiceQuery.setId(Integer.parseInt(serviceId));
			sysService.deleteServiceById(sysServiceQuery);
			out.write("success");
			out.flush();
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	

	 ===============================权限================================== 
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	 ===============================权限================================== */
}
