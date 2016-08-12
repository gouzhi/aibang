package com.cifex.web.daemon.listener;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

/**
 * Created by Administrator on 2016/3/7.
 * 监听登录消息，进行后续的业务处理
 */
public class LoginListener implements MessageListener {
    

    //当收到消息时，自动调用该方法。
    public void onMessage(Message message) {
        TextMessage tm = (TextMessage) message;
        String messageValue = "";
        try {
            messageValue = tm.getText();
            System.out.println("MessageListenerLog收到了文本消息：\t" + messageValue);
        } catch (JMSException e) {
            e.printStackTrace();
        }

        /**
         * 登录发红包处理
         */
        try {
            System.out.println("MessageListenerLog收到了文本消息：\t" + messageValue);

        }catch (Exception E){

        }
        /**
         * 登录发红包处理
         */
        try {
            System.out.println("MessageListenerLog收到了文本消息：\t" + messageValue);

        }catch (Exception E){

        }
    }
}
