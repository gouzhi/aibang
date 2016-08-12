<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>活动奖励 - 未使用</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<script src="${css_imagedomain}/front/js/trading.js" type="text/javascript"></script>
<script src="${css_imagedomain}/front/js/jquery-1.9.1.min.js"></script>
</head> 
<script>
 /* $(function(){
	$('.tixian').click(function(){
		$('.bindingMask').show();	
		$('.binding').show();		
	});
	$('.close').click(function(){
		$('.bindingMask').hide();	
		$('.binding').hide();
	});
});  */
</script>	
<body style="background: #e8e8e8;">

<!-- <div class="bindingMask" style="display:none;"></div>
<div class="binding" style="display:none;">
	<p class="color5">您还没有开通第三方托管账户，<br />请先开通后再进行绑定提现银行卡操作。</p>
    <p><a href="${project_name}/user/customer/toActivateName" class="open">开通第三方托管账户</a><a href="#" class="close">取消</a></p>  
</div> -->

<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
    <div id="nav_point" class="icoPoint" >
		<span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span>活动奖励</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
	<form action="unuse.do?usestatus=0" method="post" id="form">
    <div class="account-Right fl">

		<div class="bonus">
			<h3>活动奖励</h3>
			<div style="width: 1000px; background: #fff;">
				<ul class="bonusUl clear" >
					<li><a href="${project_name}/user/actbonususers/unuse?usestatus=0" name="usestatus" val="0" class="bonusUlAct">未使用（<i>${count0}</i>）</a></li>
					<li><a href="${project_name}/user/actbonususers/use?usestatus=1" name="usestatus" val="1">已使用（<i>${count1}</i>）</a></li>
					<li><a href="${project_name}/user/actbonususers/failure?usestatus=2" name="usestatus" val="2">已过期（<i>${count2}</i>）</a></li>
					<li><a href="${project_name}/user/actbonususers/withdraw?usestatus=3" name="usestatus" val="3">已提现（<i>${count3}</i>）</a></li>
				</ul>
			</div>
			<div style="width: 1000px; background: #fff;">
				<div class="bonusNav" id= "bonusNav">
					<i style="font-size:14px;color:#ababab;margin-left: 10px;">排序：</i>
					<a class="${sortPastTime}"  id="sort_past_time_id"  >过期时间<input type="hidden" name="sortPastTime" value="${sortPastTime}"/></a>
					<a class="${sortIncomeTime}"     id="sort_income_time_id"  >到账时间<input type="hidden" name="sortIncomeTime" value="${sortIncomeTime}"/></a>
					<a class="${sortPrice}"   id="sort_price_id"  >金额<input type="hidden" name="sortPrice" value="${sortPrice}"/></a>
				</div>
			</div>
            <!--未使用-->
            <div class="bonsList" id="bonsList" style="display:block;">
                <ul class="clear">
					<c:forEach items="${page.result}" var="pc" varStatus="vspc">
                    <li>
                        <div class="disInline">
                        <c:if test="${pc.TYPE == 1}">
							<!--现金 红包-->
                        	<div class="hongbao">
                            	<div class="text_J"><i>￥</i>
                            		<fmt:formatNumber type="number" value="${pc.VALUE} " maxFractionDigits="0"/>
                            	</div>
                            </div>
                        </c:if>
                        <c:if test="${pc.TYPE == 2}">
							<!-- 返佣红包-->
							<div class="hongbaoF">
									<div class="text_J"><i>￥</i><fmt:formatNumber type="number" value="${pc.VALUE} " maxFractionDigits="0"/></div>
							</div>
                        </c:if>
                        </div>
                        <div style="height:144px;">
						<div class="text_T">有效时间：<fmt:formatDate value="${pc.CREATE_TIME}" pattern="yyyy/MM/dd" />-<fmt:formatDate value="${pc.EXPIRE_TIME}" pattern="yyyy/MM/dd" /></div>
                        <div class="yt">${pc.ACT_RULES }</div>
                        <div class="ly">来源：${pc.ACT_SOURCE }</div>
                        <!-- 判断是否是购买产品 -->
                        <c:if test="${fn:contains(pc.USE_TYPE,'2') && pc.TYPE == 1}">
							<div class="yt">
								<p>投资金额满<span style="color:#f27267">${pc.TENDER_MIN }</span>元可以使用</p>
							</div>
                        </c:if>
                        </div>
                        <div class="zt" style="margin:20px auto 0; text-align:center;">
                             <!-- 通过使用方式和红包类型判断显示是否存在提现按钮 -->
                             <c:choose>
									<c:when test="${pc.USE_TYPE == '1' || pc.TYPE == 2 }">
	                            		  <%-- <a href="${project_name}/borrow/list" class="use">使用</a> --%>
											  <a href="#" class="tixian withdrawals" onclick="tixian('${pc.bonusUserId}')" val="${pc.bonusUserId}">提现</a>
											  <input type="hidden" value="${pc.bonusId }" id="bonusId">
											  <input type="hidden" value="${pc.USER_ID }" id="userId">
									</c:when>
									<c:when test="${pc.USE_TYPE == '2'}">
	                            		  <a href="${project_name}/borrow/list" class="use">使&nbsp;用</a>
									</c:when>
									<c:otherwise>
										 <a href="${project_name}/borrow/list" class="use">使&nbsp;用</a>
										 <a href="#" class="tixian withdrawals" onclick="tixian('${pc.bonusUserId}')" val="${pc.bonusUserId}">提&nbsp;现</a>
									</c:otherwise>
							</c:choose>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
		             <c:if test="${count0 == 0}">
								<div style="width: 900px;height:150px;line-height: 150px; text-align:center;border-bottom: 1px solid #e8e8e8;">暂无记录！</div>
		             </c:if>
            </div>
			<div class="pagination">
					   ${page.frontPageStr} 
			</div>
			<style>
				.pagination ul{padding: 20px 0 50px;}
			</style>
        </div>
    </div>
 </form>
    
