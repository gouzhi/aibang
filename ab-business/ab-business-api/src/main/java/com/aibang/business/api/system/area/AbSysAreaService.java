package com.aibang.business.api.system.area;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysArea;
import com.aibang.transfer.model.vo.AbSysAreaQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface AbSysAreaService {
    
	/** 
	 * 创建HjsSysArea
	 **/
	public AbSysArea saveObj(AbSysArea model);
	
	/** 
	 * 更新HjsSysArea
	 **/	
    public void update(AbSysArea model);
    
	/** 
	 * 删除HjsSysArea
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsSysArea
     */
    public void remove(AbSysArea model);
    
	/** 
	 * 根据ID得到HjsSysArea
	 **/    
    public AbSysArea getById(Integer id);
    
 
	public List<AbSysArea> findAll();
	
	public AbSysArea saveOrUpdate(AbSysArea entity);
	 
	public boolean isUnique(AbSysArea entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsSysArea
	 **/      
	@SuppressWarnings("rawtypes")
	public Page findPage(AbSysAreaQuery query);
	
}
