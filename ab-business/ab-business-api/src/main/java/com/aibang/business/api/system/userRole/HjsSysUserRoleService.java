package com.aibang.business.api.system.userRole;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysRole;
import com.aibang.transfer.model.dto.HjsSysUserRole;
import com.aibang.transfer.model.vo.HjsSysRoleQuery;
import com.aibang.transfer.model.vo.HjsSysUserRoleQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsSysUserRoleService {
    
	/** 
	 * 创建HjsSysUserRole
	 **/
	public HjsSysUserRole saveObj(HjsSysUserRole model);
	
	/** 
	 * 更新HjsSysUserRole
	 **/	
    public void update(HjsSysUserRole model);
    
	/** 
	 * 删除HjsSysUserRole
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsSysUserRole
     */
    public void remove(HjsSysUserRole model);
    
	/** 
	 * 根据ID得到HjsSysUserRole
	 **/    
    public HjsSysUserRole getById(Integer id);
    
 
	public List<HjsSysUserRole> findAll();
	
	public HjsSysUserRole saveOrUpdate(HjsSysUserRole entity);
	 
	public boolean isUnique(HjsSysUserRole entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsSysUserRole
	 **/      
	@SuppressWarnings("rawtypes")
	public Page findPage(HjsSysUserRoleQuery query);
	/**
	 * 得到该角色下所有用户列表
	 * @param query
	 * @return List<HjsSysRole>
	 * @author zhangyong
	 * @date 2016年1月25日
	 */
	public List<HjsSysRole> listAllUByRid(HjsSysRoleQuery query);
	
}
