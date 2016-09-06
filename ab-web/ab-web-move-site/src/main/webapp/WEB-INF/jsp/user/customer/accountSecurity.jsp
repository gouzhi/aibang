<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>爱帮</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="wapOutside">
		<div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
		  <h1>账户安全</h1>
		</div>
		<div class="pLR9">
		  <ul class="accSecList">
		    <li>
		    	<span class="okCircle"></span>输入新密码<a href="${project_name}/user/customer/toEditPass" class="accSecA">修改</a>
		    </li>
		    <li>
		    	<c:choose>
		    		<c:when test="${emailStatus == 0 }">
				    	<span class="okCircle whyCircle"></span>邮箱验证
				    	<a href="pv?vt=1" class="accSecA">验证</a>
			    	</c:when>
			    	<c:otherwise>
			    		<span class="okCircle"></span>邮箱验证
				    	<a href="pv?vt=1" class="accSecA">修改</a>
			    	</c:otherwise>
		    	</c:choose>
		    </li>
		    <li><span class="okCircle"></span>手机验证<a href="pv?vt=2" class="accSecA">修改</a></li>
		    
		  </ul>
		</div>
		</div>
	</body>
</html>