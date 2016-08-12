package com.cifex.framework.utils;

import org.apache.commons.lang.StringUtils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	public static final String YYYY_MM_DD = "yyyy-MM-dd";
    public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";
    public static final String YYYY_MM_DD_HH_MM = "yyyy-MM-dd HH:mm";
    public static final String YYYYMMDDHHMMSSSSS = "yyyyMMddhhmmssSSS";
    public static final String YYYYMMDD = "yyyyMMdd";
    public static final String HH_mm = "HH:mm";
    /** 日期形式(yyyy/MM/dd|HH:mm:ss) */
	public static final String DATE_FORMAT_RECORD_DATE = "yyyy/MM/dd|HH:mm:ss";
	
    public static final String YYYY_NIAN_MM_YUE_DD_RI_HH_MM = "yyyy年MM月dd日 HH:mm";
    public static final String YYYY_NIAN_MM_YUE_DD_RI= "yyyy年MM月dd日";

    
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");

	private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
	
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");

	private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
    private static final FieldPosition HELPER_POSITION = new FieldPosition(0);
	
	private final static Format dateFormat = new SimpleDateFormat("yyMMddHHmmssS");

	private static int seq = 0;

	private static final int MAX = 9999;
	
    public static long getDateDiffByDay(String time1, String time2) {
        long quot = 0;
        SimpleDateFormat ft = new SimpleDateFormat(YYYY_MM_DD);
        try {
            Date date1 = ft.parse(time1);
            Date date2 = ft.parse(time2);
            quot = date1.getTime() - date2.getTime();
            quot = quot / 1000 / 60 / 60 / 24;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return quot;
    }

    public static Date getDateDiffNDay(String strDate, int n) {
        SimpleDateFormat ft = new SimpleDateFormat(YYYY_MM_DD);
        try {
            Date dDate = ft.parse(strDate);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dDate);
            calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + n);
            return calendar.getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Date parseDate(String sDate, String pattern) {
        DateFormat format = new SimpleDateFormat(pattern);
        if (StringUtils.isNotEmpty(sDate)) {
            try {
                return format.parse(sDate);
            } catch (ParseException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                return null;
            }
        }
        return null;
    }

    public static Date parseDate(String sDate) {
        return parseDate(sDate, YYYY_MM_DD);
    }

    public static String formatDate(Date sDate) {
        return formatDate(sDate, YYYY_MM_DD);
    }

    public static String formatCnDate(Date sDate) {
        return formatDate(sDate, YYYY_NIAN_MM_YUE_DD_RI);
    }

    public static String formatDate(Date sDate, String formatStr) {
        if (sDate == null)
            return "";
        DateFormat format = new SimpleDateFormat(formatStr);
        return format.format(sDate);
    }

    public static String defaultFormatDate(Date sDate) {
        return formatDate(sDate, YYYY_MM_DD_HH_MM_SS);
    }

    public static boolean isValidDate(String dateStr, String pattern) {
        return formatDate(parseDate(dateStr, pattern), pattern).equals(dateStr);
    }
    
    public static Date addMinutes(Date date, int amount) {
        return add(date, Calendar.MINUTE, amount);
    }

    public static Date addDays(Date date, int amount) {
        return add(date, Calendar.DAY_OF_MONTH, amount);
    }

    public static Date add(Date date, int calendarField, int amount) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(calendarField, amount);
        return c.getTime();
    }

    public static String getStringCurrentDateTime() {
        Calendar rightNow = Calendar.getInstance();
        int intYear = rightNow.get(Calendar.YEAR);

        int intMonth = rightNow.get(Calendar.MONTH) + 1;
        String strMonth = null;
        if (intMonth < 10) {
            strMonth = "0" + intMonth;
        } else {
            strMonth = "" + intMonth;
        }

        int intDate = rightNow.get(Calendar.DATE);
        String strDate = null;
        if (intDate < 10) {
            strDate = "0" + intDate;
        } else {
            strDate = "" + intDate;
        }

        int intHour = rightNow.get(Calendar.HOUR_OF_DAY);
        String strHour = null;
        if (intHour < 10) {
            strHour = "0" + intHour;
        } else {
            strHour = "" + intHour;
        }

        int intMinute = rightNow.get(Calendar.MINUTE);
        String strMinute = null;
        if (intMinute < 10) {
            strMinute = "0" + intMinute;
        } else {
            strMinute = "" + intMinute;
        }

        int intSecond = rightNow.get(Calendar.SECOND);
        String strSecond = null;
        if (intSecond < 10) {
            strSecond = "0" + intSecond;
        } else {
            strSecond = "" + intSecond;
        }

        return intYear + "-" + strMonth + "-" + strDate + " " + strHour + ":"
                + strMinute + ":" + strSecond;

    }

    /**
     * 用来转换日期格式的公用方法
     *
     * @param dateString       需要转换的时间
     * @param sourceDateFormat 原时间格式
     * @param destDateFormat   目的时间格式
     * @return 转换后的时间
     * @throws java.text.ParseException 日期格式错误时抛出的异常
     */
    public static String convertDateFormat(String dateString,
                                           String sourceDateFormat, String destDateFormat) throws ParseException {
        DateFormat dfOne = new SimpleDateFormat(sourceDateFormat);
        DateFormat dfTwo = new SimpleDateFormat(destDateFormat);
        Date date = dfOne.parse(dateString);
        return dfTwo.format(date);
    }


    public static String getthreeMothDate() {
        Calendar time = Calendar.getInstance();
        time.add(Calendar.MONTH, 2);
        int dayNum = time.getActualMaximum(Calendar.DAY_OF_MONTH);
        time.set(Calendar.DATE ,dayNum);
        Date date=time.getTime();
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String format = df.format(date);
        return format;
    }

    public static String getDateToString(){
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }

    public static String getNextDateToString(){
        Date date = new Date(new Date().getTime()+1000 * 3600 * 24);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }
      
    public static Date getDateNotTime(Date date) {
        Calendar  cal=Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND,0);
        return cal.getTime();
    }
    
    public static boolean isBeforeEquals(Date date1, Date date2){
    	if(date1 == null || date2 == null){
    		return false;
    	}
    	Date d1 = DateUtils.parseDate(DateUtils.formatDate(date1));
    	Date d2 = DateUtils.parseDate(DateUtils.formatDate(date2));
    	return !d1.after(d2);
    }
    
    public static boolean isAfterEquals(Date date1, Date date2){
    	if(date1 == null || date2 == null){
    		return false;
    	}
    	Date d1 = DateUtils.parseDate(DateUtils.formatDate(date1));
    	Date d2 = DateUtils.parseDate(DateUtils.formatDate(date2));
    	return !d1.before(d2);
    }
    
    public static String formatTimeToDHMS(Long ms) {  
        Integer mi =  60;  
        Integer hh = mi * 60;  
        Integer dd = hh * 24;  
        Long day = ms / dd;  
        Long hour = (ms - day * dd) / hh;  
        Long minute = (ms - day * dd - hour * hh) / mi;  
        Long second = (ms - day * dd - hour * hh - minute * mi);  
          
        StringBuffer sb = new StringBuffer();  
        if(day > 0) {  
            sb.append(day+"天");  
        }  
        if(hour >= 0) {  
            sb.append(hour+"小时");  
        }  
        if(minute >= 0) {  
            sb.append(minute+"分");  
        }  
        if(second >= 0) {  
            sb.append(second+"秒");  
        }  
        
        return sb.toString();  
    }  
    public static void main(String[] args){
        SimpleDateFormat   sdf=new   SimpleDateFormat("yyyy-MM-dd"); 
        System.out.println(sdf.format(new Timestamp(System.currentTimeMillis()))); 
    }
    /**
     * 查询开始日期转化 
     * @methodname getStartDate  
     * @discription yyyy-MM-dd 转 yyyy-MM-dd 00:00:00
     * @param startDate
     * @return Date
     * @author liuj
     * @date 2015年8月26日
     */
    public static Date getStartDate(Date startDate)
    {
    	String lastLoginStart=DateUtils.formatDate(startDate);
    	if(lastLoginStart != null && !"".equals(lastLoginStart)){
    		lastLoginStart = lastLoginStart+" 00:00:00";
    		 return DateUtils.parseDate(lastLoginStart,DateUtils.YYYY_MM_DD_HH_MM_SS);
    	}
    	return null;
    }
    /**
     * 查询结束日期转化 
     * @methodname getStartDate  
     * @discription yyyy-MM-dd 转 yyyy-MM-dd 23:59:59 
     * @param startDate
     * @return Date
     * @author liuj
     * @date 2015年8月26日
     */
    public static Date getEndDate(Date endDate)
    {
    	String lastLoginEnd=DateUtils.formatDate(endDate);
    	if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
    		lastLoginEnd = lastLoginEnd+" 23:59:59";
    		 return DateUtils.parseDate(lastLoginEnd,DateUtils.YYYY_MM_DD_HH_MM_SS);
    	}
    	return null;
    }
	//-----------------------
    /** 
     * 默认日期格式 
     */  
    public static String DEFAULT_FORMAT = "yyyy-MM-dd";  
	
	/**
	 * 获取YYYY格式
	 * 
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * 
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * 
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * 
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}

	/**
	* @Title: compareDate
	* @Description: (日期比较，如果s>=e 返回true 否则返回false)
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author luguosui
	 */
	public static boolean compareDate(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() >=fomatDate(e).getTime();
	}
	
	/**
	 * 比较两个日期
	 * @param sdate 开始时间
	 * @param edate 结束时间
	 * @return boolean 开始时间》=结束时间 返回true，否则返回false
	 * @author zeng.fangfang
	 * @date 2015年8月31日
	 */
	public static boolean compareDate(Date sdate,Date edate){
		if (null == sdate || null == edate) {
			return false;
		}
		return sdate.getTime() >= edate.getTime();
	}

	/**
	 * 格式化日期
	 * 
	 * @return
	 */
	public static Date fomatDate(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 校验日期是否合法
	 * 
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	  /**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date beginDate = null;
        Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
    /**
     * <li>功能描述：时间相减得到分钟
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author ZHANG YONG
     */
    public static long getHourSub(String beginDateStr,String endDateStr){
        long day=0;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date beginDate = null;
        Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(60*1000);
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
    
    /**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        
        return dateStr;
    }
    
    /**
     * @methodname dateToString  
     * @discription 格式化日期 
     * @param date 时间
     * @param format 格式
     * @return String
     * @author zeng.fangfang
     * @date 2015年8月12日
     */
    public static String dateToString(Date date,String format){  
        SimpleDateFormat f = new SimpleDateFormat(format);  
        String sDate = f.format(date);  
        return sDate;  
    }   

    /**
     * @methodname dateToString  
     * @discription 格式化日期 
     * @param date 时间
     * @return String
     * @author zeng.fangfang
     * @date 2015年8月12日
     */
    public static String dateToString(Date date){  
        SimpleDateFormat f = new SimpleDateFormat(DEFAULT_FORMAT);  
        String sDate = f.format(date);  
        return sDate;  
    }   
    /**
     * 将时间转化为yyyyMMdd格式
     */
    public static String dateToYMD(Date date) {
    	 return formatDate(date, YYYYMMDD);
    }
    


	/**
	 * 时间格式生成序列
	 * 
	 * @return String
	 */
	public static synchronized String generateSequenceNo() {

		Calendar rightNow = Calendar.getInstance();

		StringBuffer sb = new StringBuffer();

		dateFormat.format(rightNow.getTime(), sb, HELPER_POSITION);

		if (seq == MAX) {
			seq = 0;
		} else {
			seq++;
		}

		return sb.toString();
	}
    /**
     *比较两个日期
     * @param s
     * @param e
     * @return 如果-2:参数有误;如果1:大于;如果0:相等;如果-1:小于
     */
    public static int compareTwoDate(String s, String e) {
        if(fomatDate(s)==null||fomatDate(e)==null){
            return -2;
        }
        if(fomatDate(s).getTime() >fomatDate(e).getTime()){
            return 1;
        }else if(fomatDate(s).getTime() ==fomatDate(e).getTime()){
            return 0;
        }else {
            return -1;
        }

    }
    
    /**
     * unix时间戳转java日期 
     */
    public static Date unixTimeStamp2Date(String timestampStr)
    {
    	Long timestamp = Long.parseLong(timestampStr)*1000;
    	return new Date(timestamp);
    }
    /**
     * unix时间戳转java日期 
     */
    public static Date unixTimeStamp2Date(int timestampInt)
    {
    	return new Date((long)timestampInt*1000);
    }
    /**
     * unix时间戳转java日期 
     */
    public static Date unixTimeStamp2Date(Long timestampLong)
    {
    	return new Date(timestampLong*1000);
    }
    /**
     * 获取当前时间-min分钟的时间
     * @param min
     * @return
     */
    public static Date getMinusDate(int min) {
        long curren = System.currentTimeMillis();
        curren -= min * 60 * 1000;
        Date date = new Date(curren);
        return date;
    }

    /**
     *获得两个时间相差毫秒数
     * @param s1
     * @param s2
     * @return
     */
    public static  long getTwoDateSubMilSeconds(Date s1,Date s2){
        return (s2.getTime()- s1.getTime());
    }
}
