package com.aibang.business.provider.system.area;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.area.AbSysAreaService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysArea;
import com.aibang.transfer.model.vo.AbSysAreaQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsSysAreaService")
@SuppressWarnings({"unchecked"})
public class AbSysAreaServiceImpl  extends ProviderServiceBase<AbSysArea,Integer> implements AbSysAreaService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysArea";
	}
	
	public AbSysArea saveOrUpdate(AbSysArea entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbSysAreaQuery query) {
		return pageQuery("HjsSysArea.findPage",query);
	}

	@Override
	public AbSysArea saveObj(AbSysArea model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	 
}
