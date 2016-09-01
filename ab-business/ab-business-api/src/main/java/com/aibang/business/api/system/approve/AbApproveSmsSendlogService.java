package com.aibang.business.api.system.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveSmsSendlog;
import com.aibang.transfer.model.vo.AbApproveSmsSendlogQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface AbApproveSmsSendlogService {
    
	/** 
	 * 创建HjsApproveSmsSendlog
	 **/
	public AbApproveSmsSendlog saveObj(AbApproveSmsSendlog model);
	
	/** 
	 * 更新HjsApproveSmsSendlog
	 **/	
    public void update(AbApproveSmsSendlog model);
    
	/** 
	 * 删除HjsApproveSmsSendlog
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveSmsSendlog
     */
    public void remove(AbApproveSmsSendlog model);
    
	/** 
	 * 根据ID得到HjsApproveSmsSendlog
	 **/    
    public AbApproveSmsSendlog getById(Integer id);
    
 
	public List<AbApproveSmsSendlog> findAll();
	
	public AbApproveSmsSendlog saveOrUpdate(AbApproveSmsSendlog entity);
	 
	public boolean isUnique(AbApproveSmsSendlog entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveSmsSendlog
	 **/      
	public Page<?> findPage(AbApproveSmsSendlogQuery query);
	
}
