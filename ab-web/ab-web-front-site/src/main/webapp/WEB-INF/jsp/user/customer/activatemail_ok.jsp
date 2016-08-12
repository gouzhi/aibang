<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>邮箱验证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
      <style>
          .spanText{ margin-left: 56px;}
          .xiuPhone1-top{margin-bottom: 110px;}
          .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
          .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_022.png) no-repeat 8px center; }
          .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_033.png) no-repeat 8px center;}
          .spanText .sp4{background: url(${css_imagedomain}/front/images/ico_04.png) no-repeat 8px center;border-bottom: 2px solid #f27267;color:#383838;}
          #email{width:298px;height:42px;line-height:42px;border-radius:4px;border:1px solid #d2d2d2;margin-left:298px;text-indent:48px;background: url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px 6px;}
          .formVer input{margin-bottom: 14px;}
          .email2 .ret{display: inline-block;width:300px;height:50px;line-height: 50px;background: #f27267;font-size: 24px;color:#fff;margin:75px 0 0 300px;border-radius:4px;}
      </style>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--邮箱激活-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/center/accountall" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">邮箱验证成功</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="email2">
        	<div class="xiuPhone1-top">
            	
            	 <div class="spanText">
                	<span class="sp1">身份验证</span>
                     <i></i>
                    <span class="sp2">输入邮箱</span>
                     <i></i>
                    <span class="sp3">发送邮件</span>
                     <i></i>
                    <span class="sp4 active">完成</span>
                </div>
               
            </div>
    		<h3><i></i>恭喜您已成功验证电子邮箱！</h3>
            <a href="${project_name}/user/customer/toSafe" class="ret">返回账户安全</a>
        </div>
		
    
    </div>

</div>
<!--邮箱激活 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>