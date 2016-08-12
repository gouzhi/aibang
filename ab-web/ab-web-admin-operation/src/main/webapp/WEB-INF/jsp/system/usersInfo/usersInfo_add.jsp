<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html >
	<head>
		<base href="${project_name}/">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
        <link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
        <script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>		
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
		<!-- 共用js -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/jquery.validation/css/validate.css">
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.metadata.js"></script>
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.validate.js"></script>
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/validate-methods.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
		<script type="text/javascript">
    $(function(){
    	top.mainFrame.reloadPage(/usersInfo\/listU/);
    });
	$(top.hangge());	
</script>
	</head>
<body>
<div class="center centerW">
<form action="usersInfo/add.do" name="userForm" id="userForm" method="post">
	<div class="row-fluid"><input type="hidden" name="id" id="user_id" value=""/>
	    <div class="span12">新增会员信息</div>
	</div>
	<div class="row-fluid">
	    <div class="span2 pl"><span class="required">*</span>登录名称：</div>
	    <div class="span4">
	    	<input type="text" class="span11" name="hjsUser.username" id="loginname" value="" maxlength="32" placeholder="这里输入用户登录名" title="用户登录名" validate="{required:true,usernameCheck:true,messages:{required:'请输入登录名',usernameCheck:'登录名长度4-16个字符，仅允许中英文、数字、下划线，注册后不能修改'}}"/><br />
	    </div>
	    <div class="span2 pl"><span class="required">*</span>手机号码：</div>
	    <div class="span4">
	        <input type="text" class="span11" name="hjsUser.phone" id="PHONE"  value=""  maxlength="11" placeholder="这里输入手机号" title="手机号" validate="{required:true,isMobile:true,messages:{required:'请输入正确手机号'}}" /><br />
	    </div>
	</div>
    <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>登录密码：</div>
         <div class="span4">
         	<input type="password" class="span11" name="hjsUser.password" id="password"  maxlength="32" placeholder="输入密码" title="密码" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'密密码格式：6-32位字符，最佳为英文、数字、符号组合'}}"/><br />
         </div>
         <div class="span2 pl"><span class="required">*</span>确认密码：</div>
         <div class="span4">
             <input type="password" class="span11" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" validate="{required:true,equalTo:'#password',messages:{required:'两次密码不一致'}}"/><br />
    	</div>
    </div>
    <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>支付密码：</div>
         <div class="span4">
         	<input type="password" class="span11" name="hjsUserBase.payPassword" id="paypassword"  maxlength="32" placeholder="输入密码" title="密码" validate="{required:true,isPwd:true,messages:{required:'请输入支付密码',isPwd:'密密码格式：6-32位字符，最佳为英文、数字、符号组合'}}"/><br />
         </div>
         <div class="span2 pl"><span class="required">*</span>确认密码：</div>
         <div class="span4">
             <input type="password" class="span11" name="chkpwd1" id="chkpwd1"  maxlength="32" placeholder="确认支付密码" title="确认支付密码" validate="{required:true,equalTo:'#paypassword',messages:{required:'两次密码不一致'}}"/><br />
    	</div>
    </div>
    <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>邀请码：</div>
         <div class="span4">
         	<input type="text" class="span11" name="inviteCode" id="inviteCode" placeholder="输入邀请码" title="邀请码"/>
         </div>
    </div>
    <div class="row-fluid">
        <input type="submit" value="确定" class="span2" id="subBtn"/>
        <input type="buttom" value="关闭" class="span2" onclick="top.mainFrame.closeCurrTab()"/>
    </div>
</form>
</div>
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>	
<script type="text/javascript">
$(document).ready(function(){
	/*登录验证模板*/
	$.metadata.setType("attr", "validate");
	$("#userForm").validate({
		onfocusout:false,
		onclick:false,
		onkeyup:false,
		errorElement: "em",//用来创建错误提示信息标签(可自定义)
		errorContainer: $("#warning, #summary"),
		errorPlacement: function(error, element) {
			error.appendTo(element.parent()); 
		}
	});
	//点击提交按钮
	document.getElementById("subBtn").onclick = function(){
		if($("#userForm").valid()){
			if(!hasU()){
				return false;	
			}else if(!hasP()){
				return false;
			}else{
				$("#userForm").submit();
			}			
		}
	}
});
$(function(){
	$("#projectid").change(function(){
		var projectRemark = $("#projectid").find("option:selected").attr("projectRemark");
		projectRemarkEditor.setContent(projectRemark);
	});
	$("#vouchId").change(function(){
		var descr = $("#vouchId").find("option:selected").attr("descr");
		vouchRemarkEditor.setContent(descr);
	});
});
//判断用户名是否存在
function hasU(){
	var USERNAME = $("#loginname").val();
	var url = "${project_name}/user/hasU.do?username="+USERNAME;
	var ref = true;
	$.ajax({ 
	   type: "post", 
       url: url, 
       cache:false, 
       async:false,  
       success: function(data){
    	   if(data=="error"){
				alert("用户名已存在");
				ref=false;
			}else{
				ref=true;
			}
       } 
	});
	return ref;
}
//判断邮箱是否存在
function hasE(){
	var email = $("#EMAIL").val();
	var url = "${project_name}/user/hasE.do?email="+email;
	var ref= true
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
					alert("邮箱已存在");
					ref=false;
				}else{
					ref=true;
				}
	       } 
	});
	return ref;
}
//判断手机号是否存在
function hasP(){
	var phone = $("#PHONE").val();
	var url = "${project_name}/user/hasP.do?phone="+phone;
	var ref=true;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
					alert("手机号已存在");
					ref=false;
				}else{
					ref=true;
				}
	       } 
		});
	return ref;
}
</script>