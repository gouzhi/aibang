package com.aibang.business.api.system.config;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysConfig;
import com.aibang.transfer.model.vo.AbSysConfigQuery;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */




 
public interface AbSysConfigService {
    
	/**
	 * 添加配置信息
	 *  
	 * @param model
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	public AbSysConfig saveObj(AbSysConfig model);

	
	/**
	 * 修改配置信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void update(AbSysConfig model);
    /**
     * 通过ID删除配置信息
     *  
     * @param id void
     * @author zhangyong
     * @date 2015年8月25日
     */




    public void deleteById(Integer id);
    /**
     * 逻辑删除配置信息
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    public void remove(AbSysConfig model);
    /**
     * 通过id获取配置信息  
     *  
     * @param id
     * @return HjsSysConfig
     * @author zhangyong
     * @date 2015年8月25日
     */
    public AbSysConfig getById(Integer id);
    /**
     * 获得所有配置信息
     *  
     * @return List<HjsSysConfig>
     * @author zhangyong
     * @date 2015年8月25日
     */

	public List<AbSysConfig> findAll();

	/**
	 * 添加或修改配置信息
	 *  
	 * @param entity
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	public AbSysConfig saveOrUpdate(AbSysConfig entity);

	/**
	 * 配置唯一性
	 *  
	 * @param entity
	 * @param uniquePropertyNames
	 * @return boolean
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	public boolean isUnique(AbSysConfig entity, String uniquePropertyNames);

	/**     
	 * 分页获得配置信息
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	@SuppressWarnings("rawtypes")
	public Page findPage(AbSysConfigQuery query);

	/**
	 * 通过Pcode获得配置信息
	 *  
	 * @param param
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysConfig getByPcode(String param);
	/**
	 * 获得配置信息数量
	 *  
	 * @param query
	 * @return Long
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public Long findCount(AbSysConfigQuery query) ;
	/**
	 * 查询编码是否存在
	 *  
	 * @param query
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysConfig findBmCount(AbSysConfigQuery query) ;
	/**
	 * 通过父类ID获得配置信息
	 *  
	 * @param query
	 * @return Page<HjsSysConfig>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public Page<AbSysConfig> dictlistPage(AbSysConfigQuery query) ;



	

	/**
	 * 
	 * @methodname findConfigsByParentId
	 * @discription 根据parentId查询子配置
	 * @param parentId
	 * @return List<HjsSysConfig>
	 * @author wang wei
	 * @date 2015年8月24日
	 */
	public List<AbSysConfig> findConfigsByParentId(Integer parentId);

}
