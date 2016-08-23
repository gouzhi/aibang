
/**   
 * @Title: ICache.java 
 * @Package com.cifex.admin.controller.cache 
 * @Description: (用一句话描述该文件做什么) 
 * @author liuj    
 * @date 2015-8-7 上午11:04:26 
 * Copyright CIFEX Corporation 2015   
 * 版权所有  
 * @version V1.0   
*/ 

package com.aibang.framework.memcache;

import java.util.Map;

import com.aibang.framework.exception.BaseException;



/** 
 * @ClassName: ICache
 * @Description: (这里用一句话描述这个类的作用)
 * @author liuj
 * @date 2015-8-7 上午11:04:26
 * Copyright CIFEX Corporation 2015  
 */

public interface ICache{

	/**
	 * @Title: get
	 * @Description: 通过key获取对应的缓存 
	 * @param key
	 * @return Object 不存在则返回null
	 * @throws CacheException 
	 */
	public Object get(final String key) throws BaseException;
	
	/**
	 * @Title: get
	 * @Description: 通过key获取对应的缓存 
	 * @param key
	 * @param readTimeOut 读取超时时间
	 * @return Object 不存在则返回null
	 * @throws CacheException 
	 */
	public Object get(final String key, long readTimeOut)throws BaseException;
	
	/**
	 * @Title: get
	 * @Description: 使用泛型，根据key获取缓存 
	 * @param key
	 * @param clazz
	 * @return T 不存在则返回null
	 * @throws CacheException 
	 */
	public <T> T get(final String key, Class<T> clazz)throws BaseException;
	
	/**
	 * @Title: gets
	 * @Description: 一次获取多个缓存 
	 * @param keyList 需要获取的key数组
	 * @return Map<String,Object> 返回map，map中的key与传入的key一一对应，map.get("xx")，不存在则返回null
	 * @throws CacheException
	 */
	public <T> Map<String, Object> gets(final String... keyList)throws BaseException;
	
	/**
	 * @Title: put
	 * @Description: 放入缓存 
	 * @param key 缓存的key
	 * @param obj 缓存对象
	 * @throws CacheException void
	 */
	public void put(final String key, Object obj)throws BaseException;
	
	/**
	 * @Title: put
	 * @Description: 放入缓存 
	 * @param key 缓存的key
	 * @param obj 缓存对象
	 * @param expSecond 到期时间，单位分钟。可以长达30天。30天之后，看作是一个确切的日期，UNIX时间戳。
	 * @throws CacheException void
	 */
	public void put(final String key, Object obj, int expSecond)throws BaseException;
	
	/**
	 * @Title: remove
	 * @Description: 删除一个缓存 
	 * @param key 缓存的key
	 * @return boolean true删除成功，false删除失败
	 * @throws CacheException 
	 */
	public boolean remove(final String key)throws BaseException;
	
	/**
	 * @Title: clear
	 * @Description: 清空所有的缓存 这个是最大的 是清空整个memcache的缓存 
	 * @return boolean true删除成功，false删除失败
	 * @throws CacheException 
	 */
	public boolean clear()throws BaseException;
	
	/**
	 * @Title: setDefaultCacheTime
	 * @Description: 设置系统缓存时间 
	 * @param minute 单位分钟
	 */
	public void setDefaultCacheTime(int minute);
	
	/**
	 * @Title: getDefaultCacheTime
	 * @Description: 获取系统缓存时间 
	 * @return long  单位分钟
	 */
	public long getDefaultCacheTime();

	 

}
