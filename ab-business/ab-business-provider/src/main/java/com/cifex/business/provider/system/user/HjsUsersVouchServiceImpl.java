package com.cifex.business.provider.system.user;

import org.springframework.stereotype.Service;

import com.cifex.business.api.system.user.HjsUsersVouchService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersVouch;
import com.cifex.transfer.model.vo.HjsUsersVouchQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsUsersVouchService")
@SuppressWarnings({"unchecked"})
public class HjsUsersVouchServiceImpl  extends ProviderServiceBase<HjsUsersVouch,Integer> implements HjsUsersVouchService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersVouch";
	}
	
	public HjsUsersVouch saveOrUpdate(HjsUsersVouch entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUsersVouchQuery query) {
		return pageQuery("HjsUsersVouch.findPage",query);
	}

	@Override
	public HjsUsersVouch saveObj(HjsUsersVouch model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	 
}
