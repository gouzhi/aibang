package com.cifex.business.provider.system.userRole;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.system.userRole.HjsSysUserRoleService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsSysRole;
import com.cifex.transfer.model.dto.HjsSysUserRole;
import com.cifex.transfer.model.vo.HjsSysRoleQuery;
import com.cifex.transfer.model.vo.HjsSysUserRoleQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsSysUserRoleService")
@SuppressWarnings({"unchecked"})
public class HjsSysUserRoleServiceImpl  extends ProviderServiceBase<HjsSysUserRole,Integer> implements HjsSysUserRoleService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysUserRole";
	}
	
	public HjsSysUserRole saveOrUpdate(HjsSysUserRole entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsSysUserRoleQuery query) {
		return pageQuery("HjsSysUserRole.findPage",query);
	}

	@Override
	public HjsSysUserRole saveObj(HjsSysUserRole model) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 得到该角色下所有用户列表
	 * @param query
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2016年1月25日
	 */
	public List<HjsSysRole> listAllUByRid(HjsSysRoleQuery query){
		try {
			return (List<HjsSysRole>)findForList(getIbatisMapperNamesapce()+".listAllUByRid", null);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"获取该角色相关的用户信息错误",e.getCause());
		}
	}
	
	 
}
