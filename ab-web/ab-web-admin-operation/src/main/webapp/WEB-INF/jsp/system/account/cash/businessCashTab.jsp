<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<base href="${project_name}/">
<title>操作</title>
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
<script type="text/javascript" src="${css_imagedomain}/js/ace-elements.min.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/ace.min.js"></script>

</head>
<script type="text/javascript">
top.hangge();
function auditingSb(){
	 if(window.confirm("确认取现?")){
		var verifyRemarkLength=$("textarea[name='poolMemo']").val().length;
		if(verifyRemarkLength>255){
			alert("输入内容在255个字以内");
			return false;
		}
		 $.ajax({
			url:"${project_name}/cash/merchCash.do?amount=${amount}",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			async: false,
			success:function(data){
				if(data.state == '2'){
					alert(data.msg);
					top.Dialog.close();	
					return;
				}
				if(data.state == '0'){
					alert(data.msg);
					top.Dialog.close();	
				}else{
					alert(data.msg);
					top.Dialog.close();
				}
			}
		}); 
		
	} 
}
</script>
<body>
<form action="cash/merchCash.do" id="form"  method="post" >

<input type="hidden" name="borrowId" id="borrowId" value="${borrowId}"/>
<div id="zhongxin" style="padding: 15px 0 0 20px;font-size: 16px;">
	<table style="width: 100%">
		<tr>
			<td>商户代取现金额：</td>
			<td>${amount}</td>
		</tr>
		<tr style="height: 20px;"></tr>
		<tr style="position: relative;">
			<td style="position: absolute;">备注：</td>
			<td><textarea rows="" cols="" style="margin: 0px 0px 10px;width: 400px;height: 100px;resize: none;" name="poolMemo"></textarea></td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="2">
			<a class="btn btn-mini btn-primary" style="padding: 1px 25px;" onclick="auditingSb()">确认</a>
			<a class="btn btn-mini btn-danger" style="padding: 1px 25px;" onclick="top.Dialog.close();">关闭</a>
			</td>
		</tr>
	</table>
</div>
</form>
<div id="zhongxin2" class="center" style="display:none"><img src="${css_imagedomain}/images/jzx.gif"  style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
</body>

</html>


