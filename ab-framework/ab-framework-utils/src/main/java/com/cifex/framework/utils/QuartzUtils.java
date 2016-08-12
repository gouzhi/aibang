package com.cifex.framework.utils;
import java.text.ParseException;
import java.util.Map;

import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 任务调度
 * @classname QuartzUtils    
 * @description 任务调度
 * @author liuj    
 * @date 2016年4月22日
 */
public class QuartzUtils {
	Logger log = LoggerFactory.getLogger(this.getClass());

	private Scheduler scheduler = null;
	
	public static final String DATA_KEY = "STATE_DATA";
	
	public QuartzUtils (){
		try {
			scheduler = new StdSchedulerFactory().getScheduler();
			log.info("初始化调度器 ");
		} catch (SchedulerException ex) {
			log.error("初始化调度器=> [失败]:" + ex.getLocalizedMessage());
		}
	}	
	/**
	 * 添加作业
	 * @methodname addJob  
	 * @discription 添加作业 
	 * @param name 名
	 * @param group 组
	 * @param clazz 作业实现类
	 * @param cronExpression
	 * @throws ParseException void
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void addJob(String name, String group, Class<? extends Job> clazz,String cronExpression) throws ParseException {					
		try {		
			//构造任务
			JobDetail job =  new JobDetail(name, group,clazz);
			//构造任务触发器
			Trigger trg=new CronTrigger(name, group,cronExpression);
			
			//将作业添加到调度器
			scheduler.scheduleJob(job, trg);
			log.info("创建作业=> [作业名称：" + name + " 作业组：" + group + "] ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("创建作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
		}
	}
	 
	/**
	 * 添加作业
	 * @methodname addJob  
	 * @discription 添加作业 
	 * @param name 名
	 * @param group 组
	 * @param clazz 作业实现类
	 * @param map 参数
	 * @param cronExpression
	 * @throws ParseException void
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void addJob(String name, String group, Class<? extends Job> clazz,Map map,String cronExpression) throws ParseException {					
		try {		
			//构造任务
			JobDetail job =  new JobDetail(name, group,clazz);
			
			job.getJobDataMap().putAll(map);
			//构造任务触发器
			Trigger trg=new CronTrigger(name, group,cronExpression);
			
			//将作业添加到调度器
			scheduler.scheduleJob(job, trg);
			log.info("创建作业=> [作业名称：" + name + " 作业组：" + group + "] ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("创建作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
		}
	}
	
	
	/**
	 * 删除作业
	 * @methodname removeJob  
	 * @discription 删除作业 
	 * @param name 名
	 * @param group 组   void 
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void removeJob(String name, String group){
		try {
			scheduler.pauseTrigger(name, group);//停止触发器  
			scheduler.unscheduleJob(name, group);//移除触发器
			scheduler.deleteJob(name, group);//删除作业
			log.info("删除作业=> [作业名称：" + name + " 作业组：" + group + "] ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("删除作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
		}
	}
	/**
	 * 暂停作业
	 * @methodname pauseJob  
	 * @discription 暂停作业 
	 * @param name  名
	 * @param group 组 void 
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void pauseJob(String name, String group){
		try {
			scheduler.pauseJob(name, group);
			log.info("暂停作业=> [作业名称：" + name + " 作业组：" + group + "] ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("暂停作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
		}
	}
	/**
	 * 恢复作业
	 * @methodname resumeJob  
	 * @discription 恢复作业 
	 * @param name  名
	 * @param group 组 void
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void resumeJob(String name, String group){
		try {
			scheduler.resumeJob(name, group);
			log.info("恢复作业=> [作业名称：" + name + " 作业组：" + group + "] ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("恢复作业=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
		}		
	}
	/**
	 * 修改作业
	 * @methodname modifyTime  
	 * @discription 修改作业 
	 * @param name 名
	 * @param group 组
	 * @param cronExpression cron表达式
	 * @throws ParseException void
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void modifyTime(String name, String group, String cronExpression) throws ParseException{		
		try {
			//构造任务触发器
			Trigger trg=new CronTrigger(name, group,name, group,cronExpression);		
			scheduler.rescheduleJob(name, group, trg);
			log.info("修改作业触发时间=> [作业名称：" + name + " 作业组：" + group + "] ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("修改作业触发时间=> [作业名称：" + name + " 作业组：" + group + "]=> [失败]");
		}
	}
 
	/**
	 * 启动调度
	 * @methodname start  
	 * @discription 启动调度  void
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void start() {
		try {
			scheduler.start();
			log.info("启动调度器 ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("启动调度器=> [失败]");
		}
	}
    
	/**
	 * 停止调度
	 * @methodname shutdown  
	 * @discription 停止调度  void
	 * @author liuj
	 * @date 2016年4月22日
	 */
	public void shutdown() {
		try {
			scheduler.shutdown();
			log.info("停止调度器 ");
		} catch (SchedulerException e) {
			e.printStackTrace();
			log.error("停止调度器=> [失败]");
		}
	}
}
