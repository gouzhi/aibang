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
		<link rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
	<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索  -->
			<form action="actrecharge/list.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="context" value="${hjsActRechargeQuery.context}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${hjsActRechargeQuery.createTimeBegin}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})"  type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${hjsActRechargeQuery.createTimeEnd}" pattern="yyyy-MM-dd"/>"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<td style="vertical-align:top;">
					 	<select  name="rechargeType" data-placeholder="" style="vertical-align:top;width: 120px;">
							<<option value="">请选择</option>
							<c:forEach items="${statusTypes}" var="item">
								<option value="${item.code }" <c:if test="${(not empty hjsActRechargeQuery) and (hjsActRechargeQuery.rechargeType eq item.code)}">selected</c:if>>${item.cname }</option>
							</c:forEach>
					  	</select>
					</td>
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询">查询</button></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>充值编号</th>
						<th>充值名称</th>
						<th>充值类型</th>
						<th>充值金额</th>
						<th>关联活动</th>
						<th>充值时间</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:if test="${QX.cha == 1 }">
							<c:forEach items="${page.result}" var="var" varStatus="vs">
								<tr>
											<td>${var.RECHARGE_CODE}</td>
											<td>${var.RECHARGE_NAME}</td>
											<td>${var.RECHARGE_TYPE}</td>
											<td>${var.VALUE}</td>
											<td>${var.ACT_URL}</td>
											<td><fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
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
					<td style="vertical-align:top;">
						<c:if test="${QX.add == 1 }">
						<a class="btn btn-small btn-success" onclick="add();">新增</a>
						</c:if>
						
						
					</td>
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
		
		//新增
		function add() {
			top.mainFrame.showTabPage("新增平台充值",'${project_name}/actrecharge/goAdd.do');
		}
		</script>
		
	</body>
</html>
