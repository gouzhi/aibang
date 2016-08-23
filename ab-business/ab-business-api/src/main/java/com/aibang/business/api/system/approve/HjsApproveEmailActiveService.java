package com.aibang.business.api.system.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveEmailActive;
import com.aibang.transfer.model.vo.HjsApproveEmailActiveQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsApproveEmailActiveService {
    
	/** 
	 * 创建HjsApproveEmailActive
	 **/
	public HjsApproveEmailActive saveObj(HjsApproveEmailActive model);
	
	/** 
	 * 更新HjsApproveEmailActive
	 **/	
    public void update(HjsApproveEmailActive model);
    
	/** 
	 * 删除HjsApproveEmailActive
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveEmailActive
     */
    public void remove(HjsApproveEmailActive model);
    
	/**
	 * 通过ID获得邮件认证信息   
	 * @param id
	 * @return HjsApproveEmailActive
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public HjsApproveEmailActive getById(Integer id);
    
 
	public List<HjsApproveEmailActive> findAll();
	
	public HjsApproveEmailActive saveOrUpdate(HjsApproveEmailActive entity);
	 
	public boolean isUnique(HjsApproveEmailActive entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveEmailActive
	 **/      
	public Page<?> findPage(HjsApproveEmailActiveQuery query);
	/**
	 * 审核邮件认证
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void auditEmail(HjsApproveEmailActive entity);
	
}
