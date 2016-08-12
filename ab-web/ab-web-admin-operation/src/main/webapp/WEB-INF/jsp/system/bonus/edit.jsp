<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${project_name}/">
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%> 
   	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
	<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
	<!-- My97DatePicker -->
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
	<!-- ueditor -->
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/lang/zh-cn/zh-cn.js"></script>
	<!-- jquery.validate -->
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/jquery.validation/css/validate.css">
	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.metadata.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.validate.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/validate-methods.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
		
	</head>
<body>
	<form action="hjsactbonus/edit.do" name="Form" id="Form" method="post">
		<input type="hidden" name="id" id="id" value="${hjsActBonus.id}"/>
		<div id="zhongxin"> 
		<!-- 标题头部 -->
		<div class="row-fluid">
	    	<div class="span12">红包基本信息</div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包类型：</div>
	         <div class="span3">
	             <select class="span11" name="type" validate="{required:true,messages:{required:'请选择红包类型'}}" id="type" value="${hjsActBonus.type}">
	                <!-- 配置信息 -->
					<c:forEach items="${actBonus}" var="pc" varStatus="vspc">
						<option value="${pc.code}">${pc.cname}</option>
					</c:forEach>
	            </select>
	         </div>
	   </div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包名称：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包名称" class="span11" name="bname" id="bname" value="${hjsActBonus.bname}" validate="{required:true,messages:{required:'请选择红包名称'}}"/></div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包编号：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包编号" class="span11" name="bcode" id="bcode" value="${hjsActBonus.bcode}" validate="{required:true,messages:{required:'请选择红包编号'}}"/></div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包周期：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包周期" class="span11" name="avlDays" id="avlDays" value="${hjsActBonus.avlDays}" validate="{required:true,messages:{required:'请选择红包周期'}}"/>天</div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包面值：</div> 
		    <div class="span3"><input type="text" placeholder="请输入红包面值" class="span11" name="value" id="value" value="${hjsActBonus.value}" validate="{required:true,messages:{required:'请选择红包面值'}}"/></div>
		</div>
		<div class="row-fluid">
        <input type="submit" value="确定" class="span2" id="subBtn" />
        <input type="submit" value="关闭" class="span2" onclick="top.mainFrame.closeCurrTab()"/>
    </div>
	</form>
	 
	<script type="text/javascript">
		$(document).ready(function(){
			/*登录验证模板*/
			$.metadata.setType("attr", "validate");
			$("#Form").validate({
				onfocusout:false,
				onclick:false,
				onkeyup:false,
				errorElement: "em",//用来创建错误提示信息标签(可自定义)
				errorContainer: $("#warning, #summary"),
				errorPlacement: function(error, element) {
					error.appendTo(element.parent()); 
				}
			});
			//表单验证
			
			$("#subBtn").click(function(){
				 if($("Form").valid()){
						 var bname=$("#bname").val();//红包名称
						 var bcode=$("#bcode").val();//红包编号
						 var bcode=$("#bcode").val();//红包周期
						 var avlDays=$("#avlDays").val();//红包面值
						 if(type == ""){
							 alert("请输入紅包类型。");
							 return false;
						 }
						 if(bname == ""){
							 alert("请输入紅包名称。");
							 return false;
						 }
						 if(bcode == ""){
							 alert("请输入紅包编号。");
							 return false;
						 }
						 if(avlDays == ""){
							 alert("请输入紅包周期。");
							 return false;
						 }
						 if(value == ""){
							 alert("请输入紅包面值。");
							 return false;
						 }
						 //提交增加活动基本信息操作
						 $("#Form").submit();
					 }
				});
		});
		
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