/**    
 * @filename Command.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.command;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.fileupload.configuration.IConfiguration;
import com.aibang.framework.utils.fileupload.rule.IResourceType;
import com.aibang.framework.utils.fileupload.rule.ReturnResult;
import com.aibang.framework.utils.fileupload.rule.impl.ExecelResourceType;
import com.aibang.framework.utils.fileupload.rule.impl.FileResourceType;
import com.aibang.framework.utils.fileupload.rule.impl.ImageResourceType;
import com.aibang.framework.utils.fileupload.rule.impl.WordResourceType;
import com.alibaba.fastjson.JSON;

/**    
 * @classname Command    
 * @description 行为指令的父类 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public abstract class Command {

	/**
	 * 用户目录
	 */
	protected String userPath;
	/**
	 * 错误信息
	 */
	protected String error;
	/**
	 * 系统配置信息
	 */
	protected IConfiguration configuration;

	/**
	 * 返回结果
	 */
	protected ReturnResult returnResult;
	/**
	 * 异常信息
	 */
	protected Exception exception;
	
	/**
	 * 类初始化方法
	 */
	protected void initParams(final HttpServletRequest request,final HttpServletResponse response,final IConfiguration configuration){
		if(configuration!=null){
			this.configuration = configuration;
		}
	}
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * 设置头信息
	 * @param response
	 * @param sc
	 */
	protected abstract void setResponseHeader(final HttpServletRequest request,final HttpServletResponse response);
	
	/**
	 * 判断用户权限
	 * 生成用户目录 userPath
	 * 这里父类不做调用，各个子类如果需要登录信息验证的再自己调取验证
	 * @param request
	 * @param response
	 * @return true 有权限
	 */
	@SuppressWarnings("unchecked")
	protected boolean checkAuthentication(final HttpServletRequest request,final HttpServletResponse response){
		Session session = SecurityUtils.getSubject().getSession();
		Object object = null;
		try {
			object = session.getAttribute(Const.SESSION_USER);
			if (null != object) {//验证后台
				String jsonCache = JSON.toJSONString(object);
				Map<String, Object> userMap = JSON.parseObject(jsonCache, Map.class);
				Integer userId =(Integer)userMap.get("id");
				String username =(String)userMap.get("username");
				if(userId!=null&&username!=null){
					this.userPath = username+"/"+userId+"/"+session.getId();
					return true;
				} 
			}
		} catch (Exception e) {
			logger.error("上传组件解析登录信息出错 ",e);
		}
		return false;
	}
	
	/**
	 * 程序运行入口
	 * @param request
	 * @param response
	 * @param configuration1
	 * @param params
	 * @throws java.io.IOException
	 */ 
	public void runCommand(final HttpServletRequest request,
			final HttpServletResponse response,
			final IConfiguration configuration1,
			final Object... params) throws IOException{
		initParams(request,response, configuration1);
		setResponseHeader(request,response );
		execute(request, response); 
	}
	
	protected abstract void execute(final HttpServletRequest request,final HttpServletResponse response)  throws IOException;
	
	/**
	 * @classname RequestResourceTypeEnum    
	 * @description 上传格式的配置
	 * 前台用 type参数控制选择 
	 * @author zeng.fangfang    
	 * @date 2015年8月12日
	 */
	public enum RequestResourceTypeEnum{
		FILE(new FileResourceType()),
		IMAGE(new ImageResourceType()),
		EXECEL(new ExecelResourceType()),
		WORD(new WordResourceType());
		private final IResourceType resourceType;
		RequestResourceTypeEnum(IResourceType rt){
			this.resourceType = rt;
		}
		public IResourceType getResourceType(){
			return this.resourceType;
		}
	}
}
