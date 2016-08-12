package com.cifex.business.api.user.message;

import java.util.List;

import com.cifex.framework.utils.page.Page;
import com.cifex.transfer.model.dto.HjsUsersMessage;
import com.cifex.transfer.model.vo.HjsUsersMessageQuery;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
public interface UsersMessageService {
    
	/** 
	 * 创建HjsUsersMessage
	 **/
	public HjsUsersMessage saveObj(HjsUsersMessage model);
	
	/** 
	 * 更新HjsUsersMessage
	 **/	
    public void update(HjsUsersMessage model);
    
	/** 
	 * 删除HjsUsersMessage
	 **/
    public void deleteById(Integer id);
    
    /** 
     * 逻辑删除HjsUsersMessage
     */
    public void remove(HjsUsersMessage model);
    
	/** 
	 * 根据ID得到HjsUsersMessage
	 **/    
    public HjsUsersMessage getById(Integer id);
    
 
	public List<HjsUsersMessage> findAll();
	
	public HjsUsersMessage saveOrUpdate(HjsUsersMessage entity);
	 
	public boolean isUnique(HjsUsersMessage entity, String uniquePropertyNames);
	
	/** 
	 * 分页查询: HjsUsersMessage
	 **/      
	@SuppressWarnings("rawtypes")
	public Page findPage(HjsUsersMessageQuery query);

	/**
	 * 分页查询已收到的消息（type=2 or type=3）
	 * @param receiveUserid
	 * @return Page
	 * @author zeng.fangfang
	 * @date 2015年9月22日
	 */
	@SuppressWarnings("rawtypes")
	public Page findNoticesPageByUserId(HjsUsersMessageQuery query);

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
