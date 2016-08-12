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
		<div class="detailedTab"> <span onclick = "having()">持有中的投资</span> <span onclick = "over()">已结清的投资</span> <span onclick = "record()" class="action">申请记录</span> </div>
       
      <form id = "allList" action="${project_name}/user/invest/investRecord" method="post" >
        <div class="detailedList" style="display:block;">
			<div class="zjmxData">
				<span class="littleGray">时间：</span>
				<input class="Wdate" value="<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>" type="text" id="startTime" name="startTime" placeholder="请选择日期" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('s'); }})">
				<span class="littleGray" style="margin: 0 2px;">-</span>
				<input class="Wdate" value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"/>" type="text" id="endTime" name="endTime" placeholder="请选择日期" onClick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('e'); }})">
				<input type="hidden" id="timeRange" name="timeRange">
				<span class="littleGray marginL30">最近：</span>
				<span class="drakGray ${timeRange eq 1 ? "on":"" }"  id="oneWeekTime" >一周</span>
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
                	<th class="detSp22">投资基本信息</th>
					<th class="detSp23">年化收益</th>
					<th class="detSp24">投资期限</th>
                    <th class="detSp25">投资金额（元）</th>
                    <th class="detSp26">申请时间</th>
                    <th class="detSp27">状态</th>
                </tr>
            
             <c:choose>
            
             <c:when test="${not empty  page.result}">
            
           <c:forEach items="${page.result }" var="item">
            <tr class="detailedList-con">
                <td class="detSp22">
                	<c:choose>
                	<c:when test="${item.SHENQING_STATUS==3 }">
                	<a href="user/invest/investHavingDetail?tId=${item.ID}">${item.B_NAME }</a><br />
                	</c:when>
                	<c:when test="${item.SHENQING_STATUS==4 }">
                	<a href="user/invest/investOverDetail?tId=${item.ID}">${item.B_NAME }</a><br />
                	</c:when>
                	<c:otherwise>
                	${item.B_NAME }</br>
                	</c:otherwise>
                	</c:choose>
				</td>
                <td><i>${item.BORROW_APR }%</td>
				<td>${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'月':'天'}</td>
                <td class="detSp9" style="color: #f27267;">${item.TENDER_ACCOUNT }</td>
                <td class="detSp10"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd "/></td>
                <td class="detSp11">
                   	<c:if test="${item.SHENQING_STATUS==1 }">申请中</c:if>
                   	<c:if test="${item.SHENQING_STATUS==2 }">已退款</c:if>
                    <c:if test="${item.SHENQING_STATUS==3 }">持有中</c:if>
                    <c:if test="${item.SHENQING_STATUS==4 }">已结清</c:if>
                    <c:if test="${item.SHENQING_STATUS==5 }">退款中</c:if>
                </td>
            </tr>
            </c:forEach>
             </c:when>
             <c:when test="${ startTime!=null && startTime!='' }">    <tr><td style="text-align:center;height: 150px;line-height: 150px;" colspan='6'>抱歉，没有符合条件的记录！ </td></tr></c:when>
             <c:when test="${page.totalCount==0 && page.pageNumber==1 }">	<tr><td style="text-align:center;height: 150px;line-height: 150px;" colspan='6'>暂无记录! </td></tr></c:when>
             </c:choose>
				</table>
   			<!--<div class="page-header position-relative">
              		<div class="page-header position-relative" style="margin-top: 12px">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<div class="pagination" style="padding-top: 0px;margin-top: 0px;width:900px;">${page.frontPageStr}</div>
								</td>
							</tr>
						</table>
    				</div>
  				</div>-->
				<div class="pagination" style="padding-top: 0px;margin-top: 0px;width:900px;">
					<span style="text-align: center;">${page.frontPageStr}</span>
				</div>
    		</div>
    	</form>
			<style>
				.pagination ul{width:900px;}
			</style>
		</div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>

<script type="text/javascript">

function over(){
	location.href = "${project_name}/user/invest/investOver?c="+Math.random();
}

function having(){
	location.href = "${project_name}/user/invest/investHaving?c="+Math.random();
}

function record(){
	location.href = "${project_name}/user/invest/investRecord?c="+Math.random();
}


//时间范围修改
$("#oneWeekTime").click(function(){
	/* $("#oneWeekTime").removeClass('drakGray');
	$("#oneMonthTime").removeClass('on');
	$("#oneWeekTime").addClass('drakGray on') */
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

