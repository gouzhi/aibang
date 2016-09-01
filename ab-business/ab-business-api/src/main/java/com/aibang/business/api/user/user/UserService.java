package com.aibang.business.api.user.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.vo.AbUserQuery;
 
 
/**
 * 用户相关操作
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
public interface UserService {
    
	/**
	 * 添加用户及相关信息
	 *  
	 * @param model
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbUser saveObj(AbUser model);
	
	/**
	 * 修改用户及相关信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void update(AbUser model);
    
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
    public void remove(AbUser model);
    /**   
     * 通过ID的到用户信息
     *  
     * @param id
     * @return HjsUser
     * @author zhangyong
     * @date 2015年8月25日
     */
    public AbUser getById(Integer id);
    /**
     * 得到所有用户信息
     *  
     * @return List<HjsUser>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<AbUser> findAll();
	/**
	 * 保存或修改用户信息
	 *  
	 * @param entity
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbUser saveOrUpdate(AbUser entity);
	 /**
	  * 判断用户唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(AbUser entity, String uniquePropertyNames);
	/**
	 * 分页查询用户数据
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public Page<?> findPage(AbUserQuery query);
	/**
	 * 通过username获得用户数据
	 *  
	 * @param param
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbUser getByUsername(String param);
	/**		
	 * 登陆判断
	 *  
	 * @param query
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbUser getSysUserByNameAndPwd(AbUserQuery query);
	/**	
	 * 批量删除用户数据（逻辑）
	 *  
	 * @param query void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void deleteAllU(AbUserQuery query);
	/**
	 * 前台修改会员登录密码
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月17日
	 */
	public void updateCustomerPass(AbUser entity);
	/**
	 * 前台通过用户名/手机/邮箱查询会员
	 * @param name
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	public AbUser getByName(String name);

		
}
