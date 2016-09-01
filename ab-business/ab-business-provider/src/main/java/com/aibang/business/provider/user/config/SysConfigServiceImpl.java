package com.aibang.business.provider.user.config;

import com.aibang.business.api.user.config.SysConfigService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysConfig;
import com.aibang.transfer.model.vo.AbSysConfigQuery;
import com.alibaba.dubbo.rpc.RpcException;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * 配置服务相关操作
 *  
 * @author zhangyong    
 * @date 2015年8月25日
 */
@Service("sysConfigService")
@SuppressWarnings({ "unchecked" })
public class SysConfigServiceImpl extends
		ProviderServiceBase<AbSysConfig, Integer> implements
		SysConfigService {

	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysConfig";
	}
	/**
	 * 添加或修改配置信息
	 *
	 * @param entity
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysConfig saveOrUpdate(AbSysConfig entity) {
		if (entity.getId() == null)
			save(entity);
		else
			update(entity);
		return entity;
	}

	/**
	 * 分页获得配置信息
	 *
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@SuppressWarnings("rawtypes")
	public Page findPage(AbSysConfigQuery query) {
		Page page = new Page();
		try {
			page = pageQuery("HjsSysConfig.findPage", query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"分页显示配置信息错误", e.getCause());
		}
		return page;
	}
	/**
	 * 通过Pcode获得配置信息
	 *
	 * @param param
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysConfig getByPcode(String v) {
		AbSysConfig config = new AbSysConfig();
		try {
			config = (AbSysConfig) getSqlSessionTemplate().selectOne(
					"HjsSysConfig.getByPcode", v);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"通过父级编码_当前编号获得配置信息错误", e.getCause());
		}
		return config;
	}
	
	/**
	 * 修改配置信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public void update(AbSysConfig model) {
		try {
			super.update(model);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "更新配置错误",
					e.getCause());
		}
	}

	/**
     * 通过ID删除配置信息
     *  
     * @param id void
     * @author zhangyong
     * @date 2015年8月25日
     */
	public void deleteById(Integer id) {
		try {
			super.deleteById(id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "删除配置错误",
					e.getCause());
		}
	}

	/**
     * 逻辑删除配置信息
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
	public void remove(AbSysConfig model) {
		try {
			super.remove(model);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"逻辑删除配置错误", e.getCause());
		}
	}
	
	/**
     * 通过id获取配置信息  
     *  
     * @param id
     * @return HjsSysConfig
     * @author zhangyong
     * @date 2015年8月25日
     */
	public AbSysConfig getById(Integer id) {
		AbSysConfig config = new AbSysConfig();
		try {
			config = super.getById(id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"根据ID得到配置错误", e.getCause());
		}
		return config;
	}

	/**
     * 获得所有配置信息
     *  
     * @return List<HjsSysConfig>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<AbSysConfig> findAll() {
		List<AbSysConfig> configList = new ArrayList<AbSysConfig>();
		try {
			configList = super.findAll();
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"查询所有配置列表错误", e.getCause());
		}
		return configList;
	}
	/**
	 * 配置唯一性
	 *  
	 * @param entity
	 * @param uniquePropertyNames
	 * @return boolean
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public boolean isUnique(AbSysConfig entity, String uniquePropertyNames) {
		boolean ref = false;
		try {
			ref = super.isUnique(entity, uniquePropertyNames);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"查询配置唯一性错误", e.getCause());
		}
		return ref;
	}
	/**
	 * 获得配置信息数量
	 *  
	 * @param query
	 * @return Long
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public Long findCount(AbSysConfigQuery query) {
		Long count = 0L;
		try {
			count = (Long) super.findForObject(this.getIbatisMapperNamesapce()
					+ ".findCount", query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"通过ID获取子配置总数错误", e.getCause());
		}
		return count;
	}
	/**
	 * 查询编码是否存在
	 *  
	 * @param query
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbSysConfig findBmCount(AbSysConfigQuery query) {
		AbSysConfig config = new AbSysConfig();
		try {
			config = (AbSysConfig) super.findForObject(
					this.getIbatisMapperNamesapce() + ".findBmCount", query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "查询编码错误",
					e.getCause());
		}
		return config;
	}

	/**
	 * 添加配置信息
	 *  
	 * @param model
	 * @return HjsSysConfig
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Override
	public AbSysConfig saveObj(AbSysConfig model) {
		try {
			super.save(model);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "添加配置错误",
					e.getCause());
		}
		return null;
	}

	/**
	 * 通过父类ID获得配置信息
	 *  
	 * @param query
	 * @return Page<HjsSysConfig>
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Override
	public Page<AbSysConfig> dictlistPage(AbSysConfigQuery query) {
		
		return null;
	}

	@Override
	public List<AbSysConfig> findConfigsByParentId(Integer parentId) {

		return (List<AbSysConfig>) super.findForList(
				this.getIbatisMapperNamesapce() + ".findConfigsByParentId",
				parentId);
	}

}