</div>
<script type="text/javascript">

   function redFunction(){
	   document.getElementById("bonsList").innerHTML = "";
   }

	$(function(){
		  //红包类型修改
		  $("#usersatus").change(function(){
			  submitForm();
		  });
	});
	
	   //提交
	  function submitForm()
	  {
		  $("form").submit();
	  }
		   function sortPage()
		   {
			   var sortValue=$(this).find("input").val();
			   var status = $(".bonusUlAct").attr("val");
			   if(sortValue=="arrowC" || sortValue=="arrowDrop")
				{
				   sortValue="arrowUp";
				} else
				{
					sortValue="arrowDrop";
				} 
			   window.location.href="unuse?"+$(this).find("input").attr("name")+"="+sortValue+"&usestatus="+status;
		   }
		   //过期时间排序
		   $("#sort_past_time_id").on("click",sortPage);
		   //到账时间排序
           $("#sort_income_time_id").on("click",sortPage);
           //金额排序
		   $("#sort_price_id").on("click",sortPage);
           
    
  	//红包提现
	 function tixian(id)
	 {
		 $.ajax({
				type: "post",
				 url: '${project_name}/user/actbonususers/getCash',
				 data:"bonusUserId="+id,
				success: function (data) {
			  		/* var bonusId = $(".tixian").attr("val");
			  		if(bonusId == id){
				 		alert("你已提现不能进行重复提现");
			  		}el */
				 	if(data=="success"){
					     alert("你已提现");
					     $("#form").submit();
					}
					else if(data == "924"){
						 alert("当日红包提现次数已达到上限。");
						 return false;
					}
					else if(data=="nouserId"){//跳出开户页面
						$('.bindingMask').show();	
						$('.binding').show();		
						$('.off').click(function(){
							$('.bindingMask').hide();	
							$('.binding').hide();
						});
					}
					else{
					 alert("提现异常，请联系管理员。");
					 return false;
					}
				}
			    });  
	} 
  
</script>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>