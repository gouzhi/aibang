package com.aibang.business.provider.system.area;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.area.HjsSysAreaService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysArea;
import com.aibang.transfer.model.vo.HjsSysAreaQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsSysAreaService")
@SuppressWarnings({"unchecked"})
public class HjsSysAreaServiceImpl  extends ProviderServiceBase<HjsSysArea,Integer> implements HjsSysAreaService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysArea";
	}
	
	public HjsSysArea saveOrUpdate(HjsSysArea entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsSysAreaQuery query) {
		return pageQuery("HjsSysArea.findPage",query);
	}

	@Override
	public HjsSysArea saveObj(HjsSysArea model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	 
}
