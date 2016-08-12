<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
		<!-- 表单验证 -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
	    <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
	    <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
	    <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
	</head>
	<body> 
		<div class="wapOutside whithBg">
			<div class="header ">
				<a class="arrowLeft" href="javascript:void(0);" id="back"></a>
				<h1>修改密码</h1>
			</div>
			<form name="passForm" id="passForm" action="${project_name}/user/customer/editPass" method="post">
				<div class="pLR16 modifInput" >
					<div class="regInput"><label>旧密码</label>
						<input type="password" value="" name="oldPass" id="oldPass"  placeholder="请输入旧密码" />
						<span class="glyphicon-remove-sign"></span>
					</div>
					<div class="regInput"><label>新密码</label>
						<input type="password" value="" name="newPass" id="newPass" placeholder="请输入新密码" />
						<span class="glyphicon-remove-sign"></span>
					</div>
					<div class="regInput"><label>确认新密码</label>
						<input type="password" value="" name="renewPass" id="renewPass" placeholder="再次确认新密码" />
						<span class="glyphicon-remove-sign"></span>
					</div>
				</div>
				<div class="mobile_sub pLR16">
					<a href="javascript:void(0)" id="subBtn">保存</a>
				</div>
			  </form>
			  
		  </div>
		  <script type="text/javascript">
		  	$(function(){
		  		$('#oldPass,#newPass,#renewPass').focus(function(){
		  			if($(this).val().length==0){
		  				$(this).parent().addClass('errorInput');
		  			}else if($(this).val().length!=0){
		  				$(this).parent().removeClass('errorInput');
		  			}
		  			$(this).attr('placeholder','');
		  			$(this).parent().find('.glyphicon-remove-sign').click(function(){
		  				$('#oldWord').val('').attr('placeholder','请输入旧密码');
		  			})
		  		})
		  		$('#oldPass,#newPass,#renewPass').blur(function(){
		  			if($(this).val().length!=0){
		  				$(this).parent().removeClass('errorInput');
		  			}else{
		  				$(this).parent().removeClass('errorInput');
		  				$(this).val('').attr('placeholder','请输入旧密码');
		  			}
		  		})

		  	});
		  	
		  	//点击提交按钮
		  	$("#subBtn").click(function(){
		  		if(check()){
		  			var oldPass = $("#oldPass").val();
			  		var newPass = $("#newPass").val();
			  		var renewPass = $("#renewPass").val();
			  		$.ajax({
			  			type: "POST",
						url: '${project_name}/user/customer/editPass',
						data: {oldPass:oldPass,newPass:newPass},
						dataType:'json',
						success:function(data){
							if("success" == data.result){
								alert("密码修改成功");
								window.location.href="${project_name}/user/customer/toSafe";
							}else if("errorOld" == data.result){
								alert("请输入旧密码");
							}else if("errorNew" == data.result){
								alert("请输入新密码");
							}else if("errorOldW" == data.result){
								alert("旧密码输入错误");
							}
						}
			  		})
				}
		  	});
		  	
		  	//前端页面验证
		  	 function check(){
		  		var oldPass = $("#oldPass").val();
		  		var newPass = $("#newPass").val();
		  		var renewPass = $("#renewPass").val();
		  		if(oldPass == ""){
		  			alert("请输入旧密码");
		  			return false;
		  		}
		  		if(newPass == ""){
		  			alert("请输入新密码");
		  			return false;
		  		}else if(!(/^.{6,32}$/.test(newPass))){
		  			alert("6~32位字符，至少包含字母、数字和符号的两种以上组合")
		  			return false;
		  		}
		  		if(renewPass == ""){
		  			alert("请输入重复输入新密码");
		  			return false;
		  		}else if(!(/^.{6,32}$/.test(renewPass))){
		  			alert("6~32位字符，至少包含字母、数字和符号的两种以上组合")
		  			return false;
		  		}
		  		if(newPass != renewPass){
		  			alert("两次新密码不一致,请重新输入")
		  			return false;
		  		}
		  		return true;
		  	} 
		  </script>
	</body>
</html>