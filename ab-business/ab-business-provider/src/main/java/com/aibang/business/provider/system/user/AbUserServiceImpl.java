package com.aibang.business.provider.system.user;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aibang.business.api.system.user.AbUserService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbSysRole;
import com.aibang.transfer.model.dto.AbSysUserRole;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUsersOpt;
import com.aibang.transfer.model.vo.AbSysUserRoleQuery;
import com.aibang.transfer.model.vo.AbUserQuery;
import com.alibaba.dubbo.rpc.RpcException;


/**
 * @author
 * @version 1.0
 * @since 1.0
 */



@Service("abUserService")
@SuppressWarnings({"unchecked"})
public class AbUserServiceImpl  extends ProviderServiceBase<AbUser,Integer> implements AbUserService {

	@Override
	public String getIbatisMapperNamesapce() {
		return "AbUser";
	}

	/**
	 * 保存或修改用户信息
	 *  
	 * @param entity
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbUser saveOrUpdate(AbUser entity) {
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
	public Page findPage(AbUserQuery query) {
		return pageQuery(getIbatisMapperNamesapce() + ".findPage",query);
	}

	/**
	 * 通过username获得用户数据
	 *  
	 * @param param
	 * @return HjsUser
	 * @author zhangyong
	 * @date 2015年8月25日
	 */
	public AbUser getByUsername(String v) {
		return (AbUser)getSqlSessionTemplate().selectOne(getIbatisMapperNamesapce() + ".getByUsername",v);
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
	public AbUser saveObj(AbUser model) {
		try {
			super.save(model);
			//用户详细创建
			AbUsersOpt admin = model.getHjsUsersOpt();
			admin.setLoginId(model.getId());
			admin.setEntId(0);   //暂时设置成固定值，以后可拓展
			admin.setLastTime(new Date());
			admin.setOptUsername("");
			super.save("AbUsersOpt.insert",admin);
			//用户角色创建
			AbSysUserRole hsurq = new AbSysUserRole();
			hsurq.setUserId(model.getId());
			hsurq.setIsDel(0);
			hsurq.setCreateTime(new Date());
			hsurq.setVersion(0);
			if(model.getRoles()!=null && model.getRoles().size()>0){
				for(AbSysRole role:model.getRoles()){
					hsurq.setRoleId(role.getId());
					super.save("AbSysUserRole.insert", hsurq);
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
    public void update(AbUser model){
    	try {
    			super.update(model);
    			//用户详细修改
    			if(model.getHjsUsersOpt()!=null){
    				AbUsersOpt admin = model.getHjsUsersOpt();
    				admin.setLoginId(model.getId());
    				admin.setEntId(0);   //暂时设置成固定值，以后可拓展
    				admin.setLastTime(new Date());
    				admin.setOptUsername("");
    				super.update("AbUsersOpt.updateByLoginId",admin);
    			}
    			//用户角色修改
				AbSysUserRole hsur = new AbSysUserRole();
				hsur.setUserId(model.getId());
				super.delete("AbSysUserRole.deleteUserRole",hsur);
				hsur.setIsDel(0);
				hsur.setCreateTime(new Date());
				hsur.setVersion(0);
				if(model.getRoles()!=null&&model.getRoles().size()>0){
					for(AbSysRole role:model.getRoles()){
						if(role.getId()!=null){
							hsur.setRoleId(role.getId());
							super.save("AbSysUserRole.insert", hsur);
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
    public void remove(AbUser model){
    	try {
			super.remove(model);
			AbSysUserRoleQuery hsurq = new AbSysUserRoleQuery();
			hsurq.setUserId(model.getId());
			super.delete("AbSysUserRole.deleteUserRole",hsurq);
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
    public AbUser getById(Integer id){
    	try {
    		AbUser user = super.getById(id);
    		AbUsersOpt usersOpt = new AbUsersOpt();
    		usersOpt.setLoginId(id);
    		user.setHjsUsersOpt((AbUsersOpt)super.findForObject("AbUsersOpt.getByLoginId", usersOpt));
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
	public List<AbUser> findAll(){
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
	public boolean isUnique(AbUser entity, String uniquePropertyNames){

		try {
			AbUser user =null;
			if(uniquePropertyNames.equals("username")){
				user  = (AbUser)findForObject(getIbatisMapperNamesapce()+".userenameUnique", entity);
				if(user!=null&&user.getId()!=null){
					return false;
				}
			}else if(uniquePropertyNames.equals("email")){
				user  = (AbUser)findForObject(getIbatisMapperNamesapce()+".emailUnique", entity);
				if(user!=null&&user.getId()!=null){
					return false;
				}
			}else if(uniquePropertyNames.equals("phone")){
				user  = (AbUser)findForObject(getIbatisMapperNamesapce()+".phoneUnique", entity);
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
	public AbUser getSysUserByNameAndPwd(AbUserQuery query) {
		AbUser user = null;
		try {
			user = (AbUser) findForObject(getIbatisMapperNamesapce() + ".getUserInfo", query);
			
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
	public void deleteAllU(AbUserQuery query){
		try {
			AbSysUserRoleQuery hsurq = new AbSysUserRoleQuery();
			hsurq.setUserId(query.getId());
			hsurq.setSysUserIds(query.getSysUserIds());
			query.setDeleteTimeBegin(new Date());
			delete("AbSysUserRole.deleteUserRole",hsurq);
			delete(getIbatisMapperNamesapce()+".deleteAllU",query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"批量删除用户错误",e.getCause());
		}
	}

	@Override
	public AbUser getByPhone(String phone) {
		return (AbUser) findForObject(getIbatisMapperNamesapce() + ".getByPhone", phone);
	}
}
