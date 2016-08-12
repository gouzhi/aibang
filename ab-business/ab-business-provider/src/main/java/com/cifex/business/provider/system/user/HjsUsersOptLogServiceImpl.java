package com.cifex.business.provider.system.user;

import org.springframework.stereotype.Service;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.system.user.HjsUsersOptLogService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersOptLog;
import com.cifex.transfer.model.vo.HjsUsersOptLogQuery;
 
 
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
