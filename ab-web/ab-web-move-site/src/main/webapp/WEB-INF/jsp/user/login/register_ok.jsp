<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>华金所 - 注册成功</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="${css_imagedomain}/move/css/suc.css" type="text/css" rel="stylesheet" />
<style>

</style>
</head>

<body>

<div class="wrap">
	<div class="header">
    	<i></i>
        <span>恭喜您已完成注册</span>
    </div>
    <div class="grant">
    	<p>10元现金已发放到您的账户中<br />请登录www.huafax.com进行投资</p>
    </div>
    <p class="invite">邀请好友注册，即得现金10元/位！</p>
    <div class="invitation_code">您的邀请码：<span>${inviteCode}</span></div>
    <p class="invite">或复制下面链接发送给您的好友</p>
    <div class="invitation_link">您的邀请链接：<br /><span>http://${web_name}${web_domain}${project_name}/toReg?inviteCode=${inviteCode}</span></div>
    <div class="regProcess"><img src="${css_imagedomain}/move/images/regProcess.png" /></div>
    <div class="return_reg">
    	<a href="toReg">回到注册页</a>
    </div>
</div>
</body>
</html>