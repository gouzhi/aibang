<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${project_name}/">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${css_imagedomain}/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="${css_imagedomain}/css/chosen.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
		
<script type="text/javascript">
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
	<form action="usersOpt/editUP.do" name="userForm" id="userForm" method="post">
		<input type="hidden" name="id" id="user_id" value="${pd.id }"/>
		<input type="hidden" name="hjsUser.id" id="userId" value="${pd.hjsUser.id }"/>
		<input type="hidden" name="hjsUser.typeId" id="typeId" value="${pd.hjsUser.typeId}"/>
		<input type="hidden" name="hjsUser.isDel" id="isDel" value="${pd.hjsUser.isDel}"/>
		<input type="hidden" name="hjsUser.entId" id="entId" value="${pd.entId }"/>
		<div id="zhongxin">
		<table>
			<c:if test="${!empty pd.hjsUser.roles}">
				<c:forEach items="${pd.hjsUser.roles}" varStatus="i" var="rol">
					<tr id='tr_${rol.id}' class='info'>
						<td>
							<input type='hidden' name='hjsUser.roles[${i.index}].id' id='${rol.id}' value='${rol.id}'/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td><input type="text" name="hjsUser.username" id="loginname" value="${pd.hjsUser.username }" maxlength="32" placeholder="这里输入用户名" title="用户名"/></td>
			</tr>
			
			<tr>
				<td><input type="password" name="hjsUser.password" id="password"  maxlength="32" placeholder="输入密码" title="密码"/></td>
			</tr>
			<tr>
				<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" /></td>
			</tr>
			<%-- <tr>
				<td><input type="text" name="name" id="name"  value="${pd.name }"  maxlength="32" placeholder="这里输入姓名" title="姓名"/></td>
			</tr> --%>
			<tr>
			 <tr>
				<td><input type="text" name="hjsUser.phone" id="PHONE"  value="${pd.hjsUser.phone }"  onkeypress="checkNumFun(this)" onkeyup="checkNumFun(this)"  maxlength="11" placeholder="这里输入手机号" title="手机号"/></td>
			</tr>
			<tr>
				<td><input type="email" name="hjsUser.email" id="EMAIL"  value="${pd.hjsUser.email }" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<td><input type="text" name="qq" id="qq"  value="${pd.qq }" maxlength="32" placeholder="这里输入qq" title="qq"/></td>
			</tr>
			<tr class="info">
				<td>
					<select class="chzn-select" name="sex" id="sex" data-placeholder="请选择性别" style="vertical-align:top;">
					<option value=""></option>
					<option value="0" ${pd.sex==0?"selected='selected'":"" }>女</option>
					<option value="1" ${pd.sex==1?"selected='selected'":"" }>男</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><textarea name="remark" id="remark" placeholder="这里输入备注">${pd.remark }</textarea></td>
			</tr>
			</tr>
			
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="${css_imagedomain}/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		<script type="text/javascript">	
	//保存
	function save(){
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}		
		if($("#user_id").val()=="" && $("#password").val()==""){
			
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			
			$("#chkpwd").focus();
			return false;
		}
		if($("#name").val()==""){
			
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}
		
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		
		if($("#EMAIL").val()==""){
			
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}
		
		if(checkUnipue()){
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}else{
			return false;
		}
	}	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	var res;
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $("#loginname").val();
		var userid = $("#userId").val();
		var url = "${project_name}/user/hasU.do?id="+userid+"&username="+USERNAME;
		$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
					alert("用户名已存在");
					res=false;
					return;
				}else{
					res=true;
					return;
				}
	       } 
		});
	}
	//判断邮箱是否存在
	function hasE(){
		var email = $("#EMAIL").val();
		var userid = $("#userId").val();
		var url = "${project_name}/user/hasE.do?id="+userid+"&email="+email;
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false,  
		       success: function(data){
		    	   if(data=="error"){
						alert("邮箱已存在");
						res=false;
						return;
					}else{
						res=true;
						return;
					}
		       } 
		});
	}
	//判断手机号是否存在
	function hasP(){
		var phone = $("#PHONE").val();
		var userid = $("#userId").val();
		var url = "${project_name}/user/hasP.do?id="+userid+"&phone="+phone;
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false,  
		       success: function(data){
		    	   if(data=="error"){
						alert("手机号已存在");
						res=false;
						return;
					}else{
						res=true;
						return;
					}
		       } 
			});
	}
	
	function checkUnipue(){		
		hasU();
		hasE();
		hasP();
		return res;
	}
</script>
	
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>