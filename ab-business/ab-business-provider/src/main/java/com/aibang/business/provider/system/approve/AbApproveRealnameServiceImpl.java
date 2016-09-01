package com.aibang.business.provider.system.approve;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.system.approve.AbApproveRealnameService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveRealname;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.vo.AbApproveRealnameQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("abApproveRealnameService")
@SuppressWarnings({"unchecked"})
public class AbApproveRealnameServiceImpl  extends ProviderServiceBase<AbApproveRealname,Integer> implements AbApproveRealnameService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "AbApproveRealname";
	}
	
	public AbApproveRealname saveOrUpdate(AbApproveRealname entity) {
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
	public Page findPage(AbApproveRealnameQuery query) {
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
			return pageQuery(getIbatisMapperNamesapce() + ".findPage",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"显示实名认证信息列表错误",e.getCause());
		}
		
		
	}

	@Override
	public AbApproveRealname saveObj(AbApproveRealname model) {
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
	public AbApproveRealname getById(Integer id){
		AbApproveRealname abApproveRealname = null;
		try {
			abApproveRealname = super.getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"根据ID获得实名信息错误",e.getCause());
		}
		return abApproveRealname;
	}
	/**
	 * 用户实名认证审核
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	@Transactional
	public void AuditRealName(AbApproveRealname entity){
		try {
			update(this.getIbatisMapperNamesapce()+".audit", entity);//修改实名审核信息
			AbUser abUser = new AbUser();
			abUser.setId(entity.getUserId());
			abUser.setRealNameStatus(entity.getStatus());
			abUser.setOptId(entity.getVerifyUserid());
			update("AbUser.auditRealName", abUser);//修改用户表实名审核相关
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
	public AbApproveRealname getByLoginId(Integer id){
		AbApproveRealname abApproveRealname = null;
		AbApproveRealnameQuery abApproveRealnameQuery = new AbApproveRealnameQuery();
		abApproveRealnameQuery.setUserId(id);
		try {
			abApproveRealname = (AbApproveRealname)findForObject(getIbatisMapperNamesapce()+".getByLoginId", abApproveRealnameQuery);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过登录ID获得实名信息错误",e.getCause());
		}
		return abApproveRealname;
	}
	 
}
