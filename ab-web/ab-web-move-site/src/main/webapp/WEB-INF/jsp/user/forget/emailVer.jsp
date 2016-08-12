<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script> 
	</head>
<body>
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>验证邮件</h1>
  </div>
  <div class="emailVerBg">
    <p class="pCon1">我们已经向您的邮箱${emailShow}发送了一封验证邮件，请点击邮件中的链接完成验证！</p>
    <p class="pCon2">验证邮件两个小时内有效，请尽快登录您的邮箱点击验证链接完成验证。</p>
  </div>
   <div class="mobile_sub pLR16"> <a href="${mailUrl}">立即登录邮箱</a></div>
  <div class="emailVerCon pLR16">
    <p class="pCon1">没有收到确认邮件，怎么办？<br />
      看看是否在邮箱的回收站中、垃圾邮件中</p>
    <p class="pCon2"><a href="${project_name}/sendEmail?userId=${userId}">重新发一封</a> </p>
  </div>
</div>
</body>
</html>
