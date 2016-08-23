package com.aibang.business.provider.system.approve;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.approve.HjsApproveSmsSendlogService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveSmsSendlog;
import com.aibang.transfer.model.vo.HjsApproveSmsSendlogQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsApproveSmsSendlogService")
@SuppressWarnings({"unchecked"})
public class HjsApproveSmsSendlogServiceImpl  extends ProviderServiceBase<HjsApproveSmsSendlog,Integer> implements HjsApproveSmsSendlogService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsApproveSmsSendlog";
	}
	
	public HjsApproveSmsSendlog saveOrUpdate(HjsApproveSmsSendlog entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsApproveSmsSendlogQuery query) {
		return pageQuery("HjsApproveSmsSendlog.findPage",query);
	}

	@Override
	public HjsApproveSmsSendlog saveObj(HjsApproveSmsSendlog model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	 
}
