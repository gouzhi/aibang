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
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
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
    	top.mainFrame.reloadPage(/usersOpt\/listUsers/);
    });
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
</script>
	</head>
<body>
<div class="center centerW">
<form action="usersOpt/saveU.do" name="userForm" id="userForm" method="post">
	<div class="row-fluid"><input type="hidden" name="id" id="user_id" value="${pd.id }"/>
	    <div class="span12">新增用户信息</div>
	</div>
	<div class="row-fluid">
	    <div class="span2 pl"><span class="required">*</span>登录名称：</div>
	    <div class="span4">
	    	<input type="text" class="span11" name="hjsUser.username" id="loginname" value="${pd.hjsUser.username }" maxlength="32" placeholder="这里输入用户登录名" title="用户登录名" validate="{required:true,usernameCheck:true,messages:{required:'请输入登录名',usernameCheck:'4~16位字符，可使用字母、数字、<br/>“-”和“_”。注册后不能修改'}}"/><br />
	    </div>
	    <div class="span2 pl"><span class="required">*</span>真实姓名：</div>
	    <div class="span4">
	        <input type="text" class="span11" name="hjsUser.realName" id="realname" value="${pd.hjsUser.realName }" maxlength="32" placeholder="这里输入用户真实姓名" title="真实姓名" validate="{required:true,messages:{required:'请输入用户真实姓名'}}"/><br />
	    </div>
	</div>
    <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>用户密码：</div>
         <div class="span4">
         	<input type="password" class="span11" name="hjsUser.password" id="password"  maxlength="32" placeholder="输入密码" title="密码" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'密码格式：6-32位字符，最佳为英文、<br />数字、符号组合'}}"/><br />
         </div>
         <div class="span2 pl"><span class="required">*</span>确认密码：</div>
         <div class="span4">
             <input type="password" class="span11" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" validate="{required:true,equalTo:'#password',messages:{required:'两次密码不一致'}}"/><br />
    	</div>
    </div>
    <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>用户手机：</div>
         <div class="span4">
             <input type="text" class="span11" name="hjsUser.phone" id="PHONE"  value="${pd.hjsUser.phone }"  onkeypress="checkNumFun(this)" onkeyup="checkNumFun(this)"  maxlength="11" placeholder="这里输入手机号" title="手机号" validate="{required:true,isMobile:true,messages:{required:'请输入正确手机号'}}" /><br />
         </div>
        <div class="span2 pl"><span class="required">*</span>电子邮件：</div>
    	<div class="span4"><input class="span11" type="email" name="hjsUser.email" id="EMAIL"  value="${pd.hjsUser.email }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" validate="{required:true,isEmail:true,messages:{required:'请输入正确邮箱'}}" /><br /></div>
    </div>
    <div class="row-fluid">
     	<div class="span2 pl"><span class="required">&nbsp;&nbsp;</span>用户性别：</div>
    	<div class="span4">
    		<select class="span11" name="sex" id="sex" validate="{required:true,messages:{required:'请选择性别'}}">
				<option value="0">女</option>
				<option value="1">男</option>
			</select><br />
    	</div>
     	<div class="span2 pl"><span class="required">&nbsp;&nbsp;</span>用户QQ：</div>
        <div class="span4">
            <input type="text" class="span11" name="qq" id="qq"  value="${pd.qq }" maxlength="32" placeholder="这里输入qq" title="qq"/>
        </div> 	
	</div>
	<div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>用户状态：</div>
        <div class="span4">
         	<select class="span11" name="hjsUser.status" id="status" >
				<option value="1" ${pd.hjsUser.status==1?"selected='selected'":"" }>有效用户</option>
				<option value="2" ${pd.hjsUser.status==2?"selected='selected'":"" }>用户停用</option>
			</select>
        </div>
	</div>
	<div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>选择角色：</div>
        <div class="span4">
            <select class="span11" name="roleinfo" id="role_id" validate="{required:true,messages:{required:'请选择角色'}}">
				<option value="">请选择角色</option>
				<c:forEach items="${roleList}" var="role">
					<option value="${role.id}">${role.roleName}</option>
				</c:forEach>
			</select><br />
        </div>
        <div class="span2 pl"><a class="btn btn-small btn-success" onclick="addrole();">添加</a></div>
	</div>
	<div class="row-fluid" id="addrole">
		<div class="span2 pl"><span class="required">*</span>已添角色：</div>	
	</div>
	<div class="row-fluid">
		<div class="span2 pl"><span class="required">&nbsp;&nbsp;</span>备注信息：</div>
    	<div class="span10">
        	<textarea class="span11" name="remark" id="remark" placeholder="这里输入备注"></textarea>
    	</div>
	</div>
    <div class="row-fluid">
        <input type="submit" value="确定" class="span2" onclick="save();" id="subBtn"/>
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
			}else if(!hasE()){
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
//添加角色选项
var idnum=0;
var roleids=new Array();
function addrole(){
	var roleName=$("#role_id option:selected").text();
	var roleid=$("#role_id option:selected").val();
	if(roleid==""){
		alert("请选择要添加角色");
		$("#role_id").focus();
		return;
	}
	if(checkrole(roleid)){
		$("#addrole").append("<div class='span2 pl' id='div_"+idnum+"'><input type='hidden' name='hjsUser.roles["+idnum+"].id' value='"+roleid+"'/>"+roleName+"<a class='btn btn-mini btn-danger' title='删除' onclick='delrole("+idnum+");'>删除</a></div>");
		roleids[idnum]=roleid;
		idnum++;
	}	
}
function checkrole(v){
	for(var i=0;i<roleids.length;i++){
		if(roleids[i]==v){
			return false;
		}
	}
	return true;
}
//删除角色
function delrole(v){
	$("#div_"+v).remove();	
	roleids.splice(v,1);
	idnum=roleids.length; 
}
function checkNumFun(obj) {
    var Reg = /^[0-9]*[1-9][0-9]*$/;
    var varNum = obj.value;
    if (Reg.test(varNum) == false) {
        if (varNum != '')
            obj.value = '';
    }
}
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
	var refe = true;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
					alert("邮箱已存在");
					ref = false;
				}else{
					ref = true;
				}
	       } 
	});
	return ref;
}
//判断手机号是否存在
function hasP(){
	var phone = $("#PHONE").val();
	var url = "${project_name}/user/hasP.do?phone="+phone;
	var ref = true;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
					alert("手机号已存在");
					ref = false;
				}else{
					ref = true;
				}
	       } 
		});
	return ref;
}
</script>