package com.aibang.business.api.system.menu;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysMenu;
import com.aibang.transfer.model.vo.AbSysMenuQuery;
 
 
/**
 * 菜单相关操作
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
public interface AbSysMenuService {
    
	/**
	 * 添加菜单信息
	 *  
	 * @param model
	 * @return HjsSysMenu
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysMenu saveObj(AbSysMenu model);
	/**	
	 * 修改菜单信息
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void update(AbSysMenu model);
    /**
     * 通过ID删除菜单
     *  
     * @param id void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void deleteById(Integer id);
    /**
     * 逻辑删除菜单
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void remove(AbSysMenu model);
    /**    
     * 通过ID获得菜单信息
     *  
     * @param id
     * @return HjsSysMenu
     * @author zhangyong
     * @date 2015年8月25日
     */
    public AbSysMenu getById(Integer id);
    /**
     * 获得所有菜单
     *  
     * @return List<HjsSysMenu>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<AbSysMenu> findAll();
	/**
	 * 添加或修改菜单信息
	 *  
	 * @param entity
	 * @return HjsSysMenu
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysMenu saveOrUpdate(AbSysMenu entity);
	 /**
	  * 菜单唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(AbSysMenu entity, String uniquePropertyNames);
	/**     
	 * 分页获得菜单信息
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@SuppressWarnings("rawtypes")
	public Page findPage(AbSysMenuQuery query);
	/**
	 * 获得所有一级菜单
	 *  
	 * @return List<HjsSysMenu>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public List<AbSysMenu> findAllParentMenu();
	/**
	 * 通过ID获得子菜单列表
	 *  
	 * @param id
	 * @return List<HjsSysMenu>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public List<AbSysMenu> findSubMenuById(Integer id);
	/**
	 * 修改菜单图标（顶级）
	 *  
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void editIcon(AbSysMenu entity);
	/**
	 * 修改菜单类型（顶级）
	 *  
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void editType(AbSysMenu entity);

	
}
