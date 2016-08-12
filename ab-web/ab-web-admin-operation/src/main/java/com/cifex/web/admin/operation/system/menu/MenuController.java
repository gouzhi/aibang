package com.cifex.web.admin.operation.system.menu;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cifex.business.api.system.menu.HjsSysMenuService;
import com.cifex.transfer.model.dto.HjsSysMenu;
import com.cifex.transfer.model.vo.HjsSysMenuQuery;
import com.cifex.web.admin.operation.base.AdminController;
 
/**
 * 
* @ClassName: MenuController
* @Description: (菜单操作控制类)
* @author zy
* @date 2015-7-29 下午3:10:56
* Copyright CIFEX Corporation 2015
 */
@Controller
@RequestMapping(value="/menu")
public class MenuController extends AdminController {

	@Resource(name="hjsSysMenuService")
	private HjsSysMenuService hjsSysMenuService;
	private String display(String pageName)
	{
		return  "system/menu/"+pageName;
	}
	/**
	 * 
	* @Title: list
	* @Description: (显示菜单列表)
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping
	public String list(ModelMap model)throws Exception{
		try{
			List<HjsSysMenu> menuList = hjsSysMenuService.findAllParentMenu();
			model.addAttribute("menuList", menuList);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return display("menu_list");
	}
	
	/**
	 * 
	* @Title: toAdd
	* @Description: (请求新增菜单页面)
	* @param @return
	* @param @throws Exception
	* @return String 
	* @throws
	 */
	@RequestMapping(value="/toAdd")
	public String toAdd(ModelMap model)throws Exception{
		try{
			List<HjsSysMenu> menuList = hjsSysMenuService.findAllParentMenu();
			model.addAttribute("menuList", menuList);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return display("menu_add");
	}
	/**
	 * 
	* @Title: add
	* @Description: (保存菜单信息)
	* @param @param newMenu
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/add")
	public String add(ModelMap model,HjsSysMenu newMenu,HttpServletRequest request)throws Exception{
		try{
			int PARENT_ID = 0;
			//是否有parentID
			if(newMenu.getParentId()!=null){
				PARENT_ID = newMenu.getParentId();
			}
			//判断是否是顶级菜单 默认顶级
			if(PARENT_ID !=0){
				HjsSysMenuQuery sysMenu=new HjsSysMenuQuery();
				HjsSysMenu menu=new HjsSysMenu();
				sysMenu.setId(PARENT_ID);
				menu = hjsSysMenuService.getById(PARENT_ID);
				newMenu.setTypeId(menu.getTypeId());	

			}
			newMenu.setParentId(PARENT_ID);
			newMenu.setCreateTime(new Date());
			newMenu.setOptId(getLoginUser().getId());
			newMenu.setVersion(0);
			newMenu.setIsDel(0);
			HjsSysMenu rsm=hjsSysMenuService.saveObj(newMenu);
			model.addAttribute("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			model.addAttribute("msg","failed");
		}
		return "save_result";
		
	}

	/**
	 * 
	* @Title: toEdit
	* @Description: (请求编辑菜单页面)
	* @param @param menuId
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/toEdit")
	public String toEdit(ModelMap model,String menuId)throws Exception{
		try{
			HjsSysMenu m=new HjsSysMenu();
			
			m = hjsSysMenuService.getById(Integer.parseInt(menuId));
			HjsSysMenu parent = null;			
			if(m.getParentId()!=null&&m.getParentId().intValue()!=0)
			{
				parent= hjsSysMenuService.getById(m.getParentId().intValue());
			}
			
			List<HjsSysMenu> menuList = hjsSysMenuService.findAllParentMenu();

			model.addAttribute("menuList", menuList);
			model.addAttribute("menu", m);
			model.addAttribute("parent", parent);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return display("menu_edit");
	}

	/**
	 * 
	* @Title: toEditicon
	* @Description: (请求编辑菜单图标页面)
	* @param @param menuId
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/toEditicon")
	public String toEditicon(ModelMap model,String menuId)throws Exception{
		try{
			HjsSysMenu m=new HjsSysMenu();
			HjsSysMenuQuery smq=new HjsSysMenuQuery();
			smq.setId(Integer.parseInt(menuId));
			m = hjsSysMenuService.getById(Integer.parseInt(menuId));
			model.addAttribute("menu", m);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return display("menu_icon");
	}
	
	/**
	 * 
	* @Title: editicon
	* @Description: (保存菜单图标 (顶部菜单))
	* @param @param menu
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/editicon")
	public String editicon(ModelMap model,HjsSysMenu menu)throws Exception{
		try{
			hjsSysMenuService.editIcon(menu);
			model.addAttribute("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			model.addAttribute("msg","failed");
		}
		return "save_result";
	}

	/**
	 * 
	* @Title: edit
	* @Description: (保存编辑)
	* @param @param menu
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/edit")
	public String edit(ModelMap model,HjsSysMenu menu,HttpServletRequest request)throws Exception{
		try{
			//判断修改菜单类型还是菜单内容
			if(menu.getParentId()==0){
				hjsSysMenuService.editType(menu);
			}else
			{
				HjsSysMenuQuery query=new HjsSysMenuQuery();
				query.setId(menu.getParentId());
				HjsSysMenu parentMenu = hjsSysMenuService.getById(menu.getParentId());
				menu.setTypeId(parentMenu.getTypeId());
				
			}		
			menu.setOptId(getLoginUser().getId());
			menu.setUpdateTime(new Date());
			hjsSysMenuService.update(menu);
			model.addAttribute("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			model.addAttribute("msg","failed");
		}
		return "save_result";
	}
	
	/**
	 * 
	* @Title: getSub
	* @Description: (获取当前菜单的所有子菜单)
	* @param @param menuId
	* @param @param response
	* @param @throws Exception
	* @return void 
	* @throws
	 */
	@RequestMapping(value="/sub")
	public void getSub(@RequestParam String menuId,HttpServletResponse response)throws Exception{
		try {
			HjsSysMenuQuery menuQuery = new HjsSysMenuQuery();
			menuQuery.setId(Integer.parseInt(menuId));
			List<HjsSysMenu> subMenu = hjsSysMenuService.findSubMenuById(Integer.parseInt(menuId));
			JSONArray arr = JSONArray.fromObject(subMenu);
			//获得对象变为JSON格式，并且输出
			PrintWriter out;			
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String json = arr.toString();
			out.write(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
	}

	/**
	 * 
	* @Title: delete
	* @Description: (删除菜单)
	* @param @param menuId
	* @param @param out
	* @param @throws Exception
	* @return void 
	* @throws
	 */
	@RequestMapping(value="/del")
	public void delete(@RequestParam String menuId,PrintWriter out)throws Exception{
		
		try{
			HjsSysMenu sysMenu = new HjsSysMenu();
			sysMenu.setId(Integer.parseInt(menuId));
			sysMenu.setDeleteTime(new Date());
			hjsSysMenuService.remove(sysMenu);
			out.write("success");
			out.flush();
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}


}
