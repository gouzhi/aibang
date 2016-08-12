<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>查看订单详细信息</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet"
	href="${css_imagedomain}/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet"
	href="${css_imagedomain}/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="${css_imagedomain}/css/ace.min.css" />
<link type="text/css" rel="stylesheet"
	href="${css_imagedomain}/css/ace-responsive.min.css" />
<link type="text/css" rel="stylesheet"
	href="${css_imagedomain}/css/ace-skins.min.css" />
<link type="text/css" rel="stylesheet"
	href="${css_imagedomain}/css/custom.css" />
<script type="text/javascript"
	src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>

</head>
<script type="text/javascript">
$(top.hangge());
</script>
<body>
	<div class="center centerW" id="zhongxin">
		<div class="row-fluid">
			<div class="span12">订单详情</div>
		</div>
		<div class="row-fluid">
			<div class="span1"></div>
			<div class="span8">
				<div class="span2">用户名：</div>
				<div class="span8">${hjsBorrowTender.USERNAME}</div>
			</div>
		</div>
		
		<div class="row-fluid">
			<div class="span1"></div>
			<div class="span8">
				<div class="span2">产品名称：</div>
				<div class="span8">${hjsBorrowTender.B_NAME}</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span1"></div>
			<div class="span8">
				<div class="span2">投标金额：</div>
				<div class="span8">${hjsBorrowTender.TENDER_ACCOUNT}</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span1"></div>
			<div class="span8">
				<div class="span2">预计收益：</div>
				<div class="span8">${hjsBorrowTender.RECOVER_ACCOUNT_ALL}</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span1"></div>
			<div class="span8">
				<div class="span2">订单时间：</div>
				<div class="span8">${hjsBorrowTender.CREATE_TIME}</div>
			</div>
		</div>



	</div>
</body>
<jsp:include page="../../common/alert_message.jsp"></jsp:include>
</html>
