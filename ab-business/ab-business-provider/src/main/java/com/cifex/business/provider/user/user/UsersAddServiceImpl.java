package com.cifex.business.provider.user.user;

import org.springframework.stereotype.Service;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.user.user.UsersAddService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersAdd;
import com.cifex.transfer.model.vo.HjsUsersAddQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("usersAddService")
@SuppressWarnings({"unchecked"})
public class UsersAddServiceImpl  extends ProviderServiceBase<HjsUsersAdd,Integer> implements UsersAddService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersAdd";
	}
	
	public HjsUsersAdd saveOrUpdate(HjsUsersAdd entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUsersAddQuery query) {
		try {
		    return pageQuery("HjsUsersAdd.findPage",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"查询列表页错误",e.getCause());
		}
	}
	
	public HjsUsersAdd saveObj(HjsUsersAdd model)
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
	public HjsUsersAdd getAddressByBaseId(Integer baseId){
		HjsUsersAdd usersAdd = null;
		try {
			HjsUsersAddQuery query = new HjsUsersAddQuery();
			query.setUserId(baseId);
			usersAdd = (HjsUsersAdd)findForObject(getIbatisMapperNamesapce()+".getByBaseId", query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过账户ID获取收货地址信息错误",e.getCause());
		}
		return usersAdd;
	}
	
	 
}
