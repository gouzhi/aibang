<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${css_imagedomain}/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
<script type="text/javascript" src="${css_imagedomain}/plugins/plupload/plupload.full.min.js"></script>
</head>
<body>
 	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='${css_imagedomain}/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
	<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
	<script src="${css_imagedomain}/js/ace.min.js"></script>

	<script type="text/javascript">
		$(top.hangge());
	</script>
	 
	<a href="fileupload/exportexcel.do">exportexcel</a>

	<script type="text/javascript" src="${css_imagedomain}/plugins/jqueryfileupload/js/vendor/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/plugins/jqueryfileupload/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/plugins/jqueryfileupload/js/jquery.fileupload.js"></script>
	
	
	<li class="pm-item">
		<div class="pm-box"> 
		</div>
		<div class="pm-itemcont">
			<div class="preview" id="aaaa"></div>
			<span class="upload">附图1 <a href="javascript:void(0);"><input
					id="fileupload" field="pic1" class="fileupload" type="file"
					name="uploadFile" multiple></a>
			</span>
		</div>
	</li>
	<li class="pm-item">
		<div class="pm-box"> 
		</div>
		<div class="pm-itemcont">
			<div class="preview"></div>
			<span class="upload">附图2 <a href="javascript:void(0);"><input
					id="fileupload" field="pic2" class="fileupload" type="file"
					name="uploadFile"  multiple></a>
			</span>
		</div>
	</li>
	<li class="pm-item">
		<div class="pm-box"> 
		</div>
		<div class="pm-itemcont">
			<div class="preview"></div>
			<span class="upload">附图3 <a href="javascript:void(0);"><input
					id="fileupload" field="pic3" class="fileupload" type="file"
					name="uploadFile" multiple></a>
			</span>
		</div>
	</li>

<script type="text/javascript">
$('.fileupload').fileupload({
	url : getUploadFullUrl("${upload_pic_path}","image"),
	forceIframeTransport : true,
	singleFileUploads : true,
	maxFileSize : 5000000,//最大文件尺寸
	acceptFileTypes : /(\.|\/)(gif|jpe?g|png)$/i,//文件上传类型正则
	dataType : 'json',//返回数据类型“json”
	messages : {//错误信息提示
		acceptFileTypes : '上传图片类型不正确',
		maxFileSize : '上传图片过大',
		minFileSize : '上传图片太小'
	}, 

	done : function(e, data) {
		if (data.result.result == 'E') {
			alert(data.result.msg);
		} else {
			$("#" + $(e.target).attr("field")).val(
					data.result.data.savePath);
			var imgHtml = '<img style="width: auto; max-width: 88px; height: auto; max-height: 88px;" src="'+data.result.data.savePath+'">';
			$(e.target).parents(".pm-itemcont").find(
					".preview").html(imgHtml);
		} 
	}
});
	</script>
</body>
</html>