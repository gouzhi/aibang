package com.aibang.business.provider.system.role;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.role.HjsSysRoleService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysRole;
import com.aibang.transfer.model.vo.HjsSysRoleQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/**
 * 角色相关操作 
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
@Service("hjsSysRoleService")
@SuppressWarnings({"unchecked"})
public class HjsSysRoleServiceImpl  extends ProviderServiceBase<HjsSysRole,Integer> implements HjsSysRoleService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysRole";
	}
	
	/**
	 * 添加或修改角色信息
	 *  
	 * @param entity
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysRole saveOrUpdate(HjsSysRole entity) {
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
	public Page findPage(HjsSysRoleQuery query) {
		return pageQuery("HjsSysRole.findPage",query);
	}
	
	/**
	 * 保存添加角色信息
	 *  
	 * @param model
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysRole saveObj(HjsSysRole model){
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
    public void update(HjsSysRole model){
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
    public void remove(HjsSysRole model){
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
    public HjsSysRole getById(Integer id){
    	HjsSysRole role = new HjsSysRole();
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
	public List<HjsSysRole> findAll(){
		try {
			return (List<HjsSysRole>)findForList(getIbatisMapperNamesapce()+".listAllRoles", null);
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
	public boolean isUnique(HjsSysRole entity, String uniquePropertyNames){
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
	public List<HjsSysRole> listAllERRoles(String sessionId){
		List<HjsSysRole> roleList =null;
		try {
    		roleList = (List<HjsSysRole>)findForList(getIbatisMapperNamesapce()+".listAllERRoles", null);
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
	public List<HjsSysRole> listAllappERRoles(String sessionId){
		List<HjsSysRole> roleList =null;
		try {
    		roleList = (List<HjsSysRole>)findForList(getIbatisMapperNamesapce()+".listAllappERRoles", null);
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
	public List<HjsSysRole> listAllRolesByPId(HjsSysRoleQuery query){
		List<HjsSysRole> roleList =null;
		try {
    		roleList = (List<HjsSysRole>)findForList(getIbatisMapperNamesapce()+".listAllRolesByPId", query);
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
	public HjsSysRole updateRoleRights(HjsSysRole role){
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
	public HjsSysRole updateQx(HjsSysRole role,String msg){
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
	public HjsSysRole setAllRights(HjsSysRole role){
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
	public HjsSysRole updateKFQx(HjsSysRole role, String msg) {
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
	public HjsSysRole updateGysqxc(HjsSysRole role, String msg) {
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
	public List<HjsSysRole> listAllERRoles(){
		try {
			return (List<HjsSysRole>)findForList(getIbatisMapperNamesapce()+".listAllERRoles", null);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"列出二级角色信息错误",e.getCause());
		}
	}
	 
}
