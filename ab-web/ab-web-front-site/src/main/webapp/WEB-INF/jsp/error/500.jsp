<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>500</title>
<link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
<style>
.errorWrap{width:100%;border-top:2px solid #287ad2;}
.errorWrap .error{width:1000px;height:260px; margin:100px auto 0;}
.errorWrap .error .errorL{margin-left:195px;}
.errorWrap .error .errorR{margin-top:100px; margin-left:15px;}
.errorWrap .error h3{font-size:24px;line-height:36px;color:#333;}
.errorWrap .error p{font-size:18px;line-height:60px;color:#666;}
.errorWrap .error a{display:block;width:136px;height:36px;line-height:36px;font-size:18px;color:#fff;border:1px solid #167ce2; background:#388fe7; text-align:center;border-radius:5px; margin:8px 0;}

</style>
</head>

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--404 Start-->
<div class="errorWrap">
	<div class="error clear">
    	<div class="errorL fl">
        	<img src="${css_imagedomain}/front/images/404.png" width="205" height="222" alt="华金所" />
        </div>
    	<div class="errorR fl">
    		<h3>很抱歉，系统维护中...</h3>
    		<p>您要查看的网址可能暂时不可用。</p>
    		<a href="${project_name}">返回首页</a>
    	</div>
    </div>
</div>
<!--404 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>
