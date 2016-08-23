package com.aibang.web.task.quratz;
 
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Timer;

import javax.annotation.PostConstruct;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.aibang.framework.utils.DateUtils;

@Component
public class TaskJobFactory {
	private Logger logger=LoggerFactory.getLogger(TaskJobFactory.class);
	
	
	    //初始化定时计划
		@PostConstruct
		public void initJob() throws Exception{
			//从数据库获得应该流标的投资项目
			logger.info("initJob is start ...");
			//找出招标中的项目且结束时间已经小于当前时间满足的项目，然后将其上线
			List<String> contentList =new ArrayList<>();
			contentList.add("a1");
			contentList.add("a2");
			contentList.add("a3");
			long time=1;
			for (String i : contentList) {
				//开启一个线程，在内存中执行定时流标120/119/118/117/93/92
		        Timer timer = new Timer();
		        Date d=new Date();
		        time+=1000l;
		        long delay=time;
		        delay = delay<0?1000l:delay;
		        timer.schedule(new TaskJob(i,"service1"), delay);
                //new Thread(new TaskJob(i,bondPackageInvestManager)).start();
			}
		}
		 
		public void addJob(String inv,String service){ 
			logger.info("initJob is start ...");
	        Timer timer = new Timer();
	        Date d=new Date();
	        long delay=-1;
	        delay = delay<0?5000l:delay;
	        timer.schedule(new TaskJob(inv,service), delay);
 			//new Thread(new TaskJob(inv,"service1")).start();
		}
		
		
		

		/**
		 * 创建一个定时任务
		 * @throws Exception 
		 */
		public void createScheduler(String  content,String service) throws Exception{
			if(content==null||service==null){
				return ;
			}
			logger.info("------- Initializing ------------");
			logger.info("create schedule factory.");
			
			StdSchedulerFactory sf = new StdSchedulerFactory();
			//Properties props = new Properties();
			//props.put("org.quartz.scheduler.instanceName", content);
			//props.put("org.quartz.threadPool.threadCount", "100");
			//sf.initialize(props);
			//Scheduler s = sf.getScheduler();
			Scheduler s = sf.getScheduler();
			
			System.out.println(s);
			logger.info("------- Initializing complete----");
			
			
			Date runTime = DateUtils.add(new Date(), Calendar.MILLISECOND, 5000);
			logger.info("------- create job----");
			JobDetail job = new JobDetail("job"+content,  "group1", TaskJob.class);
					
			job.getJobDataMap().put(TaskJob.SEQUENCE, "SEQUENCE");
			job.getJobDataMap().put(TaskJob.STARTDATE, DateUtils.formatDate(new Date(),DateUtils.DATE_FORMAT_RECORD_DATE));
			job.getJobDataMap().put(TaskJob.ENDDATE, DateUtils.formatDate(runTime,DateUtils.DATE_FORMAT_RECORD_DATE));
			job.getJobDataMap().put(TaskJob.NAME, content);
			job.getJobDataMap().put(TaskJob.MANAGER, service);
			logger.info("------- create trigger----");
			SimpleTrigger trigger = new SimpleTrigger("trigger"+content, "group1", runTime);
			
			
			trigger.setRepeatInterval(10);
			
			trigger.setRepeatCount(1);
			
			// 注册并进行调度  
	        s.scheduleJob(job, trigger);
	        // 启动调度器  
	        //s.standby();
	        s.start();
	        logger.info("结束运行。。。。");
	        //s.shutdown(true);
		}
		
		
		
		public static void main(String[] args) {
			for (int i = 0; i <1000; i++) {
				TaskJobFactory taskJobFactory=new TaskJobFactory();
				try {
					taskJobFactory.createScheduler("内容"+i, "服务"+i);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		/*	try {
				taskJobFactory.createScheduler("内容", "服务");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} */
		}
		
		
		
}
