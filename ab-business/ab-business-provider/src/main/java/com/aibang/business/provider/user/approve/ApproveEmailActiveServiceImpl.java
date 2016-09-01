package com.aibang.business.provider.user.approve;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.user.approve.ApproveEmailActiveService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveEmailActive;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.vo.AbApproveEmailActiveQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("approveEmailActiveService")
@SuppressWarnings({"unchecked"})
public class ApproveEmailActiveServiceImpl  extends ProviderServiceBase<AbApproveEmailActive,Integer> implements ApproveEmailActiveService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "AbApproveEmailActive";
	}
	
	public AbApproveEmailActive saveOrUpdate(AbApproveEmailActive entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbApproveEmailActiveQuery query) {
		return pageQuery(getIbatisMapperNamesapce() + ".findPage",query);
	}

	@Override
	public AbApproveEmailActive saveObj(AbApproveEmailActive model) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 通过ID获得邮件认证信息   
	 * @param id
	 * @return HjsApproveEmailActive
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    public AbApproveEmailActive getById(Integer id){
    	AbApproveEmailActive abApproveRealname = null;
    	try {
    		abApproveRealname = super.getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID获得邮件认证信息错误",e.getCause());
		}
    	return abApproveRealname;
    }
	/**
	 * 前台会员邮件认证
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    @Transactional
	public void activateEmail(AbApproveEmailActive entity){
		try {
			AbApproveEmailActive approveEmailActive = (AbApproveEmailActive)super.findForObject(getIbatisMapperNamesapce()+".getByLoginId",entity.getUserId());
			//判断邮件验证表是否有记录，没有的话记录一条，有的话修改验证状态
			if(approveEmailActive!=null&&approveEmailActive.getId()!=null){
				entity.setId(approveEmailActive.getId());
				approveEmailActive.setEmail(entity.getEmail());
				approveEmailActive.setVerifyTime(new Date());
				super.update(getIbatisMapperNamesapce()+".activate",approveEmailActive);
			}else{
				entity.setCreateTime(new Date());
				entity.setVerifyTime(new Date());
				entity.setStatus(1);
				super.save(entity);
			}
			//修改用户表相关
			AbUser abUser = new AbUser();
			abUser.setId(entity.getUserId());
			abUser.setEmail(entity.getEmail());
			abUser.setEmailStatus(1);
			update("AbUser.activateEmail", abUser);//修改用户表相关邮件审核状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"前台会员邮件认证错误",e.getCause());
		}
	}
	/**
	 * 审核邮件认证
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    @Transactional
	public void auditEmail(AbApproveEmailActive entity){
		try {
			super.update(getIbatisMapperNamesapce()+".audit",entity);//修改邮件表审核状态
			AbUser abUser = new AbUser();
			abUser.setId(entity.getUserId());
			abUser.setEmailStatus(entity.getStatus());
			abUser.setOptId(entity.getVerifyUserid());
			update("HjsUser.auditEmail", abUser);//修改用户表相关邮件审核状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"审核邮件认证错误",e.getCause());
		}
	}
	 
}
