//package com.cifex.web.admin.operation.system.fundLogs;
//
//
//import com.cifex.business.api.fund.system.logs.HjsFundSynclogMainService;
//import com.cifex.business.api.fund.system.logs.HjsFundSynclogService;
//import com.cifex.framework.utils.ip.Utils;
//import com.cifex.framework.utils.page.Page;
//import com.cifex.transfer.model.dto.HjsUser;
//import com.cifex.transfer.model.fund.dto.HjsFundSynclogMain;
//import com.cifex.transfer.model.fund.vo.HjsFundSynclogMainQuery;
//import com.cifex.web.admin.operation.base.AdminController;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
///**
//* Created by ${jiangshuang} on 2016/4/19.
//*/
//@Controller
//@RequestMapping("/hjsFundSynclogMain")
//public class HjsFundSynclogMainController extends AdminController{
//
//
//    @Autowired
//    private HjsFundSynclogService hjsFundSynclogService;
//    @Autowired
//    private HjsFundSynclogMainService hjsFundSynclogMainService;
//
//    /**
//     * 查询获取基金同步log列表
//     * @return
//     */
//    @RequestMapping("/findSynclogs")
//    public String findSynclogs(HttpServletRequest request,HttpServletResponse response,HjsFundSynclogMainQuery query ){
//        Page<?> page=hjsFundSynclogMainService.findPage(query);
//        request.setAttribute("page",page);
//        return display("synclogs");
//    }
//    private String display(String pageName)
//    {
//        return  "system/fund/synclog/"+pageName;
//    }
//    @ResponseBody
//    @RequestMapping("/syncFunds")
//    public String syncFunds(HttpServletRequest request,HttpServletResponse response){
//        HjsUser hjsUser=getLoginUser();
//        String result="0";
//        HjsFundSynclogMain hjsFundSynclogMain=new HjsFundSynclogMain();
//        hjsFundSynclogMain.setOptId(hjsUser.getId());
//        hjsFundSynclogMain.setOptName(hjsUser.getRealName());
//        hjsFundSynclogMain.setSyncType(1);//手动
//        hjsFundSynclogMain.setMemo("现在没有特殊说明");
//        String ip = Utils.getCdnIpAddr(request);//获取IP
//        int res= hjsFundSynclogService.doSyncFunds(hjsFundSynclogMain,ip);
//        if (res==1){
//            result="1";
//
//        }
//        return result;
//    }
//}
