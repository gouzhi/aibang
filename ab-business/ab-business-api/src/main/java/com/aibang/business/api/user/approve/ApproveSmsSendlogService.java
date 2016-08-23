package com.aibang.business.api.user.approve;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveSmsSendlog;
import com.aibang.transfer.model.vo.HjsApproveSmsSendlogQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface ApproveSmsSendlogService {
    
	/** 
	 * 创建HjsApproveSmsSendlog
	 **/
	public HjsApproveSmsSendlog saveObj(HjsApproveSmsSendlog model);
	
	/** 
	 * 更新HjsApproveSmsSendlog
	 **/	
    public void update(HjsApproveSmsSendlog model);
    
	/** 
	 * 删除HjsApproveSmsSendlog
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsApproveSmsSendlog
     */
    public void remove(HjsApproveSmsSendlog model);
    
	/** 
	 * 根据ID得到HjsApproveSmsSendlog
	 **/    
    public HjsApproveSmsSendlog getById(Integer id);
    
 
	public List<HjsApproveSmsSendlog> findAll();
	
	public HjsApproveSmsSendlog saveOrUpdate(HjsApproveSmsSendlog entity);
	 
	public boolean isUnique(HjsApproveSmsSendlog entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsApproveSmsSendlog
	 **/      
	public Page<?> findPage(HjsApproveSmsSendlogQuery query);
	
}
