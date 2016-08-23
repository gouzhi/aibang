package com.aibang.web.front.site.secCode;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibang.business.api.user.user.UserService;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.DateUtils;
import com.aibang.framework.utils.Tools;
import com.aibang.framework.utils.redis.SpringRedisCacheService;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.web.front.site.base.UserController;

/**
 * Created by zhaoyu on 2015/9/17.
 * 手机验证码发送类
 */
@Controller
@RequestMapping(value = "/smscode")
public class SmsCodeController extends UserController{
	@Resource(name = "userService")
	private UserService userService;
	/**
	 * 提现手机验证码
	 * @author zhaoyu
	 */
	@RequestMapping(value = "/cash")
	@ResponseBody
	public void generator(){
		Session session = getSession();
		SmsCode smsCodeOld = (SmsCode)session.getAttribute(Const.SESSION_SECURITY_CASH_SMSCODE);
		if (smsCodeOld==null||(System.currentTimeMillis()-smsCodeOld.getTime())<120000){
			Random random = new Random();
			int num = random.nextInt(999999);
//			num =111111;
			String code = new DecimalFormat("000000").format(num);
			logger.error(code);
			SmsCode smsCode = new SmsCode(code,System.currentTimeMillis());
			session.setAttribute(Const.SESSION_SECURITY_CASH_SMSCODE,smsCode);
		}
	}

