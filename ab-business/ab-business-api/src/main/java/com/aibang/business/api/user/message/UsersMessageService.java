package com.aibang.business.api.user.message;

import java.util.List;

import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUsersMessage;
import com.aibang.transfer.model.vo.AbUsersMessageQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface UsersMessageService {
    
	/** 
	 * 创建HjsUsersMessage
	 **/
	public AbUsersMessage saveObj(AbUsersMessage model);
	
	/** 
	 * 更新HjsUsersMessage
	 **/	
    public void update(AbUsersMessage model);
    
	/** 
	 * 删除HjsUsersMessage
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersMessage
     */
    public void remove(AbUsersMessage model);
    
	/** 
	 * 根据ID得到HjsUsersMessage
	 **/    
    public AbUsersMessage getById(Integer id);
    
 
	public List<AbUsersMessage> findAll();
	
	public AbUsersMessage saveOrUpdate(AbUsersMessage entity);
	 
	public boolean isUnique(AbUsersMessage entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersMessage
	 **/      
	@SuppressWarnings("rawtypes")
	public Page findPage(AbUsersMessageQuery query);

	/**
	 * 分页查询已收到的消息（type=2 or type=3）
	 * @param receiveUserid
	 * @return Page
	 * @author zeng.fangfang
	 * @date 2015年9月22日
	 */
	@SuppressWarnings("rawtypes")
	public Page findNoticesPageByUserId(AbUsersMessageQuery query);

	/**
	 * 执行标记已读
	 * @param records 需要被标记已读的消息ID数组（前台传参为[?,?,?,?,?,]）
	 * @author zeng.fangfang
	 * @date 2015年9月23日
	 */
	public void domark(Integer[] records);

	/**
	 * 执行删除
	 * @param records 需要被删除的消息ID数组（前台传参为[?,?,?,?,?,]）
	 * @author zeng.fangfang
	 * @date 2015年9月23日
	 */
	public void doremove(Integer[] records);
	/**
	 * 统计登录用户未读的消息数量
	 * @param receiveLoginid
	 * @return Integer
	 * @author wang wei
	 * @date 2016年1月20日
	 */
	public Integer getUnreadMessageCount(Integer receiveLoginid);
}
