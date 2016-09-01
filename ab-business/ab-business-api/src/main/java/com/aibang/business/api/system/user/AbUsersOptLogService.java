package com.aibang.business.api.system.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUsersOptLog;
import com.aibang.transfer.model.vo.AbUsersOptLogQuery;

/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface AbUsersOptLogService {
    
	/** 
	 * 创建HjsUsersOptLog
	 **/
	public AbUsersOptLog saveObj(AbUsersOptLog model);
	
	/** 
	 * 更新HjsUsersOptLog
	 **/	
    public void update(AbUsersOptLog model);
    
	/** 
	 * 删除HjsUsersOptLog
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersOptLog
     */
    public void remove(AbUsersOptLog model);
    
	/** 
	 * 根据ID得到HjsUsersOptLog
	 **/    
    public AbUsersOptLog getById(Integer id);
    
 
	public List<AbUsersOptLog> findAll();
	
	public AbUsersOptLog saveOrUpdate(AbUsersOptLog entity);
	 
	public boolean isUnique(AbUsersOptLog entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersOptLog
	 **/      
	public Page<?> findPage(AbUsersOptLogQuery query);
	
}
