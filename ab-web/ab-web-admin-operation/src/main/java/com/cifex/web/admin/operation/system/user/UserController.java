package com.cifex.web.admin.operation.system.user;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.system.role.HjsSysRoleService;
import com.cifex.business.api.system.user.HjsUserService;
import com.cifex.framework.exception.BaseException;
import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.ip.Utils;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsSysRole;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.transfer.model.vo.HjsUserQuery;
import com.cifex.web.admin.operation.base.AdminController;
 
/**
 * 
* @ClassName: UserController
* @Description: 用户相关控制类
* @author zy
* @date 2015-7-29 下午3:24:23
* Copyright CIFEX Corporation 2015
 */
@Controller
@RequestMapping(value="/user")
public class UserController extends AdminController {
	
	@Resource(name="hjsUserService")
	private HjsUserService hjsUserService;
	@Resource(name="hjsSysRoleService")
	private HjsSysRoleService hjsSysRoleService;
	private String display(String pageName)
	{
		return  "system/user/"+pageName;
	}
	/**
	 * 
	* @Title: saveU
	* @Description: 保存用户及相应的权限
	* @param @param user
	* @param @param out
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/saveU")

	public String saveU(ModelMap model,HjsUser user,HttpServletRequest request) throws Exception{
		user.setPassword(new SimpleHash("SHA-1",user.getUsername(),user.getPassword()).toString());
		HjsUserQuery hsuq = new HjsUserQuery();
		hsuq.setUsername(user.getUsername());
		user.setCreateIp(Utils.getCdnIpAddr(request));
		
		//平台类型用户
		user.setTypeId(1);
		//有效用户
		user.setStatus(1);
		user.setCreateTime(new Date());
		user.setIsDel(0);
		user.setEmailStatus(0);
		user.setPhoneStatus(0);
		user.setRealNameStatus(0);	
		try {
			hjsUserService.saveObj(user);

			model.addAttribute("message","用户添加成功");
		} 
		catch(RpcException e){
			model.addAttribute("message",e.getMessage());
		}
		catch (BaseException e) {
			model.addAttribute("message",e.getMessage());
		} catch (Exception e) {
			model.addAttribute("message",e.getMessage());
		}
		
		List<HjsSysRole> roleList = hjsSysRoleService.listAllERRoles();			//列出所有二级角色		
		model.addAttribute("pd", new HjsUser());
		model.addAttribute("ROLE_ID","");
		model.addAttribute("roleList", roleList);
		return display("user_add");
	}
	
	/**
	 * 判断用户是否唯一
	 * @param user
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月28日
	 */
	@RequestMapping(value="/hasU")
	public void hasUsername(HjsUser user,PrintWriter out){
		try{
			if(!hjsUserService.isUnique(user,"username")){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	/**
	 * 判断邮箱是否唯一
	 * @param user
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月28日
	 */
	@RequestMapping(value="/hasE")
	public void hasEmail(HjsUser user,PrintWriter out){
		try{
			if(!hjsUserService.isUnique(user,"email")){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	/**
	 * 判断手机是否唯一
	 * @param user
	 * @param out void
	 * @author zhangyong
	 * @date 2015年8月28日
	 */
	@RequestMapping(value="/hasP")
	public void hasPhone(HjsUser user,PrintWriter out){
		try{
			if(!hjsUserService.isUnique(user,"phone")){
				out.write("error");
			}else{
				out.write("success");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	/**
	 * 
	* @Title: editU
	* @Description: 保存修改用户
	* @param @param user
	* @param @param delids
	* @param @param out
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/editU")
	public String editU(ModelMap model,HjsUser user) throws Exception{
		//密码加密处理
		if(user.getPassword() != null && !"".equals(user.getPassword())){
			user.setPassword(new SimpleHash("SHA-1", user.getUsername(), user.getPassword()).toString());
		}
		String msg="用户修改成功";
		try {
			hjsUserService.update(user);
		} 
		catch(RpcException e){
			msg=e.getMessage();
		}
		catch(BaseException e){
			msg=e.getMessage();
		}
		catch(Exception e){
			msg=e.getMessage();
		}
		model.addAttribute("message",msg);
		return goEditU(model,user.getId().toString());
	}

	/**
	 * 
	* @Title: goEditU
	* @Description: 加载修改用户页面
	* @param @param USER_ID
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/goEditU")
	public String goEditU(ModelMap model,String USER_ID) throws Exception{
		List<HjsSysRole> roleList = hjsSysRoleService.listAllERRoles();
		HjsUserQuery hsuq = new HjsUserQuery();
		hsuq.setId(Integer.parseInt(USER_ID));
		HjsUser user = hjsUserService.getById(Integer.parseInt(USER_ID));	//根据ID读取
		model.addAttribute("msg", "editU");
		model.addAttribute("pd", user);
		model.addAttribute("roleList", roleList);	
		return display("user_edit");
	}
	/**
	 * 
	* @Title: goEditUP
	* @Description: 顶部修改个人资料
	* @param @param USER_ID
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/goEditUP")
	public String goEditUP(ModelMap model,String USER_ID) throws Exception{		
		//顶部修改个人资料
		model.addAttribute("fx", "head");

		List<HjsSysRole> roleList = hjsSysRoleService.listAllERRoles();
		HjsUserQuery hsuq = new HjsUserQuery();
		hsuq.setId(Integer.parseInt(USER_ID));
		HjsUser user = hjsUserService.getById(Integer.parseInt(USER_ID));	//根据ID读取
		model.addAttribute("msg", "editU");
		model.addAttribute("pd", user);
		model.addAttribute("roleList", roleList);
		
		return display("user_p_edit");
	}
	/**
	 * 
	* @Title: editU
	* @Description: 保存修改用户
	* @param @param user
	* @param @param delids
	* @param @param out
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/editUP")
	public String editUP(ModelMap model,HjsUser user) throws Exception{
		//密码加密处理
		if(user.getPassword() != null && !"".equals(user.getPassword())){
			user.setPassword(new SimpleHash("SHA-1", user.getUsername(), user.getPassword()).toString());
		}
		String msg="用户修改成功";
		try {
			hjsUserService.update(user);
		} 
		catch(RpcException e){
			msg=e.getMessage();
		}
		catch(BaseException e){
			msg=e.getMessage();
		}
		catch(Exception e){
			msg=e.getMessage();
		}
		model.addAttribute("message",msg);
		return goEditUP(model,user.getId().toString());
	}
	/**
	 * 
	* @Title: goAddU
	* @Description: 加载新增用户页面
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/goAddU")
	public String goAddU(ModelMap model)throws Exception{
		List<HjsSysRole> roleList;	
		roleList = hjsSysRoleService.listAllERRoles();			//列出所有二级角色		
		HjsUser user= new HjsUser();
		model.addAttribute("pd", user);
		model.addAttribute("ROLE_ID","");
		model.addAttribute("roleList", roleList);
		return display("user_add");
	}

	/**
	 * 
	* @Title: listUsers
	* @Description: 显示用户列表(用户组)
	* @param @param page
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/listUsers")
	public String listUsers(ModelMap model,HjsUserQuery page)throws Exception{		
		Page pd = hjsUserService.findPage(page);
		List<HjsUser> userList = pd.getResult();			//列出用户列表
		List<HjsSysRole> roleList = hjsSysRoleService.listAllERRoles();	//列出所有二级角色	
		model.addAttribute("userList", userList);
		model.addAttribute("roleList", roleList);	
		model.addAttribute("pd", page);
		model.addAttribute("page", pd);
		model.addAttribute(Const.SESSION_QX,this.getHC());	//按钮权限
		return display("user_list");
	}
	/**
	 * 
	* @Title: deleteU
	* @Description: 删除用户
	* @param @param user
	* @param @param out
	* @return void 
	* @throws
	 */
	@RequestMapping(value="/deleteU")
	public void deleteU(HjsUser user,PrintWriter out){
		try{		
			hjsUserService.remove(user);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 
	* @Title: deleteAllU
	* @Description: 批量删除用户
	* @param @param sysUserIds
	* @param @return
	* @return Object 
	* @throws
	 */
	@RequestMapping(value="/deleteAllU")
	@ResponseBody
	public Object deleteAllU(@RequestParam String sysUserIds) {

		Map<String,String> map = new HashMap<String,String>();
		try {
			//批量删除判断
			if(null != sysUserIds && !"".equals(sysUserIds)){
				HjsUserQuery hsuq = new HjsUserQuery();
				hsuq.setSysUserIds(sysUserIds.split(","));
				hjsUserService.deleteAllU(hsuq);
				map.put("result", "success");
			}else{
				map.put("result", "false");
			}					
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return map;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
