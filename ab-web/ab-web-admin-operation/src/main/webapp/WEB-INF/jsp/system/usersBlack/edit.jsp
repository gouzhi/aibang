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
		<link rel="stylesheet" href="${css_imagedomain}/css/addUser.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
		
	</head>
<body>
<div class="center">
  	<form action="${project_name}/usersBlack/edit" method="post" name="addForm" id="addForm">  
    <input type="hidden" id="ids" name="ids" value="${ids}" />
    <div class="row-fluid">
        <div class="span12">受限设置</div>
    </div>   
    <div class="row-fluid">
        <div class="span11">
        	<span class="w20"></span>
             <label><input type="checkbox" value="1" id="charge" name="charge"><span class="lbl"></span><span>限制返佣</span></label>
             <label><input type="checkbox" value="1" id="limiteTender" name="limiteTender"><span class="lbl"></span><span>限制投资</span></label>
        </div>
    </div>
    <div class="row-fluid">
        <input type="button" onclick="edit();" value="确定" class="sure" />
    </div>
    </form>
</div>
</body>
</html>	
<script type="text/javascript">		
$(top.hangge());
function search(){
	$("#checkForm").submit();
}
function edit(){
	if(!$("#charge").is(":checked") && !$("#limiteTender").is(":checked")){
		alert("请选择要限制的内容");
		return false;
	}
	$("#addForm").submit();
}
</script>
<script type="text/javascript">		
		$(function() {									
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});	
</script>