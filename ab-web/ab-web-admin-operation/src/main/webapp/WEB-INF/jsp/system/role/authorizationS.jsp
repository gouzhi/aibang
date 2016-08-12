<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title></title>

<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />

<link type="text/css" rel="stylesheet" href="${css_imagedomain}/plugins/zTree/2.6/zTreeStyle.css"/>
<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />


<style type="text/css">
footer{height:50px;position:fixed;bottom:0px;left:0px;width:100%;text-align: center;}
</style>

</head>
<body>
	<div id="zhongxin">
		<ul id="tree" class="tree" style="overflow:auto;"></ul>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="${css_imagedomain}/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	
	
	<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
	
	<script type="text/javascript">
	$(top.hangge());
	var zTree;
	$(document).ready(function(){
			
			var setting = {
			    showLine: true,
			    checkable: true
			};
			var zn = '${zTreeNodes}';
			var zTreeNodes = eval(zn);
			zTree = $("#tree").zTree(setting, zTreeNodes);
		});
	</script>
	<script type="text/javascript">
	
		 function save(){
			   
				var nodes = zTree.getCheckedNodes();
				var tmpNode;
				var ids = "";
				for(var i=0; i<nodes.length; i++){
					tmpNode = nodes[i];
					if(i!=nodes.length-1){
						ids += tmpNode.id+",";
					}else{
						ids += tmpNode.id;
					}
				}
				
				var roleId = "${roleId}";
				var url = "${project_name}/role/service/save.do";
				var postData;
				
				postData = {"ROLE_ID":roleId,"serviceIds":ids};
				
				$("#zhongxin").hide();
				$("#zhongxin2").show();
				$.post(url,postData,function(data){
					//if(data && data=="success"){
						top.Dialog.close();
					//}
				});
			 
		 }
	
	</script>
	<footer>
	<div style="width: 100%;" class="center">
		<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
		<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
	</div>
	</footer>
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>