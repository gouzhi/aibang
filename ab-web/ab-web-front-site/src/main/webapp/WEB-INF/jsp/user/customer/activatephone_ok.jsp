<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>修改手机 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
      <style>
          .spanText{margin-left: 170px;}
          .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
          .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_022.png) no-repeat 8px center; }
          .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_03.png) no-repeat 8px center; color:#383838;border-bottom: 2px solid #f27267;}
          .xiuPhone2 a{width:300px;height: 50px;line-height: 50px; background: #f27267;font-size: 24px;color:#fff;margin-left: 298px;border-radius: 4px;}
            .xiuPhone2{padding-bottom: 208px;}
      </style>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改手机-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">修改手机成功</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="xiuPhone2">
        	<div class="xiuPhone1-top">
            	 <div class="spanText">
                	<span class="sp1">身份验证</span>
                     <i></i>
                    <span class="sp2">输入新手机号</span>
                     <i></i>
                    <span class="sp3 active">完成</span>
                </div>
            </div>
            <h3 style="height: 35px;line-height: 35px;"><i style="width:35px;height:35px;line-height: 35px;"></i>恭喜您已成功修改手机号码！</h3>
            <a style="display:block;" href="${project_name}/user/customer/toSafe">返回账户安全</a>
        </div>
		
    
    </div>

</div>
<!--修改手机 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>