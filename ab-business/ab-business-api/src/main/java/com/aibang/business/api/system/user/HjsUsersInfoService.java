package com.aibang.business.api.system.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUsersInfo;
import com.aibang.transfer.model.vo.HjsUsersInfoQuery;


 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsUsersInfoService {
    
	/**
	 * 新增会员信息
	 * @param model
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public HjsUsersInfo saveObj(HjsUsersInfo model);
	
	/**	
	 * 修改会员信息
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
    public void update(HjsUsersInfo model);
    
	/**
	 * 通过ID删除会员信息
	 * @param id void
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
    public void deleteById(Integer id);
    
    /**
     * 逻辑删除会员信息
     * @param model void
     * @author zhangyong
     * @date 2015年8月31日
     */
    public void remove(HjsUsersInfo model);
    /**
     * 通过ID得到会员信息   
     * @param id
     * @return HjsUsersInfo
     * @author zhangyong
     * @date 2015年8月31日
     */
    public HjsUsersInfo getById(Integer id);
    /**
     * 得到所有会员信息列表
     * @return List<HjsUsersInfo>
     * @author zhangyong
     * @date 2015年8月31日
     */
	public List<HjsUsersInfo> findAll();
	/**
	 * 添加或修改会员信息
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public HjsUsersInfo saveOrUpdate(HjsUsersInfo entity);
	 /**
	  * 会员信息唯一性判别
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月31日
	  */
	public boolean isUnique(HjsUsersInfo entity, String uniquePropertyNames);
	
	/**
	 * 分页获取会员信息     
	 * @param query
	 * @return Page<?>
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public Page<?> findPage(HjsUsersInfoQuery query);
	/**
	 * 后台得到用户信息列表（分页）
	 * @param query
	 * @return Page<?>
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public Page<?> getUsersInfo(HjsUsersInfoQuery query);
	/**
	 * 后台添加会员
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	public HjsUsersInfo addHjsUsersInfo(HjsUsersInfo entity);
	/**
	 * 后台加载修改会员信息
	 * @param query
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	public HjsUsersInfo getEditUsersInfo(HjsUsersInfoQuery query);
	/**
	 * 后台修改会员基本信息
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	public HjsUsersInfo editUsersInfo(HjsUsersInfo entity);
	/**
	 * 通过登录ID获取用户信息
	 * @param query
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	public HjsUsersInfo getUsersInfoByLoginId(Integer LoginId);
	/**
	 * 通过账户ID获取用户信息
	 * @param query
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	public List<HjsUsersInfo> getUsersInfoByUsername(String username);
	
	
}
