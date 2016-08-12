<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>活动列表</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${css_imagedomain}/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
<script src="${css_imagedomain}/js/ace.min.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
<!-- My97DatePicker -->
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
			<form action="hjsactinfo/list.do" method="post" name="Form" id="Form">
				<div class="row-fluid row_header">
			        <div class="span2">
						<span class="input-icon">
							<input  id="nav-search-input" type="text" name="aname" value="${query.aname}" placeholder="请输入活动名称" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</div>
			     	<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'startTimeEnd\')||\'%y-%M-%d\'}'})" name="startTimeBegin" id="startTimeBegin" value="<fmt:formatDate value="${query.startTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startTimeBegin\')}',maxDate:'%y-%M-%d'})" name="startTimeEnd" id="startTimeEnd" value="<fmt:formatDate value="${query.startTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
			        <c:if test="${QX.cha == 1 }">
					  <td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询" style="margin-top:-10px;">查询</button></td>
					</c:if>
				</div>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th align="center">活动名称</th>
						<th align="center">活动周期</th>
						<th align="center">活动类型</th>
						<th align="center">活动预算(元)</th>
						<th align="center">已使用预算(元)</th>
						<th align="center">剩余预算(元)</th>
						<th align="center">活动规则</th>
						<th align="center">活动状态</th>
						<th class="center">操作</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty hjsActInfo}">
							<c:forEach items="${hjsActInfo}" var="var" varStatus="vs">
								<tr>
									<td align='center' style="width: 30px;" hidden="true">${vs.index+1}</td>
									<td align='center' hidden="true">${var.id}</td>
									<td align='center'>
										<a href="javascript:void(0)" style="color: blue;" class="td_b" onclick="showDetail(${var.ID})">${var.A_NAME}</a>
									</td>
									<td align='center' >
										<fmt:formatDate value="${var.START_TIME}" pattern="yyyy-MM-dd " /> - <fmt:formatDate value="${var.STOP_TIME}" pattern="yyyy-MM-dd " />
									</td>
									<c:forEach items="${actType}" var="info">
										<c:if test="${info.code == var.TYPE}"><td class='left'>${info.cname}</td></c:if>
									</c:forEach>
									<td align='center'>${var.BUDGET_TOTAL}</td>
									<td align='center'>${var.BUDGET_USED}</td>
									<td align='center'>${var.BUDGET_LAST}</td>
									<td align='center'>
										<span class="td_b">${var.ACT_RULES}</span>
									</td>
									<c:forEach items="${actStatus}" var="info">
										<c:if test="${info.code == var.STATUS}"><td class='left'>${info.cname}</td></c:if>
									</c:forEach>
									<td style="width: 30px;" class="center">
										<div class='hidden-phone visible-desktop btn-group'>
										
											<c:if test="${QX.edit != 1 && QX.del != 1 }">
											<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:if>
											<div class="inline position-relative">
												<div class='hidden-phone visible-desktop btn-group'>	
														<a class='btn btn-mini btn-info' title="编辑" onclick="goEdit('${var.ID }');">编辑</a>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
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
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<script type="text/javascript">
		
		//检索查询
		function search(){
			top.jzts();
			$("#Form").submit();
		}
   
        //查看活动详细信息
        function showDetail(id)
        {
        	
        	top.jzts();
         	var diag = new top.Dialog();
         	diag.Drag=true;
        	diag.Title ="详情";
        	diag.URL = '${project_name}/hjsactinfo/detail.do?id='+id;
        	diag.Width = 950;
        	diag.Height = 480;
        	diag.CancelEvent = function(){ //关闭事件
        	diag.close();
        	};
        	diag.show();
        }
        
        //加载修改活动基信息页面
		function goEdit(id)
        {
		    top.mainFrame.showTabPage("修改活动信息",'${project_name}/hjsactinfo/goEdit.do?id='+id);

		}
		
     </script>
	 <script type="text/javascript">
		$(top.hangge());
	 </script>
		
	</body>
</html>

