package com.aibang.web.task.quratz;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 

public class TaskJob  extends java.util.TimerTask implements Job,Runnable{

	private Logger logger = LoggerFactory.getLogger(TaskJob.class);
	
	private String content;
	
	private String service;

	public TaskJob() {
	}
	
	public TaskJob(String content,String service) {
		this.content= content;
		this.service = service;
	}
	
	// 静态变量
	public static final String SEQUENCE = "sequence";
	public static final String STARTDATE = "startDate";
	public static final String ENDDATE = "endDate";
	public static final String NAME = "name";
	public static final String MANAGER = "manager";
	
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		logger.info("faildInvestment is start ...");
		// job 的名字
		String jobName = context.getJobDetail().getKey().getName();
		// 任务执行的时间
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy 年 MM 月 dd 日  HH 时 mm 分 ss 秒");
		String jobRunTime = dateFormat.format(Calendar.getInstance().getTime());
		logger.info("jobName:" + jobName + "\n\texecuteTime:" + jobRunTime);
		// 获取 JobDataMap , 并从中取出参数
		JobDataMap data = context.getJobDetail().getJobDataMap();
		String sequence = data.getString(SEQUENCE);
		String startDate = data.getString(STARTDATE);
		String endDate = data.getString(ENDDATE);
		String name = data.getString(NAME);
		String manager = (String) data.get(MANAGER);
		logger.info("ID："+sequence+";名称："+name+";开始时间："+startDate+";结束时间："+endDate+";");
		System.out.println("execute.............service:"+manager+"content"+name);
		logger.info("faildInvestment is end.");
	}

	public void run() {
		try {
			System.out.println("run.............service:"+service+"content"+content);
		} catch (Exception e) {
			logger.error("create faild scheduler is error.",e);
		}
	}

}
