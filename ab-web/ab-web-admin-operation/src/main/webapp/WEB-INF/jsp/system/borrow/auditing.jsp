<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>审核</title>
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
</script>
<body>
<form action="" id="form"  method="post">

<input type="hidden" name="borrowids" id="borrowids" value="${borrowids}"/>
<div id="zhongxin" style="padding: 15px 0 0 20px;font-size: 16px;">
	<table style="width: 100%">
		<tr>
			<td>审核状态：</td>
			<td style="font-size:15px; ">
				<input type="radio" value="${verifyStatusSucess}" name="verifyStatus" checked="checked" style="opacity:1;position: inherit;vertical-align: middle;width: 15px;"/><span style="margin-right: 50px;vertical-align: middle;">通过</span>
				<input type="radio" value="${verifyStatusFaile}" name="verifyStatus" style="opacity:1;position: inherit;vertical-align: middle;width: 15px;"/><span style="vertical-align: middle;">不通过</span>
			</td>
		</tr>
		<tr style="height: 20px;"></tr>
		<tr style="position: relative;">
			<td style="position: absolute;">审核备注：</td>
			<td><textarea rows="" cols="" style="margin: 0px 0px 10px;width: 400px;height: 100px;resize: none;" name="verifyRemark"></textarea></td>
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
<%@include file="../../common/alert_message.jsp"%>
</html>
<script type="text/javascript">
function auditingSb(){
	if(window.confirm("确认审批?")){
		var verifyRemarkLength=$("textarea[name='verifyRemark']").val().length;
	
		if(verifyRemarkLength>255){
			alert("输入内容在255个字以内");
			return false;
		}
		 $.ajax({
			url:"borrow/auditingSb.do",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(data){
				if(data.state == '0'){
					alert(data.msg);
					top.Dialog.close();
					window.location.reload(true);
				}else{
					alert(data.msg);
					top.Dialog.close();
					window.location.reload(true);
				}
			}
		}); 
	}
}
</script>