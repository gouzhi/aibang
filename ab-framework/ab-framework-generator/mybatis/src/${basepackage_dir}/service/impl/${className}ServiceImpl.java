<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.business.provider;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.framework.exception.BaseException;
import com.cifex.framework.support.dao.Query;
import com.hd.common.page.Page;
import com.hd.dao.BaseIbatis3Dao;

import ${basepackage}.vo.query.${className}Query;
import ${basepackage}.transfer.model.dto.${className};
import ${basepackage}.business.api; 
<#include "/java_imports.include">

 
@Service("${classNameLower}Service")
@SuppressWarnings({"unchecked"})
public class ${className}ServiceImpl  extends ProviderServiceBase<${className},${table.idColumn.javaType}> implements ${className}Service {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "${className}";
	}
	
	public ${className} saveOrUpdate(${className} entity) {
		if(entity.get${table.idColumn.columnName}() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(${className}Query query) {
		try {
		    return pageQuery("${className}.findPage",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"查询列表页错误",e.getCause());
		}
	}
	
	
	public List<${className}> findList(${className}Query query)
	{
		try {
		    return findListByQeury("${className}.findList",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"查询集合错误",e.getCause());
		}
	}
	
	public ${className} saveObj(${className} model)
	{
		
		try {
			save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"添加错误错误",e.getCause());
		}
		return model;
	}
	
	
	<#list table.columns as column>
	<#if column.unique && !column.pk>
	public ${className} getBy${column.columnName}(${column.javaType} v) {
		return (${className})getSqlSessionTemplate().selectOne("${className}.getBy${column.columnName}",v);
	}	
	</#if>
	</#list>
	 
}
