package com.cifex.business.api.system.user;

import java.util.List;

import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersOpt;
import com.cifex.transfer.model.vo.HjsUsersOptQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsUsersOptService {
    
	/** 
	 * 创建HjsUsersOpt
	 **/
	public HjsUsersOpt saveObj(HjsUsersOpt model);
	
	/** 
	 * 更新HjsUsersOpt
	 **/	
    public void update(HjsUsersOpt model);
    
	/** 
	 * 删除HjsUsersOpt
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersOpt
     */
    public void remove(HjsUsersOpt model);
    
	/** 
	 * 根据ID得到HjsUsersOpt
	 **/    
    public HjsUsersOpt getById(Integer id);
    
 
	public List<HjsUsersOpt> findAll();
	
	public HjsUsersOpt saveOrUpdate(HjsUsersOpt entity);
	 
	public boolean isUnique(HjsUsersOpt entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersOpt
	 **/      
	public Page<?> findPage(HjsUsersOptQuery query);
	/**
	 * 通过登录ID获取用户相关数据(企业信息，账户信息，企业用户信息)
	 * @param id
	 * @return HjsUsersOpt
	 * @author zhangyong
	 * @date 2015年8月26日
	 */
	public HjsUsersOpt getUsersOptByLoginId(Integer id);
	/**
	 * 添加用户及相关信息
	 *  
	 * @param model
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsUsersOpt saveUser(HjsUsersOpt model);
	/**
     * 逻辑删除用户数据
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void removeUser(HjsUsersOpt model);
    /**	
	 * 批量删除用户数据（逻辑）
	 *  
	 * @param query void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void deleteAllU(HjsUsersOptQuery query);
	
	/**
	 * 获得用户信息通过userid
	 * @methodname getByUserId  
	 * @discription TODO 
	 * @param userid
	 * @return HjsUsersOpt
	 * @author yinzhigang
	 * @date 2016年4月27日
	 */
	public HjsUsersOpt getByUserId(Integer userid);
}
