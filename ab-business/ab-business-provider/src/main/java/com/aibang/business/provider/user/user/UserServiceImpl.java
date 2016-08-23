package com.aibang.business.provider.user.user;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.user.user.UserService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsSysRole;
import com.aibang.transfer.model.dto.HjsSysUserRole;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.transfer.model.dto.HjsUsersOpt;
import com.aibang.transfer.model.vo.HjsSysUserRoleQuery;
import com.aibang.transfer.model.vo.HjsUserQuery;
import com.alibaba.dubbo.rpc.RpcException;


/**
 * @author
 * @version 1.0
 * @since 1.0
 */



@Service("userService")
@SuppressWarnings({"unchecked"})
public class UserServiceImpl  extends ProviderServiceBase<HjsUser,Integer> implements UserService {

	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUser";
	}

	/**
	 * 保存或修改用户信息
	 *  
	 * @param entity
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsUser saveOrUpdate(HjsUser entity) {
		if(entity.getId() == null)
			save(entity);
		else
			update(entity);
		return entity;
	}
	
	/**
	 * 分页查询用户数据
	 *  
	 * @param query
	 * @return Page
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUserQuery query) {
		return pageQuery("HjsUser.findPage",query);
	}

	/**
	 * 通过username获得用户数据
	 *  
	 * @param param
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public HjsUser getByUsername(String v) {
		return (HjsUser)getSqlSessionTemplate().selectOne("HjsUser.getByUsername",v);
	}

	/**
	 * 添加用户及相关信息
	 *  
	 * @param model
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Override
	public HjsUser saveObj(HjsUser model) {
		try {
			super.save(model);
			//用户详细创建
			HjsUsersOpt admin = model.getHjsUsersOpt();
			admin.setLoginId(model.getId());
			admin.setEntId(0);   //暂时设置成固定值，以后可拓展
			admin.setLastTime(new Date());
			admin.setOptUsername("");
			super.save("HjsUsersOpt.insert",admin);
			//用户角色创建
			HjsSysUserRole hsurq = new HjsSysUserRole();
			hsurq.setUserId(model.getId());
			hsurq.setIsDel(0);
			hsurq.setCreateTime(new Date());
			hsurq.setVersion(0);
			if(model.getRoles()!=null && model.getRoles().size()>0){
				for(HjsSysRole role:model.getRoles()){
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
    public void update(HjsUser model){
    	try {
    			super.update(model);
    			//用户详细修改
    			if(model.getHjsUsersOpt()!=null){
    				HjsUsersOpt admin = model.getHjsUsersOpt();
    				admin.setLoginId(model.getId());
    				admin.setEntId(0);   //暂时设置成固定值，以后可拓展
    				admin.setLastTime(new Date());
    				admin.setOptUsername("");
    				super.update("HjsUsersOpt.updateByLoginId",admin);
    			}
    			//用户角色修改
				HjsSysUserRole hsur = new HjsSysUserRole();
				hsur.setUserId(model.getId());
				super.delete("HjsSysUserRole.deleteUserRole",hsur);
				hsur.setIsDel(0);
				hsur.setCreateTime(new Date());
				hsur.setVersion(0);
				if(model.getRoles()!=null&&model.getRoles().size()>0){
					for(HjsSysRole role:model.getRoles()){
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
    public void remove(HjsUser model){
    	try {
			super.remove(model);
			HjsSysUserRoleQuery hsurq = new HjsSysUserRoleQuery();
			hsurq.setUserId(model.getId());
			super.delete("HjsSysUserRole.deleteUserRole",hsurq);
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
    public HjsUser getById(Integer id){
    	try {
    		HjsUser user = super.getById(id);
    		HjsUsersOpt usersOpt = new HjsUsersOpt();
    		usersOpt.setLoginId(id);
    		user.setHjsUsersOpt((HjsUsersOpt)super.findForObject("HjsUsersOpt.getByLoginId", usersOpt));
			return user;
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
	public List<HjsUser> findAll(){
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
	public boolean isUnique(HjsUser entity, String uniquePropertyNames){

		try {
			HjsUser user =null;
			if(uniquePropertyNames.equals("username")){
				user  = (HjsUser)findForObject(getIbatisMapperNamesapce()+".userenameUnique", entity);
				if(user!=null&&user.getId()!=null){
					return false;
				}
			}else if(uniquePropertyNames.equals("email")){
				user  = (HjsUser)findForObject(getIbatisMapperNamesapce()+".emailUnique", entity);
				if(user!=null&&user.getId()!=null){
					return false;
				}
			}else if(uniquePropertyNames.equals("phone")){
				user  = (HjsUser)findForObject(getIbatisMapperNamesapce()+".phoneUnique", entity);
				if(user!=null&&user.getId()!=null){
					return false;
				}
			}
			return true;
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"判断用户唯一错误",e.getCause());
		}
	}

	/**		
	 * 登陆判断
	 *  
	 * @param query
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Override
	public HjsUser getSysUserByNameAndPwd(HjsUserQuery query) {
		HjsUser user = null;
		try {
			user = (HjsUser) findForObject("HjsUser.getCustomerInfo", query);
			
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"通过username与pass获取用户信息错误",e.getCause());
		}
		return user;
	}
	/**	
	 * 批量删除用户数据（逻辑）
	 *  
	 * @param query void
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	@Transactional
	public void deleteAllU(HjsUserQuery query){
		try {
			HjsSysUserRoleQuery hsurq = new HjsSysUserRoleQuery();
			hsurq.setUserId(query.getId());
			hsurq.setSysUserIds(query.getSysUserIds());
			query.setDeleteTimeBegin(new Date());
			delete("HjsSysUserRole.deleteUserRole",hsurq);
			delete(getIbatisMapperNamesapce()+".deleteAllU",query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"批量删除用户错误",e.getCause());
		}
	}
	
	/**
	 * 前台修改会员登录密码
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月17日
	 */
	public void updateCustomerPass(HjsUser entity){
		try {
			super.update("HjsUser.updateCustomerPass",entity);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"前台修改会员登录密码错误",e.getCause());
		}
	}
	/**
	 * 前台通过用户名/手机/邮箱查询会员
	 * @param name
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年9月24日
	 */
	public HjsUser getByName(String name){
		HjsUser user = null;
		try {
			HjsUserQuery userQuery = new HjsUserQuery();
			userQuery.setEmail(name);
			userQuery.setUsername(name);
			userQuery.setPhone(name);
			user = (HjsUser)findForObject(getIbatisMapperNamesapce()+".getByName", userQuery);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"前台通过用户名/手机/邮箱查询会员错误",e.getCause());
		}		
		return user;
	}
}
