<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>发现</title>
		<link href="${project_name}/static/ab/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${project_name}/static/ab/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="${project_name}/static/ab/css/media.css"/>
		<style>
			html,
			body {
				height: 100%;
				font-family: "微软雅黑";
			}
			.mui-bar {
				-webkit-box-shadow: none;
				box-shadow: none;
				background: #FFF;
			}
			.mui-content,.mui-table-view:before,.mui-table-view:after{
				background: #fff;
			}
			
		</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav rpproval-header" id="find-header">
			<h1 class="mui-title">发现</h1>
		</header>
		<section class="mui-content rpproval-content" id="find-section">
					<ul class="mui-table-view">
						<li class="find-li">
							<div class="find-dy">
								<div class="find-li-img">
									<i></i>
								</div>
								<div class="find-li-text">
									<div>
										<p>我的订阅</p>
									<span>添加订阅，帮你找到新消息</span>
									</div>
									<s class=" mui-icon mui-pull-right"></s>
								</div>
							</div>
						</li>
						<li class="find-li">
							<div class="find-dy">
								<div class="find-li-img">
									<i></i>
								</div>
								<div class="find-li-text">
									<div>
										<p>找买家</p>
									<span>你要买什么？</span>
									</div>
									<s class=" mui-icon mui-pull-right"></s>
								</div>
							</div>
						</li>
						<li class="find-li">
							<div class="find-dy">
								<div class="find-li-img">
									<i></i>
								</div>
								<div class="find-li-text">
									<div>
										<p>找卖家</p>
									<span>你需要什么？</span>
									</div>
									<s class=" mui-icon mui-pull-right"></s>
								</div>
							</div>
						</li>
						<li class="find-li">
							<div class="find-dy">
								<div class="find-li-img">
									<i></i>
								</div>
								<div class="find-li-text">
									<div>
										<p>成功案例</p>
									<span>交易成功案例</span>
									</div>
									<s class=" mui-icon mui-pull-right"></s>
								</div>
							</div>
						</li>
					</ul>
					<div class="find-other">
						<p>猜你喜欢</p>
						<ul class="find-other-ul">
							<li class="find-other-li">
								<div class="find-main">
									<div class="find-other-img">
										<img src="${project_name}/static/ab/images/ym.jpg"/>
									</div>
									<div class="find-other-text">
										<p>这里是内容标题区域</p>
										<div>
											<span>玉米</span>
											<b>15:13</b>
										</div>
									</div>
								</div>
							</li>
							<li class="find-other-li">
								<div class="find-main">
									<div class="find-other-img">
										<img src="${project_name}/static/ab/images/td.jpg"/>
									</div>
									<div class="find-other-text">
										<p>这里是内容标题区域</p>
										<div>
											<span>土豆</span>
											<b>15:13</b>
										</div>
									</div>
								</div>
							</li>
							<li class="find-other-li">
								<div class="find-main">
									<div class="find-other-img">
										<img src="${project_name}/static/ab/images/hd.jpg"/>
									</div>
									<div class="find-other-text">
										<p>这里是内容标题区域</p>
										<div>
											<span>黄豆</span>
											<b>15:13</b>
										</div>
									</div>
								</div>
							</li>
							<li class="find-other-li">
								<div class="find-main">
									<div class="find-other-img">
										<img src="${project_name}/static/ab/images/niu.jpg"/>
									</div>
									<div class="find-other-text">
										<p>这里是内容标题区域</p>
										<div>
											<span>牛</span>
											<b>15:13</b>
										</div>
									</div>
								</div>
							</li>
							<li class="find-other-li">
								<div class="find-main">
									<div class="find-other-img">
										<img src="${project_name}/static/ab/images/zhu.jpg"/>
									</div>
									<div class="find-other-text">
										<p>这里是内容标题区域</p>
										<div>
											<span>猪</span>
											<b>15:13</b>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
		</section>
		<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
		<script src="${project_name}/static/ab/js/mui.min.js"></script>
		<script>
			
		</script>
	</body>

</html>