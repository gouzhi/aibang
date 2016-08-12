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
	<!-- jsp文件头和头部 -->
    <%@ include file="../../admin/top.jsp"%> 
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
	<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
	<!-- ueditor -->
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
	
	
	
	
	
	<script type="text/javascript">
	$(function(){
		$("tbody tr").each(function(index,element){ 
				//格式化昨日收益后显示的日期
				var dateSpan = $("#dataList"+"\\["+index+"\\]\\.profitDateSpan");
				if (dateSpan.length>0) {
					var dateValue = $("#dataList"+"\\["+index+"\\]\\.profitDate").val();
					dateSpan.text(formatDate(dateValue));
				}
		});
			  
	});
	//格式化昨日收益的时间
	function formatDate(date){
		var patt = /-.+\s/i;
		var patt2 = /\w.+/;
		var temp = new String(date.match(patt));
		return "( "+temp.match(patt2)+" )";
	}</script>
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<h1>总资产/持仓查询</h1>  
			<!-- 检索  -->
			<form action="hjsFundAccount/queryTradeShares" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="mobile" value="" placeholder="输入手机号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="identity" value="" placeholder="输入身份证号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询">查询</button></td>
					</c:if>
				</tr>
			</table>
			<!-- 标题头部 -->
			<div class="row-fluid">
		    	<div class="span12">总资产信息</div>
			</div>
			<div class="row-fluid">
			    <div class="span2 pl"><span class="required"></span>姓名：</div>
			    <div class="span3">${hjsFundUserinfo.realname}</div>
		 		<div class="span2 pl"><span class="required"></span>钱景数据更新时间：</div>
			    <div class="span3">${assets.last_update_time }</div>
	 		</div>
	 		<div class="row-fluid">
			    <div class="span2 pl"><span class="required"></span>昨日收益(元)：</div>
			    <div class="span3">${assets.profit_yesterday}</div>
		 		<div class="span2 pl"><span class="required"></span>当前总资产(元)：</div>
			    <div class="span3">${assets.assets }</div>
	 		</div>
	 		<div class="row-fluid">
			    <div class="span2 pl"><span class="required"></span>昨日日期：</div>
			    <div class="span3">${assets.profit_date}</div>
		 		<div class="span2 pl"><span class="required"></span>当前可用资产(元)：</div>
			    <div class="span3">${assets.usable_yesterday }</div>
	 		</div>
	 		<div class="row-fluid">
			    <div class="span2 pl"><span class="required"></span>未付收益(元)：</div>
			    <div class="span3">${assets.unpaid}</div>
		 		<div class="span2 pl"><span class="required"></span>累计投资(元)：</div>
			    <div class="span3">${assets.invest }</div>
	 		</div>
	 		<div class="row-fluid">
			    <div class="span2 pl"><span class="required"></span>累计收益(元)：</div>
			    <div class="span3">${assets.profit}</div>
		 		<div class="span2 pl"><span class="required"></span>累计赎回(元)：</div>
			    <div class="span3">${assets.income }</div>
	 		</div>
			<div class="row-fluid">
		    	<div class="span12">持仓信息</div>
			</div>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>类型</th>
						<th>基金代码</th>
						<th>基金简称</th>
						<th>持有份额</th>
						<th>赎回中份额</th>
						<th>昨日收益（元）</th>
						<th>净值（元）</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:if test="${QX.cha == 1 }">
							<c:forEach items="${page.result}" var="var" varStatus="vs">
								<tr>
									<input type="hidden" id="dataList[${vs.index }].profitDate" value="${var.profit_date }">
									<td>
										<c:choose>
					               			<c:when test="${var.type == 'FUND_STOCK'}">股票基金</c:when>
					               			<c:when test="${var.type == 'FUND_BOND'}">债券基金</c:when>
					               			<c:when test="${var.type == 'FUND_MONEY'}">货币基金</c:when>
					               			<c:when test="${var.type == 'FUND_MIX'}">混合基金</c:when>
					               			<c:when test="${var.type == 'FUND_INDEX'}">指数基金</c:when>
					               			<c:when test="${var.type == 'FUND_PRESERV'}">保本</c:when>
					               			<c:when test="${var.type == 'FUND_ETF'}">ETF</c:when>
					               			<c:when test="${var.type == 'FUND_QDII'}">QDII</c:when>
					               			<c:when test="${var.type == 'FUND_OTHER'}">其他</c:when>
					               		</c:choose>
									</td>
									<td>${var.fundcode }</td>
									<td>${var.fundabbrev }</td>
									<td>${var.shares}</td>
									<td>${var.shares_redemp}</td>
									<td>${var.profit_yesterday }<span id="dataList[${vs.index }].profitDateSpan"></span></td>
               						<td>${var.nav }</td>
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
		<script type="text/javascript" src="${css_imagedomain}/plugins/jsCalendar/WdatePicker.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		</script>
		
	</body>
</html>

