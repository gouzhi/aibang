package com.aibang.business.api.user.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveEmailActive;
import com.aibang.transfer.model.vo.AbApproveEmailActiveQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface ApproveEmailActiveService {
    
	/** 
	 * 创建HjsApproveEmailActive
	 **/
	public AbApproveEmailActive saveObj(AbApproveEmailActive model);
	
	/** 
	 * 更新HjsApproveEmailActive
	 **/	
    public void update(AbApproveEmailActive model);
    
	/** 
	 * 删除HjsApproveEmailActive
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveEmailActive
     */
    public void remove(AbApproveEmailActive model);
    
	/**
	 * 通过ID获得邮件认证信息   
	 * @param id
	 * @return HjsApproveEmailActive
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public AbApproveEmailActive getById(Integer id);
    
 
	public List<AbApproveEmailActive> findAll();
	
	public AbApproveEmailActive saveOrUpdate(AbApproveEmailActive entity);
	 
	public boolean isUnique(AbApproveEmailActive entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveEmailActive
	 **/      
	public Page<?> findPage(AbApproveEmailActiveQuery query);
	/**
	 * 激活邮件
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void activateEmail(AbApproveEmailActive entity);
	/**
	 * 审核邮件认证
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void auditEmail(AbApproveEmailActive entity);
}
