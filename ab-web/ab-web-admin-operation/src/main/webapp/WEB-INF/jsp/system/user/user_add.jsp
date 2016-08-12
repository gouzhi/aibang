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
		<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="${css_imagedomain}/css/chosen.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
		<!-- 共用js -->
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
<script type="text/javascript">

    $(function(){
    	top.mainFrame.reloadPage(/user\/listUsers/);
    });
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//保存
	function save(){
		if($("#role_id").val()==""){
			
			$("#role_id").tips({
				side:3,
	            msg:'选择角色',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#role_id").focus();
			return false;
		}
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
		
		if($("#NUMBER").val()==""){
			
			$("#NUMBER").tips({
				side:3,
	            msg:'输入编号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NUMBER").focus();
			return false;
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
		
		if($("#user_id").val()==""){
			hasU();
		}else{
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $("#loginname").val();
		var url = "${project_name}/user/hasU.do?USERNAME="+USERNAME+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				$("#loginname").css("background-color","#D16E6C");
				
				setTimeout("$('#loginname').val('此用户名已存在!')",500);
				
			}else{
				$("#userForm").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $("#EMAIL").val();
		var url = "${project_name}/user/hasE.do?EMAIL="+EMAIL+"&USERNAME="+USERNAME+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				
				$("#EMAIL").tips({
					side:3,
		            msg:'邮箱已存在',
		            bg:'#AE81FF',
		            time:3
		        });
				
				setTimeout("$('#EMAIL').val('')",2000);
				
			}
		});
	}
	
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $("#NUMBER").val();
		var url = "${project_name}/user/hasN.do?NUMBER="+NUMBER+"&USERNAME="+USERNAME+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				
				$("#NUMBER").tips({
					side:3,
		            msg:'编号已存在',
		            bg:'#AE81FF',
		            time:3
		        });
				
				setTimeout("$('#NUMBER').val('')",2000);
				
			}
		});
	}
	//添加角色选项
	var idnum=0;
	var roleids=new Array();
	function addrole(){
		var roleName=$("#role_id option:selected").text();
		var roleid=$("#role_id option:selected").val();
		if(roleName==""){
			alert("请选择要添加角色");
			$("#role_id").focus();
			return;
		}
		if(checkrole(roleid)){
			$("#addrole").after("<tr id='tr_"+idnum+"' class='info'><td><input type='hidden' name='roles["+idnum+"].id' value='"+roleid+"'/>"+roleName+"<a class='btn btn-mini btn-danger' title='删除' onclick='delrole("+idnum+");'>删除</a></td></tr>");
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
		$("#tr_"+v).remove();	
		roleids.splice(v,1);
		idnum=roleids.length; 
	}
</script>
	</head>
<body>
	<form action="user/saveU.do" name="userForm" id="userForm" method="post">
		<input type="hidden" name="id" id="user_id" value="${pd.id }"/>
		<div id="zhongxin">
		<table>
			<c:if test="${ROLE_ID != '1'}">	
				<tr class="info">
					<td>
					<select class="chzn-select" name="roleinfo" id="role_id" data-placeholder="请选择职位" style="vertical-align:top;">
					<option value=""></option>
					<c:forEach items="${roleList}" var="role">
						<option value="${role.id}">${role.roleName}</option>
					</c:forEach>
					</select>
					</td>
				</tr>
				<tr class="info" id="addrole">
					<td><a class="btn btn-small btn-success" onclick="addrole();">添加角色</a></td>
				</tr>
			</c:if>
			<c:if test="${ROLE_ID == '1'}">
		        <input name="roleId" id="role_id" value="1" type="hidden" />
			</c:if>			
			<tr>
				<td><input type="text" name="username" id="loginname" value="${pd.username }" maxlength="32" placeholder="这里输入用户名" title="用户名"/></td>
			</tr>
			<%-- <tr>
				<td><input type="text" name="number" id="NUMBER" value="${pd.number }" maxlength="32" placeholder="这里输入编号" title="编号" onblur="hasN('${pd.username }')"/></td>
			</tr> --%>
			<tr>
				<td><input type="password" name="password" id="password"  maxlength="32" placeholder="输入密码" title="密码"/></td>
			</tr>
			<tr>
				<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" /></td>
			</tr>
			<tr>
			 <td>
			      <select name="status" id="status" >
					<option value="1" ${pd.status==1?"selected='selected'":"" }>有效用户</option>
				    <option value="2" ${pd.status==2?"selected='selected'":"" }>用户停用</option>
				 </select>
			 </td>
			</tr>
			<%-- <tr>
				<td><input type="text" name="name" id="name"  value="${pd.name }"  maxlength="32" placeholder="这里输入姓名" title="姓名"/></td>
			</tr> --%>
			<tr>
				<td><input type="text" name="phone" id="PHONE"  value="${pd.phone }"  onkeypress="checkNumFun(this)" onkeyup="checkNumFun(this)"  maxlength="11" placeholder="这里输入手机号" title="手机号"/></td>
			</tr>
			<tr>
				<td><input type="email" name="email" id="EMAIL"  value="${pd.email }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.username }')"/></td>
			</tr>
			<tr>
				<td><input type="text" name="hjsUsersOpt.qq" id="qq"  value="${pd.hjsUsersOpt.qq }" maxlength="32" placeholder="这里输入qq" title="qq"/></td>
			</tr>
			<tr class="info">
				<td>
					<select class="chzn-select" name="hjsUsersOpt.sex" id="hjsUsersOpt.sex" data-placeholder="请选择性别" style="vertical-align:top;">
					<option value=""></option>
					<option value="0">女</option>
					<option value="1">男</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><textarea name="hjsUsersOpt.remark" id="hjsUsersOpt.remark" placeholder="这里输入备注"></textarea></td>
			</tr>
			
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.mainFrame.closeCurrTab();">关闭</a>
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
	<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript">
	function checkNumFun(obj) {
	    var Reg = /^[0-9]*[1-9][0-9]*$/;
	    var varNum = obj.value;
	    if (Reg.test(varNum) == false) {
	        if (varNum != '')
	            obj.value = '';
	    }
	}
	$(function() {
		//单选框
		$(".chzn-select").chosen(); 
		$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
		//日期框
		$('.date-picker').datepicker();
		
	});
	</script>
	
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>