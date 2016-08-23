package com.aibang.business.api.user.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveSms;
import com.aibang.transfer.model.vo.HjsApproveSmsQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface ApproveSmsService {
    
	/** 
	 * 创建HjsApproveSms
	 **/
	public HjsApproveSms saveObj(HjsApproveSms model);
	
	/** 
	 * 更新HjsApproveSms
	 **/	
    public void update(HjsApproveSms model);
    
	/** 
	 * 删除HjsApproveSms
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveSms
     */
    public void remove(HjsApproveSms model);
    
	/**   
	 * 根据ID获得手机认证信息
	 * @param id
	 * @return HjsApproveSms
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public HjsApproveSms getById(Integer id);
    
 
	public List<HjsApproveSms> findAll();
	
	public HjsApproveSms saveOrUpdate(HjsApproveSms entity);
	 
	public boolean isUnique(HjsApproveSms entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveSms
	 **/      
	public Page<?> findPage(HjsApproveSmsQuery query);
	/**
	 * 审核手机认证
	 * @param entity
	 * @return HjsApproveSms
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void auditSms(HjsApproveSms entity);
	/**
	 * 前台手机验证
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月18日
	 */
	public void activateSms(HjsApproveSms entity);
	
}
