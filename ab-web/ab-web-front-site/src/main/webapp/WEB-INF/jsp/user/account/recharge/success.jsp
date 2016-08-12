<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值成功</title>
 <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<!--<link href="css/index.css" rel="stylesheet" type="text/css" />-->
<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js"></script>
    <style>
        .cash{width:635px; padding:98px 285px; background: #fff;margin-top: 20px;}

        .cashOk{background: #fafafa;padding: 0;position: relative;}
        .cashOk i{ position: absolute;width:59px;height:59px;background:url(${css_imagedomain}/front/images/ico_all.png) no-repeat -180px -10px;left:140px;top:76px;}
        .cashOk h4.czcg{margin: 0; padding:82px 0 10px 216px;font-size: 20px;color:#383838;}
        .cashOk h4.czcg span{font-family:"Arial";font-size:20px;color:#f27267;}
        .cashOk  .mx{ padding-left: 216px;padding-bottom: 76px;}
        .cashOk  .mx a{font-size:14px;color:#f27267;}
        .cashOk .goOn{display: inline-block;width:120px;height:34px;line-height:34px; background:#ababab;font-size:16px;color:#fff; text-align: center;border-radius: 4px;}
        .cashOk .relutn{display: inline-block;width: 120px;height: 34px;line-height: 34px; text-align: center; background:#f27267;font-size:16px;color:#fff; text-align: center;border-radius: 4px;}
        .cashOk .jx_fh{ text-align: center;padding-bottom: 58px;}
        .cashOk a{margin-left:15px;}
        .cashOk a:first-child{margin:0;}
    </style>
</head> 

<body>
<!--header Start-->
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--header End-->
<!--nav Start-->

<!--nav End-->
<!--提现主体-->
<div class="accountContent clear">
	<!--<div class="icoPoint">
        	<span>首页</span>
            <i> > </i>
            <span>账户总览</span>
        </div>-->
	<!--<div class="account-Left fl">
        <ul class="accountList">
        	<li>
            	<a href="#" class="accountListA borT">
                    <i class="icon-dashboard ico1"></i>
                    <span>账户总览</span>
                </a>
            </li>
            <li>
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico2"></i>
                    <span>我的投资</span>
                    <b class="icoI"></b>
                </a>
                <ul class="listLi-chind">
                    <li>
                    	<a href="#">
                        	<i class="icon-dashChild"></i>
                        	<span>投资统计</span>	
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="icon-dashChild"></i>
                            <span>投资明细</span>	
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                        	<i class="icon-dashChild"></i>
                        	<span>收款明细</span>	
                        </a>
                    </li>									
                </ul>
            </li>
            <li class="select">
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico3"></i>
                    <span>资金记录</span>
                    <b class="icoI"></b>
                </a>
                <ul class="listLi-chind">
                    <li>
                    	<a href="#" class="little">
                            <i class="icon-dashChild"></i>
                            <span>资金明细</span>	
                        </a>
                        <ul style="display:none;">
                        	<li>
                    	<a href="#">
                            <i class="icon-dashChild"></i>
                            <span>充值</span>	
                        </a>
                    </li>
                    		<li>
                    	<a href="#">
                            <i class="icon-dashChild"></i>
                            <span>提现</span>	
                        </a>
                    </li>
                        </ul>
                    </li>
                    <li>
                    	<a href="#">
                            <i class="icon-dashChild"></i>
                            <span>充值查询</span>	
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                            <i class="icon-dashChild"></i>
                            <span>提现查询</span>	
                        </a>
                    </li>
                    <li>
                     	<a href="#">
                            <i class="icon-dashChild"></i>
                            <span>会员积分</span>	
                        </a>
                    </li>
                    
                    							
                </ul>
            </li>
             <li>
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico4"></i>
                    <span>活动奖励</span>
                </a>
            </li>
             <li>
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico5"></i>
                    <span>渠道返佣</span>
                </a>
            </li>
            <li>
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico6"></i>
                    <span>账户安全</span>
                </a>
            </li>
            <li>
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico7"></i>
                    <span>我的评价</span>
                </a>
            </li>
            <li>
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico8"></i>
                    <span>消息中心</span>
                </a>
            </li>
            <li>
            	<a href="#" class="accountListA">
                    <i class="icon-dashboard ico9"></i>
                    <span>个人资料</span>
                </a>
            </li>
        </ul>
    </div>-->
	<div class="cash">
        <div class="cashOk">
            <i></i>
            <h4 class="fz18 color5 czcg">恭喜，您已成功充值<span>${money }</span>元！</h4>
            <p class="mx"><a href="../center/accountlist">查看资金明细</a></p>
            <p class="jx_fh">
                <a href="main" class="goOn">继续充值</a>
                <a href="../center/accountall" class="relutn">返回账户总览</a>
            </p>
        </div>
    </div>

</div>
<!--提现主体 End-->


<!--footer-->

<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
<!--footer End-->

