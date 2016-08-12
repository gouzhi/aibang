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
			<form action="${project_name}/hjsfundtrade/list" method="post" name="Form" id="Form">
			<table>
					<tr>
						<td>
							<span>交易日期</span>
							<input class="span10" name="ctimeBegin" id="ctimeBegin" value="<fmt:formatDate value="${hjsFundTradeQuery.ctimeBegin}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'ctimeEnd\')||\'%y-%M-%d\'}'})" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/>
							<span>至</span>
							<input class="span10" name="ctimeEnd" id="ctimeEnd" value="<fmt:formatDate value="${hjsFundTradeQuery.ctimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'ctimeBegin\')}',maxDate:'%y-%M-%d'})" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/>
						</td>
						<td>
						    <span>交易状态</span> 
							<select  name="status" id="status" data-placeholder="请选择" style="height:35px;font-size:14px ;font-weight:400;width: 270px;">
							 <option value=""  ${empty hjsFundTradeQuery.status?"selected='selected'":""}>全部</option>
							 <option value="0" ${hjsFundTradeQuery.status eq 0?"selected='selected'":""}>新提交</option>
							 <option value="1" ${hjsFundTradeQuery.status eq 1?"selected='selected'":""}>待确认</option>
							 <option value="2" ${hjsFundTradeQuery.status eq 2?"selected='selected'":""}>赎回中</option>
							 <option value="3" ${hjsFundTradeQuery.status eq 3?"selected='selected'":""}>成功</option>
							 <option value="4" ${hjsFundTradeQuery.status eq 4?"selected='selected'":""}>失败</option>
						  	</select>
						</td>
					</tr>
				    <tr>
						<td>
							<span>交易类型</span> 
							<select  name="tradeType" id="tradeType" data-placeholder="请选择" style="height:35px;font-size:14px ;font-weight:400;width: 198px;">
							 <option value=""  ${empty hjsFundTradeQuery.tradeType?"selected='selected'":""}>全部</option>
							 <option value="0" ${hjsFundTradeQuery.tradeType eq 0?"selected='selected'":""}>认购</option>
							 <option value="1" ${hjsFundTradeQuery.tradeType eq 1?"selected='selected'":""}>申购</option>
							 <option value="2" ${hjsFundTradeQuery.tradeType eq 2?"selected='selected'":""}>赎回</option>
						  	</select>
						</td>
						<td>
						    <span>&nbsp;&nbsp;&nbsp;&nbsp;关键词</span> 
							<select  name="keyType" id="keyType" data-placeholder="请选择" style="height:35px;font-size:14px ;font-weight:400;width: 110px;">
							      <option value="1" ${hjsFundTradeQuery.keyType eq 1?"selected='selected'":""}>我方流水号</option>
						          <option value="2" ${hjsFundTradeQuery.keyType eq 2?"selected='selected'":""}>钱景流水号</option>
						          <option value="3" ${hjsFundTradeQuery.keyType eq 3?"selected='selected'":""}>基金简称</option>
						          <option value="4" ${hjsFundTradeQuery.keyType eq 4?"selected='selected'":""}>基金代码</option>
						          <option value="5" ${hjsFundTradeQuery.keyType eq 5?"selected='selected'":""}>姓名</option>
						          <option value="6" ${hjsFundTradeQuery.keyType eq 6?"selected='selected'":""}>手机号</option>
						          <option value="7" ${hjsFundTradeQuery.keyType eq 7?"selected='selected'":""}>身份证号</option>
						  	</select>
						  	<input type="keyContent" name="keyContent" value="${hjsFundTradeQuery.keyContent}" style="width: 142px; height: 25px;" maxlength="50"/>
						  	<c:if test="${QX.cha == 1 }">
							   <td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"style="height:35px;font-size:14px ;font-weight:400;width:52px;" title="查询">查询</button></td>
							</c:if>
						</td>
					</tr>
			</table>
			<c:if test="${QX.cha == 1 }">
				<table class="center">
				 <tbody>
				   <tr>
				    <td style=" height: 41px;"><a class="btn btn-small btn-primary" id="unshelve" onclick="importExl();">导出Excel</a>
				    <input type="hidden" value="0" name="importFlag" id="importFlag"/></td>
				   </tr>
				 </tbody>
				</table>
		    </c:if>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>我方流水号</th>
						<th>钱景流水号</th>
						<th>姓名</th>
						<th>手机号</th>
						<th>身份证号</th>
						<th>交易时间</th>
						<th>交易确认时间</th>
						<th>基金简称</th>
						<th>基金代码</th>
						<th>净值（元）</th>
						<th>交易份额</th>
						<th>交易金额（元）</th>
						<th>费率</th>
						<th>手续费（元）</th>
						<th>交易银行</th>
						<th>交易卡号</th>
						<th>交易类型</th>
						<th>交易状态</th>
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
									<td>${var.ORDERNO}</td>
									<td>${var.REALNAME}</td>
									<td>${var.MOBILE}</td>
									<td>${var.IDENTITY}</td>
									<td><fmt:formatDate value="${var.CTIME}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${var.UTIME}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
									<td>${var.FUNDABBREV}</td>
									<td>${var.FUNDCODE}</td>
									<td>${var.NAV}</td>
									<td>${var.SHARES}</td>
									<td>${var.SUM}</td>
									<td>${var.FEE}</td>
									<td>${var.FEE_SUM}</td>
									<td>${var.BANKNAME}</td>
									<td>${var.CARD}</td>
									<td><c:choose>
									<c:when test="${var.TRADE_TYPE eq 0}">认购</c:when>
									<c:when test="${var.TRADE_TYPE eq 1}">申购</c:when>
									<c:when test="${var.TRADE_TYPE eq 2}">赎回</c:when>
									</c:choose></td>
									<td><c:choose>
									<c:when test="${var.STATUS eq 0}">新提交</c:when>
									<c:when test="${var.STATUS eq 1}">待确认</c:when>
									<c:when test="${var.STATUS eq 2}">赎回中</c:when>
									<c:when test="${var.STATUS eq 3}">成功</c:when>
									<c:when test="${var.STATUS eq 4}">失败</c:when>
									</c:choose></td>
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
			$("#importFlag").val("0");
			$("#Form").submit();
		}
		
		function importExl(){
			//top.jzts();
			$("#importFlag").val("1");
			$("#Form").submit();
		}
		</script>
	</body>
</html> 
