<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>华金所</title>
<link href="${css_imagedomain}/move/css/mobile.css" rel="stylesheet" />
<link href="${css_imagedomain}/move/css/secCss.css" rel="stylesheet" />
<script src="${css_imagedomain}/move/js/zepto.min.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/iscroll.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/jquery.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/creat.js"></script>
</head>
<body>
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>邀请好友</h1>
  </div>
  <input type="hidden" value="${inviteCode }" class="span_num">
  <div class="invintRule">邀请好友奖励规则：每位好友注册成功并开通理财账
    户，奖励您<b> 10 </b>元可提现佣金红包</div>
  <div class="invintWhiteBor">
    <h3>请您的好友扫描以下二维码</h3>
    <div class="invintEvm"><%-- <img src="${css_imagedomain}/move/images/evm1.png" /> --%></div>
  </div>
  <%-- <div class="invintWhiteBor">
    <h3>还可以分享邀请好友</h3>
    <div class="invintShare"><span><img src="${css_imagedomain}/move/images/weixin.png" /><br />微信好友</span><span><img src="${css_imagedomain}/move/images/pengyouquan.png" /><br />微信朋友圈</span></div>
  </div> --%>
</div>
</body>
</html>
<script>
    weixin();
	function weixin(){
	var inviteCode = $(".span_num").val();//获取验证码的值
	var url="http://"+location.host+"/register?inviteCode="+inviteCode;
	$(".invintEvm").qrcode({
		render: "canvas",
		/* width: 364,
		height:364, */
		text: url
	});
	};
</script>