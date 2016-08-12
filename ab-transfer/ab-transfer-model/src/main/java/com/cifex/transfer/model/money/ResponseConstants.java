package com.cifex.transfer.model.money;
/**
 * 响应编码
 * @classname ResponseConstants    
 * @description 响应编码 
 * @author liuj    
 * @date 2015年12月22日
 */
public interface  ResponseConstants {
	// 通用的状态码
	public abstract class CommonCode {
		/********************system code begin*****************/
		public static final String SUCCESS_CODE = "0";// 获取数据成功状态码
		public static final String NOT_DEFINE_CODE = "1";// 没有定义错误状态码
		public static final String NO_LOGIN = "1000";// 未登录状态码
		public static final String EXCEPTION_CODE = "1001";// 发生异常
		/********************system code end*****************/

		/********************account code begin*****************/
		/*public static final String RESPONSE_CODE_1101 = "1101";// 用户不存在
		public static final String RESPONSE_CODE_1102 = "1102";// 用户已存在
		public static final String RESPONSE_CODE_1103 = "1103";// 用户名为空
		public static final String RESPONSE_CODE_1104 = "1104";// 密码为空
		public static final String RESPONSE_CODE_1105 = "1105";// 验证码为空 */
		/********************account code end*****************/
	}

	// 通用的消息
	public abstract class CommonMessage {
		/********************system msg begin*****************/
		public static final String SUCCESS_MESSAGE = "请求数据成功!";// 获取数据失败
		public static final String NOT_DEFINE_MESSAGE = "没有定义的错误";
		public static final String NO_LOGIN_MESSAGE = "用户未登录!";// 用户未登录!
		/********************system msg end*****************/

		/********************account msg begin*****************/
		/*public static final String RESPONSE_MSG_1101 = "用户不存在";
		public static final String RESPONSE_MSG_1102 = "用户名已存在";
		public static final String RESPONSE_MSG_1103 = "用户名为空";
		public static final String RESPONSE_MSG_1104 = "密码为空";
		public static final String RESPONSE_MSG_1105 = "验证码为空"; */
		/********************account msg end*****************/

	}

}
