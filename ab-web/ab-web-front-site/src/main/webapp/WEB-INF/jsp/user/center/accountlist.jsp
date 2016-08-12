<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>资金明细 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  	  <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <script src="${css_imagedomain}/front/js/trading.js" type="text/javascript"></script>
  <script src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head> 
<body> 
<div class="bindingMask" style="display:none;"></div>
<div class="binding" style="display:none;">
	<h3 class="color5 pr">提示<span class="off fzw fz18 pa">x</span></h3>
	<p class="color5">您未开通第三方托管账户<br /><span>请先开通后再进行操作</span></p>
    <a href="${project_name}/user/customer/toActivateName" class="open recharge_open">开通理财账户</a>
</div>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
    <div id="nav_point" class="icoPoint">
		<span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金记录</a></span>
        <i> &gt; </i>
        <span>资金明细</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
	<form action="accountlist" method="post">
		<div class="account-Right fl">
			<div class="crumbNav329">资金明细</div>
				<div class="zjmxBtn">
					<a onclick="recharge()" class="chongzhi" href="javascript:void(0)">充&nbsp;值</a>
					<a onclick="cash()" class="tixian" href="javascript:void(0)">提&nbsp;现</a>
					<a href="${project_name}/user/invest/havingDetail" class="chakan">[ 查看待收款明细 ]</a>
				</div>
			<ul class="category clear">
				<li><p class="redBg">总资产</p><span><i>${userBase.total }</i> 元</span></li>
				<li><p class="blueBg">投资总额</p><span><i>${userBase.tenderAccount }</i> 元</span></li>
				<li><p class="greenBg">余额</p><span><i>${userBase.balance }</i> 元</span></li>
				<li><p class="orangeBg">可用余额</p><span><i>${userBase.avlBalance }</i> 元</span></li>
			</ul>
			<div class="whiteR329">
				<div class="receivablesDate">
	                <div class="zjmxData">
						<span class="littleGray">时间：</span>
						<input class="Wdate" value="<fmt:formatDate value="${startTime}" pattern="yyyy-MM-dd"/>" type="text" id="startTime" name="startTime" placeholder="请选择日期" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('s'); }})">
						<span class="littleGray" style="margin:0 2px;">-</span>
						<input class="Wdate" value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"/>" type="text" id="endTime" name="endTime" placeholder="请选择日期" onClick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\');}',readOnly:true,onpicked:function(dp){ selectedTrades('e'); }})">
						<input type="hidden" id="timeRange" name="timeRange" value="${timeRange }">
						<span class="littleGray marginL30">最近：</span>
						<span class="drakGray ${timeRange eq 1 ? "on":"" }" id="oneWeekTime" >一周</span>
						<span class="drakGray ${timeRange eq 2 ? "on":"" }" id="oneMonthTime">一个月</span>
						<span class="drakGray ${timeRange eq 3 ? "on":"" }" id="sixMonthTime">六个月</span>
	                   	<!--<select class="shijian" id="timeRange" name="timeRange">
	                   	    <option value="">请选择</option>
	                    	<option value="1" ${timeRange eq 1?"selected='selected'":"" }>最近一周</option>
	                        <option value="2" ${timeRange eq 2?"selected='selected'":"" }>最近一个月</option>
	                        <option value="3" ${timeRange eq 3?"selected='selected'":"" }>最近六个月</option>
	                    </select>-->
						<div class="zhuangT">
							<span class="typeSpan">类型：</span>
							<select class="type" id="tradeType" name="tradeType">
								<option value="">全部</option>
								<option value="1" ${tradeType eq 1?"selected='selected'":"" }>充值</option>
								<option value="2" ${tradeType eq 2?"selected='selected'":"" }>取现</option>
								<option value="3" ${tradeType eq 3?"selected='selected'":"" }>收款</option>
								<option value="4" ${tradeType eq 4?"selected='selected'":"" }>付款</option>
								<option value="5" ${tradeType eq 5?"selected='selected'":"" }>奖励</option>
							</select>
						</div>
	                </div>
				</div>
	                <div class="zjmxTable">
	                	<table class="zjmxtableHead">
	                    	<tr>
	                        	<th class="zjmxSp1">时间</th>
	                            <th class="zjmxSp2">类型</th>
	                            <th class="zjmxSp3">收入（元）</th>
	                            <th class="zjmxSp4">支出（元）</th>
	                            <th class="zjmxSp5">账户余额（元）</th>
	                            <th class="zjmxSp6">备注</th>
	                        </tr>
							<c:choose>
								<c:when test="${not empty page.result}">
									<c:forEach items="${page.result}" var="item">
										<tr>
											<td><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd"/></td>
											<td>
											  <c:choose>
												  <c:when test="${item.TYPE eq '1'}">充值</c:when>
												  <c:when test="${item.TYPE eq '4'}">提现</c:when>
												  <c:when test="${item.TYPE eq '6'}">付款</c:when>
												  <c:when test="${item.TYPE eq '11'}">收款</c:when>
												  <c:when test="${item.TYPE eq '28'}">奖励</c:when>
											  </c:choose>
											</td>
											<td style="color: #f27267">${item.INCOME}</td>
											<td style="color: #64cd8e">${item.EXPEND}</td>
											<td>${item.BALANCE}</td>
											<td title="${item.REMARK }" class="zjmxSp6"><span>${fn:substring(item.REMARK,0,10)}</span></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td style="text-align: center;height:150px;line-height:150px;" colspan="6">暂时没有记录</td>
									</tr>
								</c:otherwise>
							</c:choose>
	                    </table>
	                </div>
	                <div class="pagination" style="width: 900px;">
						<span style="text-align: center;">
							${page.frontPageStr}
						</span>
					</div>
	        </div>
	    </div>
    </form>
    
</div>
<style>
	.pagination ul{width:900px;}

</style>
<script type="text/javascript">
//充值判断是否开通汇付账户
function recharge(){
	  if('${userBase.usrCustId}'){
		 location.href="${project_name}/user/recharge/main";
	 }else{
		 $('.bindingMask').show();	
		 $('.binding').show();
		 $('.off').click(function(){
				$('.bindingMask').hide();	
				$('.binding').hide();
				$('.cashMask').hide();
			});  
	 }
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
	  //类型修改
	  $("#tradeType").change(function(){
		  submitForm();
	  });
  });
   //提交
  function submitForm()
  {
	  $("form").submit();
  }
   
  
</script>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>