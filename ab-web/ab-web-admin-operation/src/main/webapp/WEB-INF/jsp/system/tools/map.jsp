﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="${project_name}/">
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%> 
	
<body>
	


		
<div class="container-fluid" id="main-container">



<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


 	<div class="span12">
		<div class="widget-box">
			<div class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
				<h4 class="lighter">地图</h4>
			</div>
			<div class="widget-body">
			 <div class="widget-main">
			 
			 	<div class="step-content row-fluid position-relative">
		 			<div style="float: left;">
						经度：
						<span class="input-icon">
							<input type="text" id="ZUOBIAO_Y" title="" value="" style="width:79%;" disabled="disabled">
							<i class="icon-fire"></i>
						</span>
						纬度：
						<span class="input-icon">
							<input type="text" id="ZUOBIAO_X" title="" value="" style="width:79%;" disabled="disabled">
							<i class="icon-fire"></i>
						</span>
					</div>
					<div style="margin-top: -5px;">
						&nbsp;&nbsp;
						<button class="btn btn-app btn-light btn-mini"  onclick="openMap();">
						<i class="icon-globe"></i>
						</button>
					</div>
			 	</div>
			 	<hr>
			 	<div class="step-content row-fluid position-relative">
		 			<div style="float: left;">
						经度：
						<span class="input-icon">
							<input type="text" id="ZUOBIAO_Y2" title="" value="" style="width:79%;" disabled="disabled">
							<i class="icon-fire"></i>
						</span>
						纬度：
						<span class="input-icon">
							<input type="text" id="ZUOBIAO_X2" title="" value="" style="width:79%;" disabled="disabled">
							<i class="icon-fire"></i>
						</span>
					</div>
					<div style="margin-top: -5px;">
						&nbsp;&nbsp;
						<button class="btn btn-app btn-light btn-mini"  onclick="openMap2();">
						<i class="icon-globe"></i>
						</button>
					</div>
			 	</div>
			 	<hr>
			 	<div class="step-content row-fluid position-relative">
		 			<div style="float: left;">
						距离：
						<span class="input-icon">
							<input type="text" id="distance" title="" value="" style="width:200px;" disabled="disabled">
							<i class="icon-dashboard"></i>
						</span>
					</div>
					<div style="margin-top: -5px;">
						千米&nbsp;&nbsp;
						<button class="btn btn-app btn-light btn-mini" onclick="getDistance();">计算</button>
					</div>
			 	</div>
			 	
			 </div><!--/widget-main-->
			</div><!--/widget-body-->
		</div>
	</div>
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='${css_imagedomain}/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		<!-- 引入 -->
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="${css_imagedomain}/js/myjs/map.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
	</body>
</html>

