package com.cifex.business.api.system.user;

import java.util.List;

import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersOptLog;
import com.cifex.transfer.model.vo.HjsUsersOptLogQuery;

/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsUsersOptLogService {
    
	/** 
	 * 创建HjsUsersOptLog
	 **/
	public HjsUsersOptLog saveObj(HjsUsersOptLog model);
	
	/** 
	 * 更新HjsUsersOptLog
	 **/	
    public void update(HjsUsersOptLog model);
    
	/** 
	 * 删除HjsUsersOptLog
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersOptLog
     */
    public void remove(HjsUsersOptLog model);
    
	/** 
	 * 根据ID得到HjsUsersOptLog
	 **/    
    public HjsUsersOptLog getById(Integer id);
    
 
	public List<HjsUsersOptLog> findAll();
	
	public HjsUsersOptLog saveOrUpdate(HjsUsersOptLog entity);
	 
	public boolean isUnique(HjsUsersOptLog entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersOptLog
	 **/      
	public Page<?> findPage(HjsUsersOptLogQuery query);
	
}
