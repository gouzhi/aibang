package com.aibang.business.api.system.account;
import java.util.List;
import java.util.Map;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.vo.AbUserBaseQuery;


 /**
  * @classname HjsUserBaseService    
  * @description 用户账户管理
  * @author liuj    
  * @date 2015年8月26日
  */
public interface AbUserBaseService {
    
	/** 
	 * 创建HjsUserBase
	 **/
	public AbUserBase saveObj(AbUserBase model);
	
	/** 
	 * 更新HjsUserBase
	 **/	
    public void update(AbUserBase model);
    
	/** 
	 * 删除HjsUserBase
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUserBase
     */
    public void remove(AbUserBase model);
    
	/** 
	 * 根据ID得到HjsUserBase
	 **/    
    public AbUserBase getById(Integer id);
    
 
	public List<AbUserBase> findAll();
	
	public AbUserBase saveOrUpdate(AbUserBase entity);
	 
	public boolean isUnique(AbUserBase entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUserBase
	 **/      
	public Page<?> findPage(AbUserBaseQuery query);

	/**
	 * 获取冻结与余额的总和
	 * @methodname findTotalBalance  
	 * @discription 列名 TotalBalance 
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findTotalBalance(AbUserBaseQuery query);

	/**
	 * 获取用户账户详细信息
	 * @methodname findUserDetailById  
	 * @discription 用户信息账户信息
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findUserDetailById(AbUserBaseQuery query);
	/**
	 * 根据ID修改是否是新手
	 * @param id void
	 * @author wang wei
	 * @date 2016年4月13日
	 */
	public void updateIsNewById(Integer id);
	
	/**
	 * 帮没有开通法大大的用户去开通
	 * @methodname synFadada  
	 * @discription TODO  void
	 * @author yinzhigang
	 * @date 2016年7月25日
	 */
	public String synFadada();
	
	/**
	 * 通过baseid查询用户
	 * @methodname getByBaseId  
	 * @discription TODO 
	 * @param id
	 * @return HjsUserBase
	 * @author yinzhigang
	 * @date 2016年7月26日
	 */
	public AbUserBase getByBaseId(Integer id);
	
	
	/**
	 * @methodname authorTrade  
	 * @discription  借款人授权签章
	 * @param userId 借款人ID
	 * @param fadadaCaId 客户编号
	 * @param clientType 客户类型  1个人 2企业
	 * @author wanglongwei
	 * @date 2016年8月1日
	 */
	public String authorTrade (Integer userId,String fadadaCaId,String clientType);
	
	/**
	 * @methodname synCallBack  
	 * @discription 同步回调
	 * @param userId 用户id
	 * @param authorContractId 合同号
	 * @param end 结束时间
	 * @param authorTradeId 授权交易号
	 * @author wanglongwei
	 * @date 2016年8月2日
	 */
	public Map<String,Object> synCallBack (Integer userId, String authorContractId,String end, String authorTradeId);
}
