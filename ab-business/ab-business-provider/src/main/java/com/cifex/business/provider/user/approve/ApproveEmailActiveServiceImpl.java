package com.cifex.business.provider.user.approve;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.user.approve.ApproveEmailActiveService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsApproveEmailActive;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.transfer.model.vo.HjsApproveEmailActiveQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("approveEmailActiveService")
@SuppressWarnings({"unchecked"})
public class ApproveEmailActiveServiceImpl  extends ProviderServiceBase<HjsApproveEmailActive,Integer> implements ApproveEmailActiveService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsApproveEmailActive";
	}
	
	public HjsApproveEmailActive saveOrUpdate(HjsApproveEmailActive entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsApproveEmailActiveQuery query) {
		return pageQuery("HjsApproveEmailActive.findPage",query);
	}

	@Override
	public HjsApproveEmailActive saveObj(HjsApproveEmailActive model) {
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
    public HjsApproveEmailActive getById(Integer id){
    	HjsApproveEmailActive hjsApproveRealname = null;
    	try {
    		hjsApproveRealname = super.getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID获得邮件认证信息错误",e.getCause());
		}
    	return hjsApproveRealname;
    }
	/**
	 * 前台会员邮件认证
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
    @Transactional
	public void activateEmail(HjsApproveEmailActive entity){
		try {
			HjsApproveEmailActive approveEmailActive = (HjsApproveEmailActive)super.findForObject(getIbatisMapperNamesapce()+".getByLoginId",entity.getUserId());
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
			HjsUser hjsUser = new HjsUser();
			hjsUser.setId(entity.getUserId());
			hjsUser.setEmail(entity.getEmail());
			hjsUser.setEmailStatus(1);
			update("HjsUser.activateEmail", hjsUser);//修改用户表相关邮件审核状态
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
	public void auditEmail(HjsApproveEmailActive entity){
		try {
			super.update(getIbatisMapperNamesapce()+".audit",entity);//修改邮件表审核状态
			HjsUser hjsUser = new HjsUser();
			hjsUser.setId(entity.getUserId());
			hjsUser.setEmailStatus(entity.getStatus());
			hjsUser.setOptId(entity.getVerifyUserid());
			update("HjsUser.auditEmail", hjsUser);//修改用户表相关邮件审核状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"审核邮件认证错误",e.getCause());
		}
	}
	 
}
