<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<#assign objectNameUpper = table.className>   
<#assign objectNameLower = objectNameUpper?uncap_first> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${r"${project_name}"}/">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${r"${css_imagedomain}"}/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${r"${css_imagedomain}"}/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/ace.min.css" />
		<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/ace-skins.min.css" />
		<script type="text/javascript" src="${r"${css_imagedomain}"}/js/jquery-1.7.2.js"></script>	
		<!--提示框-->
		<script type="text/javascript" src="${r"${css_imagedomain}"}/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	//保存
	function save(){
		
	<#list table.columns as column>
	${column._isNullable}
		<#if column._isNullable >
		if($("#${column.columnNameLower}").val()==""){
			$("#${column.columnNameLower}").tips({
				side:3,
	            msg:'请输入${column.columnAlias}',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#${column.columnNameLower}").focus();
			return false;
		}
		</#if>
	</#list>
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
	</head>
<body>
	<form action="${objectNameLower}/${r"${msg }"}.do" name="Form" id="Form" method="post">
		<input type="hidden" name="${objectNameUpper}_ID" id="${objectNameUpper}_ID" value="${r"${pd."}${objectNameUpper}_ID${r"}"}"/>
		<div id="zhongxin">
		<table>
		<#list fieldList as var>
			<#if var[3] == "是">
				<#if var[1] == 'Date'>
					<tr>
						<td><input class="span10 date-picker" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="${var[2] }" title="${var[2] }"/></td>
					</tr>
				<#elseif var[1] == 'Integer'>
					<tr>
						<td><input type="number" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}" maxlength="32" placeholder="这里输入${var[2] }" title="${var[2] }"/></td>
					</tr>
				<#else>
					<tr>
						<td><input type="text" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}" maxlength="32" placeholder="这里输入${var[2] }" title="${var[2] }"/></td>
					</tr>
				</#if>
			</#if>
		</#list>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
 
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>