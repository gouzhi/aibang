package com.cifex.business.api.system.approve;

import java.util.List;

import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsApproveSmsSendlog;
import com.cifex.transfer.model.vo.HjsApproveSmsSendlogQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface HjsApproveSmsSendlogService {
    
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
