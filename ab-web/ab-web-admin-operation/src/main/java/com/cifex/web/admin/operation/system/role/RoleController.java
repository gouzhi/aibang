package com.cifex.web.admin.operation.system.role;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cifex.business.api.system.menu.HjsSysMenuService;
import com.cifex.business.api.system.role.HjsSysRoleService;
import com.cifex.business.api.system.userRole.HjsSysUserRoleService;
import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.RightsHelper;
import com.cifex.framework.utils.Tools;
import com.cifex.transfer.model.dto.HjsSysMenu;
import com.cifex.transfer.model.dto.HjsSysRole;
import com.cifex.transfer.model.vo.HjsSysRoleQuery;
import com.cifex.web.admin.operation.base.AdminController;
 
/**
 * 
* @ClassName: RoleController
* @Description: (角色操作控制类)
* @author zy
* @date 2015-7-29 下午3:14:43
* Copyright CIFEX Corporation 2015
 */
@Controller
@RequestMapping(value="/role")
public class RoleController extends AdminController {
	
	@Resource(name="hjsSysMenuService")
	private HjsSysMenuService hjsSysMenuService;
	@Resource(name="hjsSysRoleService")
	private HjsSysRoleService hjsSysRoleService;
	@Resource(name="hjsSysUserRoleService")
	private HjsSysUserRoleService hjsSysUserRoleService;
	private String display(String pageName)
	{
		return  "system/role/"+pageName;
	}
	/**
	 * 
	* @Title: kfqx
	* @Description: (K权限)
	* @param @param id
	* @param @param value
	* @param @param msg
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/kfqx")
	public String kfqx(ModelMap model,String id,String value,String msg)throws Exception{
		try{
			HjsSysRole role=new HjsSysRole();
			role.setId(Integer.parseInt(id));
			//根据不同的标识，修改不同权限
			if(msg.equals("kfqx1")){
				role.setQx1(Integer.parseInt(value));
			}else if(msg.equals("kfqx2")){
				role.setQx2(Integer.parseInt(value));
			}else if(msg.equals("fxqx")){
				role.setFxQx(Integer.parseInt(value));
			}else if(msg.equals("fwqx")){
				role.setFwQx(Integer.parseInt(value));
			}			
			hjsSysRoleService.updateKFQx(role,msg);			
			model.addAttribute("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "save_result";
	}

	/**
	 * 
	* @Title: gysqxc
	* @Description: (c权限)
	* @param @param id
	* @param @param value
	* @param @param msg
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/gysqxc")
	public String gysqxc(ModelMap model,String id,String value,String msg)throws Exception{
		try{
			HjsSysRole role=new HjsSysRole();
			role.setId(Integer.parseInt(id));
			role.setC1(Integer.parseInt(value));
			hjsSysRoleService.updateGysqxc(role,msg);
			model.addAttribute("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "save_result";
	}
	
	/**
	 * 
	* @Title: list
	* @Description: (得到角色信息列表)
	* @param @param ROLE_ID
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping
	public String list(ModelMap model,String ROLE_ID)throws Exception{
			//给roleId设置默认值
			if(ROLE_ID == null || "".equals(ROLE_ID)){
				ROLE_ID="1";
			}	
			HjsSysRoleQuery srq=new HjsSysRoleQuery();
			srq.setId(Integer.parseInt(ROLE_ID));
			List<HjsSysRole> roleList = hjsSysRoleService.findAll();//列出所有角色
			List<HjsSysRole> roleList_z = hjsSysRoleService.listAllRolesByPId(srq);//列出此角色的所有下级		
			HjsSysRole role = hjsSysRoleService.getById(Integer.parseInt(ROLE_ID));//取得点击角色
			model.addAttribute("rolec", role);
			model.addAttribute("roleList", roleList);
			model.addAttribute("roleList_z", roleList_z);
			model.addAttribute(Const.SESSION_QX,this.getHC());//按钮权限
		
		return display("role_list");
	}
	
	/**
	 * 
	* @Title: toAdd
	* @Description: (加载添加角色页面)
	* @param @param parent_id
	* @param @return
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/toAdd")
	public String toAdd(ModelMap model,String parent_id){
		try{
			//给roleId设置默认值
			if(parent_id == null || "".equals(parent_id)){
				parent_id="1";
			}
			HjsSysRole role = new HjsSysRole();
			role.setParentId(Integer.parseInt(parent_id));
			model.addAttribute("role", role);

		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return display("role_add");
	}
	
	/**
	 * 
	* @Title: add
	* @Description: (保存添加角色信息)
	* @param @param role
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/add")//,method=RequestMethod.POST)
	public String add(ModelMap model,HjsSysRole role,HttpServletRequest request)throws Exception{		
		try{		
			String parent_id = role.getParentId().toString();		//父类角色id
			HjsSysRoleQuery srq = new HjsSysRoleQuery();
			srq.setId(role.getParentId());	
			
			if("0".equals(parent_id)){
				role.setMenuRights("");
			}else{
				String rights = hjsSysRoleService.getById(role.getParentId()).getMenuRights();//得到角色权限
				role.setMenuRights((null == rights)?"":rights);
			}			
			//设置权限默认值
			String UUID = this.get32UUID();
			role.setFwQx(0);			//服务权限
			role.setFxQx(0);			//发信权限
			role.setQx1(0);				//操作权限
			role.setQx2(0);				//产品权限
			role.setQx3(0);				//预留权限
			role.setQx4(0);				//预留权限
			role.setC1(0);				//每日发信数量
			role.setC2(0);
			role.setC3(0);
			role.setC4(0);
			role.setQ1(0);				//权限1
			role.setQ2(0);				//权限2
			role.setQ3(0);
			role.setQ4(0);
			role.setAddQx("0");			//添加权限
			role.setEditQx("0");		//修改权限
			role.setDelQx("0");			//删除权限
			role.setChaQx("0");			//查询权限
			role.setAuditQx("0");		//审核权限
			role.setIsDel(0);
			role.setVersion(0);
			role.setCreateTime(new Date());
			role.setOptId(getLoginUser().getId());
			
			hjsSysRoleService.saveObj(role);
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
	* @Description: (加载修改角色页面)
	* @param @param ROLE_ID
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/toEdit")
	public String toEdit( ModelMap model,String ROLE_ID )throws Exception{
		try{
			HjsSysRole role =hjsSysRoleService.getById(Integer.parseInt(ROLE_ID));			
			model.addAttribute("role", role);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return display("role_edit");
	}
	
	/**
	 * 
	* @Title: edit
	* @Description: (保存修改角色)
	* @param @param role
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/edit")
	public String edit(ModelMap model,HjsSysRole role,HttpServletRequest request)throws Exception{
		try{
			role.setUpdateTime(new Date());
			role.setOptId(getLoginUser().getId());
			hjsSysRoleService.update(role);
			model.addAttribute("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			model.addAttribute("msg","failed");
		}
		return "save_result";
	}
	
	/**
	 * 
	* @Title: auth
	* @Description: (加载角色菜单权限授权页面)
	* @param @param ROLE_ID
	* @param @param model
	* @param @return
	* @param @throws Exception
	* @return String 
	* @throws
	 */
	@RequestMapping(value="/auth")
	public String auth(@RequestParam String ROLE_ID,Model model)throws Exception{
		
		try{

			List<HjsSysMenu> menuList = hjsSysMenuService.findAll();
			HjsSysRole role = hjsSysRoleService.getById(Integer.parseInt(ROLE_ID));

			String roleRights = role.getMenuRights();
			//获取菜单树
			if(Tools.notEmpty(roleRights)){
				for(HjsSysMenu menu : menuList){
					menu.setHasMenu(RightsHelper.testRights(roleRights, menu.getId()));
					if(menu.isHasMenu()){
						List<HjsSysMenu> subMenuList = menu.getSubMenu();
						for(HjsSysMenu sub : subMenuList){
							sub.setHasMenu(RightsHelper.testRights(roleRights, sub.getId()));
							if(sub.isHasMenu()){
								List<HjsSysMenu> subMenuList1 = sub.getSubMenu();
								for(HjsSysMenu sub1 : subMenuList1){
									sub1.setHasMenu(RightsHelper.testRights(roleRights, sub1.getId()));
								}
							}
						}
					}
				}
			}
			JSONArray arr = JSONArray.fromObject(menuList);
			String json = arr.toString();
			json = json.replaceAll("menuId", "id").replaceAll("menuName", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("roleId", ROLE_ID);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return "system/role/authorization";
	}
	/**
	 * 
	* @Title: serviceRights
	* @Description: (加载角色服务授权页面)
	* @param @param ROLE_ID
	* @param @param model
	* @param @return
	* @param @throws Exception
	* @return String 
	* @throws
	 */
	/*@RequestMapping(value="/serviceR")
	public String serviceRights(@RequestParam String ROLE_ID,Model model)throws Exception{
		
		try{
			List<HjsSysService> sysList = sysService.listAllService().getMasterList();
			HjsSysRoleQuery hsrq = new HjsSysRoleQuery();
			hsrq.setId(Integer.parseInt(ROLE_ID));
			HjsSysRole role = roleService.getRoleById(hsrq).getMaster();
			String roleRights = role.getServiceRights();
			if(Tools.notEmpty(roleRights)){
				for(HjsSysService serv : sysList){
					serv.setHasService(RightsHelper.testRights(roleRights, serv.getId()));
					if(serv.isHasService()){
						List<HjsSysService> subSerivceList = serv.getSubService();
						for(HjsSysService sub : subSerivceList){
							sub.setHasService(RightsHelper.testRights(roleRights, sub.getId()));
							if(sub.isHasService()){
								List<HjsSysService> subServiceList1 = sub.getSubService();
								for(HjsSysService sub1 : subServiceList1){
									sub1.setHasService(RightsHelper.testRights(roleRights, sub1.getId()));
								}
							}
						}
					}
				}
			}
			JSONArray arr = JSONArray.fromObject(sysList);
			String json = arr.toString();
			json = json.replaceAll("serviceId", "id").replaceAll("serviceName", "name").replaceAll("subService", "nodes").replaceAll("hasService", "checked");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("roleId", ROLE_ID);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return "system/role/authorizationS";
	}*/

	/**
	 * 
	* @Title: button
	* @Description: (请求角色按钮授权页面)
	* @param @param ROLE_ID
	* @param @param msg
	* @param @param model
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/button")
	public String button(ModelMap model,@RequestParam String ROLE_ID,@RequestParam String msg)throws Exception{
		try{

			List<HjsSysMenu> menuList = hjsSysMenuService.findAll();

			
			HjsSysRole role = hjsSysRoleService.getById(Integer.parseInt(ROLE_ID));
			
			String roleRights = "";
			if("add_qx".equals(msg)){
				roleRights = role.getAddQx();
			}else if("del_qx".equals(msg)){
				roleRights = role.getDelQx();
			}else if("edit_qx".equals(msg)){
				roleRights = role.getEditQx();
			}else if("cha_qx".equals(msg)){
				roleRights = role.getChaQx();
			}else if("audit_qx".equals(msg)){
				roleRights = role.getAuditQx();
			}
			//获得菜单树
			if(Tools.notEmpty(roleRights)){
				for(HjsSysMenu menu : menuList){
					menu.setHasMenu(RightsHelper.testRights(roleRights, menu.getId()));
					if(menu.isHasMenu()){
						List<HjsSysMenu> subMenuList = menu.getSubMenu();
						for(HjsSysMenu sub : subMenuList){
							sub.setHasMenu(RightsHelper.testRights(roleRights, sub.getId()));
							if(sub.isHasMenu()){
								List<HjsSysMenu> subMenuList1 = sub.getSubMenu();
								for(HjsSysMenu sub1 : subMenuList1){
									sub1.setHasMenu(RightsHelper.testRights(roleRights, sub1.getId()));
								}
							}
						}
					}
				}
			}
			JSONArray arr = JSONArray.fromObject(menuList);
			String json = arr.toString();
			json = json.replaceAll("menuId", "id").replaceAll("menuName", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("roleId", ROLE_ID);
			model.addAttribute("msg", msg);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return display("role_button");
	}
	
	/**
	 * 
	* @Title: saveAuth
	* @Description: (保存角色菜单权限)
	* @param @param ROLE_ID
	* @param @param menuIds
	* @param @param out
	* @param @throws Exception
	* @return void 
	* @throws
	 */
	@RequestMapping(value="/auth/save")
	public void saveAuth(@RequestParam String ROLE_ID,@RequestParam String menuIds,PrintWriter out)throws Exception{
		HjsSysRole role = new HjsSysRole();
		role.setId(Integer.parseInt(ROLE_ID));
		try{
			//判断赋权限的菜单
			if(null != menuIds && !"".equals(menuIds.trim())){
				BigInteger rights = RightsHelper.sumRights(Tools.str2StrArray(menuIds));
				HjsSysRoleQuery hsrq = new HjsSysRoleQuery();
				hsrq.setId(Integer.parseInt(ROLE_ID));
				role = hjsSysRoleService.getById(Integer.parseInt(ROLE_ID));
				role.setMenuRights(rights.toString());
				hjsSysRoleService.updateRoleRights(role);
			}else{				
				role.setMenuRights("0");				
				hjsSysRoleService.updateRoleRights(role);
				
			}				
			hjsSysRoleService.setAllRights(role);			
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}

//	/**
//	 * 
//	* @Title: saveService
//	* @Description: (保存角色服务权限)
//	* @param @param ROLE_ID
//	* @param @param serviceIds
//	* @param @param out
//	* @param @throws Exception
//	* @return void 
//	* @throws
//	 */
//	@RequestMapping(value="/service/save")
//	public void saveService(@RequestParam String ROLE_ID,@RequestParam String serviceIds,PrintWriter out)throws Exception{
//		HjsSysRole role = new HjsSysRole();
//		role.setId(Integer.parseInt(ROLE_ID));
//		try{
//			if(null != serviceIds && !"".equals(serviceIds.trim())){
//				BigInteger rights = RightsHelper.sumRights(Tools.str2StrArray(serviceIds));
//				HjsSysRoleQuery hsrq = new HjsSysRoleQuery();
//				hsrq.setId(Integer.parseInt(ROLE_ID));
//				role = roleService.getRoleById(hsrq);
//				role.setServiceRights(rights.toString());
//				roleService.updateRoleServiceRights(role);
//			}else{				
//				role.setServiceRights("0");				
//				roleService.updateRoleServiceRights(role);
//				
//			}				
//			roleService.setAllServiceRights(role);			
//			out.write("success");
//			out.close();
//		} catch(Exception e){
//			logger.error(e.toString(), e);
//		}
//	}

	/**
	 * 
	* @Title: orleButton
	* @Description: (保存角色按钮权限)
	* @param @param ROLE_ID
	* @param @param menuIds
	* @param @param msg
	* @param @param out
	* @param @throws Exception
	* @return void 
	* @throws
	 */
	@RequestMapping(value="/roleButton/save")
	public void orleButton(@RequestParam String ROLE_ID,@RequestParam String menuIds,@RequestParam String msg,PrintWriter out)throws Exception{
		try{
			HjsSysRole role= new HjsSysRole();
			role.setId(Integer.parseInt(ROLE_ID));
			String rightsStr="";
			//权限计算
			if(!StringUtils.isBlank(menuIds)){
				BigInteger rights = RightsHelper.sumRights(Tools.str2StrArray(menuIds));
				rightsStr=rights+"";
			}
			//根据判断修改不同的操作权限
			if(msg.equals("add_qx")){
				role.setAddQx(rightsStr);
			}else if(msg.equals("del_qx")){
				role.setDelQx(rightsStr);
			}else if(msg.equals("edit_qx")){
				role.setEditQx(rightsStr);
			}else if(msg.equals("cha_qx")){
				role.setChaQx(rightsStr);
			}else if(msg.equals("audit_qx")){
				role.setAuditQx(rightsStr);
			} 
			
			
			hjsSysRoleService.updateQx(role,msg);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	/**
	 * 
	* @Title: deleteRole
	* @Description: (删除角色)
	* @param @param ROLE_ID
	* @param @return
	* @param @throws Exception
	* @return Map<String,String> 
	* @throws
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Map<String,String> deleteRole(@RequestParam String ROLE_ID)throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "";
		HjsSysRoleQuery hsrq = new HjsSysRoleQuery();
		HjsSysRole hsr = new HjsSysRole();
		try{
			hsrq.setId(Integer.parseInt(ROLE_ID));
			hsr.setId(Integer.parseInt(ROLE_ID));
			List<HjsSysRole> roleList_z = hjsSysRoleService.listAllRolesByPId(hsrq);		//列出此角色的所有下级
			if(roleList_z.size() > 0){
				errInfo = "false";
			}else{
				
				List<HjsSysRole> userlist = hjsSysUserRoleService.listAllUByRid(hsrq); //列出此角色下所有用户
				if(userlist.size() > 0 ){
					errInfo = "false2";
				}else{
					hsr.setDeleteTime(new Date());
					hjsSysRoleService.remove(hsr);
				errInfo = "success";
				}
			}
			map.put("result", errInfo);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return map;
	}
	
	/* ===============================权限================================== */
	@SuppressWarnings("unchecked")
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	

}
