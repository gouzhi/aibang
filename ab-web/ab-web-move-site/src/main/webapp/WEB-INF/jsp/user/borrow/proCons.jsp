<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
      <title>详情</title>
      <%@ include file="/WEB-INF/jsp/common/head.jsp"%>
	  <script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
 <div class="wapOutside whithBg">
	<c:if test="${tag eq 1}">
	  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
	    <h1>产品详情</h1>
	  </div>
	  <div class="proCons">

	    <p>${borrow.porjectRemark}</p>
	  </div>
	</c:if>
	
	<c:if test="${tag eq 2}">
	  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
	    <h1>企业信息</h1>
	  </div>
	  <div class="proCons">
	   
	    <p>${borrow.borrowUserRemark}</p>
	  </div>
	</c:if>
	
	<c:if test="${tag eq 3}">
	  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
	    <h1>担保详情</h1>
	  </div>
	  <div class="proCons">
	    <p>${borrow.vouchRemark}</p>
	  </div>
	</c:if>
	
	<c:if test="${tag eq 4}">
	  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
	    <h1>风险控制</h1>
	  </div>
	  <div class="proCons">
	    
	    <p>${borrow.windControl}</p>
	  </div>
	</c:if>
</div>
</body>
</html>