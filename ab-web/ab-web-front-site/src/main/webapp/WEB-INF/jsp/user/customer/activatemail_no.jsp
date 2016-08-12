<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>邮箱验证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />

  
</head> 
 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--邮箱激活-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/center/accountall" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">邮箱验证失败</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="email2">
        	<div class="xiuPhone1-top">
            	
            	 <div class="spanText">
                	<span class="sp1">身份验证</span>
                    <span class="sp2">输入邮箱</span>
                    <span class="sp3">发送邮件</span>
                    <span class="sp4 active">失败</span>
                </div>
        		<img src="${css_imagedomain}/front/images/liuFour.png" />
               
            </div>
    		<h3>非常抱歉，该链接已失效，请重新验证！</h3>
            <a style="display:block;" href="${project_name}/user/customer/toSafe">返回账户安全</a>
        </div>
		
    
    </div>

</div>
<!--邮箱激活 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>