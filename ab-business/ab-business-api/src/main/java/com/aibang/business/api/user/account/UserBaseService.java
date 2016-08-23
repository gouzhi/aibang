package com.aibang.business.api.user.account;
import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUserBase;
import com.aibang.transfer.model.vo.HjsUserBaseQuery;


 /**
  * @classname HjsUserBaseService    
  * @description 用户账户管理
  * @author liuj    
  * @date 2015年8月26日
  */
public interface UserBaseService {
    
	/** 
	 * 创建HjsUserBase
	 **/
	public HjsUserBase saveObj(HjsUserBase model);
	
	/** 
	 * 更新HjsUserBase
	 **/	
    public void update(HjsUserBase model);
    
	/** 
	 * 删除HjsUserBase
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUserBase
     */
    public void remove(HjsUserBase model);
    
	/** 
	 * 根据ID得到HjsUserBase
	 **/    
    public HjsUserBase getById(Integer id);
    
 
	public List<HjsUserBase> findAll();
	
	public HjsUserBase saveOrUpdate(HjsUserBase entity);
	 
	public boolean isUnique(HjsUserBase entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUserBase
	 **/      
	public Page<?> findPage(HjsUserBaseQuery query);

	/**
	 * 获取冻结与余额的总和
	 * @methodname findTotalBalance  
	 * @discription 列名 TotalBalance 
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findTotalBalance(HjsUserBaseQuery query);

	/**
	 * 获取用户账户详细信息
	 * @methodname findUserDetailById  
	 * @discription 用户信息账户信息
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findUserDetailById(HjsUserBaseQuery query);
	/**
	 * 前台修改账户支付密码
	 * @param entity void
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	public void editUserBase(HjsUserBase entity);
	/**
	 * 判断是否存在支付密码 true 已设置支付密码 false 未设置支付密码
	 * @param id 用户BASE表ID
	 * @return boolean
	 * @author zhangyong
	 * @date 2015年9月21日
	 */
	public boolean hasPayPass(Integer id);
	
	/**
	 * 获取用户Id
	 * 判断usrCustId是否为空
	 * @param usrCustId
	 * @return
	 */
	public Object findByUserCustId(String usrCustId);
	
}
