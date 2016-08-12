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
<input type="hidden" name="id" id="id" value="${info.id}"/>
<input type="hidden" name="userId" id="userId" value="${info.userId}"/>
<div id="zhongxin" style="padding: 15px 0 0 20px;font-size: 16px;">
	<table style="width: 100%">
		<tr>
			<td>审核状态：</td>
			<td style="font-size:15px; ">
				<c:if test="${info.status==1 }">
				<input type="hidden" name="status" id="status" value="1"/>审核通过
				</c:if>
				<c:if test="${info.status!=1 }">
				<input style="opacity:1;position: inherit;vertical-align: middle;width: 15px;" type="radio" class="" name="status" id="status" value="0" <c:if test="${info.status==0 }">checked="checked"</c:if> /><span style="margin-right: 50px;vertical-align: middle;">待审核</span>
	    		<input style="opacity:1;position: inherit;vertical-align: middle;width: 15px;" type="radio" class="" name="status" id="status" value="1" <c:if test="${info.status==1 }">checked="checked"</c:if> /><span style="margin-right: 50px;vertical-align: middle;">审核通过</span>
	    		<input style="opacity:1;position: inherit;vertical-align: middle;width: 15px;" type="radio" class="" name="status" id="status" value="-1" <c:if test="${info.status==-1 }">checked="checked"</c:if> /><span style="margin-right: 50px;vertical-align: middle;">审核不通过</span>
				</c:if>
			</td>
		</tr>
		<tr style="height: 20px;"></tr>
		<tr style="position: relative;">
			<td style="position: absolute;">审核备注：</td>
			<td><textarea rows="" cols="" style="margin: 0px 0px 10px;width: 400px;height: 100px;resize: none;" name="verifyMemo">${info.verifyMemo}</textarea></td>
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
//审核
function auditingSb(){
	if(window.confirm("确认执行操作吗？")){
		$.ajax({
			url:"hjsapproverealname/audit.do",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(data){
				if(data == "200"){
					alert("审核成功");
					top.Dialog.close();
				}else{
					alert(data);
				}
			}
		});
	}
}
</script>