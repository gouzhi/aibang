package com.cifex.business.provider.system.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.dubbo.rpc.RpcException;
import com.cifex.business.api.system.user.HjsUsersOptService;
import com.cifex.business.provider.base.ProviderServiceBase;
import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsSysRole;
import com.cifex.transfer.model.dto.HjsSysUserRole;
import com.cifex.transfer.model.dto.HjsUser;
import com.cifex.transfer.model.dto.HjsUserBase;
import com.cifex.transfer.model.dto.HjsUsersEnterprice;
import com.cifex.transfer.model.dto.HjsUsersOpt;
import com.cifex.transfer.model.vo.HjsSysUserRoleQuery;
import com.cifex.transfer.model.vo.HjsUserBaseQuery;
import com.cifex.transfer.model.vo.HjsUsersEnterpriceQuery;
import com.cifex.transfer.model.vo.HjsUsersOptQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsUsersOptService")
@SuppressWarnings({"unchecked"})
public class HjsUsersOptServiceImpl  extends ProviderServiceBase<HjsUsersOpt,Integer> implements HjsUsersOptService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersOpt";
	}
	
	public HjsUsersOpt saveOrUpdate(HjsUsersOpt entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUsersOptQuery query) {
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
			return	pageQuery("HjsUsersOpt.findPage",query);
		}catch (Exception e) {
				throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"分页获得信息错误",e.getCause());
			}
		 
	}
	
	public HjsUsersOpt saveObj(HjsUsersOpt model)
	{
		
		try {
			save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"保存添加用户信息错误",e.getCause());
		}
		return model;
	}
	/**
	 * 通过登录ID获取用户相关数据(企业信息，账户信息，企业用户信息)
	 * @param id
	 * @return HjsUsersOpt
	 * @author zhangyong
	 * @date 2015年8月26日
	 */
	public HjsUsersOpt getUsersOptByLoginId(Integer id){
		HjsUsersOpt usersOpt =null;
		try {
			HjsUsersOptQuery usersOptQuery = new HjsUsersOptQuery();
			usersOptQuery.setLoginId(id);
			//得到企业用户信息
			usersOpt = (HjsUsersOpt)super.findForObject("HjsUsersOpt.getByLoginId", usersOptQuery);
			HjsUsersEnterpriceQuery hjsUsersEnterpriceQuery = new HjsUsersEnterpriceQuery();
			hjsUsersEnterpriceQuery.setId(usersOpt.getEntId());
			//得到企业信息
			HjsUsersEnterprice hjsUsersEnterprice = (HjsUsersEnterprice)super.findForObject("HjsUsersEnterprice.getById", hjsUsersEnterpriceQuery);
			HjsUserBaseQuery userBase = new HjsUserBaseQuery();
			userBase.setId(hjsUsersEnterprice.getUserId());
			//得到企业账户信息
			hjsUsersEnterprice.setHjsUserBase((HjsUserBase)super.findForObject("HjsUserBase.getById", userBase));		
			usersOpt.setHjsUsersEnterprice(hjsUsersEnterprice);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过登录ID获取用户相关数据错误",e.getCause());
		}		
		return usersOpt;
	}
	/**
	 * 添加用户及相关信息
	 *  
	 * @param model
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Transactional
	public HjsUsersOpt saveUser(HjsUsersOpt model) {
		try {
			//用户登陆信息创建
			super.save("HjsUser.insert",model.getHjsUser());
			//平台用户信息创建
			model.setLoginId(model.getHjsUser().getId());
			model.setEntId(0);   //暂时设置成固定值，以后可拓展
			model.setLastTime(new Date());
			model.setOptUsername("");
			super.save(model);
			
			
			//用户角色创建
			HjsSysUserRole hsurq = new HjsSysUserRole();
			hsurq.setUserId(model.getHjsUser().getId());
			hsurq.setIsDel(0);
			hsurq.setCreateTime(new Date());
			hsurq.setVersion(0);
			if(model.getHjsUser().getRoles()!=null && model.getHjsUser().getRoles().size()>0){
				for(HjsSysRole role:model.getHjsUser().getRoles()){
					hsurq.setRoleId(role.getId());
					super.save("HjsSysUserRole.insert", hsurq);
				}
			}
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"新增用户错误",e.getCause());
		}

		return model;
	}


	/**
	 * 修改用户及相关信息	
	 *  
	 * @param model void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Transactional
    public void update(HjsUsersOpt model){
    	try {
    			//用户登陆信息修改
    			super.update("HjsUser.update",model.getHjsUser());    			
    			//用户详细修改
    			model.setLoginId(model.getHjsUser().getId());
    			model.setEntId(0);   //暂时设置成固定值，以后可拓展
    			model.setLastTime(new Date());
    			model.setOptUsername("");
    			super.update(model);
    			//用户角色修改
    			if(model.getHjsUser().getRoles()!=null&&model.getHjsUser().getRoles().size()>0){
					HjsSysUserRole hsur = new HjsSysUserRole();
					hsur.setUserId(model.getHjsUser().getId());
					super.delete("HjsSysUserRole.deleteUserRole",hsur);
					hsur.setIsDel(0);
					hsur.setCreateTime(new Date());
					hsur.setVersion(0);
						for(HjsSysRole role:model.getHjsUser().getRoles()){
							if(role.getId()!=null){
								hsur.setRoleId(role.getId());
								super.save("HjsSysUserRole.insert", hsur);
							}
						}
				}
				


		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"更新用户错误",e.getCause());
		}
    }

    /**
	 * 通过ID删除用户数据
	 *  
	 * @param id void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
    public void deleteById(Integer id){
    	try {
			super.deleteById(id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"删除用户错误",e.getCause());
		}
    }

    /**
     * 逻辑删除用户数据
     *  
     * @param model void
     * @author zhangyong
     * @date 2015年8月25日
     */
    @Transactional
    public void removeUser(HjsUsersOpt model){
    	try {
    		HjsUser user = getById(model.getId()).getHjsUser();
    		user.setDeleteTime(new Date());
			super.delete("HjsUser.remove",user);//删除登陆信息（逻辑）
			HjsSysUserRoleQuery hsurq = new HjsSysUserRoleQuery();
			hsurq.setUserId(user.getId());
			super.delete("HjsSysUserRole.deleteUserRole",hsurq);//移除用户角色
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"逻辑删除用户错误",e.getCause());
		}
    }

    /**   
     * 通过ID的到用户信息
     *  
     * @param id
     * @return HjsUser
     * @author zhangyong
     * @date 2015年8月25日
     */
    public HjsUsersOpt getById(Integer id){
    	try {
    		HjsUsersOpt usersOpt = super.getById(id);
    		HjsUser user = new HjsUser();
    		user.setId(usersOpt.getLoginId());
    		usersOpt.setHjsUser((HjsUser)super.findForObject("HjsUser.getById", user));
			return usersOpt;
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过ID获得用户信息错误",e.getCause());
		}
    }

    /**
     * 得到所有用户信息
     *  
     * @return List<HjsUser>
     * @author zhangyong
     * @date 2015年8月25日
     */
	public List<HjsUsersOpt> findAll(){
		try {
			return super.findAll();
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"查询所有用户错误",e.getCause());
		}
	}

	/**
	  * 判断用户唯一性
	  *  
	  * @param entity
	  * @param uniquePropertyNames
	  * @return boolean
	  * @author zhangyong
	  * @date 2015年8月25日
	  */
	public boolean isUnique(HjsUsersOpt entity, String uniquePropertyNames){

		try {
			return super.isUnique(entity, uniquePropertyNames);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"判断用户唯一错误",e.getCause());
		}
	}

	
	/**	
	 * 批量删除用户数据（逻辑）
	 *  
	 * @param query void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Transactional
	public void deleteAllU(HjsUsersOptQuery query){
		try {
			HjsSysUserRoleQuery hsurq = new HjsSysUserRoleQuery();
			hsurq.setUserId(query.getHjsUserQuery().getId());
			HjsUser user = getById(query.getId()).getHjsUser();
			hsurq.setSysUserIds(query.getUserIds());
			user.setDeleteTime(new Date());
			delete("HjsSysUserRole.deleteUserRole",hsurq);//移除用户角色
			delete("HjsUser.deleteAllU",user);//批量删除（逻辑）
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"批量删除用户错误",e.getCause());
		}
	}

	@Override
	public HjsUsersOpt getByUserId(Integer userid) {
		try {
			HjsUsersOptQuery hjsUsersOptQuery = new HjsUsersOptQuery();
			hjsUsersOptQuery.setLoginId(userid);
			HjsUsersOpt usersOpt = (HjsUsersOpt)findForObject("HjsUsersOpt.getByUserId", hjsUsersOptQuery);
			return usersOpt;
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过用户id获取信息失败",e.getCause());
		}
		
	}
	
	 
}
