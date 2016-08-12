package com.cifex.framework.pay.weixin.service;

import com.cifex.framework.pay.weixin.common.WxPayConfig;
import com.cifex.framework.pay.weixin.common.XMLParser;
import com.cifex.framework.pay.weixin.protocol.UnifiedReqData;
import com.cifex.framework.pay.weixin.protocol.UnifiedResData;
import com.cifex.framework.utils.http.HttpAccessUtil;
import com.cifex.framework.utils.http.MimeTypes;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;


/**
 * 微信接口服务层
 * maoruxin
 */
public class UnifiedOrderService {

	/**
     * 请求统一下单接口
     * @param unifiedReqData 这个数据对象里面包含了API要求提交的各种数据字段
     * @return API返回的数据
     * @throws Exception
     */
    public static UnifiedResData request(UnifiedReqData unifiedReqData) throws Exception {

        //解决XStream对出现双下划线的bug
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));

        //将要提交给API的数据对象转换成XML格式数据Post给API
        String postDataXML = xStreamForRequestPostData.toXML(unifiedReqData);
        
        //--------------------------------------------------------------------
        //发送HTTPS的Post请求到API地址
        //--------------------------------------------------------------------
    	String responseString = HttpAccessUtil.httpRequest(WxPayConfig.UNIFIED_ORDER_API,
				MimeTypes.TXT, "POST", 100000, 100000, postDataXML);

    	UnifiedResData resDate = (UnifiedResData) XMLParser.getObjectFromXML(responseString, UnifiedResData.class);
        return resDate;
    }
	
}
