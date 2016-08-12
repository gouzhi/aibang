package com.cifex.framework.activemq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.jms.listener.DefaultMessageListenerContainer;

public class BaseMessageListener implements MessageListener{
	@Override
	public void onMessage(Message message) {
		  TextMessage tm = (TextMessage) message;
		 try {
			System.out.println(tm.getText());
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		ActiveMQConnectionFactory conn=new ActiveMQConnectionFactory("tcp://localhost:61616");
		DefaultMessageListenerContainer listion=new DefaultMessageListenerContainer();
		listion.setMessageListener(new BaseMessageListener());
		listion.setDestination(new ActiveMQQueue("queueLogin"));
		listion.setConnectionFactory(conn); 
		listion.initialize();
		listion.start();
		
		/*try {
			Thread.sleep(60000);
		} catch (InterruptedException e) {
			 
			e.printStackTrace();
		}*/
	}
}
