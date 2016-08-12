<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>华金所 - 注册送现金</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="${css_imagedomain}/move/css/activity.css" type="text/css" rel="stylesheet" />
<script src="${css_imagedomain}/move/js/jquery.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
<div class="wapOutside">
<div class="header">华金所－让理财成为生活</div>
  <div class="bannerImg"><img src="${css_imagedomain}/move/images/banner.jpg" /></div>
  <!-- 加载注册模块 -->
  <div id="reg_form"></div>
  <script type="text/javascript" src="http://${web_name}${web_domain}${project_name}/regcommon.js"></script> 
  <!-- 加载注册模块结束 -->
  <div id="but">邀请好友注册，即得现金券10元/位！</div>
  <div class="actCon">
  	<img src="${css_imagedomain}/move/images/actImg1.jpg" />
  	<img src="${css_imagedomain}/move/images/actImg2.jpg" />
  	<a href="toReg" target="_blank"><img src="${css_imagedomain}/move/images/actImg3.jpg" /></a>
  	<img src="${css_imagedomain}/move/images/actImg4.png" />
  </div>
  <ul class="actList">
    <li><a href="toReg" target="_blank"><img src="${css_imagedomain}/move/images/actImg5.jpg" /></a></li>
    <li><img src="${css_imagedomain}/move/images/actImg6.jpg" /></li>
    <li><img src="${css_imagedomain}/move/images/actImg7.jpg" /></li>
    <li><img src="${css_imagedomain}/move/images/actImg8.jpg" /></li>
  </ul>
</div>

<script type="text/javascript">				
		
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
</script>
</body> 
</html>