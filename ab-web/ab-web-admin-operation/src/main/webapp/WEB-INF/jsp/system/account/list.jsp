<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索  -->
			<form action="account/list" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="context" value="${query.context}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<%--
					<td><input class="span10" name="updateTimeBegin" id="updateTimeBegin" value="<fmt:formatDate value="${query.updateTimeBegin}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'updateTimeBegin',dateFmt:'yyyy-M-d',updateTimeBegin: '%y-%M-%d'  })" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10" name="updateTimeEnd" id="updateTimeEnd" value="<fmt:formatDate value="${query.updateTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'updateTimeEnd',dateFmt:'yyyy-M-d',updateTimeEnd: '%y-%M-%d'  })" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					 --%>
				    <c:if test="${QX.cha == 1 }">
					  <td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询">查询</button></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>用户名</th>
						<th>手机号</th>
						<th>账户总额(元)</th>
						<th>余额(元)</th>
						<th>冻结总额(元)</th>
						<th>待收总额(元)</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${page.result}" var="var" varStatus="vs">
							<tr>
								<td>${var.ID}</td>
								<td><a onclick="showAccountDetail(${var.USERID})">${var.USERNAME}</a></td>
								<td>${var.PHONE}</td>
								<td>${var.TOTAL}</td>
								<td>${var.AVL_BALANCE}</td>
								<td>${var.FROST}</td>
								<td>${var.AWAIT}</td>  
						    </tr>
						</c:forEach>
						</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
				
				</tbody>
			</table>
			
		<div class="page-header position-relative">
		<span>总计（余额+冻结）：${total.TotalBalance}</span>
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		</form>
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/plugins/jsCalendar/WdatePicker.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
		
		<script type="text/javascript">
		    $(top.hangge());
			//检索
			function search(){
				top.jzts();
				$("#Form").submit();
			} 
			
			function showAccountDetail(id)
			{
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="用户详情";
				 diag.URL = '${project_name}/account/userdetail/'+id;
				 diag.Width = 800;
				 diag.Height = 400;
				 diag.show();
			}
		</script>
		
	</body>
</html>

