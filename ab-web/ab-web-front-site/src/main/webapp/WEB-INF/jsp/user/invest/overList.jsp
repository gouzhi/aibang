<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>投资明细-华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<!-- My97DatePicker -->
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/front/My97DatePicker/skin/WdatePicker.css" />
<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/lang/zh-cn.js"></script>

</head> 

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>

<div class="accountContent clear">
 <div id="nav_point" class="icoPoint">
	 <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
	 <span><a href="/user/invest/investCount" style="font-size: 14px;color:#777;">我的投资</a></span>
        <i> &gt; </i>
        <span>投资明细</span>
    </div>
<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
		<div class="crumbNav329">投资明细</div>
		<div class="whiteR329">
			<div class="detailedTab"> <span onclick = "having()">持有中的投资</span> <span onclick = "over()" class="action">已结清的投资</span> <span onclick = "record()">申请记录</span> </div>
				<form id = "overList" action="${project_name}/user/invest/investOver" method="post">
					<div class="detailedList" style="display:block;">
						<div class="zjmxData"> <span class="littleGray">时间：</span>
							<input class="Wdate" value="<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>" type="text" id="startTime" name="startTime" placeholder="请选择日期" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('s'); }})">
							<span class="littleGray" style="margin: 0 2px;">-</span>
							<input class="Wdate" value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"/>" type="text" id="endTime" name="endTime" placeholder="请选择日期" onClick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('e'); }})">
							<input type="hidden" id="timeRange" name="timeRange">
							<span class="littleGray marginL30">最近：</span>
							<span class="drakGray ${timeRange eq 1 ? "on":"" }" id="oneWeekTime" >一周</span>
							<span class="drakGray ${timeRange eq 2 ? "on":"" }" id="oneMonthTime">一个月</span>
							<span id="sixMonthTime" class="drakGray ${timeRange eq 3 ? "on":"" }">六个月</span>
							<!--<select class="shijian" id="timeRange" name="timeRange">
							<option value="">请选择</option>
							<option value="1" ${timeRange eq 1?"selected='selected'":"" }>最近一周</option>
							<option value="2" ${timeRange eq 2?"selected='selected'":"" }>最近一个月</option>
							<option value="3" ${timeRange eq 3?"selected='selected'":"" }>最近六个月</option>
						</select>-->
						</div>
						<table class="detailedList-head">
							<tr>
								<th class="detSp12">投资名称</th>
								<th class="detSp13">年化收益率</th>
								<th class="detSp14">投资期限</th>
								<th class="detSp15">起息日</th>
								<th class="detSp16">结束日</th>
								<th class="detSp17">投资金额（元）</th>
								<th class="detSp18">实际收益（元）</th>
							</tr>
							<c:choose >
								<c:when test="${not empty page.result }">
								
									<c:forEach items="${page.result }" var="item">
							<!--<tr id="ul1" class="detailedList-con">-->
							<tr class="detailedList-con">
									<td class="detSp12"><a href="${project_name}/user/invest/investOverDetail?tId=${item.tId}">${item.B_NAME }</a></td>
									<td><i>${item.BORROW_APR }%</i></td>
									<td>${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'月':'天'}</td>
									<td class="detSp13"><fmt:formatDate value="${item.BORROW_START_TIME }" pattern="yyyy-MM-dd"/></td>
									<td class="detSp14"><fmt:formatDate value="${item.RECOVER_YESTIME }" pattern="yyyy-MM-dd"/></td>
									<td class="detSp15" style="color: #f27267">${item.TENDER_ACCOUNT }</td>
									<td class="detSp16" style="color: #f27267">${item.RECOVER_INTEREST }</td>
							</tr>
									</c:forEach>
								</c:when>
								<c:when test="${ startTime!=null && startTime!='' }">    <tr><td style="text-align:center;height: 150px;line-height: 150px;" colspan='7'>抱歉，没有符合条件的记录！ </td></tr></c:when>
								<c:when test="${page.totalCount==0 && page.pageNumber==1 }">	<tr><td style="text-align:center;height: 150px;line-height: 150px;" colspan='7'>暂无记录! </td></tr></c:when>
							</c:choose>
						</table>
						<div class="pagination" style="padding-top: 0px;margin-top: 0px;width: 900px;">
						<span style="text-align: center;">${page.frontPageStr}</span>
						</div>
						<style>
							.pagination ul{width: 900px;}
						</style>
				   <!--<div class="page-header position-relative" style="margin-top: 12px">
							<table style="width:100%;">
								<tr>
									<td style="vertical-align:top;">
										<div class="pagination" style="padding-top: 0px;margin-top: 0px;width: 900px;">${page.frontPageStr}</div>
									</td>
								</tr>
							</table>
				</div>-->
				</div>

			</form>
		</div>
	</div>
</div>
</div>

<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
<script type="text/javascript">

function having(){
	location.href = "${project_name}/user/invest/investHaving?a="+Math.random();
}
function record(){
	location.href = "${project_name}/user/invest/investRecord?a="+Math.random();
}
function over(){
	location.href = "${project_name}/user/invest/investOver?a="+Math.random();
}
//时间选择后 
function selectedTrades(dateType)
{
	  $("#timeRange").val("");
	  if($("#startTime").val()!="" && $("#endTime").val()!="")
	  {
		  submitForm();  
	  }
}
$(function(){
	  //时间范围修改
	  $("#timeRange").change(function(){
		  $("#startTime").val("");
		  $("#endTime").val("");
		  submitForm();
	  });
	 
});
//提交
function submitForm()
{
	  $("form").submit();
}

$("#oneWeekTime").click(function(){

	  $("#startTime").val("");
	  $("#endTime").val("");
	  $("#timeRange").val("1");
	  submitForm();
});
//时间范围修改
$("#oneMonthTime").click(function(){
	  $("#startTime").val("");
	  $("#endTime").val("");
	  $("#timeRange").val("2");
	  submitForm();
});
//时间范围修改
$("#sixMonthTime").click(function(){
	  $("#startTime").val("");
	  $("#endTime").val("");
	  $("#timeRange").val("3");
	  submitForm();
});

/* $(function(){
	if(${timeRange=='1'}){
		$("#oneMonthTime").removeClass('on');
		$("#oneWeekTime").attr('class','drakGray on');
	}
	if(${timeRange=='2'}){
			$("#oneMonthTime").attr('class','drakGray on');
	}
	if(${timeRange=='3'}){
		$("#oneMonthTime").removeClass('on');
			$("#sixMonthTime").addClass('drakGray on');
	}
}); */
</script>

</html>

