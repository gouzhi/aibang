package com.aibang.business.provider.user.approve;

import org.springframework.stereotype.Service;

import com.aibang.business.api.user.approve.ApproveSmsService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveSms;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.vo.AbApproveSmsQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("approveSmsService")
@SuppressWarnings({"unchecked"})
public class ApproveSmsServiceImpl  extends ProviderServiceBase<AbApproveSms,Integer> implements ApproveSmsService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsApproveSms";
	}
	
	public AbApproveSms saveOrUpdate(AbApproveSms entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbApproveSmsQuery query) {
		return pageQuery("HjsApproveSms.findPage",query);
	}

	@Override
	public AbApproveSms saveObj(AbApproveSms model) {
		// TODO Auto-generated method stub
		return null;
	}
	/**   
	 * 根据ID获得手机认证信息
	 * @param id
	 * @return HjsApproveSms
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public AbApproveSms getById(Integer id){
    	AbApproveSms hjsApproveSms = null;
    	try {
    		hjsApproveSms = super.getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"根据ID获得手机认证信息错误",e.getCause());
		}
    	return hjsApproveSms;
    }
    /**
	 * 审核手机认证
	 * @param entity
	 * @return HjsApproveSms
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void auditSms(AbApproveSms entity){
		try {
			super.update(getIbatisMapperNamesapce()+".audit",entity);//修改手机审核状态
			AbUser hjsUser = new AbUser();
			hjsUser.setId(entity.getUserId());
			hjsUser.setPhoneStatus(entity.getStatus());
			hjsUser.setOptId(entity.getVerifyUserid());
			update("HjsUser.auditPhone", hjsUser);//修改用户表手机审核相关状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"审核手机认证错误",e.getCause());
		}
	}
	/**
	 * 前台手机验证
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月18日
	 */
	public void activateSms(AbApproveSms entity){
		AbApproveSms sms = null;
		AbApproveSmsQuery smsQuery = new AbApproveSmsQuery();
		try {
			smsQuery.setUserId(entity.getUserId());
			sms = (AbApproveSms)findForObject(getIbatisMapperNamesapce()+".getByLoginId", smsQuery);
			if(sms!=null&&sms.getId()!=null){
				entity.setId(sms.getId());
				super.update(getIbatisMapperNamesapce()+".activate",entity);//修改手机审核状态
			}else{
				super.save(entity);
			}
			AbUser hjsUser = new AbUser();
			hjsUser.setId(entity.getUserId());
			hjsUser.setPhoneStatus(entity.getStatus());
			hjsUser.setPhone(entity.getPhone());
			update("HjsUser.activatePhone", hjsUser);//修改用户表手机审核相关状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"审核手机认证错误",e.getCause());
		}
	}
	 
}
