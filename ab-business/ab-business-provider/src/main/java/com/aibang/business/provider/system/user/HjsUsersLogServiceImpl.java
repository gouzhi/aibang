package com.aibang.business.provider.system.user;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.user.HjsUsersLogService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUsersLog;
import com.aibang.transfer.model.vo.HjsUsersLogQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsUsersLogService")
@SuppressWarnings({"unchecked"})
public class HjsUsersLogServiceImpl  extends ProviderServiceBase<HjsUsersLog,Integer> implements HjsUsersLogService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersLog";
	}
	
	public HjsUsersLog saveOrUpdate(HjsUsersLog entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUsersLogQuery query) {
		return pageQuery("HjsUsersLog.findPage",query);
	}

	/**
	 * 保存会员日志
	 * @param model
	 * @return HjsUsersLog
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	@Override
	public HjsUsersLog saveObj(HjsUsersLog model) {
		try {
			super.save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"保存会员日志信息错误",e.getCause());
		}
		return model;
	}
	
	 
}
