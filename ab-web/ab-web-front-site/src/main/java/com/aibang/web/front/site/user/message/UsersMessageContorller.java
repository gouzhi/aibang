/**    
 * @filename UsersMessageContorller.java     
 * @version www.cifex.com.cn    
 * @date 2015年9月22日     
 */
package com.aibang.web.front.site.user.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibang.business.api.user.message.UsersMessageService;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.transfer.model.dto.HjsUsersMessage;
import com.aibang.transfer.model.vo.HjsUsersMessageQuery;
import com.aibang.web.front.site.base.UserController;

/**   
 * 消息   
 * @author zeng.fangfang    
 * @date 2015年9月22日   
 */
@Controller
@RequestMapping("user/message")
public class UsersMessageContorller extends UserController{

	@Autowired
	UsersMessageService usersMessageService;//消息
	
	/**
	 * 消息列表页
	 * @param request
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年9月22日
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("page")
	public String page(HjsUsersMessageQuery query,HttpServletRequest request){
		Integer[] param = new Integer[]{2,3}; 
		if (null != query.getIsread() && query.getIsread().intValue() == 1) {
			param = new Integer[]{2}; 
		}
		HjsUser hjsUser = getLoginUser();
		query.setReceiveLoginid(hjsUser.getId());
		query.setSortColumns("id desc");
		query.setStatusArray(param);
		Page page = usersMessageService.findNoticesPageByUserId(query);	//列出HjsUsersMessage列表
		request.setAttribute("page", page);
		request.setAttribute("query", query);
		return display("page");
	}
	
	/**
	 * 执行标记已读
	 * @param records 需要被标记已读的消息ID数组（前台传参为[?,?,?,?,?,]）
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年9月22日
	 */
	@RequestMapping("domark")
	@ResponseBody
	public String domark(@RequestParam(value="records[]") Integer[] records){
		if (null == records || records.length < 1) {
			return "请选择需要标记为已读的消息";
		}
		usersMessageService.domark(records);
		return "200";
	}
	
	/**
	 * 执行删除操作
	 * @param records  需要被删除的消息id数组（前台传参为[?,?,?,?,?,]）
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年9月22日
	 */
	@RequestMapping("doremove")
	@ResponseBody
	public String doremove(@RequestParam(value="records[]") Integer[] records){
		if (null == records || records.length < 1) {
			return "请选择需要删除的消息";
		}
		usersMessageService.doremove(records);
		return "200";
	}
	
	/**
	 * 显示详情
	 * @param id 消息ID
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年9月23日
	 */
	@RequestMapping("detail")
	public String detail(Integer id,HttpServletRequest request,HttpServletResponse response){
		if (null == id || id == 0) {
			return error("参数缺失", request, response);
		}
		HjsUsersMessage message = usersMessageService.getById(id);
		message.setStatus(3);
		usersMessageService.update(message);
		request.setAttribute("message", message);
		return display("detail");
	}
	
	private String display(String pageName) {
		return "user/message/" + pageName;
	}
}
