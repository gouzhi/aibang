package com.aibang.web.admin.operation.system.login;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aibang.business.api.system.menu.AbSysMenuService;
import com.aibang.business.api.system.user.AbUserService;
import com.aibang.business.api.system.user.AbUsersOptLogService;
import com.aibang.business.api.system.user.AbUsersOptService;
import com.aibang.framework.utils.AppUtil;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.DateUtils;
import com.aibang.framework.utils.PageData;
import com.aibang.framework.utils.RightsHelper;
import com.aibang.framework.utils.Tools;
import com.aibang.framework.utils.ip.Utils;
import com.aibang.transfer.model.dto.AbSysMenu;
import com.aibang.transfer.model.dto.AbSysRole;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUsersOpt;
import com.aibang.transfer.model.dto.AbUsersOptLog;
import com.aibang.transfer.model.vo.AbSysRoleQuery;
import com.aibang.transfer.model.vo.AbUserQuery;
import com.aibang.web.admin.operation.base.AdminController;

/**
 * 
 * @ClassName: LoginController
 * @Description: (登陆相关操作类，总入口)
 * @author zy
 * @date 2015-7-29 下午3:10:18 Copyright CIFEX Corporation 2015
 */
@Controller
public class LoginController extends AdminController {

	@Resource(name = "hjsUserService")
	private AbUserService hjsUserService;
	@Resource(name = "hjsSysMenuService")
	private AbSysMenuService hjsSysMenuService;
	@Resource(name = "hjsUsersOptLogService")
	private AbUsersOptLogService hjsUsersOptLogService;
	@Resource(name = "hjsUsersOptService")
	private AbUsersOptService hjsUsersOptService;

	/**
	 * 
	 * @Title: toLogin
	 * @Description: (访问登录页)
	 * @param @return
	 * @param @throws Exception
	 * @return ModelAndView
	 * @throws
	 */
	@RequestMapping(value = "/login_toLogin")
	public ModelAndView toLogin() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 
	 * @Title: login
	 * @Description: (请求登录，验证用户)
	 * @param @return
	 * @param @throws Exception
	 * @return Object
	 * @throws
	 */
	@RequestMapping(value = "/login_login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").split(",fh,");

