package com.aibang.business.provider.user.approve;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.user.approve.ApproveRealnameService;
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


 
@Service("approveRealnameService")
@SuppressWarnings({"unchecked"})
public class ApproveRealnameServiceImpl  extends ProviderServiceBase<HjsApproveRealname,Integer> implements ApproveRealnameService {
 
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
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsApproveRealnameQuery query) {
		return pageQuery("HjsApproveRealname.findPage",query);
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
	
	/**
	 * 用户验证实名（暂用，待第三方借口）
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	@Transactional
	public void activateRealName(HjsApproveRealname entity){
		HjsApproveRealname hjsApproveRealname = null;
		HjsApproveRealnameQuery hjsApproveRealnameQuery = new HjsApproveRealnameQuery();
		HjsUser user =new HjsUser();
		user.setId(entity.getUserId());
		user.setRealName(entity.getRealname());
		user.setRealNameStatus(1);
		try {
			
			hjsApproveRealnameQuery.setUserId(entity.getUserId());
			hjsApproveRealname = (HjsApproveRealname)findForObject(getIbatisMapperNamesapce()+".getByLoginId", hjsApproveRealnameQuery);
			if(hjsApproveRealname!=null&&hjsApproveRealname.getId()!=null){
				entity.setId(hjsApproveRealname.getId());
				update(getIbatisMapperNamesapce()+".activate",entity);
			}else{
				save(entity);
			}
			update("HjsUser.activateRealName", user);//修改用户表相关实名认证状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"用户验证实名错误",e.getCause());
		}
	}
	
	/**
	 * 判断是否进行实名认证
	 * @param loginId 用户登录表ID
	 * @return boolean true 已经实名认证  false 未实名认证
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	public boolean hasRealName(Integer loginId){
		HjsApproveRealname hjsApproveRealname = null;
		HjsApproveRealnameQuery hjsApproveRealnameQuery = new HjsApproveRealnameQuery();
		boolean res = false;
		hjsApproveRealnameQuery.setUserId(loginId);
		try {
			hjsApproveRealname = (HjsApproveRealname)findForObject(getIbatisMapperNamesapce()+".getByLoginId", hjsApproveRealnameQuery);
			if(hjsApproveRealname!=null&&hjsApproveRealname.getStatus()==1&&hjsApproveRealname.getCardId()!=null){
				res = true;
			}
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"判断是否进行实名认证错误",e.getCause());
		}
		return res;
	}
	
	/**
	 * 判断身份证是否已被认证
	 * @param cardId
	 * @return boolean true已被其他账户认证 false未被其他账户认证
	 * @author zhangyong
	 * @date 2015年11月10日
	 */
	public boolean hasCardId(String cardId){
		List<HjsApproveRealname> hjsApproveRealname = null;
		HjsApproveRealnameQuery hjsApproveRealnameQuery = new HjsApproveRealnameQuery();
		boolean res = false;
		hjsApproveRealnameQuery.setCardId(cardId);
		try {
			hjsApproveRealname = (List<HjsApproveRealname>)findForList(getIbatisMapperNamesapce()+".getByCardId", hjsApproveRealnameQuery);
			if(hjsApproveRealname!=null&&hjsApproveRealname.size()>0){
				res = true;
			}
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"判断身份证是否已被认证错误",e.getCause());
		}
		return res;
	}
	 
}
