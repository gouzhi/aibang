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
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
		<!-- 检索  -->
		<form action="hjsactbonususers/list.do" method="post" name="Form" id="Form">
			<div class="row-fluid row_header">
	        <div class="span2">
	        	<span class="input-icon">
							<input  id="nav-search-input" type="text" name="context" value="${query.context}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
				</span>
	        </div>
	        <td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
			<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
			<c:if test="${QX.cha == 1 }">
				<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询" style="margin-top:-10px;">查询</button></td>
			</c:if>
		</div>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<!-- <th class="center">
							<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> -->
						<!-- <th width="200">编号</th> -->
						<th>活动名称</th>
						<th>用户名</th>
						<th>奖励金额(元)</th>
						<th>奖励类型</th>
						<th>状态</th>
						<th>创建时间</th>
						<th>使用时间</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty typeList}">
							<c:forEach items="${typeList}" var="var" varStatus="vs">
								<tr>
									<%-- <td class='center' style="width: 30px;">
										<label><input type='checkbox' name='ids' value="${var.HjsActBonusUsers_ID}" /><span class="lbl"></span></label>
									</td> --%>
									<td class='center' style="width: 30px;" hidden="true">${vs.index+1}</td>
									<%-- <td align="center">
										<span class="td_a">${var.BU_CODE}</span>
									</td> --%>
									<!-- 判断活动是否为空 -->
									<c:choose>
										<c:when test="${var.A_NAME == null}">
											<td align="center">补发红包</td>
										</c:when>
										<c:otherwise>
											<td align="center">${var.A_NAME}</td>
										</c:otherwise>
									</c:choose>
									<td align="center">${var.USERNAME}</td>
									<td align="center">${var.VALUE}</td>
									<c:forEach items="${actBonus}" var="info">
										<c:if test="${info.code == 1}"><td align='center'>${info.cname}</td></c:if>
									</c:forEach>
									<c:forEach items="${bonusList}" var="info">
										<c:if test="${info.code == var.STATUS}"><td>${info.cname}</td></c:if>
									</c:forEach>
									<td align="center">${fn:substring(var.CREATE_TIME, 0, 19)}</td>
									<td align="center">
										<!-- 判断是否是使用状态 -->
										<c:if test="${var.logStatus == 1 }">
											${fn:substring(var.useTime, 0, 19)}
										</c:if>
										<c:if test="${var.logStatus == 2 }">
											${fn:substring(var.useTime, 0, 19)}
										</c:if>
									</td>
									<td hidden="true">${var.expireTime}</td>
								</tr>
							</c:forEach>
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
		<script type="text/javascript">
			$(top.hangge());
		</script>
		
		<script type="text/javascript">
			$(function() {
				//复选框
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
				});
			});
		</script>
	</body>
</html>