	/**
	 * 注册手机发送验证码
	 * @param model
	 * @param phone 要发送的手机号
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年10月8日
	 */
	@RequestMapping(value= "/regist")
	public void getRegisterCode(ModelMap model,String phone,String code,HttpServletRequest request,HttpServletResponse response,PrintWriter out){


		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();

		Session session = currentUser.getSession();
		String sessionCode = (String) session
				.getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
		//判断验证码是否输入正确，不正确不发手机验证码
		if(Tools.notEmpty(sessionCode)
				&& sessionCode.equalsIgnoreCase(code)){
			//结果状态 0发送失败 否则返回验证码
			int res = getSendCode(phone);
			try{

				if(res>0)
			    {
			    	out.write("1");
			    }else
			    {
			    	out.write("0");	
			    }
				request.getSession().setAttribute("regPhone", phone);
				request.getSession().setAttribute("regCode", res+"");
				request.getSession().setAttribute("regTime", new Date());
				out.close();
			}catch(Exception e){
				logger.error(e.toString(), e);
			}

		}else{
			try{
				out.write("-1");
				out.close();
			}catch(Exception e){
				logger.error(e.toString(), e);
			}
		}

	}
	/**
	 * 修改密码验证手机，发送验证码
	 * @param model
	 * @param phone 要发送的手机号
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年10月8日
	 */
	@Autowired
	private SpringRedisCacheService springRedisCacheService;
	@RequestMapping(value= "/passcode")
	public void getPassCode(ModelMap model,Integer id,HttpServletRequest request,HttpServletResponse response,PrintWriter out){
		HjsUser user = userService.getById(id);
		//判断找回密码次数，每天超过5次不做操作
		int times = 0;
		if(springRedisCacheService.get("reset_"+user.getId())!=null){
			times =Integer.parseInt(springRedisCacheService.get("reset_"+user.getId()).toString());
			if(times>5){
				try{
					out.write("1");
					out.close();
				}catch(Exception e){
					logger.error(e.toString(), e);
				}
			}else{
				String phone = user.getPhone();
				int res = getSendCode(phone);
				try{
					out.write("");
					request.getSession().setAttribute("passPhone", user.getPhone());
					request.getSession().setAttribute("passCode", res+"");
					request.getSession().setAttribute("passTime", new Date());
					out.close();
					//保存最多修改密码次数
					times+=1;
					Date nowTime = new Date();
					String nowTimeString = DateUtils.dateToString(nowTime,"yyyy-MM-dd HH:mm:ss");
					String lastTimeString = nowTimeString.substring(0,10)+" 23:59:59";
					SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date end = dfs.parse(lastTimeString);
					long between=(end.getTime()-nowTime.getTime())/1000;
					springRedisCacheService.set("reset_"+user.getId(), times,(int)between);
				}catch(Exception e){
					logger.error(e.toString(), e);
				}
			}
		}else{
			String phone = user.getPhone();
			int res = getSendCode(phone);
			try{
				out.write("");
				request.getSession().setAttribute("passPhone", user.getPhone());
				request.getSession().setAttribute("passCode", res+"");
				request.getSession().setAttribute("passTime", new Date());
				out.close();
				//保存最多修改密码次数
				times+=1;
				Date nowTime = new Date();
				String nowTimeString = DateUtils.dateToString(nowTime,"yyyy-MM-dd HH:mm:ss");
				String lastTimeString = nowTimeString.substring(0,10)+" 23:59:59";
				SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date end = dfs.parse(lastTimeString);
				long between=(end.getTime()-nowTime.getTime())/1000;
				springRedisCacheService.set("reset_"+user.getId(), times,(int)between);
			}catch(Exception e){
				logger.error(e.toString(), e);
			}
		}


	}
	/**
	 * 验证手机,发送验证码
	 * @param model
	 * @param phone 要发送的手机号
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年10月8日
	 */
	@RequestMapping(value= "/phonecode")
	public void getPhoneCode(ModelMap model,Integer id,HttpServletRequest request,HttpServletResponse response,PrintWriter out){
		HjsUser user = userService.getById(id);
		String phone = user.getPhone();
		int res = getSendCode(phone);
		try{
			out.write("");
			request.getSession().setAttribute("phonePhone", user.getPhone());
			request.getSession().setAttribute("phoneCode", res+"");
			request.getSession().setAttribute("phoneTime", new Date());
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	/**
	 * 验证新手机,发送验证码
	 * @param model
	 * @param phone 要发送的手机号
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年10月8日
	 */
	@RequestMapping(value= "/newphonecode")
	public void getNewPhoneCode(ModelMap model,String phone,HttpServletRequest request,HttpServletResponse response,PrintWriter out){
		//结果状态 0发送失败 否则返回验证码
		int res = getSendCode(phone);
		try{
			out.write("");
			request.getSession().setAttribute("phonePhone", phone);
			request.getSession().setAttribute("phoneCode", res+"");
			request.getSession().setAttribute("phoneTime", new Date());
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	/**
	 * 验证邮箱,发送验证码
	 * @param model
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年10月8日
	 */
	@RequestMapping(value= "/emailcode")
	public void getEmailCode(ModelMap model,Integer id,HttpServletRequest request,HttpServletResponse response,PrintWriter out){
		HjsUser user = userService.getById(id);
		String phone = user.getPhone();
		int res = getSendCode(phone);
		try{
			out.write("");
			request.getSession().setAttribute("emailPhone", user.getPhone());
			request.getSession().setAttribute("emailCode", res+"");
			request.getSession().setAttribute("emailTime", new Date());
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	/**
	 * 验证实名,发送验证码
	 * @param model
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年10月8日
	 */
	@RequestMapping(value= "/namecode")
	public void getNameCode(ModelMap model,Integer id,HttpServletRequest request,HttpServletResponse response,PrintWriter out){
		HjsUser user = userService.getById(id);
		//结果状态 0发送失败 否则返回验证码
		String phone = user.getPhone();
		int res = getSendCode(phone);
		try{
			out.write("");
			request.getSession().setAttribute("namePhone", user.getPhone());
			request.getSession().setAttribute("nameCode", res+"");
			request.getSession().setAttribute("nameTime", new Date());
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}

	/**
	 * 发送验证码并返回发送的验证码
	 * @return int
	 * @author zhangyong
	 * @date 2016年1月15日
	 */
	private int getSendCode(String phone) {
		int res = 0;
		int code = Tools.getRandomNum();

		return res;
	}


}
