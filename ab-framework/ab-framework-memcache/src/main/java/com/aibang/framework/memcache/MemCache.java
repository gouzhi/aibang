package com.aibang.framework.memcache;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeoutException;

import net.rubyeye.xmemcached.GetsResponse;
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.aibang.framework.exception.BaseException;
 
/**
* @ClassName: CacheService
* @Description: 
* @author liuj
* @date 2015-8-7 上午11:26:37
* Copyright CIFEX Corporation 2015
 */
@Component("memCache")
public class MemCache  implements ICache{

	protected Integer DEFAULT_CACHE_TIME = 1;//单位分钟；系统默认的缓存时间 单位 分钟
	
	private static Logger LOGGER = LoggerFactory.getLogger(MemCache.class);
	
	@Autowired
	protected MemcachedClient memcachedClient;

	@Override
	public Object get(String key) throws BaseException {
		Assert.notNull(key);
		try {
			return memcachedClient.get(key);
		} catch (TimeoutException e) {
			LOGGER.error(e.getMessage());
            throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		} catch (InterruptedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		} catch (MemcachedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		}
	}

	@Override
	public Object get(String key, long readTimeOut) throws BaseException {
		Assert.notNull(key);
		try {
			return memcachedClient.get(key,readTimeOut);
		} catch (TimeoutException e) {
			LOGGER.error(e.getMessage());
            throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		} catch (InterruptedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		} catch (MemcachedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T get(String key, Class<T> clazz) throws BaseException {
		return (T) get(key);
	}

	@Override
	public <T> Map<String, Object> gets(String... keyList)
			throws BaseException {
		Assert.notNull(keyList);
		try {
			Map<String, GetsResponse<T>> map = memcachedClient.gets(Arrays.asList(keyList));
			Map<String, Object> returnMap = new HashMap<String, Object>();
			for (Map.Entry<String, GetsResponse<T>> entry : map.entrySet()) {
				returnMap.put(entry.getKey(), entry.getValue().getValue());
			}
			return returnMap;
		} catch (TimeoutException e) {
			LOGGER.error(e.getMessage());
            throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		} catch (InterruptedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		} catch (MemcachedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"获取缓存错误",e);
		}
	}

	@Override
	public void put(String key, Object obj) throws BaseException {
		put(key, obj, DEFAULT_CACHE_TIME);
	}

	@Override
	public void put(String key, Object obj, int expSecond)
			throws BaseException {
		if (null != obj) {
			try {
				if (null == memcachedClient.get(key)) {
					memcachedClient.add(key, 60*expSecond, obj);
				}else{
					memcachedClient.replace(key, 60*expSecond, obj);
				}
			} catch (TimeoutException e) {
				LOGGER.error(e.getMessage());
                throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"添加缓存错误",e);
			} catch (InterruptedException e) {
				LOGGER.error(e.getMessage());
				throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"添加缓存错误",e);
			} catch (MemcachedException e) {
				LOGGER.error(e.getMessage());
				throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"添加缓存错误",e);
			}
		}
	}

	@Override
	public boolean remove(String key) throws BaseException {
		try {
			memcachedClient.delete(key);
			return true;
		} catch (TimeoutException e) {
			LOGGER.error(e.getMessage());
            throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"移除缓存错误",e);
		} catch (InterruptedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"移除缓存错误",e);
		} catch (MemcachedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"移除缓存错误",e);
		}
	}

	@Override
	public boolean clear() throws BaseException {
		try {
			memcachedClient.flushAll();
			return true;
		} catch (TimeoutException e) {
			LOGGER.error(e.getMessage());
            throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"清理缓存错误",e);
		} catch (InterruptedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"清理缓存错误",e);
		} catch (MemcachedException e) {
			LOGGER.error(e.getMessage());
			throw new BaseException(BaseException.MEMCACHED_EXCEPTION,"清理缓存错误",e);
		}
	}

	@Override
	public void setDefaultCacheTime(int minute) {
		this.DEFAULT_CACHE_TIME = minute;
	}

	@Override
	public long getDefaultCacheTime() {
		return this.DEFAULT_CACHE_TIME;
	}
}