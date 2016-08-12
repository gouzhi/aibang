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
    <h1>修改手机号</h1>
  </div>
  <div class="pLR9">
    <p class="mailValFont1">为了你的账号安全，请完成身份验证</p>
    <p class="loadTt">已验证手机：139******58</p>
    <div class="regInput smsCode">
      <input name="phonecode" type="text" placeholder="请输入您的短信验证码" id="xy" validate="{required:true,messages:{required:'请输入您的短信验证码'}}" />
      <span id="code_btn" style="cursor:pointer;" onclick="getSmscode();">获取验证码</span> <span id="regetcode" class="time"><i>60</i>秒后重发</span><br />
      <input type="hidden" id="smscode" name="smscode" value="" />
      <input type="hidden" id="phoneStatus" name="phoneStatus" value="1" />
      <b>请输入验证码</b> </div>
    <div class="regInput smsCode">
      <input name="phonecode" type="text" placeholder="请输入验证码" />
      <img src="${css_imagedomain}/move/images/yzm.gif" /></div>
    <div class="mobile_sub"> <a href="javascript:void(0)">下一步</a></div>
  </div>
</div>
</body>
</html>