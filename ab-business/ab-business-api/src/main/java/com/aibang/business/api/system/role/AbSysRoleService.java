package com.aibang.business.api.system.role;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysRole;
import com.aibang.transfer.model.vo.AbSysRoleQuery;
 
 

/**
 * 角色相关操作 
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
public interface AbSysRoleService {
    
	/**
	 * 保存添加角色信息
	 *  
	 * @param model
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysRole saveObj(AbSysRole model);
	/**
	 * 保存修改角色信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void update(AbSysRole model);
    /**
     * 通过ID删除角色信息
     *  
     * @param id void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void deleteById(Integer id);
    /**
     * 逻辑删除角色
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void remove(AbSysRole model);
    /**
     * 通过ID获得角色信息   
     *  
     * @param id
     * @return HjsSysRole
     * @author zhangyong
     * @date 2015年8月25日
     */
    public AbSysRole getById(Integer id);
    /**
     * 获得所有角色信息
     *  
     * @return List<HjsSysRole>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<AbSysRole> findAll();
	/**
	 * 添加或修改角色信息
	 *  
	 * @param entity
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysRole saveOrUpdate(AbSysRole entity);
	 /**
	  * 角色唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(AbSysRole entity, String uniquePropertyNames);
	/**
	 * 分页获得角色信息     
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@SuppressWarnings("rawtypes")
	public Page findPage(AbSysRoleQuery query);
	/**
	 * 列出会员二级角色信息
	 * @methodname listAllappERRoles  
	 * @discription  
	 * @param sessionId
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public List<AbSysRole> listAllappERRoles(String sessionId);
	/**
	 * 通过parentId获得子角色信息
	 * @methodname listAllRolesByPId  
	 * @discription  
	 * @param query
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public List<AbSysRole> listAllRolesByPId(AbSysRoleQuery query);
	/**
	 * 更新角色菜单权限
	 * @methodname updateRoleRights  
	 * @discription  
	 * @param role
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public AbSysRole updateRoleRights(AbSysRole role);
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
	public AbSysRole updateQx(AbSysRole role, String msg);
	/**
	 * 更新子菜单权限
	 * @methodname setAllRights  
	 * @discription  
	 * @param role
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public AbSysRole setAllRights(AbSysRole role);
	/**
	 * 修改客服权限
	 *  
	 * @param role
	 * @param msg
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public AbSysRole updateKFQx(AbSysRole role, String msg);
	/**
	 * 修改角色GC权限
	 *  
	 * @param role
	 * @param msg
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysRole updateGysqxc(AbSysRole role, String msg);
	/**
	 * 列出二级角色信息
	 *  
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public List<AbSysRole> listAllERRoles();
	
}
