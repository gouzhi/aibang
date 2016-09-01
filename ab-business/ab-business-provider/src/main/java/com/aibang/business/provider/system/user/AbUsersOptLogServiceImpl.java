package com.aibang.business.provider.system.user;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.user.AbUsersOptLogService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUsersOptLog;
import com.aibang.transfer.model.vo.AbUsersOptLogQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("abUsersOptLogService")
@SuppressWarnings({"unchecked"})
public class AbUsersOptLogServiceImpl  extends ProviderServiceBase<AbUsersOptLog,Integer> implements AbUsersOptLogService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "AbUsersOptLog";
	}
	
	public AbUsersOptLog saveOrUpdate(AbUsersOptLog entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbUsersOptLogQuery query) {
		return pageQuery(getIbatisMapperNamesapce() + ".findPage",query);
	}
	
	@Override
	public AbUsersOptLog saveObj(AbUsersOptLog model){
		
		try {
			super.save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"保存平台/企业用户日志信息错误",e.getCause());
		}
		return model;
	}
	
	
	
	
	 
}
