package com.cifex.business.api.system.area;

import java.util.List;

import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsSysArea;
import com.cifex.transfer.model.vo.HjsSysAreaQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsSysAreaService {
    
	/** 
	 * 创建HjsSysArea
	 **/
	public HjsSysArea saveObj(HjsSysArea model);
	
	/** 
	 * 更新HjsSysArea
	 **/	
    public void update(HjsSysArea model);
    
	/** 
	 * 删除HjsSysArea
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsSysArea
     */
    public void remove(HjsSysArea model);
    
	/** 
	 * 根据ID得到HjsSysArea
	 **/    
    public HjsSysArea getById(Integer id);
    
 
	public List<HjsSysArea> findAll();
	
	public HjsSysArea saveOrUpdate(HjsSysArea entity);
	 
	public boolean isUnique(HjsSysArea entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsSysArea
	 **/      
	@SuppressWarnings("rawtypes")
	public Page findPage(HjsSysAreaQuery query);
	
}
