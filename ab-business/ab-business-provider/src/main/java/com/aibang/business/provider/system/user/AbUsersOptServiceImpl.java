package com.aibang.business.provider.system.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.system.user.AbUsersOptService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysRole;
import com.aibang.transfer.model.dto.AbSysUserRole;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUsersOpt;
import com.aibang.transfer.model.vo.AbSysUserRoleQuery;
import com.aibang.transfer.model.vo.AbUsersOptQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("hjsUsersOptService")
@SuppressWarnings({"unchecked"})
public class AbUsersOptServiceImpl  extends ProviderServiceBase<AbUsersOpt,Integer> implements AbUsersOptService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersOpt";
	}
	
	public AbUsersOpt saveOrUpdate(AbUsersOpt entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(AbUsersOptQuery query) {
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
	
	public AbUsersOpt saveObj(AbUsersOpt model)
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
	public AbUsersOpt getUsersOptByLoginId(Integer id){
		AbUsersOpt usersOpt =null;
		try {
			AbUsersOptQuery usersOptQuery = new AbUsersOptQuery();
			usersOptQuery.setLoginId(id);
			//得到企业用户信息
			usersOpt = (AbUsersOpt)super.findForObject("HjsUsersOpt.getByLoginId", usersOptQuery);
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
	public AbUsersOpt saveUser(AbUsersOpt model) {
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
			AbSysUserRole hsurq = new AbSysUserRole();
			hsurq.setUserId(model.getHjsUser().getId());
			hsurq.setIsDel(0);
			hsurq.setCreateTime(new Date());
			hsurq.setVersion(0);
			if(model.getHjsUser().getRoles()!=null && model.getHjsUser().getRoles().size()>0){
				for(AbSysRole role:model.getHjsUser().getRoles()){
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
    public void update(AbUsersOpt model){
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
					AbSysUserRole hsur = new AbSysUserRole();
					hsur.setUserId(model.getHjsUser().getId());
					super.delete("HjsSysUserRole.deleteUserRole",hsur);
					hsur.setIsDel(0);
					hsur.setCreateTime(new Date());
					hsur.setVersion(0);
						for(AbSysRole role:model.getHjsUser().getRoles()){
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
    public void removeUser(AbUsersOpt model){
    	try {
    		AbUser user = getById(model.getId()).getHjsUser();
    		user.setDeleteTime(new Date());
			super.delete("HjsUser.remove",user);//删除登陆信息（逻辑）
			AbSysUserRoleQuery hsurq = new AbSysUserRoleQuery();
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
    public AbUsersOpt getById(Integer id){
    	try {
    		AbUsersOpt usersOpt = super.getById(id);
    		AbUser user = new AbUser();
    		user.setId(usersOpt.getLoginId());
    		usersOpt.setHjsUser((AbUser)super.findForObject("HjsUser.getById", user));
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
	public List<AbUsersOpt> findAll(){
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
	public boolean isUnique(AbUsersOpt entity, String uniquePropertyNames){

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
	public void deleteAllU(AbUsersOptQuery query){
		try {
			AbSysUserRoleQuery hsurq = new AbSysUserRoleQuery();
			hsurq.setUserId(query.getHjsUserQuery().getId());
			AbUser user = getById(query.getId()).getHjsUser();
			hsurq.setSysUserIds(query.getUserIds());
			user.setDeleteTime(new Date());
			delete("HjsSysUserRole.deleteUserRole",hsurq);//移除用户角色
			delete("HjsUser.deleteAllU",user);//批量删除（逻辑）
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"批量删除用户错误",e.getCause());
		}
	}

	@Override
	public AbUsersOpt getByUserId(Integer userid) {
		try {
			AbUsersOptQuery hjsUsersOptQuery = new AbUsersOptQuery();
			hjsUsersOptQuery.setLoginId(userid);
			AbUsersOpt usersOpt = (AbUsersOpt)findForObject("HjsUsersOpt.getByUserId", hjsUsersOptQuery);
			return usersOpt;
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过用户id获取信息失败",e.getCause());
		}
		
	}
	
	 
}
