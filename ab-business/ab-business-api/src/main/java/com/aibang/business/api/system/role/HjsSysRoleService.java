package com.aibang.business.api.system.role;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysRole;
import com.aibang.transfer.model.vo.HjsSysRoleQuery;
 
 

/**
 * 角色相关操作 
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
public interface HjsSysRoleService {
    
	/**
	 * 保存添加角色信息
	 *  
	 * @param model
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysRole saveObj(HjsSysRole model);
	/**
	 * 保存修改角色信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void update(HjsSysRole model);
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
    public void remove(HjsSysRole model);
    /**
     * 通过ID获得角色信息   
     *  
     * @param id
     * @return HjsSysRole
     * @author zhangyong
     * @date 2015年8月25日
     */
    public HjsSysRole getById(Integer id);
    /**
     * 获得所有角色信息
     *  
     * @return List<HjsSysRole>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<HjsSysRole> findAll();
	/**
	 * 添加或修改角色信息
	 *  
	 * @param entity
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysRole saveOrUpdate(HjsSysRole entity);
	 /**
	  * 角色唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(HjsSysRole entity, String uniquePropertyNames);
	/**
	 * 分页获得角色信息     
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@SuppressWarnings("rawtypes")
	public Page findPage(HjsSysRoleQuery query);
	/**
	 * 列出会员二级角色信息
	 * @methodname listAllappERRoles  
	 * @discription  
	 * @param sessionId
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public List<HjsSysRole> listAllappERRoles(String sessionId);
	/**
	 * 通过parentId获得子角色信息
	 * @methodname listAllRolesByPId  
	 * @discription  
	 * @param query
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public List<HjsSysRole> listAllRolesByPId(HjsSysRoleQuery query);
	/**
	 * 更新角色菜单权限
	 * @methodname updateRoleRights  
	 * @discription  
	 * @param role
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public HjsSysRole updateRoleRights(HjsSysRole role);
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
	public HjsSysRole updateQx(HjsSysRole role, String msg);
	/**
	 * 更新子菜单权限
	 * @methodname setAllRights  
	 * @discription  
	 * @param role
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月19日
	 */
	public HjsSysRole setAllRights(HjsSysRole role);
	/**
	 * 修改客服权限
	 *  
	 * @param role
	 * @param msg
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public HjsSysRole updateKFQx(HjsSysRole role, String msg);
	/**
	 * 修改角色GC权限
	 *  
	 * @param role
	 * @param msg
	 * @return HjsSysRole
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysRole updateGysqxc(HjsSysRole role, String msg);
	/**
	 * 列出二级角色信息
	 *  
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public List<HjsSysRole> listAllERRoles();
	
}
