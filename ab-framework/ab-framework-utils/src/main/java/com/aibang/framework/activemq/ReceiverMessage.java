package com.aibang.framework.activemq;

import java.io.Serializable;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.ObjectMessage;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.JmsException;
import org.springframework.jms.core.JmsTemplate;

/**
 * 消息队列接收
 * @classname ReceiverMessage    
 * @description 消息队列接收 
 * @author liuj    
 * @date 2016年3月29日
 */
public class ReceiverMessage {
	
	private JmsTemplate jmsTemplate;

    protected final Logger logger = LoggerFactory.getLogger(ReceiverMessage.class);
    
    
    
    /*public ReceiverMessage()
    {
    	ActiveMQConnectionFactory conn=new ActiveMQConnectionFactory("tcp://localhost:61616");
    	this.jmsTemplate=new JmsTemplate(conn);
    	this.jmsTemplate.setDefaultDestination(new ActiveMQQueue("queueLogin"));
    	this.jmsTemplate.setReceiveTimeout(10000);
    }*/
    
	/**
     * 获取默认消息队列消息
     * @methodname getTextMessage  
     * @discription 获取默认消息队列消息 
     * @return String 消息
     * @author liuj
     * @date 2016年3月29日
     */
    public String getTextMessage()
    {
		try {
			return((TextMessage)jmsTemplate.receive()).getText();
		} catch (JmsException | JMSException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return null;
	  
    }
    
    /**
     * 获取默认消息队列消息
     * @methodname getTextMessage  
     * @discription 获取默认消息队列消息 
     * @param destinationName 目标名称
     * @return String 消息
     * @author liuj
     * @date 2016年3月29日
     */
    public String getTextMessage(String destinationName)
    {
    	try {
			return((TextMessage)jmsTemplate.receive(destinationName)).getText();
		} catch (JmsException | JMSException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return null;
    }
    
    
    
    /**
     * 获取默认消息队列消息
     * @methodname getTextMessage  
     * @discription 获取默认消息队列消息 
     * @param destination 目标对象
     * @return String 消息
     * @author liuj
     * @date 2016年3月29日
     */
    public String getTextMessage(Destination destination)
    {
    	try {
			return((TextMessage)jmsTemplate.receive(destination)).getText();
		} catch (JmsException | JMSException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return null;
    }
    
    
    
    
    
    
    /**
     * 获取默认消息队列消息
     * @methodname getTextMessage  
     * @discription 获取默认消息队列消息 
     * @return String 消息对象
     * @author liuj
     * @date 2016年3月29日
     */
    public Serializable getObjectMessage()
    {
		try {
			return((ObjectMessage)jmsTemplate.receive()).getObject();
		} catch (JmsException | JMSException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return null;
	  
    }
    
    /**
     * 获取默认消息队列消息
     * @methodname getTextMessage  
     * @discription 获取默认消息队列消息 
     * @param destinationName 目标名称
     * @return String 消息对象
     * @author liuj
     * @date 2016年3月29日
     */
    public Serializable getObjectMessage(String destinationName)
    {
    	try {
			return((ObjectMessage)jmsTemplate.receive(destinationName)).getObject();
		} catch (JmsException | JMSException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return null;
    }
    
    /**
     * 获取默认消息队列消息
     * @methodname getTextMessage  
     * @discription 获取默认消息队列消息 
     * @param destination 目标对象
     * @return String 消息对象
     * @author liuj
     * @date 2016年3月29日
     */
    public Serializable getObjectMessage(Destination destination)
    {
    	try {
			return((ObjectMessage)jmsTemplate.receive(destination)).getObject();
		} catch (JmsException | JMSException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return null;
    }
}
