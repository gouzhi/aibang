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
	<script type="text/javascript">
		$(top.hangge());
		var windControlEditor = UE.getEditor('windControl',{readonly:true});
	</script>
	</head>
<body>
	<%-- <input type="hidden" value="${var.id}" name="id"/> --%>
	<div class="row-fluid">
	    <div class="span12">红包详细信息</div>
	</div>
	<div class="row-fluid">
     	<div class="span2 pl">红包类型：</div>
         <div class="span4">
           <c:forEach items="${actBonus }" var="item">
           <c:if test="${hjsActBonus.type eq item.code}"><span>${item.cname }</span></c:if>
           </c:forEach>
         </div>
     </div>
    <div class="row-fluid">
	    <div class="span2 pl">红包名称：</div>
	    <div class="span4"><span>${hjsActBonus.bname}</span></div>
	</div>
    <div class="row-fluid">
	    <div class="span2 pl">红包编号：</div>
	    <div class="span4"><span>${hjsActBonus.bcode}</span></div>
	</div>
    <div class="row-fluid">
	    <div class="span2 pl">红包周期：</div>
	    <div class="span4"><span>${hjsActBonus.avlDays}天</span></div>
	</div>
    <div class="row-fluid">
	    <div class="span2 pl">红包面值：</div>
	    <div class="span4"><span>${hjsActBonus.value}元</span></div>
	</div>
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
			
			$("#subBtn").click(function(){
				 if($("Form").valid()){
		                 var startTime=$("#startTime").val();//开始时间
						 alert(startDate);
						 var stopTime=$("#stopTime").val();//停止时间
						 var type=$("#type").val();//活动类型
						 var status=$("#status").val();//活动状态
						 var bonusId=$("#bonusId").val();//活动红包Id
						 var bonusChargesId=$("#bonusChargesId").val();//返佣红包Id
						 if(startTime == ""){
							 alert("输入开始时间不能为空。");
							 return false; 
						 }
						 if(stopTime == ""){
							 alert("输入停止时间不能为空。");
							 return false; 
						 }
						 if(type == ""){
							 alert("请输入活动类型。");
							 return false;
						 }
						 if(status == ""){
							 alert("请输入红包类型。");
							 return false;
						 }
						 if(bonusChargesId == ""){
							 alert("请输入返佣红包类型。");
							 return false;
						 }
						 alert("success")
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