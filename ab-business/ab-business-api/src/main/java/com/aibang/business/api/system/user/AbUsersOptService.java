package com.aibang.business.api.system.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUsersOpt;
import com.aibang.transfer.model.vo.AbUsersOptQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface AbUsersOptService {
    
	/** 
	 * 创建HjsUsersOpt
	 **/
	public AbUsersOpt saveObj(AbUsersOpt model);
	
	/** 
	 * 更新HjsUsersOpt
	 **/	
    public void update(AbUsersOpt model);
    
	/** 
	 * 删除HjsUsersOpt
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersOpt
     */
    public void remove(AbUsersOpt model);
    
	/** 
	 * 根据ID得到HjsUsersOpt
	 **/    
    public AbUsersOpt getById(Integer id);
    
 
	public List<AbUsersOpt> findAll();
	
	public AbUsersOpt saveOrUpdate(AbUsersOpt entity);
	 
	public boolean isUnique(AbUsersOpt entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersOpt
	 **/      
	public Page<?> findPage(AbUsersOptQuery query);
	/**
	 * 通过登录ID获取用户相关数据(企业信息，账户信息，企业用户信息)
	 * @param id
	 * @return HjsUsersOpt
	 * @author zhangyong
	 * @date 2015年8月26日
	 */
	public AbUsersOpt getUsersOptByLoginId(Integer id);
	/**
	 * 添加用户及相关信息
	 *  
	 * @param model
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbUsersOpt saveUser(AbUsersOpt model);
	/**
     * 逻辑删除用户数据
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void removeUser(AbUsersOpt model);
    /**	
	 * 批量删除用户数据（逻辑）
	 *  
	 * @param query void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void deleteAllU(AbUsersOptQuery query);
	
	/**
	 * 获得用户信息通过userid
	 * @methodname getByUserId  
	 * @discription TODO 
	 * @param userid
	 * @return HjsUsersOpt
	 * @author yinzhigang
	 * @date 2016年4月27日
	 */
	public AbUsersOpt getByUserId(Integer userid);
}
