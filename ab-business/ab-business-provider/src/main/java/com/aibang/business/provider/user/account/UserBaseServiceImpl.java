package com.aibang.business.provider.user.account;


import org.springframework.stereotype.Service;

import com.aibang.business.api.user.account.UserBaseService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.DateUtils;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUserBase;
import com.aibang.transfer.model.vo.HjsUserBaseQuery;
import com.alibaba.dubbo.rpc.RpcException;


 
/**
 * @classname HjsUserBaseServiceImpl    
 * @description 用户账户管理 
 * @author liuj    
 * @date 2015年8月26日
 */
@Service("userBaseService")
@SuppressWarnings({"unchecked"})
public class UserBaseServiceImpl  extends ProviderServiceBase<HjsUserBase,Integer> implements UserBaseService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUserBase";
	}
	
	public HjsUserBase saveOrUpdate(HjsUserBase entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUserBaseQuery query) {
		query.setUpdateTimeBegin(DateUtils.getStartDate(query.getUpdateTimeBegin()));
		query.setUpdateTimeEnd(DateUtils.getEndDate(query.getUpdateTimeEnd()));
		return pageQuery("HjsUserBase.findPage",query);
	}
	
	/**
	 * 获取冻结与余额的总和
	 * @methodname findTotalBalance  
	 * @discription 列名 TotalBalance 
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findTotalBalance(HjsUserBaseQuery query) {
		try {
		  return findForObject("HjsUserBase.findTotalBalance", query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"获取冻结与余额的总和错误",e.getCause());
		}
	}
	/**
	 * 获取用户账户详细信息
	 * @methodname findUserDetailById  
	 * @discription 用户信息账户信息
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findUserDetailById(HjsUserBaseQuery query) {
		try {
			return findForObject("HjsUserBase.findUserDetailById", query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"获取用户账户详细信息错误",e.getCause());
		}
	}
	
	public HjsUserBase saveObj(HjsUserBase model)
	{
		try {
			save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"添加用户账户错误",e.getCause());
		}
		return model;
	}
	
	/**
	 * 前台修改账户支付密码
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	public void editUserBase(HjsUserBase entity){
		try {
			update("HjsUserBase.updatePayPass", entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"前台修改账户支付密码错误",e.getCause());
		}
	}
	/**
	 * 判断是否存在支付密码 true 已设置支付密码 false 未设置支付密码
	 * @param id 用户BASE表ID
	 * @return boolean
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	public boolean hasPayPass(Integer id){
		boolean res = false;
		try {
			HjsUserBase userBase = super.getById(id);
			if(userBase!=null&&userBase.getPayPassword()!=null){
				res = true;
			}
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"判断是否存在支付密码错误",e.getCause());
		}
		return res;
	}
	
	

	/**
	 * 判断usrCustId是否为空
	 * @param usrCustId
	 * @return
	 */
	@Override
	public Object findByUserCustId(String usrCustId) {
			try {
				return findForObject("HjsUserBase.getByUserCustId", usrCustId);
			}catch (Exception e) {
				throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"获取用户账户详细信息错误",e.getCause());
			}
	}
}
