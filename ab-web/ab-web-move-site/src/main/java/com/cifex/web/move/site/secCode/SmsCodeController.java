package com.cifex.web.move.site.secCode;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cifex.business.api.user.user.UserService;
import com.cifex.framework.utils.DateUtils;
import com.cifex.framework.utils.Tools;
import com.cifex.framework.utils.redis.SpringRedisCacheService;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.web.move.site.base.UserController;

/**
 * Created by zhaoyu on 2015/9/17. 手机验证码发送类
 */
@Controller
@RequestMapping(value = "/smscode")
public class SmsCodeController extends UserController {
	@Resource(name = "userService")
	private UserService userService;
	@Autowired
	private SpringRedisCacheService springRedisCacheService;
	/**
	 * 注册手机发送验证码
	 * 
	 * @param model
	 * @param phone
	 *            要发送的手机号
	 * @param request
	 * @param response
	 *            void
	 * @author zhangyong
	 * @date 2015年10月8日
	 */
	@RequestMapping(value = "/regist")
	public void getRegisterCode(ModelMap model, String phone, String code,
			HttpServletRequest request, HttpServletResponse response,
			PrintWriter out) {
		// 结果状态 0发送失败 否则返回验证码
		int res = 0;
		int codeInt = Tools.getRandomNum();
		try {
			springRedisCacheService.delete("reg_"+phone);
			springRedisCacheService.set("reg_"+phone, res+"", 1800);
			out.write("");
			request.getSession().setAttribute("regPhone", phone);
			request.getSession().setAttribute("regCode", res+"");
			request.getSession().setAttribute("regTime", new Date());
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
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
	@RequestMapping(value= "/passcode")
	@ResponseBody
	public String getPassCode(ModelMap model,Integer id,HttpServletRequest request,HttpServletResponse response,PrintWriter out){
		HjsUser user = userService.getById(id);
		//判断找回密码次数，每天超过5次不做操作
		int times = 0;
		if(springRedisCacheService.get("reset_"+user.getId())!=null){
			times =Integer.parseInt(springRedisCacheService.get("reset_"+user.getId()).toString());
			if(times>5){
				try{
					 return "2";
				}catch(Exception e){
					logger.error(e.toString(), e);
				}
			}else{
				try{
					String phone = user.getPhone();
					int res = getSendCode(phone);
					request.getSession().setAttribute("passPhone", user.getPhone());
					request.getSession().setAttribute("passCode", res+"");
					request.getSession().setAttribute("passTime", new Date());
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
					return "1";
				}
			}
		}else{
			try{
				String phone = user.getPhone();
				int res = getSendCode(phone);
				request.getSession().setAttribute("passPhone", user.getPhone());
				request.getSession().setAttribute("passCode", res+"");
				request.getSession().setAttribute("passTime", new Date());
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
				return "1";
			}
		}
		return "0";
	}
	
	/**
	 * 发送验证码并返回发送的验证码
	 * @param user
	 * @return int
	 * @author zhangyong
	 * @date 2016年1月15日
	 */
	private int getSendCode(String phone) {
		int res = 0;
		int code = Tools.getRandomNum();
		return res;
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
	 * 异步验证手机验证码
	 * @param u 用户ID(可以空)
	 * @param t 验证类型
	 * @param ph 手机号
	 * @param co 用户输入的验证码
	 * @param out
	 * @param request
	 * @param response void
	 * @author zhangyong
	 * @date 2015年11月11日
	 */
	@RequestMapping(value="/vphonecode")
	public void validatePhoneCode(Integer u,String t,String ph,String co,PrintWriter out,HttpServletRequest request,HttpServletResponse response){
		if(u!=null){
			HjsUser user = userService.getById(u);
			ph=user.getPhone();
		}
		String codeString = "";
		Date codeTime = null;
		String phoneString = "";
		long diff = 0;
		String result = "success";
		if(request.getSession().getAttribute(t+"Code")!=null){
			codeString = request.getSession().getAttribute(t+"Code").toString();//手机验证码
			codeTime = (Date)request.getSession().getAttribute(t+"Time");//获取验证码的时间
			phoneString = request.getSession().getAttribute(t+"Phone").toString();//获取的手机号
			diff = (new Date().getTime()-codeTime.getTime())/(1000 * 60);
			if(request.getSession().getAttribute(t+"Code")==null)
			{
				result= "error1";//验证码不为空			
			}else if(!codeString.equals(co)||diff>30||!phoneString.equals(ph)){
				result = "error";//验证码不正确或失效
			}else{
				result = "success";//验证通过
			}
		}else{
			result = "error";//验证码未获取
		}
		try{
			out.write(result);
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}finally{
			if(out!=null){
				out.close();
			}
		}
	}
}
