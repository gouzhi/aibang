<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="${project_name}/">
    <meta charset="utf-8" />
	<title></title>
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${css_imagedomain}/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
	<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
	<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
	<style>
	.ulList{list-style-type:none;margin: 0;padding: 0;}
	.ulList li{margin-left: 50px;height:42px;line-height:42px;}
	.ulList li i.spanTit{display:inline-block;width:125px;font-style:normal; text-align:left;}
	</style>
	</head>
<body>
<div style="width:100%;overflow:hidden;margin-left: 20px;">
	<p style="line-height:42px; margin-left:10px;border-bottom: 2px solid #d2d2d2;font-size:16px;font-weight: bold;">基金详情</p>
	
	<div style="width:100%; overflow:hidden;border-bottom: 2px solid #d2d2d2;">
		<span style="float:left; margin-left:10px;font-size:16px;font-weight: bold;">基本信息</span>
		<span style="float:right; margin-right:40px; ">
		<fmt:formatDate value="${hjsFundFundsinfo.updateTime }"/>更新</span>
	</div>

<ul  class="ulList">
<li ><i class="spanTit">基金代码</i> <span style="margin-left: 100px;">${hjsFundFundsinfo.fundcode }</span></li>
<li><i class="spanTit">基金名称</i><span style="margin-left: 100px;">${hjsFundFundsinfo.fundname}</span></li>
<li ><i class="spanTit">基金简称</i><span style="margin-left: 100px;">${hjsFundFundsinfo.abbrev}</span></li>
<li ><i class="spanTit">基金净值</i><span style="margin-left: 100px;">${hjsFundFundsinfo.nav}</span></li>
<li ><i class="spanTit">净值时间</i><span style="margin-left: 100px;"><fmt:formatDate value="${hjsFundFundsinfo.navTime}" pattern="yyyy-MM-dd"/></span></li>
<li ><i class="spanTit">基金类型</i><span style="margin-left: 100px;">
<c:if test="${hjsFundFundsinfo.type=='FUND_STOCK'}">
	股票基金
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_BOND'}">
	债券基金
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_MONEY'}">
	货币基金
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_MIX'}">
	混合基金
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_INDEX'}">
	指数基金
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_PRESERV'}">
	保本
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_ETF'}">
	ETF
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_QDII'}">
	QDII
	</c:if>
	<c:if test="${hjsFundFundsinfo.type=='FUND_OTHER'}">
	其他
	</c:if>
</span>
</li>
<li ><i class="spanTit">最大限额</i><span style="margin-left: 100px;">${hjsFundFundsinfo.maxSumlimit}</span></li>
<li ><i class="spanTit">创建日期</i><span style="margin-left: 100px;"><fmt:formatDate value="${hjsFundFundsinfo.createDate}" pattern="yyyy-MM-dd"/></span></li>
<li ><i class="spanTit">基金公司</i><span style="margin-left: 100px;">${hjsFundFundsinfo.corporation}</span></li>
<li ><i class="spanTit">托管银行</i><span style="margin-left: 100px;">${hjsFundFundsinfo.bankname}</span></li>
<li ><i class="spanTit">最新份额规模</i><span style="margin-left: 100px;">${hjsFundFundsinfo.shareScale}</span></li>
<li ><i class="spanTit">总市值</i><span style="margin-left: 100px;">${hjsFundFundsinfo.marketValue}</span></li>
<li ><i class="spanTit">认购截止时间</i><span style="margin-left: 100px;"><fmt:formatDate  value="${hjsFundFundsinfo.reckonEndTime}" pattern="yyyy-MM-dd"/></span></li>
<li ><i class="spanTit">可申购状态</i><span style="margin-left: 100px;">
<c:if test="${hjsFundFundsinfo.purchaseStatus==0}">禁止申购 </c:if>
<c:if test="${hjsFundFundsinfo.purchaseStatus==1}">开放申购 </c:if>
<c:if test="${hjsFundFundsinfo.purchaseStatus==2}">暂停申购 </c:if>
<c:if test="${hjsFundFundsinfo.purchaseStatus==3}">限大额 </c:if>
<c:if test="${hjsFundFundsinfo.purchaseStatus==4}">开放认购 </c:if>
</span>
</li>
<li ><i class="spanTit">可赎回状态</i><span style="margin-left: 100px;">
<c:if test="${hjsFundFundsinfo.redempStatus==1}">可赎回</c:if>
<c:if test="${hjsFundFundsinfo.redempStatus==2}">暂停赎回</c:if>
</span>
</li>
<li ><i class="spanTit">风险等级</i><span style="margin-left: 100px;">
<c:if test="${hjsFundFundsinfo.risklevel==0}">低</c:if>
<c:if test="${hjsFundFundsinfo.risklevel==1}">中</c:if>
<c:if test="${hjsFundFundsinfo.risklevel==2}">高</c:if>
</span>
</li>
<div style="width:100%; overflow:hidden;border-bottom: 2px solid #d2d2d2;">
<span style="float:left; margin-left:10px;font-size:16px;font-weight: bold; ">交易相关</span></div>

