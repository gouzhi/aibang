package com.cifex.business.api.user.user;

import java.util.List;

import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersLog;
import com.cifex.transfer.model.vo.HjsUsersLogQuery;
 
 
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
	public HjsUsersLog saveObj(HjsUsersLog model);
	
	/** 
	 * 更新HjsUsersLog
	 **/	
    public void update(HjsUsersLog model);
    
	/** 
	 * 删除HjsUsersLog
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersLog
     */
    public void remove(HjsUsersLog model);
    
	/** 
	 * 根据ID得到HjsUsersLog
	 **/    
    public HjsUsersLog getById(Integer id);
    
 
	public List<HjsUsersLog> findAll();
	
	public HjsUsersLog saveOrUpdate(HjsUsersLog entity);
	 
	public boolean isUnique(HjsUsersLog entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersLog
	 **/      
	public Page<?> findPage(HjsUsersLogQuery query);
	
}
