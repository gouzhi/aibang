<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>修改支付密码 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  
</head> 
 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改支付密码-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><c:choose><c:when test="${not empty hasPayPass}">修改</c:when><c:otherwise>设置</c:otherwise></c:choose>支付密码成功</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="xiuPass1">
        	<div class="xiuPass1-top">
            	
            	 <div class="spanText">
                	<span class="sp1">安全验证</span>
                    <span class="sp2 "><c:choose><c:when test="${not empty hasPayPass}">修改</c:when><c:otherwise>设置</c:otherwise></c:choose>支付密码</span>
                    <span class="sp3 active">完成</span>
                </div>
        		<img src="${css_imagedomain}/front/images/liu3.png" />
               
            </div>
            <h3><span>${sessionUser.username }</span>恭喜您已成功<c:choose><c:when test="${not empty hasPayPass}">修改</c:when><c:otherwise>设置</c:otherwise></c:choose>支付密码！</h3>
            <a style="display:block;" href="${project_name}/user/customer/toSafe">返回账户安全</a>
        </div>
		
    
    </div>

</div>
<!--修改支付密码 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>