		if (null != KEYDATA && KEYDATA.length == 3) {
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			
			String sessionCode = (String) currentUser.getSession()
					.getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码

			String code = KEYDATA[2];
			if (null == code || "".equals(code)) {
				errInfo = "nullcode"; // 验证码为空
			} else {
				String USERNAME = KEYDATA[0];
				String PASSWORD = KEYDATA[1];
				pd.put("USERNAME", USERNAME);
				if (Tools.notEmpty(sessionCode)
						&& sessionCode.equalsIgnoreCase(code)) {
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD)
							.toString(); // 密码加密
					pd.put("PASSWORD", passwd);
					AbUserQuery query = new AbUserQuery();
					query.setUsername(USERNAME);
					query.setPassword(passwd);
					AbUser u = hjsUserService.getSysUserByNameAndPwd(query);
					if (u != null) {
						
						
						pd.put("LAST_LOGIN", DateUtils.getTime().toString());
						// shiro加入身份验证
						UsernamePasswordToken token = new UsernamePasswordToken(
								USERNAME, PASSWORD);
						try {
							//固定session攻击安全漏洞  https://issues.apache.org/jira/browse/SHIRO-170
							currentUser.getSession().stop();
							Session session = currentUser.getSession();
							currentUser.login(token);
							AbUsersOpt usersOpt = hjsUsersOptService.getUsersOptByLoginId(u.getId());
							session.setAttribute(Const.SESSION_USEROPT,usersOpt);
							session.setAttribute(Const.SESSION_USER, u);
							session.removeAttribute(Const.SESSION_SECURITY_CODE);
						} catch (AuthenticationException e) {
							errInfo = "身份验证失败！";
						} 
						AbUsersOptLog userOptLog = new AbUsersOptLog();
						userOptLog.setContent("登陆");
						userOptLog.setResult(1);
						userOptLog.setUserId(u.getId());
						userOptLog.setCreateIp(Utils.getCdnIpAddr(getRequest()));
						userOptLog.setTypeId(1);
						userOptLog.setCreateTime(new Date());
						hjsUsersOptLogService.saveObj(userOptLog);
					} else {
						errInfo = "usererror"; // 用户名或密码有误
					}
				} else {
					errInfo = "codeerror"; // 验证码输入有误
				}
				if (Tools.isEmpty(errInfo)) {
					errInfo = "success"; // 验证成功
				}
			}
		} else {
			errInfo = "error"; // 缺少参数
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 
	 * @Title: login_index
	 * @Description: (访问系统首页)
	 * @param @param changeMenu
	 * @param @return
	 * @return ModelAndView
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/main/{changeMenu}")
	public ModelAndView login_index(
			@PathVariable("changeMenu") String changeMenu) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {

			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			AbUser user = (AbUser) session.getAttribute(Const.SESSION_USER);
			if (user != null) {

				List<AbSysRole> role = user.getRoles();
				// 避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
				session.setAttribute(Const.SESSION_USERNAME, user.getUsername()); // 放入用户名
				List<AbSysMenu> allmenuList = new ArrayList<AbSysMenu>();
				if (null == session.getAttribute(Const.SESSION_allmenuList)) {
					allmenuList = hjsSysMenuService.findAll();

					if (role != null && role.size() > 0) {
						for (AbSysMenu menu : allmenuList) {
							for (AbSysRole rr : role) {
								if (RightsHelper.testRights(rr.getMenuRights(),
										menu.getId())) {
									menu.setHasMenu(true);
									break;
								}
							}
							if (menu.isHasMenu()) {
								List<AbSysMenu> subMenuList = menu
										.getSubMenu();
								if (subMenuList != null
										&& subMenuList.size() > 0) {
									for (AbSysMenu sub : subMenuList) {
										for (AbSysRole rr : role) {
											if (RightsHelper.testRights(
													rr.getMenuRights(),
													sub.getId())) {
												sub.setHasMenu(true);
												break;
											}
										}
										List<AbSysMenu> subMenuList3 = sub
												.getSubMenu();
										if (subMenuList3 != null
												&& subMenuList3.size() > 0) {
											for (AbSysMenu subMenu3 : subMenuList3) {
												for (AbSysRole rr : role) {
													if (RightsHelper
															.testRights(
																	rr.getMenuRights(),
																	subMenu3.getId())) {
														subMenu3.setHasMenu(true);
														break;
													}
												}
											}
										}

									}
								}
							}
						}
					}
					session.setAttribute(Const.SESSION_allmenuList, allmenuList); // 菜单权限放入session中
				} else {
					allmenuList = (List<AbSysMenu>) session
							.getAttribute(Const.SESSION_allmenuList);
				}

				// 切换菜单=====
				List<AbSysMenu> menuList = new ArrayList<AbSysMenu>();
				// if(null == session.getAttribute(Const.SESSION_menuList) ||
				// ("yes".equals(pd.getString("changeMenu")))){
				// if(null == session.getAttribute(Const.SESSION_menuList) ||
				// ("yes".equals(changeMenu))){
				List<AbSysMenu> menuList1 = new ArrayList<AbSysMenu>();
				List<AbSysMenu> menuList2 = new ArrayList<AbSysMenu>();

				// 拆分菜单
				for (int i = 0; i < allmenuList.size(); i++) {
					AbSysMenu menu = allmenuList.get(i);
					if (menu.getTypeId().intValue() == 1) {
						menuList1.add(menu);
					} else {
						menuList2.add(menu);
					}
				}

				session.removeAttribute(Const.SESSION_menuList);
				session.setAttribute(Const.SESSION_menuList, menuList1);
				session.removeAttribute("changeMenu");
				session.setAttribute("changeMenu", "1");
				menuList = menuList1;
				if (null == session.getAttribute(Const.SESSION_QX)) {
					session.setAttribute(Const.SESSION_QX, this.getUQX(session)); // 按钮权限放到session中
				}
				mv.setViewName("system/admin/index");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			} else {
				mv.setViewName("system/admin/login");// session失效后跳转登录页面
			}

		} catch (Exception e) {
			mv.setViewName("system/admin/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 
	 * @Title: tab
	 * @Description: (进入tab标签)
	 * @param @return
	 * @return String
	 * @throws
	 */
	@RequestMapping(value = "/tab")
	public String tab() {
		return "system/admin/tab";
	}

	/**
	 * 
	 * @Title: defaultPage
	 * @Description: (进入首页后的默认页面)
	 * @param @return
	 * @return String
	 * @throws
	 */
	@RequestMapping(value = "/login_default")
	public String defaultPage() {
		return "system/admin/default";
	}

	/**
	 * 
	 * @Title: logout
	 * @Description: (用户注销)
	 * @param @return
	 * @return ModelAndView
	 * @throws
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();

		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_USEROPT);
		session.removeAttribute(Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(Const.SESSION_allmenuList);
		session.removeAttribute(Const.SESSION_menuList);
		session.removeAttribute(Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute("changeMenu");

		// shiro销毁登录
		Subject subject = SecurityUtils.getSubject();
		subject.logout();

		pd = this.getPageData();
		String msg = pd.getString("msg");
		pd.put("msg", msg);

		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.setViewName("redirect:/main/index");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 
	 * @Title: getUQX
	 * @Description: (获取用户权限)
	 * @param @param session
	 * @param @return
	 * @return Map<String,String>
	 * @throws
	 */
	public Map<String, String> getUQX(Session session) {
		PageData pd = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String USERNAME = session.getAttribute(Const.SESSION_USERNAME)
					.toString();
			pd.put(Const.SESSION_USERNAME, USERNAME);
			AbUserQuery u = new AbUserQuery();
			u.setUsername(USERNAME);
			List<AbSysRole> roles = ((AbUser) session
					.getAttribute(Const.SESSION_USER)).getRoles();

			int finall_FX_QX = 0;
			int finall_FW_QX = 0;
			int finall_QX1 = 0;
			int finall_QX2 = 0;
			int finall_QX3 = 0;
			int finall_QX4 = 0;

			int finall_C1 = 0;
			int finall_C2 = 0;
			int finall_C3 = 0;
			int finall_C4 = 0;

			int finall_Q1 = 0;
			int finall_Q2 = 0;
			int finall_Q3 = 0;
			int finall_Q4 = 0;

			String finall_add = "";
			String finall_del = "";
			String finall_edit = "";
			String finall_chas = "";
			String finall_audit = "";
			AbSysRoleQuery srq = new AbSysRoleQuery();
			int i = 1;
			for (AbSysRole role : roles) {
				srq.setId(role.getId());
				finall_FX_QX = finall_FX_QX | role.getFxQx();
				finall_FW_QX = finall_FW_QX | role.getFwQx();
				finall_QX1 = finall_QX1 | role.getQx1();
				finall_QX2 = finall_QX2 | role.getQx2();
				finall_QX3 = finall_QX3 | role.getQx3();
				finall_QX4 = finall_QX4 | role.getQx4();
				finall_C1 = Math.max(finall_C1, role.getC1());
				finall_C2 = Math.max(finall_C2, role.getC2());
				finall_C3 = Math.max(finall_C3, role.getC3());
				finall_C4 = Math.max(finall_C4, role.getC4());
				finall_Q1 = Math.max(finall_Q1, role.getQ1());
				finall_Q2 = Math.max(finall_Q2, role.getQ2());
				finall_Q3 = Math.max(finall_Q3, role.getQ3());
				finall_Q4 = Math.max(finall_Q4, role.getQ4());
				if (i == 1) {
					finall_add = role.getAddQx();
					finall_del = role.getDelQx();
					finall_edit = role.getEditQx();
					finall_chas = role.getChaQx();
					finall_audit = role.getAuditQx();
				} else {
					finall_add += "," + role.getAddQx();
					finall_del += "," + role.getDelQx();
					finall_edit += "," + role.getEditQx();
					finall_chas += "," + role.getChaQx();
					finall_audit += "," + role.getAuditQx();
				}
				i++;
			}

			map.put("FX_QX", finall_FX_QX + "");
			map.put("FW_QX", finall_FW_QX + "");
			map.put("QX1", finall_QX1 + "");
			map.put("QX2", finall_QX2 + "");
			map.put("QX3", finall_QX3 + "");
			map.put("QX4", finall_QX4 + "");

			map.put("C1", finall_C1 + "");
			map.put("C2", finall_C2 + "");
			map.put("C3", finall_C3 + "");
			map.put("C4", finall_C4 + "");
			map.put("Q1", finall_Q1 + "");
			map.put("Q2", finall_Q2 + "");
			map.put("Q3", finall_Q3 + "");
			map.put("Q4", finall_Q4 + "");

			map.put("adds", finall_add);
			map.put("dels", finall_del);
			map.put("edits", finall_edit);
			map.put("chas", finall_chas);
			map.put("audits", finall_audit);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return map;
	}

}
