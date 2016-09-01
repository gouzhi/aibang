package com.aibang.business.api.system.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveSms;
import com.aibang.transfer.model.vo.AbApproveSmsQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface AbApproveSmsService {
    
	/** 
	 * 创建HjsApproveSms
	 **/
	public AbApproveSms saveObj(AbApproveSms model);
	
	/** 
	 * 更新HjsApproveSms
	 **/	
    public void update(AbApproveSms model);
    
	/** 
	 * 删除HjsApproveSms
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveSms
     */
    public void remove(AbApproveSms model);
    
	/**   
	 * 根据ID获得手机认证信息
	 * @param id
	 * @return HjsApproveSms
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public AbApproveSms getById(Integer id);
    
 
	public List<AbApproveSms> findAll();
	
	public AbApproveSms saveOrUpdate(AbApproveSms entity);
	 
	public boolean isUnique(AbApproveSms entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveSms
	 **/      
	public Page<?> findPage(AbApproveSmsQuery query);
	/**
	 * 审核手机认证
	 * @param entity
	 * @return HjsApproveSms
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void auditSms(AbApproveSms entity);
	
}
