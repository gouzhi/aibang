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
			<h1>${ actInfo.aname}</h1>  
			<!-- 检索  -->
			<form action="hjsactdrawawardwin/list" method="post" name="Form" id="Form">
			<input name="actId" type="hidden" value="${actInfo.id}">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="userMobile" value="${query.userMobile}" placeholder="输入手机号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<td style="vertical-align:top;"> 
					 	<select  name="awardType" id="awardType" data-placeholder="请选择奖品类型" style="vertical-align:top;width: 120px;">
							<option value="">请选择奖品类型</option>
							<option <c:if test="${query.awardType == 1 }">selected=selected</c:if> value="1">红包</option>
							<option <c:if test="${query.awardType == 2 }">selected=selected</c:if> value="2">实物</option>
					  	</select>
					</td>
					<td style="vertical-align:top;"> 
					 	<select  name="bonusId" id="bonusId" data-placeholder="请选择奖品" style="vertical-align:top;width: 120px;">
					 		<option value="">请选择奖品</option>
					 		<c:if test="${not empty awardList}">
					 			<c:forEach items="${awardList}" var="award" >
					 				<c:if test="${award.AWARD_TYPE == 1 }">
					 					<option <c:if test="${query.bonusId == award.BONUS_ID }">selected=selected</c:if> value="${award.BONUS_ID}">${award.B_NAME}</option>
					 				</c:if>
									<c:if test="${award.AWARD_TYPE == 2 }">
					 					<option <c:if test="${query.goodsId == award.GOODS_ID }">selected=selected</c:if> value="${award.GOODS_ID}">${award.B_NAME}</option>
					 				</c:if>
					 			</c:forEach>
					 		</c:if>
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
						<th>奖品类型</th>
						<th>奖品</th>
						<th>手机号</th>
						<th>领取时间</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:if test="${QX.cha == 1 }">
							<c:forEach items="${page.result}" var="var" varStatus="vs">
								<tr>
									<td>
										<c:choose>
											<c:when test="${var.AWARD_TYPE == 1 }">红包</c:when>
											<c:when test="${var.AWARD_TYPE == 2 }">实物</c:when>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${var.AWARD_TYPE == 1 }">${var.BONUS_NAME}</c:when>
											<c:when test="${var.AWARD_TYPE == 2 }">${var.GOODS_NAME}</c:when>
										</c:choose>
									</td>
									<td>${var.USER_MOBILE}</td>
									<td>${var.CREATE_TIME}</td>
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
			奖品总数：<span id="awardsNum">${ awardsNum}</span>  &nbsp;
			已领取数量： <span id="usedNum">${ usedNum}</span> 	&nbsp;
			剩余数量： <span id="lastNum">${ lastNum}</span> 	&nbsp;
			
			<br>
			奖品总额： <span id="awardsSum">${ awardsSum}</span> 	&nbsp;
			已领取金额： <span id="userdSum">${ userdSum}</span> 	&nbsp;
			剩余金额： <span id="lastSum">${ lastSum}</span>	&nbsp;
		
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
		<%-- <script type="text/javascript" src="${css_imagedomain}/plugins/jsCalendar/WdatePicker.js"></script><!-- 日期框 --> --%>
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
	    <script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
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

