package com.aibang.framework.support.dao;

import java.io.Serializable;
import java.util.List;
/**
 * @classname EntityDao    
 * @description 数据访问基类 
 * @author liuj    
 * @date 2015年8月17日
 */
public interface EntityDao <E,PK extends Serializable>{

	public Object getById(PK id);
	
	public void deleteById(PK id);
	
	public void remove(E entity);
	
	public void save(E entity);
	
	public void update(E entity);
	
	public boolean isUnique(E entity, String uniquePropertyNames);
	
	public void flush();
	
	public List<E> findAll();
	
}
