package com.aibang.business.api.user.config;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysConfig;
import com.aibang.transfer.model.vo.HjsSysConfigQuery;

import java.util.List;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */




 
public interface SysConfigService {

	/**
	 * 添加配置信息
	 *
	 * @param model
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	public HjsSysConfig saveObj(HjsSysConfig model);


	/**
	 * 修改配置信息
	 *
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void update(HjsSysConfig model);
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
    public void remove(HjsSysConfig model);
    /**
     * 通过id获取配置信息
     *
     * @param id
     * @return HjsSysConfig
     * @author zhangyong
     * @date 2015年8月25日
     */
    public HjsSysConfig getById(Integer id);
    /**
     * 获得所有配置信息
     *
     * @return List<HjsSysConfig>
     * @author zhangyong
     * @date 2015年8月25日
     */

	public List<HjsSysConfig> findAll();

	/**
	 * 添加或修改配置信息
	 *
	 * @param entity
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	public HjsSysConfig saveOrUpdate(HjsSysConfig entity);

	/**
	 * 配置唯一性
	 *
	 * @param entity
	 * @param uniquePropertyNames
	 * @return boolean
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	public boolean isUnique(HjsSysConfig entity, String uniquePropertyNames);

	/**
	 * 分页获得配置信息
	 *
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */

	@SuppressWarnings("rawtypes")
	public Page findPage(HjsSysConfigQuery query);

	/**
	 * 通过Pcode获得配置信息
	 *
	 * @param param
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysConfig getByPcode(String param);
	/**
	 * 获得配置信息数量
	 *  
	 * @param query
	 * @return Long
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public Long findCount(HjsSysConfigQuery query) ;
	/**
	 * 查询编码是否存在
	 *  
	 * @param query
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsSysConfig findBmCount(HjsSysConfigQuery query) ;
	/**
	 * 通过父类ID获得配置信息
	 *  
	 * @param query
	 * @return Page<HjsSysConfig>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public Page<HjsSysConfig> dictlistPage(HjsSysConfigQuery query) ;



	

	/**
	 * 
	 * @methodname findConfigsByParentId
	 * @discription 根据parentId查询子配置
	 * @param parentId
	 * @return List<HjsSysConfig>
	 * @author wang wei
	 * @date 2015年8月24日
	 */
	public List<HjsSysConfig> findConfigsByParentId(Integer parentId);

}
