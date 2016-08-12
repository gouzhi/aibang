<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>产品列表</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
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
</head>
<body>
<!-- <form action="borrow/prelim.do"></form> -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>
<div class="container-fluid" id="main-container">
<div id="page-content">
<div class="row-fluid">
<div class="row-fluid">
	<div id="breadcrumbs">
		<table class="center" style="width:30%;">
			<tr height="35">
				<td style="width: 30px;" class="center" bgcolor="#438eb9">
					<a href="javascript:void(0)" style="text-decoration:none; display:block;"><font color="#fff">未上架产品</font></a>
				</td>
				<td width="5px;"></td>
				<td style="width: 30px;" class="center" bgcolor="#E5E5E5">
					<a href="borrow/online_page.do" style="text-decoration:none; display:block;"><font color="#666666">已上架产品</font></a>
				</td>
			</tr>
		</table>
	</div>	
	<table><tr height="14px;"><td colspan="100"></td></tr></table>
	<!-- 查询 -->
	<form action="borrow/unOnline_page.do" method="post">
	<div class="center">

		<div class="row-fluid">
	    	<div class="span2 pR">
	            <select class="span12" name="verifyStatus">
	                <option value="">==全部状态==</option>
	                <option value="0" <c:if test="${borrowQuery.verifyStatus eq 0}">selected="selected"</c:if>>审核中（初审）</option>
	                <option value="1" <c:if test="${borrowQuery.verifyStatus eq 1}">selected="selected"</c:if>>审核失败</option>
	                <option value="2" <c:if test="${borrowQuery.verifyStatus eq 2}">selected="selected"</c:if>>已审核</option>
	                <option value="8" <c:if test="${borrowQuery.verifyStatus eq 8}">selected="selected"</c:if>>已结清</option>
	                <option value="12" <c:if test="${borrowQuery.verifyStatus eq 12}">selected="selected"</c:if>>已解冻</option>
	               <%--  <c:forEach items="${audiconfigs }" var="item">
	                <option value="${item.code }" <c:if test="${borrowQuery.verifyStatus eq item.code}">selected="selected"</c:if>>${item.cname }</option>
	                </c:forEach> --%>
	            </select>
	        </div>
	        <div class="span3">
	        	<input type="text" placeholder="请输入关键字" class="span12" name="bname" value="${borrowQuery.bname }"/>
	        </div>
	        
	        <div class="span1" style="width:55px">时间：</div>
	        <div class="span2">
	        	<input class="Wdate span12" type="text" placeholder="点击显示日历" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" id="createTimeBegin" name="createTimeBegin" value="<fmt:formatDate value="${borrowQuery.createTimeBegin }" pattern="yyyy-MM-dd"/>">
	        </div>
	        
	        <div class="span1">至</div>
	        <div class="span2">
	        	<input class="Wdate span12" type="text" placeholder="点击显示日历" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}'})" id="createTimeEnd" name="createTimeEnd" value="<fmt:formatDate value="${borrowQuery.createTimeEnd }" pattern="yyyy-MM-dd"/>">
	        </div>
	        <div class="span1">
	        	 <input type="submit" value="搜索" class="span12" />
	        </div>
		</div>
		<div class="row-fluid">
		 <div class="span12">
	     	<div class="span6"></div>
	        <div class="span2">
	        	
	        	<!-- <input type="button" value="上架" class="span7" /> -->
	        	<a class="btn btn-mini btn-primary" style="display:block;width:45px;margin-top:7px" onclick="goOnline()">上架</a>
	        </div>
	        <div class="span2">
	        	
	        	<a class="btn btn-mini" style="display:block;width:45px;margin-top:7px" onclick="deleteBorrow()">删除</a>
	        </div>
	       <!--  <div class="span2">
	        	<div class="span1"></div>
	        	<a class="btn btn-mini btn-success" style="padding: 1px 40px;">导出Excle</a>
	        </div> -->
	      
	     </div>
		</div>
	</div>
	</form>
	<!-- 表格数据 -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center" style="width: 30px;">选择</th>
			<th class="center">产品编号</th>
			<th class="center">产品名称</th>
			<th class="center">产品类型</th>
			<th class="center">产品总额（元）</th>
			<th class="center">年化收益率</th>
			<th class="center">还款周期</th>
			<th class="center">创建时间</th>
			<th class="center">状态</th>
			<th class="center">操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.result }" var="item">
			<tr>
				<td><input type="checkbox" style="opacity:1" value="${item.ID }" name="borrowid"/></td>
				<td>${item.ID }</td>
				<td><a class="td_a" href="javascript:void(0)" style="color: blue;" onclick="showDetail(${item.ID })">${item.B_NAME }</a></td>
				<c:forEach items="${borrowconfigs }" var="info">
					<c:if test="${info.code == item.BORROW_TYPE}"><td>${info.cname}</td></c:if>
				</c:forEach>
				<td><fmt:formatNumber value="${item.ACCOUNT }" pattern="#,#00"/></td>
				<td>${item.BORROW_APR}%</td>
				<td>${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'月':'天'}</td>
				<td><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm"/></td>
				<c:forEach items="${audiconfigs }" var="info">
					<c:if test="${info.code == item.VERIFY_STATUS && item.VERIFY_STATUS eq 0 }"><td>审核中（初审）</td></c:if>
					<c:if test="${info.code == item.VERIFY_STATUS && item.VERIFY_STATUS eq 1 }"><td>审核失败</td></c:if>
					<c:if test="${info.code == item.VERIFY_STATUS && item.VERIFY_STATUS eq 2 }"><td>已审核</td></c:if>
				    <c:if test="${info.code == item.VERIFY_STATUS && item.VERIFY_STATUS eq 8 }"><td>已结清</td></c:if>
				    <c:if test="${info.code == item.VERIFY_STATUS && item.VERIFY_STATUS eq 12 }"><td>已解冻</td></c:if>
				</c:forEach>
				<c:if test="${item.VERIFY_STATUS eq 1 || item.VERIFY_STATUS eq 0}"><td class="center"><a class="btn btn-mini btn-info" onclick="goEdit(${item.ID })">修改</a></td></c:if>
				<c:if test="${item.VERIFY_STATUS ne 1 && item.VERIFY_STATUS ne 0}"><td class="center"><a class="btn btn-mini">修改</a></td></c:if>
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
<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only"></i>
</a>
</body>
<%@include file="../../common/alert_message.jsp"%>
</html>
<script type="text/javascript">
$(top.hangge());
//delete borrow
function deleteBorrow(){
	var borrowids = new Array();
	$("input[name='borrowid']").each(function(){
		if($(this).is(":checked")){
			borrowids.push($(this).attr("value"));
		}
	});
	if(null == borrowids || "" == borrowids){
		alert("请选择需要删除的产品");return false;
	}
	$.ajax({
		url:"borrow/deleteBorrow.do",
		type:"post",
		dataType:"json",
		data:"borrowids="+borrowids,
		success:function(result){
			if(result.state == '0'){
				alert("删除成功");
				window.location.reload(true);
			}else{
				alert(result.msg);
			}
		},
		error:function(){
			alertMsg("操作失败");
		}
	})
}
//go online borrow
function goOnline(){
	var borrowids = new Array();
	$("input[name='borrowid']").each(function(){
		if($(this).is(":checked")){
			borrowids.push($(this).attr("value"));
		}
	});
	if(null == borrowids || "" == borrowids){
		alert("请选择需要上架的产品");return false;
	}
	
	 $.ajax({
		url:"borrow/goOnline.do",
		type:"post",
		data:"borrowids="+borrowids,
		dataType:"json",
		success:function(data){
			if(data.state == '0'){
				alert("上架成功");
				window.location.reload(true);
			}else{
				alert(data.msg);
			}
			
		}
	}); 
}
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

function goEdit(id){
    top.mainFrame.showTabPage("修改产品信息",'${project_name}/borrow/edit.do?borrowId='+id);

}
</script>