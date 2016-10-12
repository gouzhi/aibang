<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>爱帮</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
	</head>
	<body>
		<input id="nav_point" type="hidden" value="个人中心">
	<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>登录</h1>
    <a href="${project_name}/register" class="alreadyEnter">注册</a> </div>
			<form id="login_form" name="login_form" action="reg" method="post">
				<input type="hidden" id="passwordLevel" name="passwordLevel" value="" />
				<div class="pLR16 marginT16">
					  <div class="regInput landYz">
					   <label><img src="${css_imagedomain}/move/images/passIcon1.png" /></label>
						<input type="text" value=""  id="username" name="username" placeholder="请输入用户名／手机号／邮箱" />
						<span class="glyphicon-remove-sign"></span>
					</div>
					 <div class="regInput landYz">
                        <label><img src="${css_imagedomain}/move/images/passIcon2.png" /></label>
						<input name="password" type="password" id="password" maxlength="32" placeholder="请输入您的登录密码" />
						<span class="glyphicon-remove-sign"></span> 
						<%-- <a href="${project_name}/toFindPass" class="forgetNode">忘记密码</a> --%>
					</div>
				   <div class="regInput landYz landYzAgain">
				        <label><img src="${css_imagedomain}/move/images/passIcon3.png" /></label>
				        <input name="code" id="code" type="text" placeholder="请输入验证码" /> 
						<img id="img_code" src="code" onclick="this.src='code?d='+new Date()*1" />
						<span class="glyphicon-repeat"></span>
					</div>
					<div class="mobile_sub">
						<a href="javascript:void(0)" id="submit_login">登录</a>
					</div>
					<div class="forgetNode"><a href="${project_name}/toFindPass">找回密码</a></div>
				</div>
			</form>
			<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
		</div>
		<%@ include file="/WEB-INF/jsp/common/alert_message.jsp"%>
	</body>
	<script type="text/javascript">
	$(function(){
		//提交登录
		$("#submit_login").click(function(){
			if(check())
			{
				$.post('${project_name}/login', $('#login_form').serialize(), function(response){
					if("success" == response.result){
						alert(window.location.href);
						//window.location.href="http://127.0.0.1:8888" + "${project_name}/user/center/accountall";
						window.location.href="http://127.0.0.1:8888" + "${project_name}/toIndex";
					}else
					{
						alert(response.result);
						$("#img_code").click();
					}
				},"json");
			}
		});
		
		$(".glyphicon-remove-sign").on("click",function(){
			$(this).prev().val("");
		});
		
		$(".glyphicon-repeat").on("click",function(){
			$(this).prev().click();
		});
		
		
		 
	});
	//客户端校验
	function check() {
		//$(".errorInput").removeClass("errorInput");
		if ($("#username").val() == "") {
			alert('用户名不得为空');
			$("#username").parent().addClass("errorInput");
			$("#username").focus();
			return false;
		} else {
			$("#username").val($.trim($('#username').val()));
			$("#username").parent().removeClass("errorInput");
		}
		if ($("#password").val() == "") {
			alert('密码不得为空');
			$("#password").parent().addClass("errorInput");
			$("#password").focus();
			return false;
		}
		if ($("#code").val() == "") {
			alert('验证码不得为空'); 
			$("#code").parent().addClass("errorInput");
			$("#code").focus();
			return false;
		}
		return true;
	}
	</script>
</html>