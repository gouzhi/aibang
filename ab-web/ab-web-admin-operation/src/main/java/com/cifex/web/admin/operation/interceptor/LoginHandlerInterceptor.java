package com.cifex.web.admin.operation.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.RightsHelper;
import com.cifex.transfer.model.dto.HjsSysMenu;
import com.cifex.transfer.model.dto.HjsUser;
 
 
/**
 * 
* 类名称：LoginHandlerInterceptor.java
* 类描述： 
* 作者单位： 
* 联系方式：
* @version 1.6
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{

	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String path = request.getServletPath();
		if(path.matches(Const.NO_INTERCEPTOR_PATH)){
			return true;
		}else{
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			HjsUser user = (HjsUser)session.getAttribute(Const.SESSION_USER);
			if(user!=null){
				
				//判断是否拥有当前点击菜单的权限（内部过滤,防止通过url进入跳过菜单权限）
				/**
				 * 根据点击的菜单的xxx.do去菜单中的URL去匹配，当匹配到了此菜单，判断是否有此菜单的权限，没有的话跳转到404页面
				 * 根据按钮权限，授权按钮(当前点的菜单和角色中各按钮的权限匹对)
				 */
				Boolean b = true;
				List<HjsSysMenu> menuList = (List)session.getAttribute(Const.SESSION_allmenuList); //获取菜单列表
				path = path.substring(1, path.length());
				for(int i=0;i<menuList.size();i++){
					for(int j=0;j<menuList.get(i).getSubMenu().size();j++){
						String  aaa=menuList.get(i).getSubMenu().get(j).getMenuUrl();
						if(menuList.get(i).getSubMenu().get(j).getMenuUrl().split(".do")[0].equals(path.split(".do")[0])){
							if(!menuList.get(i).getSubMenu().get(j).isHasMenu()){				//判断有无此菜单权限
								response.sendRedirect(request.getContextPath() + Const.LOGIN);
								return false;
							}else{																//按钮判断
								Map<String, String> map = (Map<String, String>)session.getAttribute(Const.SESSION_QX);//按钮权限
								if(map==null)
								{
									map=new HashMap<String, String>();
								}
								map.remove("add");
								map.remove("del");
								map.remove("edit");
								map.remove("cha");
								map.remove("audit");
								String menuId =  menuList.get(i).getSubMenu().get(j).getId().toString();
								String USERNAME = session.getAttribute(Const.SESSION_USERNAME).toString();	//获取当前登录者loginname
								Boolean isAdmin = "admin".equals(USERNAME);
								Boolean cadd=false,cdel=false,cedit=false,ccha=false,caudit=false;
								if(map.get("adds")!=null){
									for(String add:map.get("adds").split(",")){
										if(RightsHelper.testRights(add, menuId)){
											cadd=true;
											break;
										}
									}
								}
								if(map.get("dels")!=null){
									for(String del:map.get("dels").split(",")){
										if(RightsHelper.testRights(del, menuId)){
											cdel=true;
											break;
										}
									}
								}
								if(map.get("edits")!=null){
									for(String edit:map.get("edits").split(",")){
										if(RightsHelper.testRights(edit, menuId)){
											cedit=true;
											break;
										}
									}
								}
								if(map.get("chas")!=null){
									for(String cha:map.get("chas").split(",")){
										if(RightsHelper.testRights(cha, menuId)){
											ccha=true;
											break;
										}
									}
								}
								if(map.get("audits")!=null){
									for(String audit:map.get("audits").split(",")){
										if(RightsHelper.testRights(audit, menuId)){
											caudit=true;
											break;
										}
									}
								}
								map.put("add", cadd || isAdmin?"1":"0");
								map.put("del", cdel || isAdmin?"1":"0");
								map.put("edit", cedit || isAdmin?"1":"0");
								map.put("cha", ccha || isAdmin?"1":"0");
								map.put("audit", caudit || isAdmin?"1":"0");
								session.removeAttribute(Const.SESSION_QX);
								session.setAttribute(Const.SESSION_QX, map);	//重新分配按钮权限
							}
						}
					}
				}
				return true;
			}else{
				//登陆过滤
				response.sendRedirect(request.getContextPath() + Const.LOGIN);
				return false;		
				//return true;
			}
		}
	}
	
}
