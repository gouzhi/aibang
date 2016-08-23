package com.aibang.framework.utils;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.aibang.framework.utils.code.RandomUtil;
import com.aibang.framework.utils.redis.SpringRedisCacheService;
 /**
  * 序列号生成器
  * @classname PrimaryGenerater    
  * @description 序列号生成器 
  * @author liuj    
  * @date 2016年6月23日
  */
@Component
public class PrimaryGenerater {
 
	@Autowired
	private SpringRedisCacheService redisService;
	
    private static final String SERIAL_NUMBER = "00000000"; // 流水号格式
    
    private static String sno=null;
    
    private static PrimaryGenerater primaryGenerater = null;
    
    private PrimaryGenerater() {
    	
    }
 
    /**
     * 取得PrimaryGenerater的单例实现
     *
     * @return
     */
    public static PrimaryGenerater getInstance() {
        if (primaryGenerater == null) {
            synchronized (PrimaryGenerater.class) {
                if (primaryGenerater == null) {
                    primaryGenerater = new PrimaryGenerater();
                }
            }
        }
        return primaryGenerater;
    }
 
    /**
     * 生成下一个编号
     */
    public synchronized String generaterNextNumber(String sno,String serialFormat) {
        String id = null;
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        
        DecimalFormat df=null;
        
        if(StringUtils.isBlank(serialFormat))
        {
        	   df = new DecimalFormat(SERIAL_NUMBER);
        }else
        {
        	   df = new DecimalFormat(serialFormat);
        }
       
        if (sno == null) {
            id = formatter.format(date) + df.format(1);
        } else { 
            String dateString=sno.substring(0, 8);
            if(formatter.format(date).compareTo(dateString)==0){
                id = formatter.format(date) + df.format(1 + Integer.parseInt(sno.substring(8)));	
            }else
            {
            	id = formatter.format(date) + df.format(1);
            }
        }
        return id;
    }

    /**
     * 默认分布式流水号生成
     * @methodname distributedNextNumber  
     * @discription 默认分布式流水号生成 
     * @return String 流水号
     * @author liuj
     * @date 2016年6月23日
     */
    public String distributedNextNumber()
    {
    	String snoObj = (String) redisService.get("dis_sno");
     
    	String sno=PrimaryGenerater.getInstance().generaterNextNumber(snoObj,null);
    	
    	redisService.set("dis_sno", sno);
    	
    	return sno;
    	
    }
    /**
     * 分布式流水号生成 
     * @methodname distributedNextNumber  
     * @discription 分布式流水号生成  
     * @param tableName    对应数据库表名
     * @param serialFormat 流水号序号格式 0000 代表4位数
     * @return String   流水号
     * @author liuj
     * @date 2016年6月23日
     */
    public String distributedNextNumber(String tableName,String serialFormat)
    {
    	String snoObj = (String) redisService.get("dis_sno_"+tableName);
        
    	String sno=PrimaryGenerater.getInstance().generaterNextNumber(snoObj,serialFormat);
    	
    	redisService.set("dis_sno_"+tableName, sno);
    	
    	return sno;
    }
    
    
    public static String generaterGlobalNextNumber()
    {
       return sno=PrimaryGenerater.getInstance().generaterNextNumber(sno,null);	
    }
     
    
    public static String generaterTimeSeries()
    {
    	String date = DateUtils.formatDate(new Date(), "yyMMddHHmmssSS")+RandomUtil.generateNumber(5);
    	return date;
    }
    
    private static DecimalFormat tkNoFormat = new DecimalFormat("00000000000");
    /**
     * 票号生成
     * @methodname generaterTicketNo  
     * @discription 票号生成 
     * @param ticketId 票记录Id
     * @return String 票号
     * @author liuj
     * @date 2016年6月29日
     */
    public static String generaterTicketNo(int ticketId)
    {
    	String date = tkNoFormat.format(ticketId)+RandomUtil.generateNumber(5);
    	return date;
    }
    
    
    public static void main(String[] args) {
    	for (int i = 0; i < 100; i++) {
    		System.out.println(PrimaryGenerater.generaterTicketNo(i));
		}
	}
}