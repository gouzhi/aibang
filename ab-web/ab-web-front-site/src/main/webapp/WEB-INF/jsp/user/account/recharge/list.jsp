<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
    <title>充值查询 - 华金所</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
    <script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js"></script>
    <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />

</head> 

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--充值查询-->
<div class="accountContent clear">
    <div id="nav_point" class="icoPoint">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金记录</a></span>
        <i> &gt; </i>
        <span>充值查询</span>
    </div>
    <%@ include file="/WEB-INF/jsp/common/left.jsp"%>
      <form action="list" method="post">
    <div class="account-Right fl">
        <div class="crumbNav329">充值查询</div>
		<div class="whiteR329">
            <div class="receivablesDate">
			         <div class="zjmxData">
                                <span class="littleGray">时间：</span>
                                <input class="Wdate" value="<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>" type="text" id="startTime" name="startTime" placeholder="请选择日期" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('s'); }})">
                                <span class="littleGray" style="margin: 0 2px;">-</span>
                                <input class="Wdate" value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"/>" type="text" id="endTime" name="endTime" placeholder="请选择日期" onClick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('e'); }})">
                                	<input type="hidden" id="timeRange" name="timeRange" value="${ timeRange}">
                                <span class="littleGray marginL30">最近：</span>
                                <span class="drakGray ${timeRange eq 1 ? "on":"" }" id="oneWeekTime" >一周</span>
                                <span class="drakGray ${timeRange eq 2 ? "on":"" }" id="oneMonthTime">一个月</span>
                                <span id="sixMonthTime" class="drakGray ${timeRange eq 3 ? "on":"" }">六个月</span>
	                   	<!--<select class="shijian" id="timeRange" name="timeRange">
	                   	    <option value="">请选择</option>
	                    	<option value="1" ${timeRange eq 1?"selected='selected'":"" }>最近一周</option>
	                        <option value="2" ${timeRange eq 2?"selected='selected'":"" }>最近一个月</option>
	                    </select>-->
                         <div class="zhuangT">
                            <span class="typeSpan">状态：</span>
                            <select id="status" name="status">
                                <option value="0">全部</option>
                                <option value="1" ${status eq 1?"selected='selected'":"" }>成功</option>
                                <option value="2" ${status eq 2?"selected='selected'":"" }>失败</option>
                            </select>
                         </div>
	                </div>
		    </div>
		
        <%-- 	<div class="rechargeHead">
            	<span>时间：</span>                                                                                                      <!--时间选择框，选中后调用change()方法-->
                <input class="Wdate" type="text" placeholder="请选择日期" readonly="readonly" onFocus="var endDate=$dp.$('endDate');WdatePicker({readOnly:true,oncleared:function(){change();},onpicked:function(dp){change();},maxDate:'#F{$dp.$D(\'endDate\')||\'%y-%M-%d\'}'})" id="beginDate">
                <span>至</span>
                <input class="Wdate" type="text" placeholder="请选择日期" readonly="readonly" onFocus="WdatePicker({readOnly:true,oncleared:function(){change();},onpicked:function(db){change()},minDate:'#F{$dp.$D(\'beginDate\')}',maxDate:'%y-%M-%d'})" id="endDate">
                <select class="shijian" id="time">
                    <option value="0">全部</option>
                    <option value="1">最近一周</option>
                    <option value="2">最近一个月</option>
                </select>
                <span>状态：</span>
                <select id="status">
                    <option value="3">全部</option>
                    <c:forEach items="${statusTypes}" var="item" varStatus="vs">
                        <option value="${item.code}">${item.cname}</option>
                    </c:forEach>
                </select>
            </div> --%>
            <div id="content">
                <%--动态引入详情页面--%>
               <%--  <jsp:include page="table.jsp">
                    <jsp:param name="page" value="${page}"></jsp:param>
                </jsp:include> --%>
  <div class="rechargeTable">
  <table class="rechargetableHead">
    <tr>
      <th class="rechargeSp1">流水号</th>
      <th class="rechargeSp2">创建时间</th>
      <th class="rechargeSp3">充值金额（元）</th>
      <th class="rechargeSp4">手续费（元）</th>
      <th class="rechargeSp5">实际到账金额（元）</th>
      <th class="rechargeSp6">充值方式</th>
      <th class="rechargeSp7">状态</th>
      <th class="rechargeSp8">备注</th>
    </tr>

  <%--有数据显示，没有数据显示暂无记录--%>
  <c:choose>
    <c:when test="${not empty page.result}">
      <c:forEach items="${page.result}" var="var" varStatus="vs">
        <tr>
            <td>${var.TRADE_ID}</td>
            <td><fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${var.MONEY}</td>
            <td>${var.FEE}</td>
            <td style="color: #f27267">${var.BALANCE}</td>
            <td>
            <c:if test="${var.TYPE==1}">
            	网上银行
            </c:if>
               <c:if test="${var.TYPE==2}">
            	快捷支付
            </c:if>
            </td>
            <td>
              <c:forEach items="${statusTypes}" var="item" varStatus="vs">
                <c:if test="${item.code eq var.STATUS}">
                  ${item.cname}
                </c:if>
              </c:forEach>
            </td>
            <td class="rechargeSp8"><span>${var.REMARK}</span></td>

        </tr>
      </c:forEach>
    </c:when>
    <c:otherwise>
      <tr class="rechargeList">
          <td class="rechargeSp9"  colspan="8" style="text-align: center;height: 150px;line-height: 150px;">暂时没有记录</td>
      </tr>
    </c:otherwise>
  </c:choose>
      </table>
</div>
    <div class="pagination" style="padding-top: 0px;margin-top: 0px;width:900px;">
        <span style="text-align: center;">${page.frontPageStr}</span>
    </div>
    <style>
        .pagination ul{width: 900px;}
    </style>
    <!-- <div class="page-header position-relative">
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
  	</form>
<%--没有分页--%>
<%-- <c:if test="${not empty page.result}">
  <%@ include file="../pagination.jsp"%>
</c:if> --%>
</div>
</div>
 </div>
</div>
<!--充值查询 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
<script type="text/javascript" >
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
	  //类型修改
	  $("#status").change(function(){
		  submitForm();
	  });
});
 //提交
function submitForm()
{
	  $("form").submit();
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