<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>发布类型</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="${project_name}/static/ab/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${project_name}/static/ab/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="${project_name}/static/ab/css/common/common.css"/>
		<link rel="stylesheet" type="text/css" href="${project_name}/static/ab/css/release/release_type.css"/>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<div class="mui-content">
				<div style="padding: 10px 10px;">
					<div id="segmentedControl" class="mui-segmented-control">
						<a class="mui-control-item mui-active" href="#item1">
							购买
						</a>
						<a class="mui-control-item" href="#item2">
							出售
						</a>
					</div>
				</div>
				<div>
					<div id="item1" class="mui-control-content mui-active">
						<div id="scroll" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<ul class="mui-table-view">
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/food.jpg" />
										<div>农作物</div>
									</li>
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/nongyao.jpg" />
										<div>农药</div>
									</li>
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/huafei.jpg" />
										<div>化肥</div>
									</li>
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/nongji.jpg" />
										<div>农机</div>
									</li>
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/zhongzi.jpg" />
										<div>种子</div>
									</li>
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/food.jpg" />
										<div>牲畜</div>
									</li>
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/food.jpg" />
										<div>兽药</div>
									</li>
									<li class="mui-table-view-cell">
										<img src="${project_name}/static/ab/images/food.jpg" />
										<div>顺风车</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="item2" class="mui-control-content">
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								<img src="${project_name}/static/ab/images/food.jpg" />
								<div>农作物</div>
							</li>
							<li class="mui-table-view-cell">
								<img src="${project_name}/static/ab/images/nongyao.jpg" />
								<div>农药</div>
							</li>
							<li class="mui-table-view-cell">
								<img src="${project_name}/static/ab/images/huafei.jpg" />
								<div>化肥</div>
							</li>
							<li class="mui-table-view-cell">
								<img src="${project_name}/static/ab/images/nongji.jpg" />
								<div>农机</div>
							</li>
							<li class="mui-table-view-cell">
								<img src="${project_name}/static/ab/images/zhongzi.jpg" />
								<div>种子</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
			<script src="${project_name}/static/ab/js/mui.min.js"></script>
			<script>
				mui.init({
					swipeBack: true //启用右滑关闭功能
				});
				(function($) {
					$('#scroll').scroll({
						indicators: true //是否显示滚动条
					});
					var segmentedControl = document.getElementById('segmentedControl');
					$('.mui-input-group').on('change', 'input', function() {
						if(this.checked) {
							var styleEl = document.querySelector('input[name="style"]:checked');
							var colorEl = document.querySelector('input[name="color"]:checked');
							if(styleEl && colorEl) {
								var style = styleEl.value;
								var color = colorEl.value;
								segmentedControl.className = 'mui-segmented-control' + (style ? (' mui-segmented-control-' + style) : '') + ' mui-segmented-control-' + color;
							}
						}
					});
				})(mui);
			</script>

	</body>

</html>