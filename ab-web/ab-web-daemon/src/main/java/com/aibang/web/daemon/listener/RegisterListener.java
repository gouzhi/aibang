package com.aibang.web.daemon.listener;

import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aibang.business.api.user.message.UsersMessageService;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.JSONUtils;
import com.aibang.framework.utils.MessageStrUtil;
import com.aibang.transfer.model.dto.AbUsersMessage;


/**
 * Created by Administrator on 2016/3/7.
 * 监听注册消息，进行后续的业务处理
 */
public class RegisterListener  implements MessageListener {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@Resource(name = "usersMessageService")
	private UsersMessageService usersMessageService;
	 
    //当收到消息时，自动调用该方法。
    public void onMessage(Message message) {
        TextMessage tm = (TextMessage) message;
        String messageValue = "";
        String chlUserid;//渠道方用户id
        String chlUsername;//渠道方用户名
        String logo;//渠道方活动标识
        String chlid;//渠道方唯一标识
        Integer userid;//我方平台用户id
        String username;//我方平台用户名
        Integer inviteUserid;//邀请人ID
        String ip;//ip地址
        Integer userloginid;//用户登录id
        String phone;//我方用户手机号
        try {
            messageValue = tm.getText();
            HashMap<String,Object> paras = JSONUtils.toHashMap(messageValue);
            //String[] paras = messageValue.split("&");
            chlUserid = (String)paras.get("chlUserid");
            chlUsername = (String)paras.get("chlUsername");
            logo = (String)paras.get("logo");
            chlid = (String)paras.get("chlid");
            userid = (Integer)paras.get("userid");
            username = (String)paras.get("username");
            inviteUserid = (Integer)paras.get("inviteUserid");
            ip = (String)paras.get("ip");
            userloginid = (Integer)paras.get("userloginid");
            phone = (String)paras.get("phone");
            //注册后发送站消息
            if(StringUtils.isNotBlank(username)){
            	//发送站内信
            	sendRegisterSiteMsg(userloginid,username);
            }
            
            //注册后发送短信
            if(StringUtils.isNotBlank(username)){
            	sendRegisterMessage(username);//注册的时候username就是用户的手机号
            }
            
            
   
            //注册后送积分

            //注册后其他的处理
            
            System.out.println("注册监听器收到了消息"+messageValue);
        } catch (JMSException e) {
            e.printStackTrace();
            logger.error(e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error(e.getMessage());
		}

    }
    
    /**
     * 注册成功发送短信
     * @methodname sendRegisterMessage  
     * @discription TODO 
     * @param username void
     * @author yinzhigang
     * @date 2016年4月21日
     */
    private void sendRegisterMessage(String username) {
		
    	try {
    		String registerId = Const.getProperty("USER_REGIDTER_MSG_ID"); //获得注册短信模版id
    		String bonus = Const.getProperty("OPEN_PAY_BONUS"); //获得注册红包金额
    		
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
	}

	/**
     * 用户注册后发送站内信
     * @methodname sendLetter  
     * @discription TODO 
     * @param userloginid void
     * @author yinzhigang
     * @date 2016年4月18日
     */
    private void sendRegisterSiteMsg(Integer userloginid,String username) {
		try { 
			//发送站内信
			//得到注册发送站内信的模版
			String registerSiteMsg=MessageStrUtil.getMessage("user.register.site.msg");
	    	AbUsersMessage hjsUsersMessage = new AbUsersMessage(); 	
	    	hjsUsersMessage.setType(1);
	    	hjsUsersMessage.setStatus(2);
	    	hjsUsersMessage.setSendLoginid(0);
	    	hjsUsersMessage.setReceiveLoginid(userloginid);
	    	hjsUsersMessage.setMsgTitle("注册成功");
	    	hjsUsersMessage.setContents(registerSiteMsg);
	    	hjsUsersMessage.setParentId(0);
	    	hjsUsersMessage.setCreateTime(new Date());
	    	usersMessageService.saveObj(hjsUsersMessage);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
	}

	

	

}
