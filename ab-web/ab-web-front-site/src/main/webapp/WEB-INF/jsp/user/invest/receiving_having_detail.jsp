<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>收款明细-华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />

<!-- My97DatePicker -->
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/front/My97DatePicker/skin/WdatePicker.css" />
<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/lang/zh-cn.js"></script>
</head> 

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>

<!--投资详情主体-->
<div class="accountContent clear">
 <div id="nav_point" class="icoPoint">
     <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
     <span><a href="/user/invest/investCount" style="font-size: 14px;color:#777;">我的投资</a></span>
        <i> &gt; </i>
        <span>收款明细</span>
    </div>
<%@ include file="/WEB-INF/jsp/common/left.jsp"%>

    <div class="account-Right fl">
        <div class="crumbNav329">收款明细</div>
        <div class="whiteR329">
        	<div class="receivablesTab">
            	<span onclick = "havingDetail()" class="mingxi">待收款明细</span>
                <span onclick = "overDetail()">已结请明细</span>
            </div>
            <form id = "havingDetail" action="${project_name}/user/invest/havingDetail" method="post">
                <div class="receivablesDate">
                    <div class="zjmxData">
                        <span class="littleGray">时间：</span>
                        <input class="Wdate" value="<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>" type="text" id="startTime" name="startTime" placeholder="请选择日期" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('s'); }})">
                        <span class="littleGray" style="margin: 0 2px;">-</span>
                        <input class="Wdate" value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"/>" type="text" id="endTime" name="endTime" placeholder="请选择日期" onClick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('e'); }})">
                        <input type="hidden" id="timeRange" name="timeRange">
                        <span class="littleGray marginL30">未来：</span>
                        <span class="drakGray ${timeRange eq 1 ? "on":"" }" id="oneMonthTime">一个月</span>
                        <span id="sixMonthTime" class="drakGray ${timeRange eq 2 ? "on":"" }">六个月</span>
                            <!--<select class="shijian" id="timeRange" name="timeRange">
                                <option value="">请选择</option>
                                <option value="1" ${timeRange eq 1?"selected='selected'":"" }>未来一个月</option>
                                <option value="2" ${timeRange eq 2?"selected='selected'":"" }>未来六个月</option>
                            </select>-->
                        <div class="shuoming">实际以最终到账时间为准</div>
                    </div>
                </div>

                <div class="receivablesTable" style="display:block;">
                	<table class="tableHead">
                    	<tr>
                        	<th class="receSp1">预计到账时间</th>
                            <th class="receSp2">投资名称</th>
                            <th class="receSp3">预期收款（元）</th>
                            <th class="receSp4">预收本金（元）</th>
                            <th class="receSp5">预期利息（元）</th>
                            <th class="receSp6">查看详情</th>
                        </tr>
                    
              <c:choose>
             <c:when test="${not empty page.result  }">
             
                   <c:forEach  items="${ page.result}" var="item"  >
                    <tr class="tableList">
                        	<td><fmt:formatDate value="${item.RECOVER_TIME }" pattern="yyyy-MM-dd "/></td>
                            <td class="receSp2"><span>${item.B_NAME }</span></td>
                            <td>${item.APPR+item.TENDER_ACCOUNT }</td>
                            <td>${item.TENDER_ACCOUNT }</td>
                            <td>${item.APPR}</td>
                            <td class="receSp6"><a href="user/invest/investHavingDetail?tId=${item.ID}">[ 详情 ]</a></td>
                        
                    </tr>
                    </c:forEach>
                    </c:when>
                    <c:when test="${ startTime!=null && startTime!='' }">    <tr><td style="text-align:center;height: 150px;line-height: 150px;" colspan='6'>抱歉，没有符合条件的记录！ </td></tr></c:when>
                    <c:when test="${page.totalCount==0 && page.pageNumber==1 }">	<tr><td style="text-align:center;height: 150px;line-height: 150px;" colspan='6'>暂无记录! </td></tr></c:when>
            	 </c:choose>
                        </table>
                    <p class="number">
                        <span>共 <i>${count}</i> 笔</span>
                        <span>收款额：<i>${receivTotal }</i> 元</span>
                        <span>本金：<i>${AccountTotal }</i> 元</span>
                        <span>收益：<i>${interestTotal }</i> 元</span>
                    </p>
                    <!--<div class="page-header position-relative" style="margin-top: 12px">
						<table style="width:100%;">
						<tr>
						<td style="vertical-align:top;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;width:900px;">${page.frontPageStr}</div></td>
						</tr>
						</table>
    				</div>-->
                    <div class="pagination" style="padding-top: 0px;margin-top: 0px;width:900px;">${page.frontPageStr}</div>
                </div>
           </form>
            <style>
                .pagination ul{width: 900px;}
            </style>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>

<script type="text/javascript">
function havingDetail(){
	location.href = "${project_name}/user/invest/havingDetail";
}
function overDetail(){
	location.href = "${project_name}/user/invest/receiving_over_detail";
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
 

//时间范围修改
$("#oneMonthTime").click(function(){
	  $("#startTime").val("");
	  $("#endTime").val("");
	  $("#timeRange").val("1");
	  submitForm();
});
//时间范围修改
$("#sixMonthTime").click(function(){
	  $("#startTime").val("");
	  $("#endTime").val("");
	  $("#timeRange").val("2");
	  submitForm();
});

/* $(function(){

	if(${timeRange=='1'}){
			$("#oneMonthTime").attr('class','drakGray on');
	}
	if(${timeRange=='2'}){
		$("#oneMonthTime").removeClass('on');
			$("#sixMonthTime").addClass('drakGray on');
	}
});
 */
</script>
</html>