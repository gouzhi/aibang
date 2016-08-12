<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>发送邮件 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
      <style>
          .spanText{ margin-left: 56px;}
          .xiuPhone1-top{}
          .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
          .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_022.png) no-repeat 8px center; }
          .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_03.png) no-repeat 8px center;border-bottom: 2px solid #f27267;color:#383838;}
          .spanText .sp4{background: url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}
          #email{width:298px;height:42px;line-height:42px;border-radius:4px;border:1px solid #d2d2d2;margin-left:298px;text-indent:48px;background: url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px 6px;}
          .formVer input{margin-bottom: 14px;}
      </style>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--邮箱验证-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/center/accountall" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">发送邮件</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="email3">
        	<div class="xiuPhone1-top">
            	 <div class="spanText">
                	<span class="sp1">身份验证</span>
                     <i></i>
                    <span class="sp2">输入邮箱</span>
                     <i></i>
                    <span class="sp3 active">发送邮件</span>
                     <i></i>
                    <span class="sp4">完成</span>
                </div>
            </div>
    		<h3><i></i>还差一步即可完成验证</h3>
            <p>我们已经向您的邮箱<span>${emailShow }</span>发送了一封验证邮件，请点击邮件中的链接完成验证！</p>
            <p class="ptit"><i></i>验证邮件两个小时内有效，请尽快登录您的邮箱点击验证链接完成验证。</p>
            <a target="_blank" href="${mailUrl}" class="emailBtn">立即进入邮箱</a>
            <div class="jiejue">
            	<div class="p">没有收到确认邮件，怎么办？</div>
                <ul>
                	<li>看看是否在邮箱的回收站中、垃圾邮件中</li>
                    <li>重新发送，<a href="sendEmail?email=${email}">点此重发一封</a></li>
                    <li>也可以试试更换邮箱地址，<a href="javascript:history.go(-1);">点此更换邮箱地址</a></li>
                </ul>
            </div>
        </div>
		
    
    </div>

</div>
<!--邮箱验证 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>