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
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<form id="fullscale" action="borrow/fullscale.do" method="post">
<div class="container-fluid" id="main-container">
<div id="page-content">
<div class="row-fluid">
	<div class="center">
		<div class="row-fluid">
	    	<div class="span11">
		        <span> 审核结果：</span>
		        <select class="span2" name="auditResult">
		                <option <c:if test="${borrowQuery.auditResult eq '2,3,4,12,13'}">selected="selected"</c:if> value="2,3,4,12,13">全部</option>
		                <option <c:if test="${borrowQuery.auditResult eq '2'}">selected="selected"</c:if>value="2">-</option>
		                <option <c:if test="${borrowQuery.auditResult eq '3,12'}">selected="selected"</c:if>value="3,12">通过</option>
		                <option <c:if test="${borrowQuery.auditResult eq '4,13'}">selected="selected"</c:if>value="4,13">不通过</option>
		         </select>
	             <span style="margin-left:18px;"> 满/流标：</span>
	             <select class="span2" name="fullFlowScale">
	                <option <c:if test="${borrowQuery.fullFlowScale eq '2,3,4,12,13'}">selected="selected"</c:if> value="2,3,4,12,13">全部</option>
	                <option <c:if test="${borrowQuery.fullFlowScale eq '2'}">selected="selected"</c:if> value="2">-</option>
	                <option <c:if test="${borrowQuery.fullFlowScale eq '3,4'}">selected="selected"</c:if> value="3,4">满标</option>
	                <option <c:if test="${borrowQuery.fullFlowScale eq '12,13'}">selected="selected"</c:if> value="12,13">流标</option>
	             </select>
	          </div>
		</div>
		<div class="row-fluid">
		 <div class="span12">
	     	
	        <div class="span2">
	        
	        	<a class="btn btn-mini btn-primary" style="padding: 1px 40px;white-space:nowrap;" onclick="auditing(2);">满标审核</a>
	        </div>
	        <div class="span2">
	        	
	        	<a class="btn btn-mini" style="padding: 1px 40px;white-space:nowrap;" onclick="auditing(3);">流标审核</a>
	        </div>
	    
	     </div>
		</div>
	</div>

	<!-- 表格数据 -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
		    <th class="center">
			<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
			</th>
			<th class="center">产品编号</th>
			<th class="center">产品名称</th>
			<th class="center">产品类型</th>
			<th class="center">产品总额（元）</th>
			<th class="center">年化收益率</th>
			<th class="center">还款周期</th>
			<th class="center">创建时间</th>
			<th class="center">产品进度</th>
			<th class="center">审核结果</th>
			<th class="center">满/流标</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${not empty page.result}">
		<c:forEach items="${page.result }" var="item">
			<tr>
			   	<%-- <td><input type="checkbox"  value="${item.ID }" name="borrowid"/></td> --%>
			   	<td class="center" style="width: 30px;">
				<label><input name="borrowid" value="${item.ID }" id="" alt="13121324699" type="checkbox">
				<span class="lbl"></span>
				</label>
				</td>
				<td>${item.ID }</td>
				<td><a class="td_a" href="javascript:void(0)" style="color: blue;" onclick="showDetail(${item.ID })">${item.B_NAME }</a></td>
				<c:forEach items="${borrowconfigs }" var="info">
					<c:if test="${info.code == item.BORROW_TYPE}"><td>${info.cname}</td></c:if>
				</c:forEach>
				<td><fmt:formatNumber value="${item.ACCOUNT }" pattern="#,#00"/></td>
				<td>${item.BORROW_APR}%</td>
				<td>${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'月':'天'}</td>
				<td><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm"/></td>
				<%-- <td class="center"><a class="btn btn-mini btn-info" onclick="auditing(${item.ID });">审核</a></td> --%>
			    <td>${item.TENDER_SCALE}%</td>
			    <td>
			       <c:choose>
			       <c:when test="${item.VERIFY_STATUS eq 3 || item.VERIFY_STATUS eq 12}">通过</c:when>
			       <c:when test="${item.VERIFY_STATUS eq 4 || item.VERIFY_STATUS eq 13}">不通过</c:when>
			       <c:otherwise>-</c:otherwise>
			       </c:choose>
			    </td>
			    <td>
			      <c:choose>
			       <c:when test="${item.VERIFY_STATUS eq 3 || item.VERIFY_STATUS eq 4}">满标</c:when>
			       <c:when test="${item.VERIFY_STATUS eq 12 || item.VERIFY_STATUS eq 13}">流标</c:when>
			       <c:otherwise>-</c:otherwise> 
			       </c:choose>
			    </td>
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
function auditing(param){
	var borrowids = new Array();
	$("input[name='borrowid']").each(function(){
		if($(this).is(":checked")){
			borrowids.push($(this).attr("value"));
		}
	});
	if(null == borrowids || "" == borrowids){
		alert("请选择需要审核的产品");return false;
	}
	top.jzts();
 	var diag = new top.Dialog();
 	diag.Drag=true;
	diag.Title ="审核";
	diag.URL = '${project_name}/borrow/auditing.do?borrowids='+borrowids+"&param="+param;
	diag.Width = 600;
	diag.Height = 270;
	diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			top.jzts();
			setTimeout("self.location.reload()",100);
			
		}
		window.location.reload(true);
		//top.mainFrame.reloadPage(/borrow\/fullscale/);
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
	//top.mainFrame.reloadPage(/borrow\/fullscale.do/);
	diag.close();
	};
	diag.show();
}
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
			$(".span11 select").on('change',function(){
		 		$("#fullscale").submit();
		 	});
			
		});	
	
		 	
	
</script>