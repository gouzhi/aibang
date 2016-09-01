package com.aibang.business.provider.system.approve;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.approve.AbApproveSmsSendlogService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveSmsSendlog;
import com.aibang.transfer.model.vo.AbApproveSmsSendlogQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsApproveSmsSendlogService")
@SuppressWarnings({"unchecked"})
public class AbApproveSmsSendlogServiceImpl  extends ProviderServiceBase<AbApproveSmsSendlog,Integer> implements AbApproveSmsSendlogService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsApproveSmsSendlog";
	}
	
	public AbApproveSmsSendlog saveOrUpdate(AbApproveSmsSendlog entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbApproveSmsSendlogQuery query) {
		return pageQuery("HjsApproveSmsSendlog.findPage",query);
	}

	@Override
	public AbApproveSmsSendlog saveObj(AbApproveSmsSendlog model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	 
}
