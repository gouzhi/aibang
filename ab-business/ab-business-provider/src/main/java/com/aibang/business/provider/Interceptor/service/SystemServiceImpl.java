package com.aibang.business.provider.Interceptor.service; 
import org.springframework.stereotype.Service; 

import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.transfer.model.dto.HjsSysService;

@SuppressWarnings("unchecked")
@Service("systemService")
public class SystemServiceImpl extends ProviderServiceBase<HjsSysService,Integer> implements SystemService{

	 

	
	/*@Autowired
	private CacheService cache; 
	
	public String getIbatisMapperNamesapce() {
		return "SysService";
	}
	
	public void saveOrUpdate(HjsSysService entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
	}
	
	public Page findPage(HjsSysServiceQuery query) {
		return pageQuery("SysService.findPage",query);
	}

	@Override
	public List<HjsSysService> listAllServiceCache() {
		List<HjsSysService> list=cache.get(Const.CACHE_SYSTEM_SERVICE);
		if(list==null)
		{
			list=(List<HjsSysService>)findForList(getIbatisMapperNamesapce()+".findPage", null);
			cache.set(Const.CACHE_SYSTEM_SERVICE, 3600, list);
		}
		return list;
	}

	@Override
	public HjsSysService findServiceByNameSpace(String name) {
		List<HjsSysService> sysServices=listAllServiceCache();
		if(sysServices!=null)
		{
			for (HjsSysService sysService : sysServices) {
				if(sysService.getServiceNamespace().equalsIgnoreCase(name))
				{
					return sysService;
				}
			}
		}
		return null;
	}
	
	public boolean userIsHasAcceptAcessService(String serviceNameSpace)
	{
		HjsSysService service =findServiceByNameSpace(serviceNameSpace);
		if(service!=null)
		{
			HjsSysUser user = getUserBySessionId(sessionId);
			if(user!=null)
			{
				//超级管管理员
				if(user.getUsername().equals("admin"))
				{
					return true;
				}
				List<HjsSysRole> roles=user.getRoles();
				for (HjsSysRole sysRole : roles) {
					if(RightsHelper.testRights(sysRole.getServiceRights(), service.getId()))
					{
						return true;
					}
				}
				return false;
			}else
			{
				return false;
			}
		}
		return true;
	}
	*/

}
