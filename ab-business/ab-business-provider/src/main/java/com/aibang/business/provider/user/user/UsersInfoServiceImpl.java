package com.aibang.business.provider.user.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.fadada.FddClient;
import com.aibang.framework.utils.ShareCodeUtil;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveRealname;
import com.aibang.transfer.model.dto.HjsApproveSms;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.transfer.model.dto.HjsUserBase;
import com.aibang.transfer.model.dto.HjsUsersInfo;
import com.aibang.transfer.model.dto.HjsUsersInvite;
import com.aibang.transfer.model.vo.HjsApproveRealnameQuery;
import com.aibang.transfer.model.vo.HjsUserBaseQuery;
import com.aibang.transfer.model.vo.HjsUsersInfoQuery;
import com.alibaba.dubbo.rpc.RpcException;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */
@Service("usersInfoService")
@SuppressWarnings({"unchecked"})
public class UsersInfoServiceImpl  extends ProviderServiceBase<HjsUsersInfo,Integer> implements UsersInfoService {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
			hjsUsersInfo = super.getById(id);
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
			infoPage = findPage(query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台得到用户信息列表（分页）错误",e.getCause());
		}
		return infoPage;
	}
	/**
	 * 会员注册
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@Transactional
	public HjsUsersInfo registerUser(HjsUsersInfo entity){
		try {
			save("HjsUser.insert",entity.getHjsUser());//登陆信息
			save("HjsUserBase.addUserBase",entity.getHjsUserBase());//账户信息
			entity.setLoginId(entity.getHjsUser().getId());
			entity.setUserId(entity.getHjsUserBase().getId());
			

			//邀请码相关操作
			HjsUsersInvite usersInvite = new HjsUsersInvite();
			String inviteCode = entity.getInviteCode();
			//判断是否输入邀请码
			if(inviteCode!=null&&!inviteCode.equals("")){
				if(inviteCode.length()==6){
					HjsUsersInfo inviteUsersInfo = (HjsUsersInfo)findForObject("HjsUsersInfo.getInviteUser", inviteCode);
					if(inviteUsersInfo!=null){
						usersInvite.setInviteCode(inviteCode);
						usersInvite.setInviteUserId(inviteUsersInfo.getUserId());
						usersInvite.setInviteType(1);
						usersInvite.setCreateIp(entity.getHjsUser().getCreateIp());
						usersInvite.setCreateTime(new Date());
						usersInvite.setUserId(entity.getHjsUserBase().getId());
						save("HjsUsersInvite.insert",usersInvite);
						entity.setInviteUserid(inviteUsersInfo.getUserId());
					}
				}else{
					entity.setSource(entity.getInviteCode());
				}
				
			}

			save("HjsUsersInfo.addUsersInfo",entity);//会员信息
			//注册有手机验证，故设置手机验证通过
			HjsApproveSms approveSms = new HjsApproveSms();
			approveSms.setUserId(entity.getHjsUser().getId());
			approveSms.setType(1);
			approveSms.setStatus(1);//审核成功
			approveSms.setPhone(entity.getHjsUser().getPhone());
			approveSms.setCredit(0);
			approveSms.setCreateIp(entity.getHjsUser().getCreateIp());
			approveSms.setCreateTime(new Date());
			approveSms.setVerifyRemark("");
			approveSms.setVerifyTime(new Date());
			approveSms.setVerifyUserid(entity.getHjsUser().getId());
			save("HjsApproveSms.insert",approveSms);

			//生成邀请码
			entity.setInviteCode(ShareCodeUtil.toSerialCode(entity.getId()));
			update("HjsUsersInfo.createInviteCode",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"会员注册错误",e.getCause());
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
	 * 修改会员基本信息
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	public void updateUserBaseInfo(HjsUsersInfo entity){
		try {
			update(getIbatisMapperNamesapce()+".updateBase",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改会员基本信息错误",e.getCause());
		}
	}
	/**
	 * 修改会员详细信息
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	public void updateUserDetailInfo(HjsUsersInfo entity){
		try {
			update(getIbatisMapperNamesapce()+".updateDetail",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改会员详细信息错误",e.getCause());
		}
	}
	/**
	 * 修改会员头像地址
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	public void updateUserAvatar(HjsUsersInfo entity){
		try {
			update(getIbatisMapperNamesapce()+".updateAvatar",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改会员头像地址错误",e.getCause());
		}
	}
	
	
	/**
	 * 保存汇付信息
	 * @param entity
	 * @return HjsUsersInfo
	 * @author zhangyong
	 * @date 2015年11月18日
	 */
	@Transactional
	public void saveHF(HjsUsersInfo entity,HjsApproveRealname realName){
		HjsApproveRealname hjsApproveRealname = null;
		HjsApproveRealnameQuery hjsApproveRealnameQuery = new HjsApproveRealnameQuery();
		HjsUser user =new HjsUser();
		user.setId(realName.getUserId());
		user.setRealName(realName.getRealname());
		user.setRealNameStatus(1);
		try {
			//--------法大大开通开始----------
			try {
				String responseStr = FddClient.invokeSyncPersonAuto(realName.getRealname(), entity.getHjsUser().getEmail(), realName.getCardId(), entity.getHjsUser().getPhone());
				Map<String, Object> resultMap =JSON.parseObject(responseStr, new TypeReference<Map<String,Object>>(){});
				if(resultMap != null){
					String codeStr = (String)resultMap.get("code");
					if("1000".equals(codeStr)){
						entity.getHjsUserBase().setFadadaCaId((String)resultMap.get("customer_id"));
					}else{
						logger.error((String)resultMap.get("msg"));
					}
				}else{
					logger.error("法大大服务器相应失败");
				}
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("法大大开通失败");
			}
			//---------法大大开通结束-------------------
			update("HjsUserBase.saveHF",entity.getHjsUserBase());
			update("HjsUser.saveHF",entity.getHjsUser());
			hjsApproveRealnameQuery.setUserId(realName.getUserId());
			hjsApproveRealname = (HjsApproveRealname)findForObject("HjsApproveRealname.getByLoginId", hjsApproveRealnameQuery);
			if(hjsApproveRealname!=null&&hjsApproveRealname.getId()!=null){
				realName.setId(hjsApproveRealname.getId());
				update("HjsApproveRealname.activate",realName);
			}else{
				save("HjsApproveRealname.insert",realName);
			}
			update("HjsUser.activateRealName", user);//修改用户表相关实名认证状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"保存汇付信息错误",e.getCause());
		}
	}

	
	/**
	 * 通过userbaseid获得userinfo
	 */
	public HjsUsersInfo getUsersInfoByUserBaseId(Integer userBaseId) {
		HjsUsersInfo usersInfo = null;
		try {
			//会员信息
			HjsUsersInfoQuery hjsUsersInfoQuery = new HjsUsersInfoQuery();
			hjsUsersInfoQuery.setUserId(userBaseId);
			usersInfo = (HjsUsersInfo)findForObject("HjsUsersInfo.getByUserBaseId", hjsUsersInfoQuery);
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
	@Override
	public String getUserPhoneByUserBaseId(Integer userid) {
		try{
			HjsUsersInfoQuery hjsUsersInfoQuery = new HjsUsersInfoQuery();
			hjsUsersInfoQuery.setUserId(userid);
			return (String) findForObject("HjsUsersInfo.getUserPhoneByUserBaseId", hjsUsersInfoQuery);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过登录ID获取用户信息错误",e.getCause());
		}
	}
}