package com.aibang.business.provider.system.approve;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;

import com.aibang.business.api.system.approve.HjsApproveEmailActiveService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.HjsApproveEmailActive;
import com.aibang.transfer.model.dto.HjsUser;
import com.aibang.transfer.model.vo.HjsApproveEmailActiveQuery;
import com.alibaba.dubbo.rpc.RpcException;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */

@Service("hjsApproveEmailActiveService")
@SuppressWarnings({ "unchecked" })
public class HjsApproveEmailActiveServiceImpl extends
		ProviderServiceBase<HjsApproveEmailActive, Integer> implements
		HjsApproveEmailActiveService {

	@Override
	public String getIbatisMapperNamesapce() {
		return "HjsApproveEmailActive";
	}

	public HjsApproveEmailActive saveOrUpdate(HjsApproveEmailActive entity) {
		if (entity.getId() == null)
			save(entity);
		else
			update(entity);
		return entity;
	}

	/**
	 * 显示邮箱验证信息（分页）
	 */
	@SuppressWarnings({ "rawtypes" })
	public Page findPage(HjsApproveEmailActiveQuery query) {
		try {
			//处理查询时间格式
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(query.getVerifyTimeBegin()!=null){
				query.setVerifyTimeBegin(format1.parse(format.format(query.getVerifyTimeBegin())+" 00:00:00"));
			}
			if(query.getVerifyTimeEnd()!=null){
				
				query.setVerifyTimeEnd(format1.parse(format.format(query.getVerifyTimeEnd())+" 23:59:59"));
			}
			return pageQuery("HjsApproveEmailActive.findPage", query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"显示邮箱验证信息错误", e.getCause());
		}
	}

	@Override
	public HjsApproveEmailActive saveObj(HjsApproveEmailActive model) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 通过ID获得邮件认证信息
	 * 
	 * @param id
	 * @return HjsApproveEmailActive
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public HjsApproveEmailActive getById(Integer id) {
		HjsApproveEmailActive hjsApproveRealname = null;
		try {
			hjsApproveRealname = super.getById(id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION,
					"通过ID获得邮件认证信息错误", e.getCause());
		}
		return hjsApproveRealname;
	}

	/**
	 * 审核邮件认证
	 * 
	 * @param entity
	 *            void
	 * @author zhangyong
	 * @date 2015年9月8日
	 */
	public void auditEmail(HjsApproveEmailActive entity) {
		try {
			super.update(getIbatisMapperNamesapce() + ".audit", entity);// 修改邮件表审核状态
			HjsUser hjsUser = new HjsUser();
			hjsUser.setId(entity.getUserId());
			hjsUser.setEmailStatus(entity.getStatus());
			hjsUser.setOptId(entity.getVerifyUserid());
			update("HjsUser.auditEmail", hjsUser);// 修改用户表相关邮件审核状态
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "审核邮件认证错误",
					e.getCause());
		}
	}

}