<li ><i class="spanTit">申/认购最低金额</i><span style="margin-left: 100px;">${hjsFundFundsinfo.minSubscript}</span></li>
<li ><i class="spanTit">追加最低金额</i><span style="margin-left: 100px;">${hjsFundFundsinfo.minAddition}</span></li>
<li ><i class="spanTit">最小赎回份额</i><span style="margin-left: 100px;">${hjsFundFundsinfo.minRedemp}</span></li>
<li ><i class="spanTit">最小持有</i><span style="margin-left: 100px;">${hjsFundFundsinfo.minHold}</span></li>
<li ><i class="spanTit">管理费</i><span style="margin-left: 100px;">${hjsFundFundsinfo.manageFee}</span></li>
<li ><i class="spanTit">托管费用</i><span style="margin-left: 100px;">${hjsFundFundsinfo.delegateFee}</span></li>
<li ><i class="spanTit">原申/认购费率</i><span style="margin-left: 100px;">${hjsFundFundsinfo.originalFee}</span></li>
<li ><i class="spanTit">打折后的申/认购费率</i><span style="margin-left: 100px;">${hjsFundFundsinfo.fee}</span></li>
<li ><i class="spanTit">阶梯费率</i><span style="margin-left: 100px;">${hjsFundFundsinfo.feeLadder}</span></li>
<li ><i class="spanTit">收费方式</i><span style="margin-left: 100px;">
<c:if test="${hjsFundFundsinfo.feeWay==1}">前端收费</c:if>
<c:if test="${hjsFundFundsinfo.feeWay==2}">后端收费</c:if>
</span></li>
<div style="width:100%; overflow:hidden;border-bottom: 2px solid #d2d2d2;">
<span style="float:left; margin-left:10px;font-size:16px;font-weight: bold; ">收益相关</span></div>
<hr style="width:100%;">
<li ><i class="spanTit">净值增长率</i><span style="margin-left: 100px;">${hjsFundFundsinfo.rateGrowth}</span></li>
<li ><i class="spanTit">万份收益</i><span style="margin-left: 100px;">${hjsFundFundsinfo.profit10k}</span></li>
<li ><i class="spanTit">7日年化收益率</i><span style="margin-left: 100px;">${hjsFundFundsinfo.rate7day}</span></li>
<li ><i class="spanTit">截止到</i><span style="margin-left: 100px;"><fmt:formatDate value="${hjsFundFundsinfo.calDate}" pattern="yyyy-MM-dd"/> </span></li>
<li ><i class="spanTit">近一年收益率</i><span style="margin-left: 100px;">${hjsFundFundsinfo.rateYear}</span></li>
</ul>

<a href="http://money.domain.com.cn/hjs-web-front-site/user/invist/investRecord" target="_blank">更多详情</a>
<a onclick = "history.back()">返回</a>
</div>
</body>
</html>