package com.aibang.business.provider.user.message;

import org.springframework.stereotype.Service;

import com.aibang.business.api.user.message.UsersMessageService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsUsersMessage;
import com.aibang.transfer.model.vo.HjsUsersMessageQuery;
import com.alibaba.dubbo.rpc.RpcException;
 
 
/** 
 * @author 
 * @version 1.0
 * @since 1.0
 */


 
@Service("usersMessageService")
@SuppressWarnings({"unchecked"})
public class UsersMessageServiceImpl  extends ProviderServiceBase<HjsUsersMessage,Integer> implements UsersMessageService {
 
	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsUsersMessage";
	}
	
	public HjsUsersMessage saveOrUpdate(HjsUsersMessage entity) {
		if(entity.getId() == null) 
			save(entity);
		else 
			update(entity);
		return entity;
	}
	@SuppressWarnings({"rawtypes"})
	public Page findPage(HjsUsersMessageQuery query) {
		try {
		    return pageQuery("HjsUsersMessage.findPage",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"查询列表页错误",e.getCause());
		}
	}
	
	public HjsUsersMessage saveObj(HjsUsersMessage model)
	{
		
		try {
			save(model);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"添加错误错误",e.getCause());
		}
		return model;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Page findNoticesPageByUserId(HjsUsersMessageQuery query) {
		try {
		    return pageQuery("HjsUsersMessage.findNoticesPageByUserId",query);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"查询列表页错误",e.getCause());
		}
	}

	@Override
	public void domark(Integer[] records) {
		for (Integer id : records) {
			HjsUsersMessage message = getById(id);
			message.setStatus(3);
			update(message);
		}
	}

	@Override
	public void doremove(Integer[] records) {
		for (Integer id : records) {
			deleteById(id);
		}
	}

	@Override
	public Integer getUnreadMessageCount(Integer receiveLoginid) {
		try {
	        return (Integer)findForObject(getIbatisMapperNamesapce()+".getUnreadMessageCount", receiveLoginid);
		}catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,"统计登录用户未读的消息数量错误",e.getCause());
		}
	}
	
	
	 
}
