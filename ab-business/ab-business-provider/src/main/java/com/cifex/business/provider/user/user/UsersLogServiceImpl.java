package com.cifex.business.provider.user.user;

import org.springframework.stereotype.Service;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.user.user.UsersLogService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersLog;
import com.cifex.transfer.model.vo.HjsUsersLogQuery;
 
 
/**
 * 会员日志
 * @author zhangyong    
 * @date 2015年9月16日
 */
@Service("usersLogService")
@SuppressWarnings({"unchecked"})
public class UsersLogServiceImpl  extends ProviderServiceBase<HjsUsersLog,Integer> implements UsersLogService {
 
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
