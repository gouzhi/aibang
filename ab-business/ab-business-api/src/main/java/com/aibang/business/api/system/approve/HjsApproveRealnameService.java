package com.aibang.business.api.system.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveRealname;
import com.aibang.transfer.model.vo.HjsApproveRealnameQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsApproveRealnameService {
    
	/** 
	 * 创建HjsApproveRealname
	 **/
	public HjsApproveRealname saveObj(HjsApproveRealname model);
	
	/** 
	 * 更新HjsApproveRealname
	 **/	
    public void update(HjsApproveRealname model);
    
	/** 
	 * 删除HjsApproveRealname
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveRealname
     */
    public void remove(HjsApproveRealname model);
    
	/**
	 * 根据ID获得实名信息   
	 * @param id
	 * @return HjsApproveRealname
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public HjsApproveRealname getById(Integer id);
    
 
	public List<HjsApproveRealname> findAll();
	
	public HjsApproveRealname saveOrUpdate(HjsApproveRealname entity);
	 
	public boolean isUnique(HjsApproveRealname entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveRealname
	 **/      
	public Page<?> findPage(HjsApproveRealnameQuery query);
	/**
	 * 用户实名认证审核
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void AuditRealName(HjsApproveRealname entity);
	/**
	 * 通过登录ID获得实名信息
	 * @param id
	 * @return HjsApproveRealname
	 * @author zhangyong
	 * @date 2015年9月11日
	 */
	public HjsApproveRealname getByLoginId(Integer id);
	
}
