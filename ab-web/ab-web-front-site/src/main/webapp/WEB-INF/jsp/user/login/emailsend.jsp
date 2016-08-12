<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>安全验证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/retrieve.css" rel="stylesheet" />
  <script src="${css_imagedomain}/front/js/enroll.js" type="text/jscript"></script>
      <style>
          .process {
              width: 1100px;
              margin: 28px auto 70px;
              border-bottom: 1px solid #d2d2d2;
              height: 66px;}
          .processSpan {
              height: 64px;
              line-height: 64px;
              margin-left: 150px;
          }
          .processSpan span {
              display: inline-block;
              height: 64px;
              line-height: 64px;
              padding: 0 8px 0 42px;
              font-size: 20px;
              color: #ababab;
          }
          .processSpan i {
              display: inline-block;
              width: 7px;
              height: 12px;
              background: url(${css_imagedomain}/front/images/ico_next.png) no-repeat 0 center;
              margin: 0 50px 0 32px;
          }
          .processSpan .sp1{background: url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
          .processSpan .sp2{background: url(${css_imagedomain}/front/images/ico_022.png) no-repeat 8px center;border-bottom: 2px solid #f27267;color:#383838; }
          .processSpan .sp3{background: url(${css_imagedomain}/front/images/ico_03.png) no-repeat 8px center;}
          .processSpan .sp4{background: url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}

          .formVer input{margin-bottom: 14px;}
      </style>
</head> 
 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--找回密码-->
<div class="ownContent">
	<div class="own">

        <div class="ownRight">


            <div class="process">
               <!-- <div class="processSpan">
                    <span>确认账号</span>
                    <span class="activeS">安全验证</span>
                    <span>重置密码</span>
                    <span>完成</span>
                </div>-->


                <div class="processSpan">
                    <span class="sp1 ">确认账号</span>
                    <i></i>
                    <span class="sp2 activeS">安全验证</span>
                    <i></i>
                    <span class="sp3">重置密码</span>
                    <i></i>
                    <span class="sp4">完成</span>
                </div>



            </div>
            <h3><i></i>还差一步即可完成验证</h3>
            <p>我们已经向您的邮箱<span>${emailShow }</span>发送了一封验证邮件，请点击邮件中的链接完成验证！</p>
            <%--<p>验证邮件两个小时内有效，请尽快登录您的邮箱点击验证链接完成验证。</p>--%>
            <p class="ptit"><i></i>验证邮件两个小时内有效，请尽快登录您的邮箱点击验证链接完成验证。</p>
            <%--<a href="${mailUrl}" class="emailBtn">立即进入邮箱</a>--%>
            <a target="_blank" href="${mailUrl}" class="emailBtn">立即进入邮箱</a>
           <!-- <div class="jiejue">
            	<p>没有收到确认邮件，怎么办？</p>
                <ul>
                	<li>看看是否在邮箱的回收站中、垃圾邮件中</li>
                    <li>重新发送，<a href="${project_name}/sendEmail?userId=${userId}">点此重发一封</a></li>
                </ul>
            </div>-->

            <div class="jiejue">
                <div class="p">没有收到确认邮件，怎么办？</div>
                <ul>
                    <li>看看是否在邮箱的回收站中、垃圾邮件中</li>
                    <li>重新发送，<a href="sendEmail?email=${email}">点此重发一封</a></li>
                </ul>
            </div>

        </div>       	
</div>
<!--找回密码 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>