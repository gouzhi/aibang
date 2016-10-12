<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>首页</title>
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="${project_name}/static/ab/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${project_name}/static/ab/css/bootstrap-theme.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${project_name}/static/ab/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		
		<!-- ace styles -->
		<link rel="stylesheet" href="${project_name}/static/ab/css/ace.min.css" />
		<link rel="stylesheet" href="${project_name}/static/ab/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${project_name}/static/ab/css/ace-skins.min.css" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="${project_name}/static/ab/css/ace-ie.min.css" />
		<![endif]-->
		
		<link rel="stylesheet" href="${project_name}/static/ab/css/common/common.css" />
		<link rel="stylesheet" href="${project_name}/static/ab/css/bussiness/index.css" />
		<script type="text/javascript" src="${project_name}/static/ab/js/jquery-1.11.3.min.js" ></script>
	</head>

	<body>
		<div class="search_input">
			<div class="input-group">
				<span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
				<input type="text" class="form-control" placeholder="搜索" id="search" />
			</div>
		</div>
		<div class="head">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="${project_name}/static/ab/images/head1.jpg" alt="First slide">
					</div>
					<div class="item">
					    <img src="${project_name}/static/ab/images/head2.jpg" alt="Second slide">
					</div>
					<div class="item">
						<img src="${project_name}/static/ab/imageshead3.jpg" alt="Third slide">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<!--<a class="carousel-control left" href="#myCarousel" data-slide="prev">‹</a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next">›</a>-->
			</div>
		</div>
		<ul id="myTab" class="nav nav-tabs">
			<li class="dropdown active">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#">玉米 <b class="caret"></b></a>
				<ul class="dropdown-menu dropdown-info">
					<li>
						<a data-toggle="tab" href="#home">买</a>
					</li>
					<li>
						<a data-toggle="tab" href="#home">卖</a>
					</li>
					<li>
						<a data-toggle="tab" href="#home">全部</a>
					</li>
				</ul>
			</li>
			<!--<li class="active">
				<a href="#home" data-toggle="tab">
					玉米
				</a>
			</li>-->
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#">大豆 <b class="caret"></b></a>
				<ul class="dropdown-menu dropdown-info">
					<li>
						<a data-toggle="tab" href="#home">买</a>
					</li>
					<li>
						<a data-toggle="tab" href="#home">卖</a>
					</li>
					<li>
						<a data-toggle="tab" href="#home">全部</a>
					</li>
				</ul>
			</li>
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#">瓜子<b class="caret"></b></a>
				<ul class="dropdown-menu dropdown-info">
					<li>
						<a data-toggle="tab" href="#home">买</a>
					</li>
					<li>
						<a data-toggle="tab" href="#home">卖</a>
					</li>
					<li>
						<a data-toggle="tab" href="#home">全部</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="#home" data-toggle="tab">更多</a>
			</li>
		</ul>
		<section>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="home">
					<div class="laster_price">
						<div class="span6">
							<div>
								<div class="itemdiv dialogdiv">
									<div class="date_class"> 2016-10-01</div>
									<div class="user">
										<div class="radio_data">卖</div>
									</div>

									<div class="body">
										<div class="time"><i class="icon-time"></i> <span class="green">4 sec</span></div>
										<div class="name">
											<a href="#">Alexa</a>
										</div>
										<div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis. </div>

										<div class="tools">
											<a href="#" class="btn btn-minier btn-info"><i class="icon-only icon-share-alt"></i></a>
										</div>
									</div>
								</div>

								<div class="itemdiv dialogdiv">
									<div class="user">
										<div class="radio_data">买</div>
									</div>

									<div class="body">
										<div class="time"><i class="icon-time"></i> <span class="blue">38 sec</span></div>
										<div class="name">
											<a href="#">John</a>
										</div>
										<div class="text">Raw denim you probably haven't heard of them jean shorts Austin.</div>

										<div class="tools">
											<a href="#" class="btn btn-minier btn-info"><i class="icon-only icon-share-alt"></i></a>
										</div>
									</div>
								</div>

								<div class="itemdiv dialogdiv">
									<div class="user">
										<div class="radio_data">卖</div>
									</div>

									<div class="body">
										<div class="time"><i class="icon-time"></i> <span class="orange">2 min</span></div>
										<div class="name">
											<a href="#">Bob</a> <span class="label label-info arrowed arrowed-in-right">admin</span></div>
										<div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis. </div>

										<div class="tools">
											<a href="#" class="btn btn-minier btn-info"><i class="icon-only icon-share-alt"></i></a>
										</div>
									</div>
								</div>

								<div class="itemdiv dialogdiv">
									<div class="user">
										<div class="radio_data">买</div>
									</div>

									<div class="body">
										<div class="time"><i class="icon-time"></i> <span class="muted">3 min</span></div>
										<div class="name">
											<a href="#">Jim</a>
										</div>
										<div class="text">Raw denim you probably haven't heard of them jean shorts Austin.</div>

										<div class="tools">
											<a href="#" class="btn btn-minier btn-info"><i class="icon-only icon-share-alt"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
	    <script type="text/javascript" src="${project_name}/static/ab/js/bootstrap.min.js" ></script>
		
		<!--<script type="text/javascript" src="${project_name}/static/ab/js/layer.js"/>-->
		<script type="text/javascript">
			$(function(){ 
				$("#search").bind("click", function () {
					alert(123);
					var index = layer.open({
					  type: 2,
					  content: 'http://layim.layui.com',
					  area: ['320px', '195px'],
					  maxmin: true
					});
					layer.full(index);
				});
			});
		</script>
	</body> 
</html >

