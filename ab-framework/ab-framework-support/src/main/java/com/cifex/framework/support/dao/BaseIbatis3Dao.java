package com.cifex.framework.support.dao;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.util.ReflectionUtils;

import com.cifex.framework.utils.beanutils.PropertyUtils;
import com.cifex.framework.utils.page.Page;
import com.cifex.framework.utils.page.PageRequest;
 

public abstract class BaseIbatis3Dao<E,PK extends Serializable> extends DaoSupport implements EntityDao<E,PK> {
	  protected final Log log = LogFactory.getLog(getClass());
	    
	    private SqlSessionFactory sqlSessionFactory;
	 
	    private SqlSessionTemplate sqlSessionTemplate;
	    
		protected void checkDaoConfig() throws IllegalArgumentException {
			Assert.notNull(sqlSessionFactory,"sqlSessionFactory must be not null");
		}
		public SqlSessionFactory getSqlSessionFactory() {
			return sqlSessionFactory;
		}

	    public SqlSessionTemplate getSqlSessionTemplate() {
	    	return sqlSessionTemplate;
	    }
	    
		@Autowired
		public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
			this.sqlSessionFactory = sqlSessionFactory;
			this.sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
		}

	    @SuppressWarnings("unchecked")
		public E getById(PK primaryKey) {
	        Object object = getSqlSessionTemplate().selectOne(getFindByPrimaryKeyStatement(), primaryKey);
	        return (E)object;
	    }
	    
	   /* public Object getById(PK primaryKey) {
	        Object object = getSqlSessionTemplate().selectOne(getFindByPrimaryKeyStatement(), primaryKey);
	        return object;
	    }*/
	    
		@SuppressWarnings("unused")
		public void deleteById(PK id) {
			int affectCount = getSqlSessionTemplate().delete(getDeleteStatement(), id);
		}
		
	    @SuppressWarnings("unused")
		public void save(E entity) {
			prepareObjectForSaveOrUpdate(entity);
			int affectCount = getSqlSessionTemplate().insert(getInsertStatement(), entity);    	
	    }
	    
		@SuppressWarnings("unused")
		public void update(E entity) {
			prepareObjectForSaveOrUpdate(entity);
			int affectCount = getSqlSessionTemplate().update(getUpdateStatement(), entity);
		}
		
		@SuppressWarnings("unused")
		public void remove(E entity) {
			prepareObjectForSaveOrUpdate(entity);
			int affectCount = getSqlSessionTemplate().update(getRemoveStatement(), entity);
		}
		
		/**
		 * 用于子类覆盖,在insert,update之前调用
		 * @param o
		 */
	    protected void prepareObjectForSaveOrUpdate(E o) {
	    }

	    public String getIbatisMapperNamesapce() {
	        throw new RuntimeException("not yet implement");
	    }
	    
	    public String getFindByPrimaryKeyStatement() {
	        return getIbatisMapperNamesapce()+".getById";
	    }

	    public String getInsertStatement() {
	        return getIbatisMapperNamesapce()+".insert";
	    }

	    public String getUpdateStatement() {
	    	return getIbatisMapperNamesapce()+".update";
	    }

	    public String getDeleteStatement() {
	    	return getIbatisMapperNamesapce()+".delete";
	    }
	    
	    public String getRemoveStatement() {
	    	return getIbatisMapperNamesapce()+".remove";
	    }

	    public String getFindAllStatement()
	    {
	    	return getIbatisMapperNamesapce()+".findAll";
	    }
	    
	    public String getCountStatementForPaging(String statementName) {
			return statementName +".count";
		}
	    
		@SuppressWarnings("rawtypes")
		protected Page pageQuery(String statementName, PageRequest pageRequest) {
			return pageQuery(getSqlSessionTemplate(),statementName,getCountStatementForPaging(statementName),pageRequest);
		}
		
		@SuppressWarnings({ "unchecked", "rawtypes" })
		public static Page pageQuery(SqlSessionTemplate sqlSessionTemplate,String statementName,String countStatementName, PageRequest pageRequest) {
			
			Number totalCount = (Number) sqlSessionTemplate.selectOne(countStatementName,pageRequest);
			if(totalCount == null || totalCount.longValue() <= 0) {
				return new Page(pageRequest,0);
			}
			
			Page page = new Page(pageRequest,totalCount.intValue());
			
			//其它分页参数,用于不喜欢或是因为兼容性而不使用方言(Dialect)的分页用户使用. 与getSqlMapClientTemplate().queryForList(statementName, parameterObject)配合使用
			Map filters = new HashMap();
			/*filters.put("offset", page.getFirstResult());
			filters.put("pageSize", page.getPageSize()); */
			filters.put("lastRows", page.getFirstResult() + page.getPageSize());
			filters.put("sortColumns", pageRequest.getSortColumns());
			
			Map parameterObject = PropertyUtils.describe(pageRequest);
			filters.putAll(parameterObject);
			
			List list = sqlSessionTemplate.selectList(statementName, filters,page.getFirstResult(),page.getPageSize());
			//List list = sqlSessionTemplate.selectList(statementName, filters, new RowBounds(page.getFirstResult(),page.getPageSize()));
			//List list = sqlSessionTemplate.selectList(statementName, filters);
			page.setResult(list);
			return page;
		}

		@SuppressWarnings({ "rawtypes", "unchecked" })
		protected  List<E>findListByQeury(String statementName, PageRequest pageRequest){
			Map filters = new HashMap();
			if(pageRequest!=null){
			Map parameterObject = PropertyUtils.describe(pageRequest);
			filters.putAll(parameterObject);
			}
			List<?> list=getSqlSessionTemplate().selectList(statementName, filters);
			if(list == null)
			{
				throw new IllegalArgumentException("'result' must be not null");
				
			}
			return (List<E>)list;
		}
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public List findAll() {
			return getSqlSessionTemplate().selectList(getFindAllStatement(),null);
		}

		public boolean isUnique(E entity, String uniquePropertyNames) {
			
			  Map<String, Object> map=new HashMap<String,Object>();
			  String[] nameList = uniquePropertyNames.split(",");
              try {
                      // 循环加入唯一列
                      for (int i = 0; i < nameList.length; i++) {
                    	  map.put(nameList[i], PropertyUtils.getProperty(entity, nameList[i]));
                      }
              } catch (Exception e) {
                      ReflectionUtils.handleReflectionException(e);
              }
              Number totalCount = (Number)getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce()+".findPage.count", map);
          	  if(totalCount == null || totalCount.longValue() <= 0) {
          		  return false;
          	  }
          	  
          	  return true;
		}
		
		
		
		public void flush() {
			//ignore
		}
		
		 public static class SqlSessionTemplate {
			SqlSessionFactory sqlSessionFactory;
			
			public SqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
				this.sqlSessionFactory = sqlSessionFactory;
			}

			public Object execute(SqlSessionCallback action)  {
				SqlSession session = null;
				try {
					session = sqlSessionFactory.openSession();
					Object result = action.doInSession(session);
					return result;
				}finally {
					if(session != null) session.close();
				}
			}
			
			public Object selectOne(final String statement,final Object parameter) {
				return execute(new SqlSessionCallback() {
					public Object doInSession(SqlSession session) {
						return session.selectOne(statement, parameter);
					}
				});
			}
			
			public List selectList(final String statement,final Object parameter,final int offset,final int limit) {
				return (List)execute(new SqlSessionCallback() {
					public Object doInSession(SqlSession session) {
						return session.selectList(statement, parameter, new RowBounds(offset,limit));
					}
				});
			}

			public List selectList(final String statement,final Object parameter) {
				return (List)execute(new SqlSessionCallback() {
					public Object doInSession(SqlSession session) {
						return session.selectList(statement, parameter);
					}
				});
			}
			
			public int delete(final String statement,final Object parameter) {
				return (Integer)execute(new SqlSessionCallback() {
					public Object doInSession(SqlSession session) {
						return session.delete(statement, parameter);
					}
				});
			}
			
			public int update(final String statement,final Object parameter) {
				return (Integer)execute(new SqlSessionCallback() {
					public Object doInSession(SqlSession session) {
						return session.update(statement, parameter);
					}
				});
			}
			
			public int insert(final String statement,final Object parameter) {
				return (Integer)execute(new SqlSessionCallback() {
					public Object doInSession(SqlSession session) {
						return session.insert(statement, parameter);
					}
				});
			}
		} 
		
		public static interface SqlSessionCallback {
			
			public Object doInSession(SqlSession session);
			
		} 
	
	
	
	
}
