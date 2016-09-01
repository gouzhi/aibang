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
import com.aibang.transfer.model.dto.AbApproveRealname;
import com.aibang.transfer.model.dto.AbApproveSms;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.dto.AbUsersInfo;
import com.aibang.transfer.model.dto.AbUsersInvite;
import com.aibang.transfer.model.vo.AbApproveRealnameQuery;
import com.aibang.transfer.model.vo.AbUserBaseQuery;
import com.aibang.transfer.model.vo.AbUsersInfoQuery;
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
public class UsersInfoServiceImpl  extends ProviderServiceBase<AbUsersInfo,Integer> implements UsersInfoService {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
		return pageQuery("AbUsersInfo.findPage",query);
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
			AbUsersInfo = super.getById(id);
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
			infoPage = findPage(query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"后台得到用户信息列表（分页）错误",e.getCause());
		}
		return infoPage;
	}
	/**
	 * 会员注册
	 * @param entity
	 * @return AbUsersInfo
	 * @author zhangyong
	 * @date 2015年9月1日
	 */
	@Transactional
	public AbUsersInfo registerUser(AbUsersInfo entity){
		try {
			save("AbUser.insert",entity.getAbUser());//登陆信息
			save("AbUserBase.addUserBase",entity.getAbUserBase());//账户信息
			entity.setLoginId(entity.getAbUser().getId());
			entity.setUserId(entity.getAbUserBase().getId());
			

			//邀请码相关操作
			AbUsersInvite usersInvite = new AbUsersInvite();
			String inviteCode = entity.getInviteCode();
			//判断是否输入邀请码
			if(inviteCode!=null&&!inviteCode.equals("")){
				if(inviteCode.length()==6){
					AbUsersInfo inviteUsersInfo = (AbUsersInfo)findForObject("AbUsersInfo.getInviteUser", inviteCode);
					if(inviteUsersInfo!=null){
						usersInvite.setInviteCode(inviteCode);
						usersInvite.setInviteUserId(inviteUsersInfo.getUserId());
						usersInvite.setInviteType(1);
						usersInvite.setCreateIp(entity.getAbUser().getCreateIp());
						usersInvite.setCreateTime(new Date());
						usersInvite.setUserId(entity.getAbUserBase().getId());
						save("AbUsersInvite.insert",usersInvite);
						entity.setInviteUserid(inviteUsersInfo.getUserId());
					}
				}else{
					entity.setSource(entity.getInviteCode());
				}
				
			}

			save("AbUsersInfo.addUsersInfo",entity);//会员信息
			//注册有手机验证，故设置手机验证通过
			AbApproveSms approveSms = new AbApproveSms();
			approveSms.setUserId(entity.getAbUser().getId());
			approveSms.setType(1);
			approveSms.setStatus(1);//审核成功
			approveSms.setPhone(entity.getAbUser().getPhone());
			approveSms.setCredit(0);
			approveSms.setCreateIp(entity.getAbUser().getCreateIp());
			approveSms.setCreateTime(new Date());
			approveSms.setVerifyRemark("");
			approveSms.setVerifyTime(new Date());
			approveSms.setVerifyUserid(entity.getAbUser().getId());
			save("AbApproveSms.insert",approveSms);

			//生成邀请码
			entity.setInviteCode(ShareCodeUtil.toSerialCode(entity.getId()));
			update("AbUsersInfo.createInviteCode",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"会员注册错误",e.getCause());
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
			usersInfo = (AbUsersInfo)findForObject("AbUsersInfo.getUsersInfoById", query);
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
			usersInfo = (AbUsersInfo)findForObject("AbUsersInfo.getByLoginId", AbUsersInfoQuery);
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
	 * 修改会员基本信息
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	public void updateUserBaseInfo(AbUsersInfo entity){
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
	public void updateUserDetailInfo(AbUsersInfo entity){
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
	public void updateUserAvatar(AbUsersInfo entity){
		try {
			update(getIbatisMapperNamesapce()+".updateAvatar",entity);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"修改会员头像地址错误",e.getCause());
		}
	}
	
	
	/**
	 * 保存汇付信息
	 * @param entity
	 * @return AbUsersInfo
	 * @author zhangyong
	 * @date 2015年11月18日
	 */
	@Transactional
	public void saveHF(AbUsersInfo entity,AbApproveRealname realName){
		AbApproveRealname AbApproveRealname = null;
		AbApproveRealnameQuery AbApproveRealnameQuery = new AbApproveRealnameQuery();
		AbUser user =new AbUser();
		user.setId(realName.getUserId());
		user.setRealName(realName.getRealname());
		user.setRealNameStatus(1);
		try {
			//--------法大大开通开始----------
			try {
				String responseStr = FddClient.invokeSyncPersonAuto(realName.getRealname(), entity.getAbUser().getEmail(), realName.getCardId(), entity.getAbUser().getPhone());
				Map<String, Object> resultMap =JSON.parseObject(responseStr, new TypeReference<Map<String,Object>>(){});
				if(resultMap != null){
					String codeStr = (String)resultMap.get("code");
					if("1000".equals(codeStr)){
						entity.getAbUserBase().setFadadaCaId((String)resultMap.get("customer_id"));
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
			update("AbUserBase.saveHF",entity.getAbUserBase());
			update("AbUser.saveHF",entity.getAbUser());
			AbApproveRealnameQuery.setUserId(realName.getUserId());
			AbApproveRealname = (AbApproveRealname)findForObject("AbApproveRealname.getByLoginId", AbApproveRealnameQuery);
			if(AbApproveRealname!=null&&AbApproveRealname.getId()!=null){
				realName.setId(AbApproveRealname.getId());
				update("AbApproveRealname.activate",realName);
			}else{
				save("AbApproveRealname.insert",realName);
			}
			update("AbUser.activateRealName", user);//修改用户表相关实名认证状态
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"保存汇付信息错误",e.getCause());
		}
	}

	
	/**
	 * 通过userbaseid获得userinfo
	 */
	public AbUsersInfo getUsersInfoByUserBaseId(Integer userBaseId) {
		AbUsersInfo usersInfo = null;
		try {
			//会员信息
			AbUsersInfoQuery AbUsersInfoQuery = new AbUsersInfoQuery();
			AbUsersInfoQuery.setUserId(userBaseId);
			usersInfo = (AbUsersInfo)findForObject("AbUsersInfo.getByUserBaseId", AbUsersInfoQuery);
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
	@Override
	public String getUserPhoneByUserBaseId(Integer userid) {
		try{
			AbUsersInfoQuery AbUsersInfoQuery = new AbUsersInfoQuery();
			AbUsersInfoQuery.setUserId(userid);
			return (String) findForObject("AbUsersInfo.getUserPhoneByUserBaseId", AbUsersInfoQuery);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过登录ID获取用户信息错误",e.getCause());
		}
	}
}
