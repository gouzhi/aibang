package com.aibang.business.provider.system.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.system.user.AbUsersInfoService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.ShareCodeUtil;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbApproveSms;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.dto.AbUsersInfo;
import com.aibang.transfer.model.dto.AbUsersInvite;
import com.aibang.transfer.model.vo.AbUserBaseQuery;
import com.aibang.transfer.model.vo.AbUsersInfoQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */
@Service("hjsUsersInfoService")
@SuppressWarnings({"unchecked"})
public class AbUsersInfoServiceImpl  extends ProviderServiceBase<AbUsersInfo,Integer> implements AbUsersInfoService {
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersInfo";
	}
	/**
	 * 添加或修改会员信息
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public AbUsersInfo saveOrUpdate(AbUsersInfo entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	/**
	 * 分页获取会员信息     
	 * @param query
	 * @return Page<?>
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbUsersInfoQuery query) {
		return pageQuery("HjsUsersInfo.findPage",query);
	}
	/**
	 * 新增会员信息
	 * @param model
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public AbUsersInfo saveObj(AbUsersInfo model)
	{
		try {
			save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"新增会员信息错误",e.getCause());
		}
		return model;
	}
	/**	
	 * 修改会员信息
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
    public void update(AbUsersInfo model){
    	try {
			update(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改会员信息错误",e.getCause());
		}
    }
    
	/**
	 * 通过ID删除会员信息
	 * @param id void
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
    public void deleteById(Integer id){
    	try {
			deleteById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID删除会员错误",e.getCause());
		}
    }
    
    /**
     * 逻辑删除会员信息
     * @param model void
     * @author zhangyong
     * @date 2015年8月31日
     */
    public void remove(AbUsersInfo model){
    	try {
			remove(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"逻辑删除会员错误",e.getCause());
		}
    }
    /**
     * 通过ID得到会员信息   
     * @param id
     * @return HjsUsersInfo
     * @author zhangyong
     * @date 2015年8月31日
     */
    public AbUsersInfo getById(Integer id){
    	AbUsersInfo hjsUsersInfo = null;
    	try {
    		hjsUsersInfo = getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID得到会员信息错误",e.getCause());
		}
		return hjsUsersInfo;
    }
    /**
     * 得到所有会员信息列表
     * @return List<HjsUsersInfo>
     * @author zhangyong
     * @date 2015年8月31日
     */
	public List<AbUsersInfo> findAll(){
		List<AbUsersInfo> infoList= null;
		try {
			infoList = findAll();
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"得到所有会员信息列表错误",e.getCause());
		}
		return infoList;
	}
	 /**
	  * 会员信息唯一性判别
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月31日
	  */
	public boolean isUnique(AbUsersInfo entity, String uniquePropertyNames){
		boolean ref = false;
		try {
			ref = isUnique(entity, uniquePropertyNames);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"会员信息唯一性判别错误",e.getCause());
		}
		return ref;
	}
	/**
	 * 后台得到用户信息列表（分页）
	 * @param query
	 * @return Page<?>
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public Page<?> getUsersInfo(AbUsersInfoQuery query){
		Page<AbUsersInfo> infoPage=null;
		try {
			//处理查询时间格式
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(query.getLastTimeBegin()!=null){
				query.setLastTimeBegin(format1.parse(format.format(query.getLastTimeBegin())+" 00:00:00"));
			}
			if(query.getLastTimeEnd()!=null){
				
				query.setLastTimeEnd(format1.parse(format.format(query.getLastTimeEnd())+" 23:59:59"));
			}
			infoPage = findPage(query);
			if(infoPage.getResult()!=null&&infoPage.getResult().size()>0){
				for(AbUsersInfo info :infoPage.getResult()){
					AbUsersInvite invite = new AbUsersInvite();
					invite.setUserId(info.getUserId());
					AbUsersInvite inviteUser = (AbUsersInvite)findForObject("HjsUsersInvite.getByBaseId", invite);
					info.setHjsUsersInvite(inviteUser);
				}
			}
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台得到用户信息列表（分页）错误",e.getCause());
		}
		return infoPage;
	}
	/**
	 * 后台添加会员
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@Transactional
	public AbUsersInfo addHjsUsersInfo(AbUsersInfo entity){
		try {
			save("HjsUser.insert",entity.getHjsUser());//登陆信息
			save("HjsUserBase.addUserBase",entity.getHjsUserBase());//账户信息
			entity.setLoginId(entity.getHjsUser().getId());
			entity.setUserId(entity.getHjsUserBase().getId());
			save("HjsUsersInfo.addUsersInfo",entity);//会员信息
			
			//保存手机认证信息
			AbApproveSms sms = new AbApproveSms();
			sms.setUserId(entity.getHjsUser().getId());//用户登录ID
			sms.setStatus(0);//认证状态0未认证
			sms.setType(1);//类型
			sms.setPhone(entity.getHjsUser().getPhone());//手机号
			sms.setCreateTime(new Date());//创建时间
			sms.setCreateIp(entity.getHjsUser().getCreateIp());//创建IP
			sms.setCredit(0);//验证码默认0
			sms.setVerifyTime(sms.getCreateTime());//验证时间，此时与创建时间相同
			sms.setVerifyUserid(entity.getHjsUser().getId());//验证用户ID，此时为自己
			sms.setVerifyRemark("");//备注
			save("HjsApproveSms.insert",sms);
			
			//邀请码相关操作
			AbUsersInvite usersInvite = new AbUsersInvite();
			String inviteCode = entity.getInviteCode();
			AbUsersInfo inviteUsersInfo = (AbUsersInfo)findForObject("HjsUsersInfo.getInviteUser", inviteCode);
			if(inviteUsersInfo!=null){
				usersInvite.setInviteCode(inviteCode);//邀请码
				usersInvite.setInviteUserId(inviteUsersInfo.getUserId());//邀请用户ID
				usersInvite.setInviteType(1);//邀请类型
				usersInvite.setCreateIp(entity.getHjsUser().getCreateIp());//创建IP
				usersInvite.setCreateTime(new Date());//创建时间
				usersInvite.setUserId(entity.getHjsUserBase().getId());//账户ID
				save("HjsUsersInvite.insert",usersInvite);
				entity.setInviteUserid(inviteUsersInfo.getUserId());
			}
			
			
			//生成邀请码
			entity.setInviteCode(ShareCodeUtil.toSerialCode(entity.getId()));
			update("HjsUsersInfo.createInviteCode",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台添加会员错误",e.getCause());
		}
		return entity;
	}
	/**
	 * 后台加载修改会员信息
	 * @param query
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	public AbUsersInfo getEditUsersInfo(AbUsersInfoQuery query){
		AbUsersInfo usersInfo = null;
		try {
			usersInfo = (AbUsersInfo)findForObject("HjsUsersInfo.getUsersInfoById", query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台加载修改会员信息错误",e.getCause());
		}
		return usersInfo;
	}
	/**
	 * 后台修改会员基本信息
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@Transactional
	public AbUsersInfo editUsersInfo(AbUsersInfo entity){
		
		try {
			update("HjsUser.updatePass",entity.getHjsUser());//登陆信息
			update("HjsUserBase.updatePass",entity.getHjsUserBase());//账户信息
			if(entity.getHjsUser().getPhone()!=null&&!entity.getHjsUser().getPhone().equals("")){
				AbApproveSms sms = new AbApproveSms();
				sms.setUserId(entity.getLoginId());
				sms.setPhone(entity.getHjsUser().getPhone());
				sms.setStatus(0);
				update("HjsApproveSms.updatePhone",sms);
			}
			
			
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台修改会员基本信息错误",e.getCause());
		}
		return entity;
	}
	/**
	 * 通过登录ID获取用户信息
	 * @param query
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	public AbUsersInfo getUsersInfoByLoginId(Integer LoginId){
		AbUsersInfo usersInfo = null;
		try {
			//会员信息
			AbUsersInfoQuery hjsUsersInfoQuery = new AbUsersInfoQuery();
			hjsUsersInfoQuery.setLoginId(LoginId);
			usersInfo = (AbUsersInfo)findForObject("HjsUsersInfo.getByLoginId", hjsUsersInfoQuery);
			//会员账户信息
			if(usersInfo!=null && usersInfo.getUserId()!=null){
				AbUserBaseQuery userBase = new AbUserBaseQuery();
				userBase.setId(usersInfo.getUserId());		
				usersInfo.setHjsUserBase((AbUserBase)super.findForObject("HjsUserBase.getById", userBase));
			}
			
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过登录ID获取用户信息错误",e.getCause());
		}
		return usersInfo;
	}
	/**
	 * 通过username获取用户信息
	 * @param query
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	public List<AbUsersInfo> getUsersInfoByUsername(String username){
		List<AbUsersInfo> infoPage=null;
		try {
			//会员信息
			AbUsersInfoQuery hjsUsersInfoQuery = new AbUsersInfoQuery();
			hjsUsersInfoQuery.setUsername(username);
			infoPage = (List<AbUsersInfo>)findForList("HjsUsersInfo.getByUsername", hjsUsersInfoQuery);
			if(infoPage!=null&&infoPage.size()>0){
				for(AbUsersInfo info:infoPage){
					AbUserBaseQuery userBase = new AbUserBaseQuery();
					userBase.setId(info.getUserId());		
					info.setHjsUserBase((AbUserBase)super.findForObject("HjsUserBase.getById", userBase));
				}
			}					
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过username获取用户信息错误",e.getCause());
		}
		
		return infoPage;
	}
}
