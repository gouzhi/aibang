package com.cifex.business.provider.system.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.system.user.HjsUsersInfoService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.ShareCodeUtil;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsApproveSms;
import com.cifex.transfer.model.dto.HjsUserBase;
import com.cifex.transfer.model.dto.HjsUsersInfo;
import com.cifex.transfer.model.dto.HjsUsersInvite;
import com.cifex.transfer.model.vo.HjsUserBaseQuery;
import com.cifex.transfer.model.vo.HjsUsersInfoQuery;
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */
@Service("hjsUsersInfoService")
@SuppressWarnings({"unchecked"})
public class HjsUsersInfoServiceImpl  extends ProviderServiceBase<HjsUsersInfo,Integer> implements HjsUsersInfoService {
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
	public HjsUsersInfo saveOrUpdate(HjsUsersInfo entity) {
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
	public Page findPage(HjsUsersInfoQuery query) {
		return pageQuery("HjsUsersInfo.findPage",query);
	}
	/**
	 * 新增会员信息
	 * @param model
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年8月31日
	 */
	public HjsUsersInfo saveObj(HjsUsersInfo model)
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
    public void update(HjsUsersInfo model){
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
    public void remove(HjsUsersInfo model){
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
    public HjsUsersInfo getById(Integer id){
    	HjsUsersInfo hjsUsersInfo = null;
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
	public List<HjsUsersInfo> findAll(){
		List<HjsUsersInfo> infoList= null;
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
	public boolean isUnique(HjsUsersInfo entity, String uniquePropertyNames){
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
	public Page<?> getUsersInfo(HjsUsersInfoQuery query){
		Page<HjsUsersInfo> infoPage=null;
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
				for(HjsUsersInfo info :infoPage.getResult()){
					HjsUsersInvite invite = new HjsUsersInvite();
					invite.setUserId(info.getUserId());
					HjsUsersInvite inviteUser = (HjsUsersInvite)findForObject("HjsUsersInvite.getByBaseId", invite);
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
	public HjsUsersInfo addHjsUsersInfo(HjsUsersInfo entity){
		try {
			save("HjsUser.insert",entity.getHjsUser());//登陆信息
			save("HjsUserBase.addUserBase",entity.getHjsUserBase());//账户信息
			entity.setLoginId(entity.getHjsUser().getId());
			entity.setUserId(entity.getHjsUserBase().getId());
			save("HjsUsersInfo.addUsersInfo",entity);//会员信息
			
			//保存手机认证信息
			HjsApproveSms sms = new HjsApproveSms();
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
			HjsUsersInvite usersInvite = new HjsUsersInvite();
			String inviteCode = entity.getInviteCode();
			HjsUsersInfo inviteUsersInfo = (HjsUsersInfo)findForObject("HjsUsersInfo.getInviteUser", inviteCode);
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
	public HjsUsersInfo getEditUsersInfo(HjsUsersInfoQuery query){
		HjsUsersInfo usersInfo = null;
		try {
			usersInfo = (HjsUsersInfo)findForObject("HjsUsersInfo.getUsersInfoById", query);
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
	public HjsUsersInfo editUsersInfo(HjsUsersInfo entity){
		
		try {
			update("HjsUser.updatePass",entity.getHjsUser());//登陆信息
			update("HjsUserBase.updatePass",entity.getHjsUserBase());//账户信息
			if(entity.getHjsUser().getPhone()!=null&&!entity.getHjsUser().getPhone().equals("")){
				HjsApproveSms sms = new HjsApproveSms();
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
	public HjsUsersInfo getUsersInfoByLoginId(Integer LoginId){
		HjsUsersInfo usersInfo = null;
		try {
			//会员信息
			HjsUsersInfoQuery hjsUsersInfoQuery = new HjsUsersInfoQuery();
			hjsUsersInfoQuery.setLoginId(LoginId);
			usersInfo = (HjsUsersInfo)findForObject("HjsUsersInfo.getByLoginId", hjsUsersInfoQuery);
			//会员账户信息
			if(usersInfo!=null && usersInfo.getUserId()!=null){
				HjsUserBaseQuery userBase = new HjsUserBaseQuery();
				userBase.setId(usersInfo.getUserId());		
				usersInfo.setHjsUserBase((HjsUserBase)super.findForObject("HjsUserBase.getById", userBase));
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
	public List<HjsUsersInfo> getUsersInfoByUsername(String username){
		List<HjsUsersInfo> infoPage=null;
		try {
			//会员信息
			HjsUsersInfoQuery hjsUsersInfoQuery = new HjsUsersInfoQuery();
			hjsUsersInfoQuery.setUsername(username);
			infoPage = (List<HjsUsersInfo>)findForList("HjsUsersInfo.getByUsername", hjsUsersInfoQuery);
			if(infoPage!=null&&infoPage.size()>0){
				for(HjsUsersInfo info:infoPage){
					HjsUserBaseQuery userBase = new HjsUserBaseQuery();
					userBase.setId(info.getUserId());		
					info.setHjsUserBase((HjsUserBase)super.findForObject("HjsUserBase.getById", userBase));
				}
			}					
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过username获取用户信息错误",e.getCause());
		}
		
		return infoPage;
	}
	
}
