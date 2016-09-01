package com.aibang.business.api.user.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveRealname;
import com.aibang.transfer.model.vo.AbApproveRealnameQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface ApproveRealnameService {
    
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
	/**
	 * 用户验证实名（暂用，待第三方借口）
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	public void activateRealName(AbApproveRealname entity);
	/**
	 * 判断是否进行实名认证
	 * @param loginId USER表ID
	 * @return boolean true 已经实名认证  false 未实名认证
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	public boolean hasRealName(Integer loginId);
	/**
	 * 判断身份证是否已被认证
	 * @param cardId
	 * @return boolean
	 * @author zhangyong
	 * @date 2015年11月10日
	 */
	public boolean hasCardId(String cardId);
	
}
