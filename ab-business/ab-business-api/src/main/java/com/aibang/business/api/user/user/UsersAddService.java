package com.aibang.business.api.user.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUsersAdd;
import com.aibang.transfer.model.vo.AbUsersAddQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface UsersAddService {
    
	/** 
	 * 创建HjsUsersAdd
	 **/
	public AbUsersAdd saveObj(AbUsersAdd model);
	
	/** 
	 * 更新HjsUsersAdd
	 **/	
    public void update(AbUsersAdd model);
    
	/** 
	 * 删除HjsUsersAdd
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersAdd
     */
    public void remove(AbUsersAdd model);
    
	/** 
	 * 根据ID得到HjsUsersAdd
	 **/    
    public AbUsersAdd getById(Integer id);
    
 
	public List<AbUsersAdd> findAll();
	
	public AbUsersAdd saveOrUpdate(AbUsersAdd entity);
	 
	public boolean isUnique(AbUsersAdd entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersAdd
	 **/      
	public Page<?> findPage(AbUsersAddQuery query);
	/**
	 * 通过账户ID获取收货地址信息
	 * @param baseId 账户id
	 * @return HjsUsersAdd
	 * @author zhangyong
	 * @date 2015年11月4日
	 */
	public AbUsersAdd getAddressByBaseId(Integer baseId);
	
}
