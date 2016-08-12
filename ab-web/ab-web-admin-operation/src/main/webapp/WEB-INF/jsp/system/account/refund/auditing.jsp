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
<input type="hidden" name="id" id="id" value="${id}"/>
<div id="zhongxin" style="padding: 15px 0 0 20px;font-size: 16px;">
	<table style="width: 100%">
	    <tr>
			<td>还款操作：</td>
			<td style="font-size:15px; ">
				<input type="radio" value="2" name="verifyStatus" checked="checked" style="opacity:1;position: inherit;vertical-align: middle;width: 15px;"/><span style="margin-right: 50px;vertical-align: middle;">还款</span>
			</td>
		</tr>
		<tr style="height: 20px;"></tr>
		<tr >
			<td >备注：</td>
			<td><textarea rows=""  maxlength="200" cols="" style="margin: 0px 0px 10px;width: 400px;height: 100px;resize: none;" name="verifyRemark" id="verifyRemark"></textarea></td>
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
<jsp:include page="../../../common/alert_message.jsp"  ></jsp:include>
</html>
<script type="text/javascript">
function auditingSb(){
	if($("#verifyRemark").val().length>200)
    {
    	alert("备注长度不能超过200个字符");
    	return;
    }
		$.ajax({
			url:"${project_name}/refund/auditingSb.do",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			async: false,
			success:function(data){
				if(data == "200"){
					alert("还款成功");
					top.Dialog.close();
				}else{
					alert(data);
				}
			}
			,error: function(data){ 
				if(data.responseText == "200"){
					alert("还款成功");
					top.Dialog.close();
				}else{
					alert(data.responseText);
				}
			 
			}
		});
}
</script>