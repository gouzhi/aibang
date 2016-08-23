package com.aibang.business.api.system.user;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUsersBlack;
import com.aibang.transfer.model.vo.HjsUsersBlackQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsUsersBlackService {
    
	/** 
	 * 创建HjsUsersBlack
	 **/
	public HjsUsersBlack saveObj(HjsUsersBlack model);
	
	/** 
	 * 更新HjsUsersBlack
	 **/	
    public void update(HjsUsersBlack model);
    
	/** 
	 * 删除HjsUsersBlack
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersBlack
     */
    public void remove(HjsUsersBlack model);
    
	/** 
	 * 根据ID得到HjsUsersBlack
	 **/    
    public HjsUsersBlack getById(Integer id);
    
 
	public List<HjsUsersBlack> findAll();
	
	public HjsUsersBlack saveOrUpdate(HjsUsersBlack entity);
	 
	public boolean isUnique(HjsUsersBlack entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersBlack
	 **/      
	public Page<?> findPage(HjsUsersBlackQuery query);
	
	/**
	 * 通过用户账户ID得到账户黑名单信息
	 * @param baseId
	 * @return HjsUsersBlack
	 * @author zhangyong
	 * @date 2015年11月2日
	 */
	public HjsUsersBlack getByBaseId(Integer baseId);
	/**
	 * 添加受限会员
	 * @param baseids 添加受限账户的ID
	 * @param charge 限制返佣 0不限1限制
	 * @param limiteTender 限制投资 0不限1限制
	 * @return HjsUsersBlack
	 * @author zhangyong
	 * @date 2015年11月3日
	 */
	public void addBlack(String baseids, Integer charge, Integer limiteTender, String ip, Integer optId);
	/**
	 * 修改受限会员
	 * @param ids 修改受限ID
	 * @param charge 限制返佣 0不限1限制
	 * @param limiteTender 限制投资 0不限1限制
	 * void
	 * @author zhangyong
	 * @date 2015年11月3日
	 */
	public void editBlack(String ids, Integer charge, Integer limiteTender, Integer optId);
	
	/**
	 * 删除受限会员
	 * @param ids void
	 * @author zhangyong
	 * @date 2015年11月3日
	 */
	public void delBlack(String ids);
}
