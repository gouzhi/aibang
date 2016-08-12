<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>华金所</title>
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
      <p class="glyphicon-ok-circle">${msg }</p>
    </div>
    <div class="mobile_sub"> <a href="${project_name}/user/customer/toSafe">返回账户安全</a></div>
  </div>
</div>
</body>
</html>