package com.aibang.framework.common.model;
/**
 * 统一消息编码Base
 * @classname BaseResponseMsg    
 * @description 统一消息编码Base 
 * @author liuj    
 * @date 2016年4月14日
 */
public interface BaseResponseMsg {
		/**
		 *  提示通用的状态码 
		 *  说明 :用户模块编码 AA 提示信息编码 BB 响应编码为 AABB  字段定义为 RESPONSE_CODE_AABB="AABB";  
		 *  例如 :
		 *  模块用户注册 10 提示信息编码 01  RESPONSE_CODE_1001="1001"
		 *  模块用户注册 10 提示信息编码 02  RESPONSE_CODE_1002="1002"
		 *  模块用户登录 11 提示信息编码 01  RESPONSE_CODE_1101="1101"
		 * @classname Code    
		 * @description 通用的状态码 
		 * @author liuj    
		 * @date 2016年4月14日
		 */
		public abstract class Code {
			public static final String SUCCESS_CODE = "0";   // 获取数据成功状态码
			public static final String NOT_FAIL_CODE = "1";// 没有定义错误状态码
			public static final String SMSSUCCESS_CODE = "0";// 获取验证码数据成功状态码
			public static final String GET_CODE_ERROR = "2"; //获取手机验证码失败
			public static final String NO_PAGELIST_CODE="3"; //暂无记录
			public static final String NO_PAGEQUERY_CODE="4"; //没有符合条件的记录
		}
		
		/**
		 *  提示通用的消息
		 *  说明 :用户模块编码 AA 提示信息编码 BB 响应编码为 AABB  字段定义为 RESPONSE_MSG_AABB="AABB";  
		 *  例如 :
		 *  模块用户注册 10 提示信息编码 01  RESPONSE_MSG_1001="用户注册成功"
		 *  模块用户注册 10 提示信息编码 02  RESPONSE_MSG_1002="用户注册失败"
		 *  模块用户登录 11 提示信息编码 01  RESPONSE_MSG_1101="验证码错误"
		 * @classname Msg    
		 * @description 通用的消息 
		 * @author liuj    
		 * @date 2016年4月14日
		 */
		public abstract class Msg {
			public static final String SUCCESS_MESSAGE = "请求数据成功!";// 获取数据失败
			public static final String NOT_FAIL_MESSAGE = "没有定义的错误";
			public static final String SMSSUCCESS_MESSAGE = "验证码发送成功!";// 获取数据失败
			public static final String GET_CODE_ERROR = "获取手机验证码失败";//获取手机验证码失败
			public static final String NO_PAGELIST_MESSAGE="暂无记录！";
			public static final String NO_PAGEQUERY_MESSAGE="没有符合条件的记录！";
		}
}
