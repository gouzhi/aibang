package com.aibang.business.api.system.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.transfer.model.vo.HjsUserQuery;
 
 
/**
 * 用户相关操作
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
public interface HjsUserService {
    
	/**
	 * 添加用户及相关信息
	 *  
	 * @param model
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsUser saveObj(HjsUser model);
	
	/**
	 * 修改用户及相关信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void update(HjsUser model);
    
	/**
	 * 通过ID删除用户数据
	 *  
	 * @param id void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void deleteById(Integer id);
    
    /**
     * 逻辑删除用户数据
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void remove(HjsUser model);
    /**   
     * 通过ID的到用户信息
     *  
     * @param id
     * @return HjsUser
     * @author zhangyong
     * @date 2015年8月25日
     */
    public HjsUser getById(Integer id);
    /**
     * 得到所有用户信息
     *  
     * @return List<HjsUser>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<HjsUser> findAll();
	/**
	 * 保存或修改用户信息
	 *  
	 * @param entity
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsUser saveOrUpdate(HjsUser entity);
	 /**
	  * 判断用户唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(HjsUser entity, String uniquePropertyNames);
	/**
	 * 分页查询用户数据
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public Page<?> findPage(HjsUserQuery query);
	/**
	 * 通过username获得用户数据
	 *  
	 * @param param
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsUser getByUsername(String param);
	/**		
	 * 登陆判断
	 *  
	 * @param query
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsUser getSysUserByNameAndPwd(HjsUserQuery query);
	/**	
	 * 批量删除用户数据（逻辑）
	 *  
	 * @param query void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void deleteAllU(HjsUserQuery query);
	
	/**
	 * 通过手机号获取客户信息
	 */
	public HjsUser getByPhone(String phone);
}
