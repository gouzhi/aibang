package com.aibang.business.api.user.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUsersLog;
import com.aibang.transfer.model.vo.AbUsersLogQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface UsersLogService {
    
	/**
	 * 保存会员日志
	 * @param model
	 * @return HjsUsersLog
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	public AbUsersLog saveObj(AbUsersLog model);
	
	/** 
	 * 更新HjsUsersLog
	 **/	
    public void update(AbUsersLog model);
    
	/** 
	 * 删除HjsUsersLog
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersLog
     */
    public void remove(AbUsersLog model);
    
	/** 
	 * 根据ID得到HjsUsersLog
	 **/    
    public AbUsersLog getById(Integer id);
    
 
	public List<AbUsersLog> findAll();
	
	public AbUsersLog saveOrUpdate(AbUsersLog entity);
	 
	public boolean isUnique(AbUsersLog entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersLog
	 **/      
	public Page<?> findPage(AbUsersLogQuery query);
	
}
