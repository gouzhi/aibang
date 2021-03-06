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
<form action="companyRegister/corpRegisterQuery.do" name="userForm" id="userForm" method="post">
	<div class="row-fluid"><input type="hidden" name="id" id="user_id" value=""/>
	    <div class="span12">查询企业开户</div>
	</div>
    <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>营业执照编号：</div>
         <div class="span4">
         	<input type="text" class="span11" name="Busicode"  placeholder="输入营业执照编号" title="营业执照编号"/>
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
</script>