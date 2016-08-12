<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>实名认证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <script>
</script>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
    <div class="account-Right fl">
    	<div class="open_hf">
        	<form id="nameForm" name="nameForm" action="corpRegisterQuery" method="post">
                <div class="hf_name hf pr">
                    营业执照号
                    <input id="Busicode" name="Busicode" type="text" value="" />
                </div>
                <a id="subBtn" href="javascript:void(0);" class="baoSub">查询开户结果</a>
            </form>
        </div>
		
    
    </div>

</div>
<script type="text/javascript">
$(document).ready(function(){
	/*邮箱验证*/
	$.metadata.setType("attr", "validate");
	$("#nameForm").validate({
		onfocusout:false,
		onclick:false,
		onkeyup:false,
		errorElement: "em",//用来创建错误提示信息标签(可自定义)
		errorContainer: $("#warning, #summary"),
		errorPlacement: function(error, element) {
			error.appendTo(element.parent()); 
		}
	});
	//点击提交按钮<em class="error" for="cardId" generated="true">请输入有效身份证号</em>
	document.getElementById("subBtn").onclick = function(){
			$("#nameForm").submit();
	}
});

</script>
</body> 
</html>