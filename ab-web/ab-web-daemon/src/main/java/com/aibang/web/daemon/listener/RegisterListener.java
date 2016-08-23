package com.aibang.web.daemon.listener;

import java.math.BigDecimal;
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
import com.aibang.transfer.model.dto.HjsUsersChannelRecord;
import com.aibang.transfer.model.dto.HjsUsersMessage;


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
            
            
            // 注册成功后像渠道用户记录表添加数据
            if(StringUtils.isNotBlank(chlid)){
            	addUserChannel(chlUserid, chlUsername, logo, chlid, userid, username ,phone);
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
	    	HjsUsersMessage hjsUsersMessage = new HjsUsersMessage(); 	
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

	

	/**
     * 注册成功后想渠道用户记录表添加数据
     * @param chlUserid 渠道方用户id
     * @param chlUsername 渠道方用户名
     * @param logo 渠道方活动标识
     * @param chlid 渠道方的唯一标识
     * @param userid 我方平台的用户id
     * @param username 我方平台的用户名
     */
    private void addUserChannel(String chlUserid,String chlUsername,String logo,String chlid,int userid,String username,String phone){
        try {
        	if(null != chlid){//如果有渠道方标识就添加记录
                HjsUsersChannelRecord hjsUsersChannelRecord = new HjsUsersChannelRecord();
                hjsUsersChannelRecord.setTypeNo(0);
                hjsUsersChannelRecord.setChlUserid(chlUserid);
                hjsUsersChannelRecord.setChlUsername(chlUsername);
                hjsUsersChannelRecord.setLogo(logo);
                hjsUsersChannelRecord.setChlid(Integer.parseInt(chlid));
                hjsUsersChannelRecord.setUserid(userid);
                if(StringUtils.isNotBlank(username)){
                	hjsUsersChannelRecord.setUsername(username);                	
                }else if(StringUtils.isNotBlank(phone)){
                	hjsUsersChannelRecord.setUsername(phone);            
                }
                hjsUsersChannelRecord.setCreateTime(new Date());
                hjsUsersChannelRecord.setTenderAccount(new BigDecimal(0));
                /*处理回调
	            String connTimeoutMills = Const.getProperty("ST_MAX_CONN_TIME");
	            String readTimeoutMills = Const.getProperty("ST_MAX_READ_TIME");
	            String attachments = "logo"+"="+logo+"&"+"uid"+"="+chlUserid+"&"+"e_uid"+"="+userid+"&"+"e_user"+"="+username;
	            logger.info("石头村用户注册请求开始");
	            logger.info("请求参数:"+attachments);
	            String msg = HttpAccessUtil.httpRequest(Const.getProperty("ST_REG_URL"), MimeTypes.HTML, "GET", Integer.parseInt(connTimeoutMills), Integer.parseInt(readTimeoutMills), attachments);
	            logger.info("返回参数:"+msg);
	            logger.info("石头村用户注册请求结束");*/            }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}        
    }


}
