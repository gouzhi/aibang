<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
    <title>提现查询 - 华金所</title>
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
        <span>提现查询</span>
    </div>
    <%@ include file="/WEB-INF/jsp/common/left.jsp"%>
      <form action="list" method="post">
    <div class="account-Right fl">
        <div class="crumbNav329">提现查询</div>
		<div class="whiteR329">
            <div class="receivablesDate">
			         <div class="zjmxData">
                                <span class="littleGray">时间：</span>
                                <input class="Wdate" value="<fmt:formatDate value="${createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text" id="createTimeBegin" name="createTimeBegin" placeholder="请选择日期" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'createTimeEnd\');}',readOnly:true,onpicked:function(dp){ selectedTrades('s'); }})">
                                <span class="littleGray" style="margin: 0 2px;">-</span>
                                <input class="Wdate" value="<fmt:formatDate value="${createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text" id="createTimeEnd" name="createTimeEnd" placeholder="请选择日期" onClick="WdatePicker({minDate:'#F{$dp.$D(\'createTimeBegin\');}',readOnly:true,onpicked:function(dp){ selectedTrades('e'); }})">
                                <span class="littleGray marginL30">最近：</span>
                                <span class="drakGray ${timeRange eq 1 ? "on":"" }" id="oneWeekTime" >一周</span>
                                <span class="drakGray ${timeRange eq 2 ? "on":"" }" id="oneMonthTime">一个月</span>
                                <span class="drakGray ${timeRange eq 3 ? "on":"" }" id="sixMonthTime" >六个月</span>
	                     <input type="hidden" id="timeRange" name="timeRange" value="${timeRange}">
                         <div class="zhuangT">
                            <span class="typeSpan">状态：</span>
                            <select id="status" name="status">
                                <option value="">全部</option>
                                <option value="0" ${status eq 0?"selected='selected'":"" }>提交</option>
                                <option value="1" ${status eq 1?"selected='selected'":"" }>成功</option>
                                <option value="2" ${status eq 2?"selected='selected'":"" }>失败</option>
                            </select>
                         </div>
	                </div>
		    </div>
	
            <div id="content"> 
  <div class="cashTable">
  <table class="cashtableHead">
    <tr>
      <th class="cashSp1">创建时间</th>
      <th class="cashSp2">取现金额（元）</th>
      <th class="cashSp3">手续费（元）</th>
      <th class="cashSp4">实际到账金额（元）</th>
      <th class="cashSp5">银行账户</th>
      <th class="cashSp6">状态</th>
      <th class="cashSp7">备注</th>
    </tr>
  <c:choose>
    <%--当前页面的值不为空显示信息--%>
    <c:when test="${not empty page.result}">
      <c:forEach items="${page.result}" var="var" varStatus="vs">
        <tr>
            <td><fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${var.TOTAL}</td>
            <td>${var.FEE}</td>
            <td style="color: #f27267;">${var.CREDITED}</td>
            <td>${var.BANK_NAME}(尾号${fn:substring(var.BANK_ACCOUNT,var.BANK_ACCOUNT.length()-4,var.BANK_ACCOUNT.length())})</td>
            <td>
               <c:forEach items="${statusTypes}" var="item" varStatus="vs">
                 <c:if test="${item.code eq var.STATUS}">
                   ${item.cname}
                 </c:if>
               </c:forEach>
            </td>
            <td class="cashSp7"><span>${var.REMARK}</span></td>
        </tr>
      </c:forEach>
    </c:when>
    <%--当前页面的值为空显示暂无记录--%>
    <c:otherwise>
      <tr class="cashList">
        <td colspan="7" style="text-align: center;height: 150px;line-height: 150px;">暂时没有记录！</td>
      </tr>
    </c:otherwise>
  </c:choose>
    </table>
</div>
<%--没有分页--%>
    <div class="pagination" style="padding-top: 0px;margin-top: 0px;width:900px;">
        <span style="text-align: center;">${page.frontPageStr}</span>
    </div>
    <style>
        .pagination ul{width:900px;}
    </style>
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

	  $("#createTimeBegin").val("");
	  $("#createTimeEnd").val("");
	  $("#timeRange").val("1");
	  submitForm();
});
//时间范围修改
$("#oneMonthTime").click(function(){
	  $("#createTimeBegin").val("");
	  $("#createTimeEnd").val("");
	  $("#timeRange").val("2");
	  submitForm();
});
//时间范围修改
$("#sixMonthTime").click(function(){
	  $("#createTimeBegin").val("");
	  $("#createTimeEnd").val("");
	  $("#timeRange").val("3");
	  submitForm();
});



</script>
</html>