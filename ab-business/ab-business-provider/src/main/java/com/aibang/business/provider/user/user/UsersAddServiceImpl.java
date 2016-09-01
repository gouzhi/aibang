package com.aibang.business.provider.user.user;

import org.springframework.stereotype.Service;

import com.aibang.business.api.user.user.UsersAddService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUsersAdd;
import com.aibang.transfer.model.vo.AbUsersAddQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("usersAddService")
@SuppressWarnings({"unchecked"})
public class UsersAddServiceImpl  extends ProviderServiceBase<AbUsersAdd,Integer> implements UsersAddService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersAdd";
	}
	
	public AbUsersAdd saveOrUpdate(AbUsersAdd entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbUsersAddQuery query) {
		try {
		    return pageQuery("HjsUsersAdd.findPage",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"查询列表页错误",e.getCause());
		}
	}
	
	public AbUsersAdd saveObj(AbUsersAdd model)
	{
		
		try {
			save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"添加错误错误",e.getCause());
		}
		return model;
	}
	/**
	 * 通过账户ID获取收货地址信息
	 * @param baseId 账户id
	 * @return HjsUsersAdd
	 * @author zhangyong
	 * @date 2015年11月4日
	 */
	public AbUsersAdd getAddressByBaseId(Integer baseId){
		AbUsersAdd usersAdd = null;
		try {
			AbUsersAddQuery query = new AbUsersAddQuery();
			query.setUserId(baseId);
			usersAdd = (AbUsersAdd)findForObject(getIbatisMapperNamesapce()+".getByBaseId", query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过账户ID获取收货地址信息错误",e.getCause());
		}
		return usersAdd;
	}
	
	 
}
