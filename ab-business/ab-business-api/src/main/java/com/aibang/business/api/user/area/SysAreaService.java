package com.aibang.business.api.user.area;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysArea;
import com.aibang.transfer.model.vo.HjsSysAreaQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface SysAreaService {
    
	/** 
	 * 创建HjsSysArea
	 **/
	public HjsSysArea saveObj(HjsSysArea model);
	
	/** 
	 * 更新HjsSysArea
	 **/	
    public void update(HjsSysArea model);
    
	/** 
	 * 删除HjsSysArea
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsSysArea
     */
    public void remove(HjsSysArea model);
    
	/** 
	 * 根据ID得到HjsSysArea
	 **/    
    public HjsSysArea getById(Integer id);
    
 
	public List<HjsSysArea> findAll();
	
	public HjsSysArea saveOrUpdate(HjsSysArea entity);
	 
	public boolean isUnique(HjsSysArea entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsSysArea
	 **/      
	@SuppressWarnings("rawtypes")
	public Page findPage(HjsSysAreaQuery query);
	/**
	 * 得到某级别地域信息
	 * @param layer 地域级别1：省级 2：市级 3：县级
	 * @param parentId 地域父类ID  顶级为0
	 * @return List<HjsSysArea>
	 * @author zhangyong
	 * @date 2015年9月22日
	 */
	public List<HjsSysArea> getAreaLayer(Integer layer, Integer parentId);
	
}
