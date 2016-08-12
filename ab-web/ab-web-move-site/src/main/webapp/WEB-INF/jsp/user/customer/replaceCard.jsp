<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="wapOutside">
		  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
		    <h1>更换银行卡</h1>
		  </div>
		  <div class="checkCon">
		    <p>
		      <label>持卡人姓名：</label>${UsrName }
		      
		    </p>
		    <p>
		      <label>持卡人身份证号：</label>
		      ${CertId }</p>
		    <p>
		      <label>已绑定银行账户：</label>${bankName}(尾号${account})
		    </p>
		  </div>
		 <c:choose>
		  	<c:when test="${ExpressFlag == 'Y'}">
		  		<div class="mobile_sub pLR16"> 
		  			<span style="padding-left:90px">该银行卡已开通快捷支付，不可再更改</span>
		  			<a href="${project_name}/user/customer/toSafe">返回账户安全</a>
		  		</div>
		  	</c:when>
		  	<c:otherwise>
		  		 <div  class="mobile_sub pLR16"> <a  id="btnbindingok" href="${project_name}/user/customer/toBindBank">更换银行卡</a></div>
		  	</c:otherwise>
		  </c:choose>	
		</div>
	</body>
</html>