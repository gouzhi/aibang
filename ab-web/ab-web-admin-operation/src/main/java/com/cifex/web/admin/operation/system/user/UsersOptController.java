package com.cifex.web.admin.operation.system.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.cifex.business.api.system.user.HjsUsersOptService;
import com.cifex.framework.exception.BaseException;
import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.ip.Utils;
import com.cifex.framework.utils.page.Page;
import com.cifex.framework.utils.validate.ValidateUtils;
import com.cifex.transfer.model.dto.HjsSysRole;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.transfer.model.dto.HjsUsersOpt;
import com.cifex.transfer.model.vo.HjsUserQuery;
import com.cifex.transfer.model.vo.HjsUsersOptQuery;
import com.cifex.web.admin.operation.base.AdminController;
 
/**
 * 
* @ClassName: UsersOptController
* @Description: 用户相关控制类
* @author zy
* @date 2015-7-29 下午3:24:23
* Copyright CIFEX Corporation 2015
 */
@Controller
@RequestMapping(value="/usersOpt")
public class UsersOptController extends AdminController {
	
	@Resource(name="hjsUsersOptService")
	private HjsUsersOptService hjsUsersOptService;
	@Resource(name="hjsSysRoleService")
	private HjsSysRoleService hjsSysRoleService;
	private String display(String pageName)
	{
		return  "system/usersOpt/"+pageName;
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

	public String saveU(ModelMap model,HjsUsersOpt usersOpt,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//信息入库验证
		if (ValidateUtils.isStringEmpty(usersOpt.getHjsUser().getUsername())){
			error("请填写用户登录名", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(usersOpt.getHjsUser().getPassword())){
			error("请填写用户密码", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(usersOpt.getHjsUser().getEmail())){
			error("请填写用户电子邮件", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(usersOpt.getHjsUser().getPhone())){
			error("请填写用户手机号", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(usersOpt.getHjsUser().getRealName())){
			error("请填写用户真实姓名", request, response);
			return null;
		}

		usersOpt.getHjsUser().setPassword(new SimpleHash("SHA-1",usersOpt.getHjsUser().getUsername(),usersOpt.getHjsUser().getPassword()).toString());
		usersOpt.getHjsUser().setCreateIp(Utils.getCdnIpAddr(request));		
		//平台类型用户
		usersOpt.getHjsUser().setTypeId(1);
		//有效用户
		usersOpt.getHjsUser().setStatus(1);
		usersOpt.getHjsUser().setCreateTime(new Date());
		usersOpt.getHjsUser().setIsDel(0);
		usersOpt.getHjsUser().setEmailStatus(0);
		usersOpt.getHjsUser().setPhoneStatus(0);
		usersOpt.getHjsUser().setRealNameStatus(0);
		usersOpt.getHjsUser().setOptId(getLoginUser().getId());
		try {
			hjsUsersOptService.saveUser(usersOpt);

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
		model.addAttribute("pd", new HjsUsersOpt());
		model.addAttribute("ROLE_ID","");
		model.addAttribute("roleList", roleList);
		success("用户添加成功", request, response);
		return display("user_add");
	}
	/**
	 * 
	* @Title: editU
	* @Description: 保存修改用户
	* @param @param user request response
	* @param @param delids
	* @param @param out
	* @param @return
	* @param @throws Exception
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/editU")
	public String editU(ModelMap model,HjsUsersOpt user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//信息入库验证
		if (ValidateUtils.isStringEmpty(user.getHjsUser().getUsername())){
			error("请填写用户登录名", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(user.getHjsUser().getPassword())){
			error("请填写用户密码", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(user.getHjsUser().getEmail())){
			error("请填写用户电子邮件", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(user.getHjsUser().getPhone())){
			error("请填写用户手机号", request, response);
			return null;
		}
		if (ValidateUtils.isStringEmpty(user.getHjsUser().getRealName())){
			error("请填写用户真实姓名", request, response);
			return null;
		}
		if(user.getHjsUser().getPassword() != null && !"".equals(user.getHjsUser().getPassword())){
			user.getHjsUser().setPassword(new SimpleHash("SHA-1", user.getHjsUser().getUsername(), user.getHjsUser().getPassword()).toString());
		}
		String msg="用户修改成功";
		user.getHjsUser().setOptId(getLoginUser().getId());
		try {
			hjsUsersOptService.update(user);
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
		success("用户修改成功", request, response);
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
		HjsUsersOpt user = hjsUsersOptService.getById(Integer.parseInt(USER_ID));	//根据ID读取
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
		/*HjsUserQuery hsuq = new HjsUserQuery();
		hsuq.setId(Integer.parseInt(USER_ID));*/
		//HjsUsersOpt user = hjsUsersOptService.getById(Integer.parseInt(USER_ID));	//根据ID读取
		HjsUsersOpt user = hjsUsersOptService.getByUserId(Integer.parseInt(USER_ID));
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
	public String editUP(ModelMap model,HjsUsersOpt user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//密码做处理
		if(user.getHjsUser().getPassword() != null && !"".equals(user.getHjsUser().getPassword())){
			user.getHjsUser().setPassword(new SimpleHash("SHA-1", user.getHjsUser().getUsername(), user.getHjsUser().getPassword()).toString());
		}
		String msg="用户修改成功";
		try {
			hjsUsersOptService.update(user);
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
		HjsUsersOpt usersOpt= new HjsUsersOpt();
		model.addAttribute("pd", usersOpt);
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
	public String listUsers(ModelMap model,HjsUsersOptQuery page)throws Exception{		
		
		Page pd = hjsUsersOptService.findPage(page);
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
	public void deleteU(HjsUsersOpt user,PrintWriter out){
		try{		
			hjsUsersOptService.removeUser(user);
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
	public Object deleteAllU(@RequestParam String userIds) {

		Map<String,String> map = new HashMap<String,String>();
		try {
			//批量删除判断
			if(null != userIds && !"".equals(userIds)){
				HjsUsersOptQuery hsuq = new HjsUsersOptQuery();
				hsuq.setUserIds(userIds.split(","));
				hjsUsersOptService.deleteAllU(hsuq);
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
	/**
	 * @methodname error
	 * @discription 錯誤提示
	 * @param msg
	 *            錯誤信息
	 * @param request
	 * @param response
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年8月17日
	 */
	protected String error(String msg, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			jsAlertReturn(msg, null, request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @methodname jsAlertReturn
	 * @discription 设置弹出提示
	 * @param alertStr
	 *            提示信息
	 * @param returnPath
	 *            跳转完整路径，不填跳转上一个地址
	 * @param request
	 * @param response
	 *            void
	 * @author zeng.fangfang
	 * @throws java.io.IOException
	 * @date 2015年8月17日
	 */
	protected void jsAlertReturn(String alertStr, String returnPath,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script type='text/javascript'>alert('" + alertStr
				+ "');</script>");
		if (returnPath == null) {
			out.print("<script>history.go(-1);</script>");
		} else {
			out.print("<script>window.location.href='" + returnPath
					+ "';</script>");
		}
		out.flush();
		out.close();
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
