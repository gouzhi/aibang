package com.aibang.business.provider.base;

import java.io.Serializable; 

import com.aibang.framework.support.dao.BaseIbatis3Dao;
 

@SuppressWarnings("unchecked")
public abstract class ProviderServiceBase<E,PK extends Serializable> extends BaseIbatis3Dao<E,PK>  {

	/*@Autowired
	private RedisSessionDAO redisSessionDAO;
	
	public RedisSessionDAO getRedisSessionDAO() {
		return redisSessionDAO;
	}

	public void setRedisSessionDAO(RedisSessionDAO redisSessionDAO) {
		this.redisSessionDAO = redisSessionDAO;
	}
	
	public HjsSysUser getUserBySessionId(String sessionId)
	{
		return (HjsSysUser)redisSessionDAO.readSession(sessionId).getAttribute(Const.SESSION_USER);
	}
	   
	public Session getUserSession(String sessionId)
	{
		return redisSessionDAO.readSession(sessionId);
	}*/
}
