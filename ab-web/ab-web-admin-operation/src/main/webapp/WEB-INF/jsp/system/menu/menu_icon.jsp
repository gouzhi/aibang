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
		<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>	

		<script type="text/javascript">
				
				$(top.hangge());
				//保存
				function save(){
					if($("#menuIcon").val()==""){
						alert('请选择图标');
						return false;
					}
					$("#menuForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				}
			function seticon(icon){
				$("#menuIcon").val(icon);
			}	
			
		</script>
		
	</head>
	
	<body>
		<form action="menu/editicon.do" name="menuForm" id="menuForm" method="post">
			<input type="hidden" name="id" id="id" value="${menu.id}"/>
			<input type="hidden" name="menuIcon" id="menuIcon" value=""/>
			<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<tr>
					<td><label onclick="seticon('icon-desktop');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-desktop"></i></span></label></td>
					<td><label onclick="seticon('icon-list');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-list"></i></span></label></td>
					<td><label onclick="seticon('icon-edit');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-edit"></i></span></label></td>
					<td><label onclick="seticon('icon-list-alt');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-list-alt"></i></span></label></td>
					<td><label onclick="seticon('icon-calendar');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-calendar"></i></span></label></td>
					<td><label onclick="seticon('icon-picture');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-picture"></i></span></label></td>
					<td><label onclick="seticon('icon-th');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-th"></i></span></label></td>
					<td><label onclick="seticon('icon-file');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-file"></i></span></label></td>
					<td><label onclick="seticon('icon-folder-open');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-folder-open"></i></span></label></td>
				</tr>
				<tr>
					<td><label onclick="seticon('icon-book');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-book"></i></span></label></td>
					<td><label onclick="seticon('icon-cogs');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-cogs"></i></span></label></td>
					<td><label onclick="seticon('icon-comments');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-comments"></i></span></label></td>
					<td><label onclick="seticon('icon-envelope-alt');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-envelope-alt"></i></span></label></td>
					<td><label onclick="seticon('icon-film');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-film"></i></span></label></td>
					<td><label onclick="seticon('icon-heart');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-heart"></i></span></label></td>
					<td><label onclick="seticon('icon-lock');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-lock"></i></span></label></td>
					<td><label onclick="seticon('icon-exclamation-sign');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-exclamation-sign"></i></span></label></td>
					<td><label onclick="seticon('icon-facetime-video');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="icon-facetime-video"></i></span></label></td>
				</tr>
				<tr>
				<td style="text-align: center;" colspan="100">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
			</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><img src="${css_imagedomain}/images/jzx.gif" /></div>
		</form>
	</body>
	<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>