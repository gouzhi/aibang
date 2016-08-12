<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="description" content="overview & stats" />
<base href="${project_name}/">
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
<title>企业取现</title>
<script type="text/javascript">
$(top.hangge());
$(document).ready(function(){
	$("#subBtn").click(function (){
		var isNum = /^\d+(\.\d{0,9})?$/;
	 	var isNum1= /^\d+(\.\d{0,2})?$/;
	 	var isNum2=/^([1-9][\d]{0,7}|0)(\.[\d]{0,2})?$/;
        var money = $("input[name='amount']").val();
        
        if(money<1){
        	$("#validate1").html("最低取现金额应大于等于 1 元");
        	//alert("请充值金额大于1");
        	return;
        }
        if(!isNum.test(money)){
        	$("#validate1").html("请输入正确的金额");
            //alert("请输入正确的金额");
            return;
        } 
        if(!isNum1.test(money)){
        	$("#validate1").html("请只保留两位小数");
        	 //alert("请只保留两位小数");
	            return;
        }
        if(!isNum2.test(money)){
        	$("#validate1").html("请输入金额小于9位");
            //alert("请输入正确的金额");
            return;
        }  
        $("#validate1").html("");
        var userbaseId=$("#userBaseId").val();
        if(userbaseId=="" ||userbaseId==null ){
     	   alert("请选择企业");
        	return false;
        }
	    $("#companyCash").submit();
	});
	
	
});

</script>
</head>
<body>
<form id="companyCash" action="cash/outMerchCash" method="post" > 
<!-- <form id="companyCash" action="cash/merchCash" method="post" target="_blank"> -->
<p style="margin-left: 42px"><span class="required">*</span>取现企业：
<select style="margin-left: 55px" name="userBaseId" id="userBaseId">
<option value="">==请选择企业==</option>
<c:forEach items="${enterprice }" var="item" varStatus="status" >
<option value="${item.ID }">${item.ENT_NAME }</option>
</c:forEach>
</select><br></p>
<div class="span2 pl"><span class="required">*</span>提现金额：</div>
<input type="text" name="amount" validate="{required:true,messages:{required:'请输入金额'}}"/>
<div id="validate1" style="color:red" value=""></div>

<input type="button" style="margin-left: 220px" value="提交" class="span2" id="subBtn"/>
</form>

</body>
</html>