package com.cifex.business.api.system.user;

import java.util.List;

import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersVouch;
import com.cifex.transfer.model.vo.HjsUsersVouchQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsUsersVouchService {
    
	/** 
	 * 创建HjsUsersVouch
	 **/
	public HjsUsersVouch saveObj(HjsUsersVouch model);
	
	/** 
	 * 更新HjsUsersVouch
	 **/	
    public void update(HjsUsersVouch model);
    
	/** 
	 * 删除HjsUsersVouch
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersVouch
     */
    public void remove(HjsUsersVouch model);
    
	/** 
	 * 根据ID得到HjsUsersVouch
	 **/    
    public HjsUsersVouch getById(Integer id);
    
 
	public List<HjsUsersVouch> findAll();
	
	public HjsUsersVouch saveOrUpdate(HjsUsersVouch entity);
	 
	public boolean isUnique(HjsUsersVouch entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersVouch
	 **/      
	public Page<?> findPage(HjsUsersVouchQuery query);
	
}
