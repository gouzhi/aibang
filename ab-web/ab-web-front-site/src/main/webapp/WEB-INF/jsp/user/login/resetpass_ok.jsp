<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>修改密码成功 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/retrieve.css" rel="stylesheet" />
  <link href="${css_imagedomain}/front/css/commen_new.css" rel="stylesheet" />
      <style>
          /*找回密码*/
          .process{width:1100px;margin:28px auto 150px;border-bottom:1px solid #d2d2d2;height:66px;}
          .processSpan{height:64px;line-height:64px;margin-left:150px;}
          .processSpan span{ display:inline-block;height:64px;line-height:64px;padding:0 8px 0 42px;font-size:20px;color:#ababab;}
          .processSpan span.sp1{ background:url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
          .processSpan span.sp2{ background:url(${css_imagedomain}/front/images/ico_022.png) no-repeat 8px center;}
          .processSpan span.sp3{ background:url(${css_imagedomain}/front/images/ico_033.png) no-repeat 8px center;}
          .processSpan span.sp4{ background:url(${css_imagedomain}/front/images/ico_04.png) no-repeat 8px center;border-bottom:2px solid #f27267;}
          .processSpan i{ display:inline-block;width:7px;height:12px; background:url(${css_imagedomain}/front/images/ico_next.png) no-repeat 0 center; margin:0 50px 0 32px;}
          .processSpan span.activeS{color:#494646;}
          .ownRight{ padding-bottom: 210px;}
          .backName input{background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px 6px;}
          /* .yzInput{background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px -48px;}
  #codeImg{position:absolute;left:158px;top:6px;}
  #shuaxin{ position:absolute;width:36px;height:28px;background:url(${css_imagedomain}/front/images/sx.png) no-repeat center center;border-left: 1px solid #d2d2d2;left:260px;top:8px;}*/
          .mima .ico_b{left:8px;top:7px;width:31px;height:28px;background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 0px -168px;}
          .sur_mima .ico_b{left:8px;top:7px;width:31px;height:28px;background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 0px -168px;}
          .icp{font-size:14px;color:#9d9c9c;}
          .icp:hover{color:#c2c2c2;}
      </style>
</head> 
 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--找回密码-->
<div class="ownContent">
	<div class="own">
    	
        <div class="ownRight">
        	<form>
                <!--<div class="process">
                     <div class="processSpan">
                        <span>确认账号</span>
                        <span>安全验证</span>
                        <span class="activeS">重置密码</span>
                        <span>完成</span>
            		</div>
                    <img src="${css_imagedomain}/front/images/liuFour.png" />
                </div>-->
                <div class="process">
                    <div class="processSpan">
                        <span class="sp1">确认账号</span>
                        <i></i>
                        <span class="sp2">安全验证</span>
                        <i></i>
                        <span class="sp3">重置密码</span>
                        <i></i>
                        <span class="sp4 activeS">完成</span>
                    </div>
                </div>
                <div class="setOk clear" style="margin-left: 452px;width:748px;">
               		<img src="${css_imagedomain}/front/images/oks.png" class="fl" />
                	<span style="font-size: 26px;color: #494646;text-align:left;margin-left: 22px;" class="fl">新密码设置成功！<br><a href="${project_name}/login" style="font-size:16px;color: #2cb7ff;">立即登录</a></span>
                </div>
            </form>
        </div>
    </div>    	
</div>
<!--找回密码 End-->
<div style="width:100%; margin:0 auto;height: 50px;line-height: 50px;font-size:14px;color:#9d9c9c; background:#494646;position: fixed;left:0;bottom:0;">
    <p style="width:1200px;margin:0 auto; text-align:center;">Copyright@2016&nbsp;&nbsp;中创共赢（北京）投资有限公司&nbsp;&nbsp;备案号：<a href="#" class="icp">京ICP备16016103号-1</a> </p>
</div>
</body> 
</html>