package com.aibang.business.provider.user.area;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aibang.business.api.user.area.SysAreaService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysArea;
import com.aibang.transfer.model.vo.AbSysAreaQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("sysAreaService")
@SuppressWarnings({"unchecked"})
public class SysAreaServiceImpl  extends ProviderServiceBase<AbSysArea,Integer> implements SysAreaService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "AbSysArea";
	}
	
	public AbSysArea saveOrUpdate(AbSysArea entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbSysAreaQuery query) {
		return pageQuery(getIbatisMapperNamesapce() + ".findPage",query);
	}

	@Override
	public AbSysArea saveObj(AbSysArea model) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 得到某级别地域信息
	 * @param layer 地域级别1：省级 2：市级 3：县级
	 * @return List<HjsSysArea>
	 * @author zhangyong
	 * @date 2015年9月22日
	 */
	public List<AbSysArea> getAreaLayer(Integer layer,Integer parentId){
		List<AbSysArea> areaList = null ;
		AbSysAreaQuery areaQuery = new AbSysAreaQuery();
		areaQuery.setLayer(layer);
		areaQuery.setParentId(parentId);
		try {
			areaList = (List<AbSysArea>)super.findForList(getIbatisMapperNamesapce()+".findAreaLayer", areaQuery);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"得到某级别地域信息错误",e.getCause());
		}
		return areaList;
	}
	 
}
