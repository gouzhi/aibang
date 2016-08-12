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
			<form action="account/userslist" method="post" name="Form" id="Form">
			<table>
				<tr>
				    <td style="vertical-align:top;"> 
					 	<select name="type" id="type" style="vertical-align:top;width: 150px;">
							<option value="">全部类型</option>
							<c:forEach items="${accountTypes}" var="item" varStatus="vs">
							   <option value="${item.code}" ${item.code eq query.type?"selected='selected'":""}>${item.cname}</option>
							</c:forEach>
					  	</select>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="context" value="${query.context}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
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
						<th>类型</th>
						<th>收入（元）</th>
						<th>支出（元）</th>
						<th>操作时间</th>
						<th>余额（元）</th>
						<th>可用余额（元）</th>
						<th>累计冻结（元）</th>
						<th>累计待收（元）</th>
						<th>资产总额（元）</th>
						<th>累计存入（元）</th>
						<th>累计支出（元）</th>
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
										<td>
											<c:forEach items="${accountTypes}" var="item" varStatus="vs">
											  <c:if test="${item.code eq var.TYPE}">
											     ${item.cname}
											  </c:if>
											</c:forEach>
										</td>
										<td>${var.INCOME}</td>
										<td>${var.EXPEND}</td>
										<td><fmt:formatDate value="${var.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>${var.BALANCE}</td>
										<td>${var.AVL_BALANCE}</td>
										<td>${var.FROST_TOTAL}</td>
										<td>${var.AWAIT_TOTAL}</td>
										<td>${var.TOTAL}</td>
										<td>${var.INCOME_TOTAL}</td>
										<td>${var.EXPEND_TOTAL}</td>
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
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
		<!-- My97DatePicker -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
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

