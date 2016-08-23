package com.aibang.business.provider.system.approve;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.system.approve.HjsApproveRealnameService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveRealname;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.transfer.model.vo.HjsApproveRealnameQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsApproveRealnameService")
@SuppressWarnings({"unchecked"})
public class HjsApproveRealnameServiceImpl  extends ProviderServiceBase<HjsApproveRealname,Integer> implements HjsApproveRealnameService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsApproveRealname";
	}
	
	public HjsApproveRealname saveOrUpdate(HjsApproveRealname entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	/**
	 * 显示实名认证信息列表（分页）
	 */
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsApproveRealnameQuery query) {
		try {
			//处理查询时间格式
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(query.getVerifyTimeBegin()!=null){
				query.setVerifyTimeBegin(format1.parse(format.format(query.getVerifyTimeBegin())+" 00:00:00"));
			}
			if(query.getVerifyTimeEnd()!=null){
				
				query.setVerifyTimeEnd(format1.parse(format.format(query.getVerifyTimeEnd())+" 23:59:59"));
			}
			return pageQuery("HjsApproveRealname.findPage",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"显示实名认证信息列表错误",e.getCause());
		}
		
		
	}

	@Override
	public HjsApproveRealname saveObj(HjsApproveRealname model) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 根据ID获得实名信息   
	 * @param id
	 * @return HjsApproveRealname
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public HjsApproveRealname getById(Integer id){
		HjsApproveRealname hjsApproveRealname = null;
		try {
			hjsApproveRealname = super.getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"根据ID获得实名信息错误",e.getCause());
		}
		return hjsApproveRealname;
	}
	/**
	 * 用户实名认证审核
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	@Transactional
	public void AuditRealName(HjsApproveRealname entity){
		try {
			update(this.getIbatisMapperNamesapce()+".audit", entity);//修改实名审核信息
			HjsUser hjsUser = new HjsUser();
			hjsUser.setId(entity.getUserId());
			hjsUser.setRealNameStatus(entity.getStatus());
			hjsUser.setOptId(entity.getVerifyUserid());
			update("HjsUser.auditRealName", hjsUser);//修改用户表实名审核相关
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"用户实名认证审核错误",e.getCause());
		}
	}
	
	/**
	 * 通过登录ID获得实名信息
	 * @param id
	 * @return HjsApproveRealname
	 * @author zhangyong
	 * @date 2015年9月11日
	 */
	public HjsApproveRealname getByLoginId(Integer id){
		HjsApproveRealname hjsApproveRealname = null;
		HjsApproveRealnameQuery hjsApproveRealnameQuery = new HjsApproveRealnameQuery();
		hjsApproveRealnameQuery.setUserId(id);
		try {
			hjsApproveRealname = (HjsApproveRealname)findForObject(getIbatisMapperNamesapce()+".getByLoginId", hjsApproveRealnameQuery);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过登录ID获得实名信息错误",e.getCause());
		}
		return hjsApproveRealname;
	}
	 
}
