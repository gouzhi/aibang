<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值-失败</title>
 <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<!--<link href="css/index.css" rel="stylesheet" type="text/css" />-->
<script language="javascript" type="text/javascript" src="../front/My97DatePicker/WdatePicker.js"></script>
</head> 

<body>
<!--header Start-->

    <!--<nav>
        <div class="nav">
            <ul class="navList clear">
                <li><a href="#" class="fz14">首页</a></li>
                <li><a href="#" class="fz14">新金融</a></li>
                <li><a href="#" class="fz14">抗风险</a></li>
                <li><a href="#" class="fz14">情景理财</a></li>
                <li><a href="#" class="fz14">玩 · 赚</a></li>
                <li>
                	<a href="#" class="fz14 xiaoxin">个人中心</a>
                    <ul class="drop">
                        <li><a href="#">账户总栏</a></li>
                        <li><a href="#">资金记录</a></li>
                        <li><a href="#">账户安全</a></li>
                        <li><a href="#">我的评价</a></li>
                        <li><a href="#">消息中心</a></li>
                    </ul>
                </li>
               
            </ul>
             
        </div>
    </nav>-->
</div>
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
            <h4 class="fz18 color5 lineH48 czsb">抱歉，充值失败！</h4>
            <p>
                <a href="main" class="colorAll">继续充值</a>
               <a href="../center/accountlist" class="colorAll">查看资金明细</a>
                <a href="../center/accountall" class="colorAll">返回账户总览</a>
            </p>
        </div>
    </div>

</div>
<!--提现主体 End-->


<!--footer-->

<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>