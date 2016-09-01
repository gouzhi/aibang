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
@Service("AbUsersInfoService")
@SuppressWarnings({"unchecked"})
public class AbUsersInfoServiceImpl  extends ProviderServiceBase<AbUsersInfo,Integer> implements AbUsersInfoService {
	@Override
	public String getIbatisMapperNamesapce() {
		return "AbUsersInfo";
	}
	/**
	 * 添加或修改会员信息
	 * @param entity
	 * @return AbUsersInfo
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
		return pageQuery(getIbatisMapperNamesapce() + ".findPage",query);
	}
	/**
	 * 新增会员信息
	 * @param model
	 * @return AbUsersInfo
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
     * @return AbUsersInfo
     * @author zhangyong
     * @date 2015年8月31日
     */
    public AbUsersInfo getById(Integer id){
    	AbUsersInfo AbUsersInfo = null;
    	try {
    		AbUsersInfo = getById(id);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID得到会员信息错误",e.getCause());
		}
		return AbUsersInfo;
    }
    /**
     * 得到所有会员信息列表
     * @return List<AbUsersInfo>
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
					AbUsersInvite inviteUser = (AbUsersInvite)findForObject("AbUsersInvite.getByBaseId", invite);
					info.setAbUsersInvite(inviteUser);
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
	 * @return AbUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@Transactional
	public AbUsersInfo addAbUsersInfo(AbUsersInfo entity){
		try {
			save("AbUser.insert",entity.getAbUser());//登陆信息
			save("AbUserBase.addUserBase",entity.getAbUserBase());//账户信息
			entity.setLoginId(entity.getAbUser().getId());
			entity.setUserId(entity.getAbUserBase().getId());
			save(getIbatisMapperNamesapce() + ".addUsersInfo",entity);//会员信息
			
			//保存手机认证信息
			AbApproveSms sms = new AbApproveSms();
			sms.setUserId(entity.getAbUser().getId());//用户登录ID
			sms.setStatus(0);//认证状态0未认证
			sms.setType(1);//类型
			sms.setPhone(entity.getAbUser().getPhone());//手机号
			sms.setCreateTime(new Date());//创建时间
			sms.setCreateIp(entity.getAbUser().getCreateIp());//创建IP
			sms.setCredit(0);//验证码默认0
			sms.setVerifyTime(sms.getCreateTime());//验证时间，此时与创建时间相同
			sms.setVerifyUserid(entity.getAbUser().getId());//验证用户ID，此时为自己
			sms.setVerifyRemark("");//备注
			save("AbApproveSms.insert",sms);
			
			//邀请码相关操作
			AbUsersInvite usersInvite = new AbUsersInvite();
			String inviteCode = entity.getInviteCode();
			AbUsersInfo inviteUsersInfo = (AbUsersInfo)findForObject(getIbatisMapperNamesapce() + ".getInviteUser", inviteCode);
			if(inviteUsersInfo!=null){
				usersInvite.setInviteCode(inviteCode);//邀请码
				usersInvite.setInviteUserId(inviteUsersInfo.getUserId());//邀请用户ID
				usersInvite.setInviteType(1);//邀请类型
				usersInvite.setCreateIp(entity.getAbUser().getCreateIp());//创建IP
				usersInvite.setCreateTime(new Date());//创建时间
				usersInvite.setUserId(entity.getAbUserBase().getId());//账户ID
				save("AbUsersInvite.insert",usersInvite);
				entity.setInviteUserid(inviteUsersInfo.getUserId());
			}
			
			
			//生成邀请码
			entity.setInviteCode(ShareCodeUtil.toSerialCode(entity.getId()));
			update(getIbatisMapperNamesapce() + ".createInviteCode",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台添加会员错误",e.getCause());
		}
		return entity;
	}
	/**
	 * 后台加载修改会员信息
	 * @param query
	 * @return AbUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	public AbUsersInfo getEditUsersInfo(AbUsersInfoQuery query){
		AbUsersInfo usersInfo = null;
		try {
			usersInfo = (AbUsersInfo)findForObject(getIbatisMapperNamesapce() + ".getUsersInfoById", query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台加载修改会员信息错误",e.getCause());
		}
		return usersInfo;
	}
	/**
	 * 后台修改会员基本信息
	 * @param entity
	 * @return AbUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@Transactional
	public AbUsersInfo editUsersInfo(AbUsersInfo entity){
		
		try {
			update("AbUser.updatePass",entity.getAbUser());//登陆信息
			update("AbUserBase.updatePass",entity.getAbUserBase());//账户信息
			if(entity.getAbUser().getPhone()!=null&&!entity.getAbUser().getPhone().equals("")){
				AbApproveSms sms = new AbApproveSms();
				sms.setUserId(entity.getLoginId());
				sms.setPhone(entity.getAbUser().getPhone());
				sms.setStatus(0);
				update("AbApproveSms.updatePhone",sms);
			}
			
			
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台修改会员基本信息错误",e.getCause());
		}
		return entity;
	}
	/**
	 * 通过登录ID获取用户信息
	 * @param query
	 * @return AbUsersInfo
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	public AbUsersInfo getUsersInfoByLoginId(Integer LoginId){
		AbUsersInfo usersInfo = null;
		try {
			//会员信息
			AbUsersInfoQuery AbUsersInfoQuery = new AbUsersInfoQuery();
			AbUsersInfoQuery.setLoginId(LoginId);
			usersInfo = (AbUsersInfo)findForObject(getIbatisMapperNamesapce() + ".getByLoginId", AbUsersInfoQuery);
			//会员账户信息
			if(usersInfo!=null && usersInfo.getUserId()!=null){
				AbUserBaseQuery userBase = new AbUserBaseQuery();
				userBase.setId(usersInfo.getUserId());		
				usersInfo.setAbUserBase((AbUserBase)super.findForObject("AbUserBase.getById", userBase));
			}
			
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过登录ID获取用户信息错误",e.getCause());
		}
		return usersInfo;
	}
	/**
	 * 通过username获取用户信息
	 * @param query
	 * @return AbUsersInfo
	 * @author zhangyong
	 * @date 2015年9月15日
	 */
	public List<AbUsersInfo> getUsersInfoByUsername(String username){
		List<AbUsersInfo> infoPage=null;
		try {
			//会员信息
			AbUsersInfoQuery AbUsersInfoQuery = new AbUsersInfoQuery();
			AbUsersInfoQuery.setUsername(username);
			infoPage = (List<AbUsersInfo>)findForList(getIbatisMapperNamesapce() + ".getByUsername", AbUsersInfoQuery);
			if(infoPage!=null&&infoPage.size()>0){
				for(AbUsersInfo info:infoPage){
					AbUserBaseQuery userBase = new AbUserBaseQuery();
					userBase.setId(info.getUserId());		
					info.setAbUserBase((AbUserBase)super.findForObject("AbUserBase.getById", userBase));
				}
			}					
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过username获取用户信息错误",e.getCause());
		}
		
		return infoPage;
	}
}
