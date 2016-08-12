<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <title>失败 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head> 
<body> 
<div class="wapOutside whithBg">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>失败</h1>
  </div>
  <div class="pLR9">
    <div class="regInputOk">
      <p class="glyphicon-remove-circle">抱歉，您的汇付天下账户未开通！</p>
      <p>原因：${msg}</p>
    </div>
    <div class="mobile_sub"> <a href="${project_name}/user/customer/toActivateName">重新开通汇付天下账户</a></div>
  </div>
</div>
</body>
</html>