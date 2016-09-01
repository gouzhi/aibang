package com.aibang.business.provider.system.userRole;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.userRole.AbSysUserRoleService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysRole;
import com.aibang.transfer.model.dto.AbSysUserRole;
import com.aibang.transfer.model.vo.AbSysRoleQuery;
import com.aibang.transfer.model.vo.AbSysUserRoleQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsSysUserRoleService")
@SuppressWarnings({"unchecked"})
public class AbSysUserRoleServiceImpl  extends ProviderServiceBase<AbSysUserRole,Integer> implements AbSysUserRoleService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysUserRole";
	}
	
	public AbSysUserRole saveOrUpdate(AbSysUserRole entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbSysUserRoleQuery query) {
		return pageQuery("HjsSysUserRole.findPage",query);
	}

	@Override
	public AbSysUserRole saveObj(AbSysUserRole model) {
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
	public List<AbSysRole> listAllUByRid(AbSysRoleQuery query){
		try {
			return (List<AbSysRole>)findForList(getIbatisMapperNamesapce()+".listAllUByRid", null);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"获取该角色相关的用户信息错误",e.getCause());
		}
	}
	
	 
}
