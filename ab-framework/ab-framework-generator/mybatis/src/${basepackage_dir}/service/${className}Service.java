<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.business.api;

import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import com.hd.common.page.Page;
import ${basepackage}.vo.query.${className}Query;
import ${basepackage}.transfer.model.dto.${className};

<#include "/java_imports.include">

 
public interface ${className}Service {
    
	/** 
	 * 创建${className}
	 **/
	public ${className} saveObj(${className} model);
	
	/** 
	 * 更新${className}
	 **/	
    public void update(${className} model);
    
	/** 
	 * 删除${className}
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除${className}
     */
    public void remove(${className} model);
    
	/** 
	 * 根据ID得到${className}
	 **/    
    public ${className} getById(Integer id);
    
 
	public List<${className}> findAll();
	
	public List<${className}> findList(${className}Query query);
	
	public ${className} saveOrUpdate(${className} entity);
	 
	public boolean isUnique(${className} entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: ${className}
	 **/      
	public Page findPage(${className}Query query);
	
	<#list table.columns as column>
		<#if column.unique && !column.pk>
		public ${className} getBy${column.columnName}(${column.javaType} param);
		</#if>
	</#list>
}
