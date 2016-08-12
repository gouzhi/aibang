package com.cifex.framework.activemq;
import java.io.Serializable;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.ScheduledMessage;
import org.apache.activemq.command.ActiveMQQueue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.JmsException;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import com.cifex.framework.common.model.ResultModel;
import com.sun.istack.FinalArrayList;

/**
 * Created by jiwenku on 2016/3/7.
 * 延时消息 需要配置 broker schedulerSupport="true" 如果 false 则延时不生效
 * activemq 发送消息
 */
public class SendMessage {
    private JmsTemplate jmsTemplate;

    protected final Logger logger = LoggerFactory.getLogger(SendMessage.class);
    
     
    /* public SendMessage()
    {
    	ActiveMQConnectionFactory conn=new ActiveMQConnectionFactory("tcp://localhost:61616");
    	this.jmsTemplate=new JmsTemplate(conn);
    	this.jmsTemplate.setDefaultDestination(new ActiveMQQueue("queueLogin"));
    	this.jmsTemplate.setReceiveTimeout(10000);
    }*/
    
    /**
     * 向默认队列发送消息
     * @methodname sendMessage  
     * @discription 向默认队列发送消息 
     * @param msg void 消息
     * @author liuj
     * @date 2016年3月29日
     */
    public void sendMessage(final String msg) {
        try {
            String destination =  jmsTemplate.getDefaultDestination().toString();
            logger.info("向队列" + destination + "发送了消息------------" + msg);
            jmsTemplate.send(new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                    return session.createTextMessage(msg);
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    
   
    /**
     * 向默认队列发送消息
     * @methodname sendMessage  
     * @discription 向默认队列发送消息 
     * @param msg 消息
     * @param delay 延时毫秒数
     * @param period 重复间隔毫秒数
     * @param repeat void 重复次数
     * @author liuj
     * @date 2016年3月30日
     */
    public void sendMessage(final String msg,final long delay,final long period,final int repeat) {
        try {
            String destination =  jmsTemplate.getDefaultDestination().toString();
            logger.info("向队列" + destination + "发送了消息------------" + msg);
            jmsTemplate.send(new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                	 //MessageProducer producer = session.createProducer(new ActiveMQQueue("queueLogin"));
                     TextMessage message = session.createTextMessage(msg);
                     message.setLongProperty(ScheduledMessage.AMQ_SCHEDULED_DELAY, delay);
                     message.setLongProperty(ScheduledMessage.AMQ_SCHEDULED_PERIOD, period);
                     message.setIntProperty(ScheduledMessage.AMQ_SCHEDULED_REPEAT, repeat);
                     //producer.send(message);
                     return message;
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    
    
   /**
    * 清空所有延时消息
    * @methodname clearAllScheduledMessage  
    * @discription 清空所有延时消息  void
    * @author liuj
    * @date 2016年3月30日
    */
    public void clearAllScheduledMessage() {
        try {
            String destination =  jmsTemplate.getDefaultDestination().toString();
            logger.info("清空了所有Scheduled" + destination + "的消息");
            jmsTemplate.send(new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                     TextMessage message = session.createTextMessage();
                     message.setStringProperty(ScheduledMessage.AMQ_SCHEDULER_ACTION, ScheduledMessage.AMQ_SCHEDULER_ACTION_REMOVEALL);
                     return message;
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }
   
    
    /**
     * 向指定队列发送消息
     * @methodname sendMessage  
     * @discription 向指定队列发送消息 
     * @param destinationName 目标名称
     * @param msg void 消息内容
     * @author liuj
     * @date 2016年3月29日
     */
    public void sendMessage(String destinationName,final String msg)
    {
    	logger.info("向队列" + destinationName + "发送了消息------------" + msg);
    	try {
    		jmsTemplate.send(destinationName,  new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                    return session.createTextMessage(msg);
                }
            });
		} catch (Exception e) {
			  e.printStackTrace();
		}
    }
    
   
    /**
     * 向指定队列发送消息
     * @methodname sendMessage  
     * @discription 向指定队列发送消息 
     * @param destination 目标对象
     * @param msg void 消息内容
     * @author liuj
     * @date 2016年3月29日
     */
    public void sendMessage(Destination destination, final String msg) {
        try {
        	logger.info("向队列" + destination.toString() + "发送了消息------------" + msg);
            jmsTemplate.send(destination, new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                    return session.createTextMessage(msg);
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        } 
    }
    
    
    
    /**
     * 向指定队列发送消息
     * @methodname sendMessage  
     * @discription 向指定队列发送消息 
     * @param object void 消息对象
     * @author liuj
     * @date 2016年3月29日
     */
    public void sendMessage(final Serializable object) {
        try {
            String destination =  jmsTemplate.getDefaultDestination().toString();
            logger.info("向队列" + destination + "发送了消息------------" + object.toString());
            jmsTemplate.send(new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                    return session.createObjectMessage(object);
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    /**
     * 向指定队列发送消息
     * @methodname sendMessage  
     * @discription 向指定队列发送消息 
     * @param destinationName 目标名称
     * @param object void     消息对象
     * @author liuj
     * @date 2016年3月29日
     */
    public void sendMessage(String destinationName,final Serializable object)
    {
    	logger.info("向队列" + destinationName + "发送了消息------------" + object.toString());
    	try {
    		jmsTemplate.send(destinationName,  new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                    return session.createObjectMessage(object);
                }
            });
		} catch (Exception e) {
			  e.printStackTrace();
		}
    }
    
    /**
     * 向指定队列发送消息
     * @methodname sendMessage  
     * @discription 向指定队列发送消息 
     * @param destination     目标对象
     * @param object void     消息对象
     * @author liuj
     * @date 2016年3月29日
     */
    public void sendMessage(Destination destination,final Serializable object) {
        try {
        	logger.info("向队列" + destination.toString() + "发送了消息------------" + object);
            jmsTemplate.send(destination, new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                    return session.createObjectMessage(object);
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        } 
    }

    /**
     * 向指定的topic发布消息
     * @methodname publish  
     * @discription 向指定的topic发布消息 
     * @param topic  目标对象
     * @param msg void 消息
     * @author liuj
     * @date 2016年3月29日
     */
    public void publish(final Destination topic, final String msg) {
        try {
            jmsTemplate.send(topic, new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                	logger.info("topic name 是" + topic.toString()+ "，发布消息内容为:\t" + msg);
                    return session.createTextMessage(msg);
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

    
    
    
    public static void main(String[] args) throws InterruptedException {
    	SendMessage sendMessage=new SendMessage();
    	 //sendMessage.sendMessage("hhhaa");
       /* for (int i = 0; i < 3; i++) {
       	 sendMessage.sendMessage("hhhaa"+i,6000*i,0,0);	
    	} */ 
        
        sendMessage.clearAllScheduledMessage();
    	
   /* 	String ss="";
    	ReceiverMessage receiverMessage=new ReceiverMessage();
   while (ss!=null) {
	   
	   ss=receiverMessage.getTextMessage();
    	System.out.println(ss);
	
}*/
    		
		 
    	/*ReceiverMessage receiverMessage=new ReceiverMessage();
    	System.out.println(receiverMessage.getTextMessage());
			Thread.sleep(7000);
			
	    	System.out.println(receiverMessage.getTextMessage());*/
    	
    
     
	}
}
