package com.aibang.business.provider.system.menu;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.menu.HjsSysMenuService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysMenu;
import com.aibang.transfer.model.vo.HjsSysMenuQuery;
import com.alibaba.dubbo.rpc.RpcException;



/**
 * 菜单相关操作
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
@Service("hjsSysMenuService")
@SuppressWarnings({"unchecked"})
public class HjsSysMenuServiceImpl  extends ProviderServiceBase<HjsSysMenu,Integer> implements HjsSysMenuService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysMenu";
	}
	
	/**
	 * 添加或修改菜单信息
	 *  
	 * @param entity
	 * @return HjsSysMenu
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysMenu saveOrUpdate(HjsSysMenu entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	
	/**     
	 * 分页获得菜单信息
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsSysMenuQuery query) {
		Page page = new Page();
		try {
			page = super.pageQuery("HjsSysMenu.findPage",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"菜单分页列表错误",e.getCause());
		}
		return page;
	}
	
	/**	
	 * 修改菜单信息
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */	
    public void update(HjsSysMenu model){
    	try {
			super.update(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"更新菜单错误",e.getCause());
		}
    }
    
    /**
     * 通过ID删除菜单
     *  
     * @param id void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void deleteById(Integer id){
    	try {
			super.deleteById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"删除菜单错误",e.getCause());
		}
    }
    
    /**
     * 逻辑删除菜单
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void remove(HjsSysMenu model){
    	try {
			super.remove(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"逻辑删除菜单错误",e.getCause());
		}
    }
    
    /**    
     * 通过ID获得菜单信息
     *  
     * @param id
     * @return HjsSysMenu
     * @author zhangyong
     * @date 2015年8月25日
     */    
    public HjsSysMenu getById(Integer id){
    	HjsSysMenu menu = new HjsSysMenu();
    	try {
			menu = super.getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID得到菜单错误",e.getCause());
		}
    	return menu;
    }
    
    /**
     * 获得所有菜单
     *  
     * @return List<HjsSysMenu>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<HjsSysMenu> findAll(){
		List<HjsSysMenu> infolist=null;
		try {
			
		
		infolist = (List<HjsSysMenu>)(findForList(getIbatisMapperNamesapce()+".listAllParentMenu", null));
		HjsSysMenuQuery query = new HjsSysMenuQuery();
		//初始化二级
		for(HjsSysMenu menu : infolist){
			query.setId(menu.getId());
			List<HjsSysMenu> subList =  (List<HjsSysMenu>)(findForList(getIbatisMapperNamesapce()+".listSubMenuByParentId", query));
			menu.setSubMenu(subList);
		}
		//初始化三级
		for(HjsSysMenu menu : infolist){
			List<HjsSysMenu> subMenuList2 = menu.getSubMenu();
			if(subMenuList2!=null)
			{
				for (HjsSysMenu subMenu2 : subMenuList2) {
					query.setId(subMenu2.getId());
					List<HjsSysMenu> subMenu3List =  (List<HjsSysMenu>)(findForList(getIbatisMapperNamesapce()+".listSubMenuByParentId", query));
					subMenu2.setSubMenu(subMenu3List);
				}
			}
		}
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"得到所有菜单列表错误",e.getCause());
		}
		return infolist;
	}
	
	/**
	  * 菜单唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(HjsSysMenu entity, String uniquePropertyNames){
		boolean ref = false;
		try {
			ref = super.isUnique(entity, uniquePropertyNames);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"是否是唯一菜单错误",e.getCause());
		}
		return ref;
	}
	
	/**
	 * 获得所有一级菜单
	 *  
	 * @return List<HjsSysMenu>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public List<HjsSysMenu> findAllParentMenu(){
		List<HjsSysMenu> menulist = null;
		try {
			menulist = (List<HjsSysMenu>)(findForList(getIbatisMapperNamesapce()+".listAllParentMenu", null));
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"得到所有父类菜单列表错误",e.getCause());
		}
		 
	     
		return menulist;
	}
	
	/**
	 * 通过ID获得子菜单列表
	 *  
	 * @param id
	 * @return List<HjsSysMenu>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public List<HjsSysMenu> findSubMenuById(Integer id){
		List<HjsSysMenu> menulist =null;
		try {
			menulist = (List<HjsSysMenu>)(findForList(getIbatisMapperNamesapce()+".listSubMenuByParentId", id));
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过父类ID得到子菜单列表错误",e.getCause());
		}
		return menulist;
	}

	/**
	 * 添加菜单信息
	 *  
	 * @param model
	 * @return HjsSysMenu
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Override
	public HjsSysMenu saveObj(HjsSysMenu model) {
		try {
			super.save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"创建菜单错误",e.getCause());
		}
		return model;
	}
	
	/**
	 * 修改菜单图标（顶级）
	 *  
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void editIcon(HjsSysMenu entity){
		try {
			update(getIbatisMapperNamesapce()+".editicon",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改菜单图标错误",e.getCause());
		}
	}
	
	/**
	 * 修改菜单类型（顶级）
	 *  
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void editType(HjsSysMenu entity){
		try {
			update(getIbatisMapperNamesapce()+".editType",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改菜单类型错误",e.getCause());
		}
	}
}
