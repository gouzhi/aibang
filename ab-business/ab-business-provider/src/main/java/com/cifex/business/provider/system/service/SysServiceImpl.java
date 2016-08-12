/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2013 - 2015
 */

package com.cifex.business.provider.system.service;


import org.springframework.stereotype.Service;

import com.cifex.business.api.system.service.SysService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.transfer.model.dto.HjsSysService;

 /**
  * 
 * @ClassName: SysServiceImpl
 * @Description: (服务相关操作类)
 * @author zy
 * @date 2015-7-29 下午2:40:59
 * Copyright CIFEX Corporation 2015
  */
@SuppressWarnings("unchecked")
@Service
public class SysServiceImpl  extends ProviderServiceBase<HjsSysService,Integer> implements SysService {

	
	/**  
	 * @param entity 
	 * @see com.cifex.framework.dao.EntityDao#saveOrUpdate(Object)
	 */
	
	

	
	/*@Override
	public String getIbatisMapperNamesapce() {
		return "SysService";
	}
	*//**
	 * 分页查询服务信息列表
	 *  
	 *  
	 * @param sessionId
	 * @param query
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#findPage(String, com.cifex.vo.HjsSysServiceQuery)
	 *//*
	@Override
	public ResultModel<HjsSysService> findPage(HjsSysServiceQuery query) {
		ResultModel<HjsSysService> rs=new ResultModel<HjsSysService>();
		Page<HjsSysService> page= pageQuery("",query);
		rs.setPage(page);
		return rs;
	}
	public void saveOrUpdate(HjsSysService entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
	}

	*//**
	 * 通过ID删除服务
	 *  
	 *  
	 * @param sessionId
	 * @param query
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#deleteServiceById(String, com.cifex.vo.HjsSysServiceQuery)
	 *//*
	@Override
	public ResultModel<HjsSysService> deleteServiceById(HjsSysServiceQuery query) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		deleteById(query.getId());
		resultModel.setMsg("服务删除成功");
		resultModel.setState("0");
		return resultModel;
	}

	*//**
	 * 通过ID获得服务信息
	 *  
	 *  
	 * @param sessionId
	 * @param query
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#getServiceById(String, com.cifex.vo.HjsSysServiceQuery)
	 *//*
	@Override
	public ResultModel<HjsSysService> getServiceById(HjsSysServiceQuery query) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		resultModel.setMaster(getById(query.getId()));
		return resultModel;
	}

	*//**
	 * 得到服务表中最大的ID
	 *  
	 *  
	 * @param sessionId
	 * @param query
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#findMaxId(String, com.cifex.vo.HjsSysServiceQuery)
	 *//*
	@Override
	public ResultModel<HjsSysService> findMaxId(HjsSysServiceQuery query) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		HjsSysService master = (HjsSysService) findForObject(getIbatisMapperNamesapce()+".findMaxId", query);
	    resultModel.setMaster(master);
	    return resultModel;
	}

	*//**
	 * 得到所有父类服务列表
	 *  
	 *  
	 * @param sessionId
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#listAllParentService(String)
	 *//*
	@Override
	public ResultModel<HjsSysService> listAllParentService(String sessionId) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		List<HjsSysService> servicelist = (List<HjsSysService>)(findForList(getIbatisMapperNamesapce()+".listAllParentService", null));
	    resultModel.setMasterList(servicelist);
		return resultModel;
	}

	*//**
	 * 保存服务
	 *  
	 *  
	 * @param sessionId
	 * @param service
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#saveService(String, com.cifex.dto.HjsSysService)
	 *//*
	@Override
	public ResultModel<HjsSysService> saveService(HjsSysService service) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		save(service);		
		resultModel.setMsg("服务添加成功");
		resultModel.setState("0");
		return resultModel;
	}

	*//**
	 * 通过父类ID得到子服务列表
	 *  
	 *  
	 * @param sessionId
	 * @param query
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#listSubServiceByParentId(String, com.cifex.vo.HjsSysServiceQuery)
	 *//*
	@Override
	public ResultModel<HjsSysService> listSubServiceByParentId(HjsSysServiceQuery query) {
		ResultModel<HjsSysService> res=new ResultModel<HjsSysService>();
		List<HjsSysService> servicelist = (List<HjsSysService>)(findForList(getIbatisMapperNamesapce()+".listSubServiceByParentId", query));
		res.setMasterList(servicelist);
		return res;
	}

	*//**
	 * 得到所有服务信息列表
	 *  
	 *  
	 * @param sessionId
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#listAllService(String)
	 *//*
	@Override
	public ResultModel<HjsSysService> listAllService(String sessionId) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		List<HjsSysService> infolist= (List<HjsSysService>)(findForList(getIbatisMapperNamesapce()+".listAllParentService", null));
		HjsSysServiceQuery query = new HjsSysServiceQuery();
		//初始化二级
		for(HjsSysService service : infolist){
			query.setId(service.getId());
			List<HjsSysService> subList =  (List<HjsSysService>)(findForList(getIbatisMapperNamesapce()+".listSubServiceByParentId", query));
			service.setSubService(subList);
		}
		//初始化三级
		for(HjsSysService service : infolist){
			List<HjsSysService> subServiceList2 = service.getSubService();
			if(subServiceList2!=null)
			{
				for (HjsSysService subService2 : subServiceList2) {
					query.setId(subService2.getId());
					List<HjsSysService> subService3List =  (List<HjsSysService>)(findForList(getIbatisMapperNamesapce()+".listSubServiceByParentId", query));
					subService2.setSubService(subService3List);
				}
			}
		}
	    resultModel.setMasterList(infolist);
	    return resultModel;
	}

	*//**
	 * 修改服务信息
	 *  
	 *  
	 * @param sessionId
	 * @param service
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#edit(String, com.cifex.dto.HjsSysService)
	 *//*
	@Override
	public ResultModel<HjsSysService> edit(HjsSysService service) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		if(service.getId()!=null && service.getId() != -1){
			update(service);
		}
		resultModel.setMsg("服务修改成功");
		resultModel.setState("0");
		return resultModel;
	}

	*//**
	 * 修改服务图标
	 *  
	 *  
	 * @param sessionId
	 * @param service
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#editicon(String, com.cifex.dto.HjsSysService)
	 *//*
	@Override
	public ResultModel<HjsSysService> editicon(HjsSysService service) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		if(service.getId()!=null && service.getId() != -1){
			findForObject(getIbatisMapperNamesapce()+".editicon",service);
		}
		resultModel.setMsg("服务图标修改成功");
		resultModel.setState("0");
		return resultModel;
	}

	*//**
	 * 修改子服务类型
	 *  
	 *  
	 * @param sessionId
	 * @param service
	 * @return 
	 * @see com.cifex.api.service.system.service.SysService#editType(String, com.cifex.dto.HjsSysService)
	 *//*
	@Override
	public ResultModel<HjsSysService> editType(HjsSysService service) {
		ResultModel<HjsSysService> resultModel = new ResultModel<HjsSysService>();
		if(service.getId()!=null && service.getId() != -1){
			findForObject(getIbatisMapperNamesapce()+".editType",service);
		}
		resultModel.setMsg("子服务类型修改成功");
		resultModel.setState("0");
		return resultModel;
	}	*/
}
