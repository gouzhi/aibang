<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">

<meta charset="utf-8" />
<title>收益总额统计列表</title>
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
					<form  method="post"
						 id="form" >
						<table>
							<tr>
                                <td>起止时间:</td>

								<td align="right"><input class="Wdate span11" type="text"
									placeholder="点击显示日历"
									onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})"
									id="createTimeBegin" name="createTimeBegin"
									validate="{required:true,messages:{required:'请选择开始时间'}}"
									value="<fmt:formatDate value="${hjsBorrowTenderQuery.createTimeBegin}" pattern="yyyy-MM-dd" />" />
								</td>
								<td align="right">至<input class="Wdate span11" type="text"
									placeholder="点击显示日历"
									onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})"
									id="createTimeEnd" name="createTimeEnd"
									validate="{required:true,messages:{required:'请选择结束时间'}}"
									value="<fmt:formatDate value="${hjsBorrowTenderQuery.createTimeEnd}" pattern="yyyy-MM-dd" />" />
								</td>

								<td><span class="input-icon">查询数量: <input
										autocomplete="off" id="pageSize" type="text" name="pageSize"
										placeholder="这里输入关键词" value="${hjsBorrowTenderQuery.pageSize}" /> <i
										></i>
								</span></td>

								<td align="right">&nbsp;&nbsp;&nbsp;
									<button class="btn btn-mini btn-light" onclick="search();"
										title="查询">查询</button>
								</td>
								<td align="right">
									<a class="btn btn-mini btn-success" style="padding: 1px 40px;" onclick="exportExcel()">导出Excle</a>

								</td>


							</tr>
						</table>
						<!-- 检索  -->


						<table id="table_report"
							class="table table-striped table-bordered table-hover">

							<thead>
								<tr>

									<th class="center">序号</th>
									<th class="center">用户</th>
									<th class="center">投资总额</th>

								</tr>
							</thead>

							<tbody>

							<c:choose>
								<c:when test="${not empty tenderRecoverAccountAllList}">

									<c:forEach items="${tenderRecoverAccountAllList}" var="bp"
											   varStatus="vs">

										<tr>
											<td class='center' style="width: 30px;"><label>${vs.index + 1}<span
													class="lbl"></span></label></td>
											<td class="center">${bp.phone}</td>

											<td class="center">${bp.RECOVER_ACCOUNT_ALL_SUM}</td>


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

					</form>
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
        //检索
		function search() {
			$("#form").attr("action","${project_name}/recoverSta/findrecoverSta.do");
         $("#form").submit();

		}
		function exportExcel(){

			$("#form").attr("action","${project_name}/recoverSta/exportExcel.do");
			$("#form").submit();
		}
     </script>

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
<jsp:include page="../../common/alert_message.jsp"></jsp:include>
</html>

