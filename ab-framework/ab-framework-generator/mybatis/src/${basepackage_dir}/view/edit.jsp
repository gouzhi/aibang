<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<#assign objectNameUpper = table.className>   
<#assign objectNameLower = objectNameUpper?uncap_first> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${r"${project_name}"}/">
		<!-- jsp文件头和头部 -->
	    <%@ include file="../admin/top.jsp"%> 
		<script type="text/javascript">
			//保存
			function save(){
				<#list table.columns as column>
					<#if column.fieldNull=="false" >
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
			 <#list table.columns as column>
				<#if column.fieldNull=="false">
					<#if column.javaType == 'java.util.Date'>
						<tr>
							<td><input class="span10 date-picker" name="${column.columnNameLower}" id="${column.columnNameLower}" value="${r"${pd."}${column.columnNameLower}${r"}"}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="${column.columnAlias}" title="${column.columnAlias}"/></td>
						</tr>
					<#elseif column.javaType == 'java.lang.Integer'>
						<tr>
							<td><input type="number" name="${column.columnNameLower}" id="${column.columnNameLower}" value="${r"${pd."}${column.columnNameLower}${r"}"}" maxlength="32" placeholder="这里输入${column.columnAlias}" title="${column.columnAlias}"/></td>
						</tr>
					<#else>
						<tr>
							<td><input type="text" name="${column.columnNameLower}" id="${column.columnNameLower}" value="${r"${pd."}${column.columnNameLower}${r"}"}" maxlength="32" placeholder="这里输入${column.columnAlias}" title="${column.columnAlias}"/></td>
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