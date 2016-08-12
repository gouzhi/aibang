<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${project_name}/">

	<meta charset="utf-8" />
	<title>获取基金</title>
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
	<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
	<!-- My97DatePicker -->
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>

	<script type="text/javascript">
		$(top.hangge());
	</script>
</head>

<body>

<div class="container-fluid" id="main-container">


	<div id="page-content" class="clearfix">

		<div class="row-fluid">

			<div class="row-fluid">

				<!-- 检索  -->

					<table>
						<tr>
							<td><span class="input-icon"> <input
									 id="pname" type="button"
									 value="立即获取" onclick="getFunds()"/>
								</span></td>
						</tr>
					</table>
					<!-- 检索  -->


					<table id="table_report"
						   class="table table-striped table-bordered table-hover">

						<thead>
						<tr>

							<th class="center">操作时间</th>
							<th class="center">操作人</th>
							<th class="center">操作类型</th>
							<th class="center">获取状态</th>
							<th class="center">完成时间</th>

						</tr>
						</thead>

						<tbody>

						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty page.result}">

								<c:forEach items="${page.result}" var="bp"
										   varStatus="vs">

									<tr>


										<td class="center"><fmt:formatDate
												value="${bp.REQUEST_TIME}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
										<td class="center">
											${bp.OPT_NAME}
											</td>
										<td class="center"><c:choose><c:when test="${bp.SYNC_TYPE ==0}">自动</c:when><c:otherwise>手工</c:otherwise></c:choose></td>
										<td class="center"><c:choose><c:when test="${bp.STATUS==0}">开始同步</c:when><c:when test="${bp.STATUS==1}">同步成功</c:when><c:otherwise>同步失败</c:otherwise></c:choose></td>

											<td class="center"><fmt:formatDate
													value="${bp.END_TIME}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
									</tr>

								</c:forEach>



							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="10" class="center">没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose>


						</tbody>
					</table>

					<div class="page-header position-relative">
						<table style="width: 100%;">
							<tr>
								<td style="vertical-align: top;"><div class="pagination"
																	  style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
					</div>

			</div>
			<!-- PAGE CONTENT ENDS HERE -->
		</div>
		<!--/row-->

	</div>
	<!--/#page-content-->
</div>
<!--/.fluid-container#main-container-->

<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
</a>


<script type="text/javascript">
	$(function() {
		//复选框
		$('table th input:checkbox').on(
				'click',
				function() {
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
							function() {
								this.checked = that.checked;
								$(this).closest('tr').toggleClass(
										'selected');
							});

				});

	});

</script>

</body>
<%--<jsp:include page="../../common/alert_message.jsp"></jsp:include>--%>

</html>
<script>
	function getFunds(){
		$.ajax({
			url:"${project_name}/hjsFundSynclogMain/syncFunds.do",
			type:"post",
			dataType:"json",
			success:function(result){
				if(result==0){
					alert("立即获取成功!");
					window.location.href="${project_name}/hjsFundSynclogMain/findSynclogs.do";
				}else if(result=1){
					alert("部分成功!");
				}
			}
		});
	}
</script>

