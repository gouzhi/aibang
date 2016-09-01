package com.aibang.business.api.system.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveRealname;
import com.aibang.transfer.model.vo.AbApproveRealnameQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface AbApproveRealnameService {
    
	/** 
	 * 创建HjsApproveRealname
	 **/
	public AbApproveRealname saveObj(AbApproveRealname model);
	
	/** 
	 * 更新HjsApproveRealname
	 **/	
    public void update(AbApproveRealname model);
    
	/** 
	 * 删除HjsApproveRealname
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveRealname
     */
    public void remove(AbApproveRealname model);
    
	/**
	 * 根据ID获得实名信息   
	 * @param id
	 * @return HjsApproveRealname
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public AbApproveRealname getById(Integer id);
    
 
	public List<AbApproveRealname> findAll();
	
	public AbApproveRealname saveOrUpdate(AbApproveRealname entity);
	 
	public boolean isUnique(AbApproveRealname entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveRealname
	 **/      
	public Page<?> findPage(AbApproveRealnameQuery query);
	/**
	 * 用户实名认证审核
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void AuditRealName(AbApproveRealname entity);
	/**
	 * 通过登录ID获得实名信息
	 * @param id
	 * @return HjsApproveRealname
	 * @author zhangyong
	 * @date 2015年9月11日
	 */
	public AbApproveRealname getByLoginId(Integer id);
	
}
