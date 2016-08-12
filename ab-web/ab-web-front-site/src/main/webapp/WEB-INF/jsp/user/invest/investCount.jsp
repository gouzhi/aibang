<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>投资统计-华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
</head> 

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>

<div class="accountContent clear">
 <div id="nav_point" class="icoPoint">
     <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
     <span><a href="/user/invest/investCount" style="font-size: 14px;color:#777;">我的投资</a></span>
        <i> &gt; </i>
        <span>投资统计</span>
    </div>
<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
        <div class="crumbNav329">投资统计
        	<p class="fr">统计数据自您第一笔投资开始<b></b>数据更新时间：<span><fmt:formatDate value="${userBase.updateTime }" pattern="yyyy-MM-dd"/></span></p>
        </div>
        <div class="invest331Menu1"><i></i>资金</div>
            <ul class="capital marginB10">
                <li>
                    <p class="redBg">投资总额<b></b></p>
                    <span><i>${userBase.tenderAccount }</i> 元</span>
                </li>
                <li>
                    <p class="blueBg">已结清总额<b><a href="user/invest/receiving_over_detail">[ 查看明细 ]</a></b></p>
                    <span><i>${overAllMoney }</i> 元</span>
                </li>
                <li>
                    <p class="orangeBg">待收款总额<b><a href="user/invest/havingDetail">[ 查看明细 ]</a></b></p>
                    <span><i>${userBase.await }</i> 元</span>
                </li>
            </ul>
        <div class="invest331Menu2"><i></i>投资</div>
             <ul class="project331 marginB10">
                <li class="bg1">
                    <b>持有中：</b><a href="${project_name}/user/invest/investHaving">${havingCount }</a>
                </li>
                <li class="bg2">
                    <b>申请中：</b><a href="user/invest/investRecord">${applyCount }</a>
                </li>
                <li class="bg3">
                   <b>已结清：</b><a href="user/invest/investOver">${overCount }</a>
                </li>
            </ul>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>