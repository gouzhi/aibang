<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册成功提示页面</title>
<link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/zhuce.css" rel="stylesheet" type="text/css" />
<script src="${css_imagedomain}/front/js/jquery-1.9.1.min.js"></script>
<style>
.contentregOk{width:100%;margin-top:20px;}
.regOk{width:1000px; margin:50px auto 0; text-align:center;border:1px solid #ccc}
.regOk img{ padding-top:155px;}
.regOk .wish{ font-size:16px;color:#2a7fda; margin:50px 0 35px; }  
.regOk .back{ font-size:12px;color:#333; margin-bottom:30px;}
.regOk .back i,.regOk .back a{color:#287ad2;}
</style>
<script>
$(function(){
	
	$('.navListT li').mouseover(function(){
		$('.navListT li').children('.search').hide();
		$(this).children('.search').show();
	});
	$('.navListT li').mouseout(function(){
		$('.navListT li').children('.search').hide();
	});
	
	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="contentregOk">
	<div class="regOk">
    	<img src="${css_imagedomain}/front/images/ok.png" width="98" height="98" alt="ok" />
        <p class="wish">恭喜您，您已成功注册为华金所会员</p>
        <p class="back"><i id="timeF">5</i>S&nbsp;&nbsp;&nbsp;后进入<a href="#">账户总览</a></p>
       
    </div>
    <script>
    var oTimeF=document.getElementById("timeF");
	var iNub=5;
	var iSpeed=1;
	setInterval(function(){
		iNub-=iSpeed;
		if(iNub==0)
		{
			iSpeed=0;
			//跳转到账户安全
			top.window.location.href='http://${web_name}${web_domain}${project_name}/user/center/accountall';
		}
		oTimeF.innerHTML=iNub;
	},1000);
	</script>
</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>