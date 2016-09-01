package com.aibang.business.provider.system.account;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.aibang.business.api.system.account.AbUserBaseService;
import com.aibang.business.provider.base.ProviderServiceBase;
import com.aibang.framework.fadada.FddClient;
import com.aibang.framework.fadada.config.FddConstant;
import com.aibang.framework.utils.Const;
import com.aibang.framework.utils.DateUtils;
import com.aibang.framework.utils.page.Page;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.vo.AbUserBaseQuery;
import com.alibaba.dubbo.rpc.RpcException;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

/**
 * @classname AbUserBaseServiceImpl
 * @description 用户账户管理
 * @author liuj
 * @date 2015年8月26日
 */
@Service("AbUserBaseService")
@SuppressWarnings({ "unchecked" })
public class AbUserBaseServiceImpl extends ProviderServiceBase<AbUserBase, Integer>implements AbUserBaseService {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public String getIbatisMapperNamesapce() {
		return "AbUserBase";
	}

	public AbUserBase saveOrUpdate(AbUserBase entity) {
		if (entity.getId() == null)
			save(entity);
		else
			update(entity);
		return entity;
	}

	@SuppressWarnings({ "rawtypes" })
	public Page findPage(AbUserBaseQuery query) {
		query.setUpdateTimeBegin(DateUtils.getStartDate(query.getUpdateTimeBegin()));
		query.setUpdateTimeEnd(DateUtils.getEndDate(query.getUpdateTimeEnd()));
		return pageQuery(getIbatisMapperNamesapce() + ".findPage", query);
	}

