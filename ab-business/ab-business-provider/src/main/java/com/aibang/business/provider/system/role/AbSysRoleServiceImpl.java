package com.aibang.business.provider.system.role;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.role.AbSysRoleService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysRole;
import com.aibang.transfer.model.vo.AbSysRoleQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/**
 * 角色相关操作 
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
@Service("abSysRoleService")
@SuppressWarnings({"unchecked"})
public class AbSysRoleServiceImpl  extends ProviderServiceBase<AbSysRole,Integer> implements AbSysRoleService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "AbSysRole";
	}
	
	/**
	 * 添加或修改角色信息
	 *  
	 * @param entity
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysRole saveOrUpdate(AbSysRole entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	
	/**
	 * 分页获得角色信息     
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbSysRoleQuery query) {
		return pageQuery(getIbatisMapperNamesapce() + ".findPage",query);
	}
	
	/**
	 * 保存添加角色信息
	 *  
	 * @param model
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysRole saveObj(AbSysRole model){
		try {
			save(model);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"创建角色错误",e.getCause());
		}
		return model;
	}
	
	/**
	 * 保存修改角色信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */	
    public void update(AbSysRole model){
    	try {
    		super.update(model);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"更新角色错误",e.getCause());
		}
    }
    
    /**
     * 通过ID删除角色信息
     *  
     * @param id void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void deleteById(Integer id){
    	try {
			super.deleteById(id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"删除角色错误",e.getCause());
		}
    }
    
    /**
     * 逻辑删除角色
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void remove(AbSysRole model){
    	try {
    		super.remove(model);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"逻辑删除角色错误",e.getCause());
		}
    }
    
    /**
     * 通过ID获得角色信息   
     *  
     * @param id
     * @return HjsSysRole
     * @author zhangyong
     * @date 2015年8月25日
     */   
    public AbSysRole getById(Integer id){
    	AbSysRole role = new AbSysRole();
    	try {
    		role = super.getById(id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID获取角色错误",e.getCause());
		}
    	return role;
    }
    
    /**
     * 获得所有角色信息
     *  
     * @return List<HjsSysRole>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<AbSysRole> findAll(){
		try {
			return (List<AbSysRole>)findForList(getIbatisMapperNamesapce()+".listAllRoles", null);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"获取所有角色信息列表错误",e.getCause());
		}
		
	}

	/**
	  * 角色唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(AbSysRole entity, String uniquePropertyNames){
		try {
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"角色唯一判断错误",e.getCause());
		}
		return false;
	}
	
	/**
	 * 列出二级角色信息
	 * @methodname listAllERRoles  
	 * @discription  
	 * @param sessionId
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public List<AbSysRole> listAllERRoles(String sessionId){
		List<AbSysRole> roleList =null;
		try {
    		roleList = (List<AbSysRole>)findForList(getIbatisMapperNamesapce()+".listAllERRoles", null);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"角色唯一判断错误",e.getCause());
		}
		return roleList;
	}
	/**
	 * 列出会员二级角色信息
	 * @methodname listAllappERRoles  
	 * @discription  
	 * @param sessionId
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public List<AbSysRole> listAllappERRoles(String sessionId){
		List<AbSysRole> roleList =null;
		try {
    		roleList = (List<AbSysRole>)findForList(getIbatisMapperNamesapce()+".listAllappERRoles", null);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"角色唯一判断错误",e.getCause());
		}
		return roleList;
	}
	/**
	 * 通过parentId获得子角色信息
	 * @methodname listAllRolesByPId  
	 * @discription  
	 * @param query
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public List<AbSysRole> listAllRolesByPId(AbSysRoleQuery query){
		List<AbSysRole> roleList =null;
		try {
    		roleList = (List<AbSysRole>)findForList(getIbatisMapperNamesapce()+".listAllRolesByPId", query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过parentId获得自角色信息错误",e.getCause());
		}
		return roleList;
	}
	/**
	 * 更新角色菜单权限
	 * @methodname updateRoleRights  
	 * @discription  
	 * @param role
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public AbSysRole updateRoleRights(AbSysRole role){
		try {
			super.update(getIbatisMapperNamesapce()+".updateRoleRights", role);	
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"更新角色菜单权限错误",e.getCause());
		}
		
		return role;
	}
	/**
	 * 更新角色操作权限（增删改查审）
	 * @methodname updateQx  
	 * @discription  
	 * @param role
	 * @param msg
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public AbSysRole updateQx(AbSysRole role,String msg){
		try {
			super.update(getIbatisMapperNamesapce()+"."+msg, role);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"更新角色操作权限错误",e.getCause());
		}
		 
		return role;
	}
	/**
	 * 更新子菜单权限
	 * @methodname setAllRights  
	 * @discription  
	 * @param role
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public AbSysRole setAllRights(AbSysRole role){
		try {
			update(getIbatisMapperNamesapce()+".setAllRights",role);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改子角色菜单权限错误",e.getCause());
		}
				
		return role;
	}
	
	/**
	 * 修改客服权限
	 *  
	 * @param role
	 * @param msg
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Override
	public AbSysRole updateKFQx(AbSysRole role, String msg) {
		try {
			update(getIbatisMapperNamesapce()+"."+msg,role);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改角色服务权限错误",e.getCause());
		}
				
		return role;
	}

	/**
	 * 修改角色GC权限
	 *  
	 * @param role
	 * @param msg
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Override
	public AbSysRole updateGysqxc(AbSysRole role, String msg) {
		try {
			update(getIbatisMapperNamesapce()+"."+msg,role);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改角色GC权限错误",e.getCause());
		}
				
		return role;
	}
	/**
	 * 列出二级角色信息
	 *  
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public List<AbSysRole> listAllERRoles(){
		try {
			return (List<AbSysRole>)findForList(getIbatisMapperNamesapce()+".listAllERRoles", null);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"列出二级角色信息错误",e.getCause());
		}
	}
	 
}
