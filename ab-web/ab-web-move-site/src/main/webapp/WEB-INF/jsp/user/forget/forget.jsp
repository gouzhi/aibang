<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script> 
	</head>
<body>
<form id="passForm" name="passForm" action="toValidate" method="post">
	<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>找回密码</h1>
  </div>
	 <div class="pLR16">
	    <p class="loadTt">请填写您需要找回的帐号：</p>
	   <div class="regInput inputW1">
	      <label>帐号</label>
	      <input type="text" name="name" value="" id="input_phone_or_email_id" placeholder="输入用户名／手机号／邮箱" />
	      <span class="glyphicon-remove-sign"></span>
	    </div>
	     <div class="regInput inputW1 forgetYz">
	      <label>验证码</label>
	      <input name="code" id="code" type="text" placeholder="请输入验证码" />
	      <img  src="" id="img_code_id" onclick="this.src='code?d='+new Date()*1"  />
	      <span class="glyphicon-repeat"></span></div>
	    <div class="mobile_sub"> <a href="javascript:void(0)" id="subBtn">下一步</a></div>
	  </div>
	</div>
</form>
<script type="text/javascript">	
		function validForm()
		{
			$(".errorInput").removeClass("errorInput");
			if($.trim($("#input_phone_or_email_id").val())=="")
			{
				$("#input_phone_or_email_id").parent().addClass("errorInput");
				alert("请输入手机号或邮箱");
				return false;
			}
			
			if($.trim($("#code").val())=="")
			{
				$("#code").parent().addClass("errorInput");
				alert("验证码不得为空");
				return false;
			}
			
			return true;
		}
		$(function(){
			$("#code").val("");
			$("#img_code_id").click();
			$("#subBtn").click(function(){
				if(validForm())
				{
					$("#passForm").submit();							
				}
			}); 
			
			$(".glyphicon-remove-sign").on("click",function(){
				$(this).prev().val("");
			});
			$(".glyphicon-repeat").on("click",function(){
				$(this).prev().click();
			});
		});
</script>
</body>
</html>