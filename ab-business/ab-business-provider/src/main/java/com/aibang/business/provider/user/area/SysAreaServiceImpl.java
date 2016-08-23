package com.aibang.business.provider.user.area;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aibang.business.api.user.area.SysAreaService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysArea;
import com.aibang.transfer.model.vo.HjsSysAreaQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("sysAreaService")
@SuppressWarnings({"unchecked"})
public class SysAreaServiceImpl  extends ProviderServiceBase<HjsSysArea,Integer> implements SysAreaService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsSysArea";
	}
	
	public HjsSysArea saveOrUpdate(HjsSysArea entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsSysAreaQuery query) {
		return pageQuery("HjsSysArea.findPage",query);
	}

	@Override
	public HjsSysArea saveObj(HjsSysArea model) {
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
	public List<HjsSysArea> getAreaLayer(Integer layer,Integer parentId){
		List<HjsSysArea> areaList = null ;
		HjsSysAreaQuery areaQuery = new HjsSysAreaQuery();
		areaQuery.setLayer(layer);
		areaQuery.setParentId(parentId);
		try {
			areaList = (List<HjsSysArea>)super.findForList(getIbatisMapperNamesapce()+".findAreaLayer", areaQuery);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"得到某级别地域信息错误",e.getCause());
		}
		return areaList;
	}
	 
}
