<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
	<head>
	<title>华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/move/css/mobile.css" rel="stylesheet" />
<link href="${css_imagedomain}/move/css/secCss.css" rel="stylesheet" />
<script src="${css_imagedomain}/move/js/zepto.min.js"></script>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
<!-- 表单验证 -->
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
</head>
<body>
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>资金记录</h1>
  </div>
  <!--<div class="safeCon myInvestMenu"><span class="glyphicon-chevron-down"></span>
    <p>资金类型</p>
    <ul>
      <li>资金类型</li>
      <li>全部</li>
      <li>充值</li>
      <li>提现</li>
      <li>收款</li>
      <li>付款</li>
    </ul>
  </div>-->
  <div class="fundRecordList">
  <c:choose>
  <c:when test="${not empty accountUsers}">
  <c:forEach items="${accountUsers}" var="item">
    <dl>
      <dt>${item.remark}</dt>
      <dd>
           <p class="timeMoney">
           <span><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm" /> </span>
                                余额：${item.avlBalance}元</p>
           <p class="addMinus">
           <label>
           <c:forEach items="${sysConfigs}" var="sc"  >
           <c:choose>
           <c:when test="${item.type eq sc.code}">${sc.cname}</c:when>
		   </c:choose>
		   </c:forEach>
		   </label>
		   <c:if test="${item.expend == '0.00'}">
           <span class="glyphicon-plus">${item.money}</span>
           </c:if>
           <c:if test="${item.income == '0.00'}">
           <span class=""> - ${item.money}</span>
           </c:if>
           </p>
           
      </dd>
    </dl>
  	</c:forEach>
   	</c:when>
 	<c:otherwise>
	<li style="text-align: center"><span>暂时没有记录</span></li>
	</c:otherwise>
	</c:choose>
     
  </div>
</div>
</body>
</html>