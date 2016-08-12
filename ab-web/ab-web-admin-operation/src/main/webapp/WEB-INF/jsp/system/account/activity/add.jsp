<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
		<!-- My97DatePicker -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
		<!-- jquery.validate -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/jquery.validation/css/validate.css">
		<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.metadata.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.validate.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/jquery.validation/validate-methods.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				/*登录验证模板*/
				$.metadata.setType("attr", "validate");
				$("#actRecharge").validate({
					errorElement: "em",//用来创建错误提示信息标签(可自定义)
					errorContainer: $("#warning, #summary"),
					errorPlacement: function(error, element) {
						error.appendTo(element.parent());
					}
				});
				document.getElementById("subBtn").onclick = function(){
					if($("#actRecharge").valid()){
						$("#actRecharge").submit();
					}
				}
			});
		</script>
	</head>
<body>
	<div class="center centerW">
		<form id="actRecharge" method="post" action="save.do" >
			<div class="row-fluid">
				<div class="span12">新建</div>
			</div>
			<div class="row-fluid">
				<div class="span2 pl"><span class="required">*</span>充值类型：</div>
				<div class="span4">
					<select class="span11" name="rechargeType" validate="{required:true,messages:{required:'请选择充值类型'}}">
						<option value>请选择</option>
						<c:forEach items="${statusTypes}" var="item">
							<option value="${item.code }">${item.cname }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span2 pl"><span class="required">*</span>充值名称：</div>
				<div class="span4">
					<input class="span11" name="rechargeName" validate="{required:true,messages:{required:'请输入充值名称'}}">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span2 pl"><span class="required">*</span>充值编号：</div>
				<div class="span4">
					<input class="span11" name="rechargeCode" validate="{required:true,messages:{required:'请输入充值编号'}}">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span2 pl"><span class="required">*</span>充值金额：</div>
				<div class="span4">
					<input class="span11" name="value"  validate="{required:true,isFloat:true,intMaxEight:true,isDigitsDot:true,isZeroAmountRecharge:true,isIntGteZero:true,messages:{required:'请输入充值金额'}}">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span2 pl"><span class="required">*</span>关联活动：</div>
				<div class="span4">
					<input class="span11" name="actUrl" validate="{required:true,messages:{required:'请输入关联活动'}}">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span8" style="text-align: center">
						<input type="submit" value="确定" class="span2" id="subBtn"/>
				</div>
			</div>
		</form>
	 </div>
</body>
</html>