package com.aibang.business.provider.system.user;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.user.HjsUsersOptLogService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUsersOptLog;
import com.aibang.transfer.model.vo.HjsUsersOptLogQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsUsersOptLogService")
@SuppressWarnings({"unchecked"})
public class HjsUsersOptLogServiceImpl  extends ProviderServiceBase<HjsUsersOptLog,Integer> implements HjsUsersOptLogService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersOptLog";
	}
	
	public HjsUsersOptLog saveOrUpdate(HjsUsersOptLog entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUsersOptLogQuery query) {
		return pageQuery("HjsUsersOptLog.findPage",query);
	}
	
	@Override
	public HjsUsersOptLog saveObj(HjsUsersOptLog model){
		
		try {
			super.save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"保存平台/企业用户日志信息错误",e.getCause());
		}
		return model;
	}
	
	
	
	
	 
}
