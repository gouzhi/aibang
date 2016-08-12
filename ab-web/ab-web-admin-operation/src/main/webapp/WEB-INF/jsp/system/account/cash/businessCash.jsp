<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>商户代取现</title>
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
<div id="page-content">
<div class="row-fluid">
<div class="row-fluid">
<form action="cash/businessCash.do" method="post"></form>
	<!-- 表格数据 -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
		
			<th class="center">产品编号</th>
			<th class="center">产品名称</th>
			<th class="center">关联借款</th>
			<th class="center">产品金额（元）</th>
			<th class="center">已借到金额（元）</th>
			<th class="center">商户代取现金额</th>
			<th class="center">商户代取现时间</th>
			<th class="center">状态</th>
			<th class="center">备注</th>
			<th class="center">操作</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
		  <c:when test="${not empty page.result}">
		  
			  <c:forEach items="${page.result }" var="item">
				<tr>
					<td>${item.ID }</td>
					<td><a class="td_a">${item.B_NAME }</a></td>
					<td>${item.P_NAME }</td>
					<td>${item.ACCOUNT }</td>
					<td>${item.BORROW_ACCOUNT_YES }</td>
					<td>${item.POOL_ACCOUNT }</td>
					
					<td><fmt:formatDate value="${item.POOL_OUT_TIME }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>
						<c:if test="${item.POOL_STATE eq 0 || item.POOL_STATE eq null }">未代取现</c:if>
						<c:if test="${item.POOL_STATE eq 1}">已代取现</c:if>
                    </td>
                    <td>${item.POOL_MEMO }</td>
                    <td>
	                    <c:if test="${item.POOL_STATE eq 0 || item.POOL_STATE eq null }"><span style="color:#287ad2;cursor:pointer;" onclick="caozuo('${item.ID}','${item.BORROW_ACCOUNT_YES }')">操作</span></c:if>
                        <c:if test="${item.POOL_STATE eq 1}"><span style="color:#999;">已操作</span></c:if>
                    </td>
				</tr>
			  </c:forEach>
		  </c:when>
		  <c:otherwise>
			  <tr class="main_info">
				<td colspan="11" class="center">没有相关数据</td>
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
</div>
</div>
</div>
</div>
<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only"></i>
</a>
</body>

</html>
<script type="text/javascript">
$(top.hangge());

//daiquxian
function caozuo(id,amount){

if(null == id || "" == id){
	alert("请选择需要代取现的产品");return false;
}
top.jzts();
 var diag = new top.Dialog();
 diag.Drag=true;
 diag.Title ="取现信息";
 diag.URL = '${project_name}/cash/businessCashTab.do?id='+id+'&amount='+amount;
 diag.Width = 650;
 diag.Height = 300;
 diag.CancelEvent = function(){ //关闭事件
    	if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
    		top.jzts();
    		setTimeout("self.location.reload()",100);
    	}
      	
    	diag.close();
    	top.mainFrame.reloadPage(/cash\/businessCash/);
    	};
    	diag.show();
    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
}
</script>