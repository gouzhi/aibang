package com.aibang.business.api.system.userRole;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysRole;
import com.aibang.transfer.model.dto.AbSysUserRole;
import com.aibang.transfer.model.vo.AbSysRoleQuery;
import com.aibang.transfer.model.vo.AbSysUserRoleQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface AbSysUserRoleService {
    
	/** 
	 * 创建HjsSysUserRole
	 **/
	public AbSysUserRole saveObj(AbSysUserRole model);
	
	/** 
	 * 更新HjsSysUserRole
	 **/	
    public void update(AbSysUserRole model);
    
	/** 
	 * 删除HjsSysUserRole
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsSysUserRole
     */
    public void remove(AbSysUserRole model);
    
	/** 
	 * 根据ID得到HjsSysUserRole
	 **/    
    public AbSysUserRole getById(Integer id);
    
 
	public List<AbSysUserRole> findAll();
	
	public AbSysUserRole saveOrUpdate(AbSysUserRole entity);
	 
	public boolean isUnique(AbSysUserRole entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsSysUserRole
	 **/      
	@SuppressWarnings("rawtypes")
	public Page findPage(AbSysUserRoleQuery query);
	/**
	 * 得到该角色下所有用户列表
	 * @param query
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2016年1月25日
	 */
	public List<AbSysRole> listAllUByRid(AbSysRoleQuery query);
	
}
