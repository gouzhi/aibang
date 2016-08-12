package com.cifex.web.move.site.secCode;

import java.io.Serializable;

/**
 * Created by zhaoyu on 2015/9/17.
 * 验证码实体类
 * code 验证码值
 * time 发送时间
 */
public class SmsCode implements Serializable,Cloneable{
    /**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -2211835571764223978L;
	private String code;
    private long time;

    public SmsCode(String code, long time) {
        this.code = code;
        this.time = time;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }
}
