package com.aibang.business.api.user.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUsersAdd;
import com.aibang.transfer.model.vo.HjsUsersAddQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface UsersAddService {
    
	/** 
	 * 创建HjsUsersAdd
	 **/
	public HjsUsersAdd saveObj(HjsUsersAdd model);
	
	/** 
	 * 更新HjsUsersAdd
	 **/	
    public void update(HjsUsersAdd model);
    
	/** 
	 * 删除HjsUsersAdd
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersAdd
     */
    public void remove(HjsUsersAdd model);
    
	/** 
	 * 根据ID得到HjsUsersAdd
	 **/    
    public HjsUsersAdd getById(Integer id);
    
 
	public List<HjsUsersAdd> findAll();
	
	public HjsUsersAdd saveOrUpdate(HjsUsersAdd entity);
	 
	public boolean isUnique(HjsUsersAdd entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersAdd
	 **/      
	public Page<?> findPage(HjsUsersAddQuery query);
	/**
	 * 通过账户ID获取收货地址信息
	 * @param baseId 账户id
	 * @return HjsUsersAdd
	 * @author zhangyong
	 * @date 2015年11月4日
	 */
	public HjsUsersAdd getAddressByBaseId(Integer baseId);
	
}