	/**
	 * 获取冻结与余额的总和
	 * 
	 * @methodname findTotalBalance
	 * @discription 列名 TotalBalance
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findTotalBalance(AbUserBaseQuery query) {
		try {
			return findForObject(getIbatisMapperNamesapce() + ".findTotalBalance", query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "获取冻结与余额的总和错误", e.getCause());
		}
	}

	/**
	 * 获取用户账户详细信息
	 * 
	 * @methodname findUserDetailById
	 * @discription 用户信息账户信息
	 * @param query
	 * @return Object
	 * @author liuj
	 * @date 2015年8月26日
	 */
	public Object findUserDetailById(AbUserBaseQuery query) {
		try {
			return findForObject(getIbatisMapperNamesapce() + ".findUserDetailById", query);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "获取用户账户详细信息错误", e.getCause());
		}
	}

	public AbUserBase saveObj(AbUserBase model) {
		try {
			save(model);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "添加用户账户错误", e.getCause());
		}
		return model;
	}

	@Override
	public void updateIsNewById(Integer id) {
		try {
			super.update(getIbatisMapperNamesapce() + ".updateIsNewById", id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "修改是否是新手错误", e.getCause());
		}
	}

	public AbUserBase getByBaseId(Integer id) {
		try {
			return (AbUserBase) findForObject(getIbatisMapperNamesapce() + ".getByBaseId", id);
		} catch (Exception e) {
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "通过baseid查询用户失败", e.getCause());
		}
	}

	
	
	@Override
	public String synFadada() {
		String msg = null;
		// 没有开通法大大的用户查出来
		List<Map<String, Object>> userMsgs = (List<Map<String, Object>>) findForList(getIbatisMapperNamesapce() + ".findFadadaNo", null);
		// 预先设定用到的变量
		String responseStr = null;// 法大大相应字符串
		Map<String, Object> resultMap = null;// json字符串转map的变量
		AbUserBase abUserBase = null;// 查询userbase
		if (userMsgs != null && userMsgs.size() > 0) {
			// 遍历未开通法大大的用户
			for (Map<String, Object> userMsg : userMsgs) {
				responseStr = FddClient.invokeSyncPersonAuto((String) userMsg.get("REALNAME"),
						(String) userMsg.get("EMAIL"), (String) userMsg.get("CARD_ID"), (String) userMsg.get("PHONE"));
				if (responseStr != null && !"".equals(responseStr)) {
					resultMap = JSON.parseObject(responseStr, new TypeReference<Map<String, Object>>() {
					});
					// 判断返回code值
					if ("1000".equals((String) resultMap.get("code"))) {
						// 根据id查userbase
						abUserBase = getByBaseId(Integer.valueOf(((Long) userMsg.get("ID")).toString()));
						if (abUserBase != null) {
							abUserBase.setFadadaCaId((String) resultMap.get("customer_id"));
							update(abUserBase);
						}
					} else {
						logger.error((String) userMsg.get("CARD_ID") + ":" + (String) resultMap.get("msg"));
					}
				} else {
					logger.error("法大大服务器相应失败");
				}
			}
		} else {
			msg = "暂时没有未开通法大大的用户";
		}
		msg = "同步完成";
		return msg;
	}

	/**
	 * @methodname authorTrade  
	 * @discription  借款人授权签章
	 * @param userId 借款人ID
	 * @param fadadaCaId 客户编号
	 * @param clientType 客户类型  1个人 2企业
	 * @author wanglongwei
	 * @date 2016年8月1日
	 */
	@Override
	public String authorTrade(Integer userId,String fadadaCaId,String clientType)  {
		String res = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		// 合同号 SQHT年月日时分秒_userId
		String now = sdf.format(new Date());
		String authorContractId = "SQHT" + now + "_" + userId;

		// QZSQ 签章授权交易号
		String authorTradeId = "QZSQ" + now + "_" + userId;

		// 获取当前时间 格式为如：2016年8月2日
		sdf = new SimpleDateFormat("yyyy年MM月dd日");
		now = sdf.format(new Date());
		// 一年后的时间
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR) + 1);
		calendar.setTime(calendar.getTime());
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
		String end = sdf.format(calendar.getTime());

		Map<String, Object> parameter_map = new HashMap<String, Object>();
		// 委托方
		parameter_map.put("fill_1", fadadaCaId);
		// 授权有效期
		parameter_map.put("fill_2", now + "至" + end);
		// 委托方签字日期
		parameter_map.put("fill_3", now);
		// 受托方签字日期
		parameter_map.put("fill_4", now);
		String response = FddClient.invokeGenerateContract("授权委托书", FddConstant.DOC_TEMPLATE_AUTHORID.getValue(),
				authorContractId, parameter_map);
		log.debug("授权生成合同接口调用信息:"+response);
		Map<String, Object> resultMap =JSON.parseObject(response, new TypeReference<Map<String,Object>>(){});
		if ("success".equals(resultMap.get("result"))) {
			String returnUrl = Const.getProperty("FDD_RETURN_HOST")+"/account/syncallback?userId="+userId+"&fadadaCaId="+fadadaCaId+"&authorContractId="+authorContractId
					+"&authorTradeId="+authorTradeId+"&end="+end;
			res = FddClient.invokeExtSign(authorTradeId,authorContractId, "", returnUrl, clientType, fadadaCaId, "授权委托书", "",
					FddConstant.FDD_NOTIFY_HOST.getValue()+FddConstant.FDD_NOTIFY_SIGN_URL.getValue(),FddConstant.FDD_SIGNATURE_BORROWER.getValue());
			log.debug("授权手动签章接口调用信息:"+response);
		}
		return res;
	}

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
	@Override
	public Map<String,Object> synCallBack(Integer userId, String authorContractId, String end,
			String authorTradeId) {
		Map<String,Object> map=new HashMap<>();
		try {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String now = sdf.format(new Date());
			AbUserBase admin = getByBaseId(0);
			log.debug("authorContractId:"+authorContractId+"--authorTradeId:"+authorTradeId);
			String res = FddClient.invokeExtSignAuto(now+userId, admin.getFadadaCaId(), "", "", "2", "1",
					authorContractId, "授权委托书", FddConstant.FDD_SIGNATURE_PLATFORM.getValue(), "", "");
			log.debug("合同平台签章接口调用信息:"+res);
			Map<String, Object> resultMap = JSON.parseObject(res, new TypeReference<Map<String, Object>>() {});
			if ("1000".equals(resultMap.get("code"))) {
				//平台签章成功之后保存交易信息
				AbUserBase userBase = getByBaseId(userId);
				userBase.setAuthorContractId(authorContractId);
				userBase.setAuthorTradeId(authorTradeId);
				sdf = new SimpleDateFormat("yyyy年MM月dd日 hh:mm:ss");
				userBase.setAuthorEndDate(sdf.parse(end + " 23:59:59"));
				update(userBase);
				//合同归档
				String resp = FddClient.invokeContractFilling(authorContractId);
				log.debug("合同归档接口调用信息:"+resp);
				resultMap = JSON.parseObject(resp, new TypeReference<Map<String, Object>>() {});
				if ("success".equals(resultMap.get("result"))) {
					map.put("result", "success");
				}
				map.put("msg", resultMap.get("msg"));
				return map;
			}else {
				map.put("msg", resultMap.get("msg"));
				return map;
			}
		} catch (ParseException e) {
			log.error("法大大授权异步调用失败");
			throw new RpcException(RpcException.UNKNOWN_EXCEPTION, "法大大授权异步调用失败", e.getCause());
		}
	}
}
