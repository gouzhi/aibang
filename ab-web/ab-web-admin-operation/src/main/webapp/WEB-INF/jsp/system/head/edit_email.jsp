<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${project_name}/">
		
		<meta charset="utf-8" />
		<title>编辑邮箱</title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${css_imagedomain}/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
		
		<script type="text/javascript">
		$(top.hangge());
		function save(){
			var EMAIL = $("#EMAIL").val();
		    window.returnValue=EMAIL;
		    window.close();
		}
		</script>
		
	</head>
<body>
<div>
		<table style="width:100%;" >
			<tr>
				<td style="margin-top:0px;">
					 <textarea name="EMAIL" id="EMAIL" rows="20" cols="50" style="width:97.5%;" placeholder="请选输入对方邮箱,多个请用(;)分号隔开" title="请选输入对方邮箱,多个请用(;)分号隔开">${pd.EMAIL}</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="window.close();">取消</a>
				</td>
			</tr>
		</table>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='${css_imagedomain}/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
</div>
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>