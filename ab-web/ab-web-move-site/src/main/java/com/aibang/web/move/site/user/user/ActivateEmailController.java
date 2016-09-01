package com.aibang.web.move.site.user.user;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aibang.business.api.user.approve.ApproveEmailActiveService;
import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.framework.utils.Base64Utils;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.DateUtils;
import com.aibang.framework.utils.MD5;
import com.aibang.framework.utils.ip.Utils;
import com.aibang.framework.utils.validate.ValidateUtils;
import com.aibang.transfer.model.dto.AbApproveEmailActive;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUsersInfo;

/**
 * 会员相关操作
 * @author zhangyong
 * @date 2015年9月16日
 */
@Controller
public class ActivateEmailController extends com.aibang.web.move.site.base.UserController{

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "usersInfoService")
	private UsersInfoService usersInfoService;
	@Resource(name = "approveEmailActiveService")
	private ApproveEmailActiveService approveEmailActiveService;
	/**
	 * 验证邮箱激活邮件
	 * @param kid 激活信息码
	 * @param request
	 * @param response
	 * @return String
	 * @author zhangyong
	 * @date 2015年9月18日
	 */
	@RequestMapping(value="/activateEmail")
	public String activateEmail(String kid,String code,HttpServletRequest request,HttpServletResponse response){
		request.setAttribute("msg", "非常抱歉，该链接已失效，请重新验证！");
		if(ValidateUtils.isStringEmpty(kid)){
			return "参数错误";
		}
		String infoString = Base64Utils.decodeStr(kid);
		String[] infos = infoString.split("####"); 
		if(infos.length!=3){
			return "参数错误";
		}
		//激活邮件发送时间
		Date vDate = DateUtils.fomatDate(infos[2]);
		//当前时间
		Date nDate = DateUtils.fomatDate(DateUtils.getTime());
		Long datesub = DateUtils.getHourSub(infos[2],DateUtils.getTime());
		DateUtils.compareDate(vDate, nDate);
		AbUser user = userService.getByUsername(infos[0]);
		//用户不存在及邮件失效处理
		if(user==null){
			return "用户不存在，验证失败";
		}else if(!user.getEmail().equals(infos[1])||datesub>120){
			return "邮箱异常或验证邮件失效，验证失败";
		}
		if(!MD5.md5(infos[0]+infos[1]+infos[2]+user.getPassword()).equals(StringUtils.trim(code)))
		{
			return "邮箱认证失败";
		}
		//验证成功，修改相关激活状态
		AbApproveEmailActive hjsApproveEmailActive = new AbApproveEmailActive();
		hjsApproveEmailActive.setUserId(user.getId());
		hjsApproveEmailActive.setEmail(user.getEmail());
		hjsApproveEmailActive.setCreateIp(Utils.getCdnIpAddr(request));
		approveEmailActiveService.activateEmail(hjsApproveEmailActive);
		//激活成功，自动登录用户
		user.setEmailStatus(1);
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_USER, user);
		AbUsersInfo usersInfo = usersInfoService.getUsersInfoByLoginId(user.getId());
		session.setAttribute(Const.SESSION_USERCUSTOMER, usersInfo);
		request.setAttribute("msg", "恭喜您已成功验证电子邮箱！");
		return "redirect:/user/center/accountall "; 
	}
}
