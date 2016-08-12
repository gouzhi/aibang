<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>注册成功 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/zhuce.css" rel="stylesheet" type="text/css" /> 
</head> 
 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--content-->
<div class="contentregOk">
	<div class="regOk">    
    	<p class="wish">请开通第三方资金托管账户</p>
        <p class="back">保证资金安全</p>
        <p class="back">领取相关奖励</p>
        <p class="open"><a href="user/customer/toActivateName">开通理财账户</a></p>
        <p class="ret"><a href="user/center/accountall">暂不开通</a></p>
        <!--<p class="wish">恭喜您，已成功注册成为华金所会员！</p>
        <p class="ret">返回<a href="#" style="margin-left: 5px;">账户安全</a></p>-->
    </div>
    
</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>