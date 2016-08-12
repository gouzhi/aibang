<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>审核管理</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<form action="borrow/prelim.do" method="post">
<div class="container-fluid" id="main-container">
<div id="page-content">
<div class="row-fluid">
<div class="row-fluid">
	<!-- 表格数据 -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">产品编号</th>
			<th class="center">产品名称</th>
			<th class="center">产品类型</th>
			<th class="center">产品总额（元）</th>
			<th class="center">年化收益率</th>
			<th class="center">还款周期</th>
			<th class="center">创建时间</th>
			<th class="center">操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.result }" var="item">
			<tr>
				<td>${item.ID }</td>
				<td><a class="td_a" href="javascript:void(0)" style="color: blue;" onclick="showDetail(${item.ID })">${item.B_NAME }</a></td>
				<c:forEach items="${borrowconfigs }" var="info">
					<c:if test="${info.code == item.BORROW_TYPE}"><td>${info.cname}</td></c:if>
				</c:forEach>
				<td><fmt:formatNumber value="${item.ACCOUNT }" pattern="#,#00"/></td>
				<td>${item.BORROW_APR}%</td>
				<td>${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'月':'天'}</td>
				<td><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td class="center"><a class="btn btn-mini btn-info" onclick="auditing(${item.ID });">审核</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page-header position-relative">
	<table style="width:100%;">
		<tr>
			<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
		</tr>
	</table>
	</div>
</div>
</div>
</div>
</div>
</form>	
<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only"></i>
</a>
</body>
<%@include file="../../common/alert_message.jsp"%>
</html>
<script type="text/javascript">
$(top.hangge());
function auditing(id){
	top.jzts();
 	var diag = new top.Dialog();
 	diag.Drag=true;
	diag.Title ="审核";
	diag.URL = '${project_name}/borrow/auditing.do?borrowids='+id+"&param=1";
	diag.Width = 600;
	diag.Height = 270;
	diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			top.jzts();
			setTimeout("self.location.reload()",100);
			
		}
		window.location.reload(true);
		//top.mainFrame.reloadPage(/borrow\/prelim/);
		diag.close();
	};
	diag.show();
};
//显示详情
function showDetail(borrowid){
	top.jzts();
 	var diag = new top.Dialog();
 	diag.Drag=true;
	diag.Title ="详情";
	diag.URL = '${project_name}/borrow/detail.do?borrowid='+borrowid;
	diag.Width = 950;
	diag.Height = 1500;
	diag.CancelEvent = function(){ //关闭事件
	if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
		top.jzts();
		setTimeout("self.location.reload()",100);
		
	}
	//top.mainFrame.reloadPage(/borrow\/prelim.do/);
	diag.close();
	};
	diag.show();
}
</script>
