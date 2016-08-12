<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>活动奖励 - 已使用</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<script src="${css_imagedomain}/front/js/trading.js" type="text/javascript"></script>
</head> 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
    <div id="nav_point" class="icoPoint">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span>活动奖励</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
	<form action="use.do?usestatus=1" method="post">
    <div class="account-Right fl">
		<div class="bonus">
            <h3>活动奖励</h3>
        	<%-- <c:forEach items="${bonusUseStatus}" var="p"> --%>
            <div style="width: 1000px; background: #fff;">
                <ul class="bonusUl clear" >
                    <li><a href="${project_name}/user/actbonususers/unuse?usestatus=0"  name="usestatus" val="0">未使用（<i>${count0 }</i>）</a></li>
                    <li><a href="${project_name}/user/actbonususers/use?usestatus=1" name="usestatus" class="bonusUlAct" val="1">已使用（<i>${count1 }</i>）</a></li>
                    <li><a href="${project_name}/user/actbonususers/failure?usestatus=2" name="usestatus" val="2">已过期（<i>${count2 }</i>）</a></li>
                    <li><a href="${project_name}/user/actbonususers/withdraw?usestatus=3" name="usestatus" val="3">已提现（<i>${count3 }</i>）</a></li>
                </ul>
                </div>
            <!--已使用-->

            <div class="bonsList" style="display:block;">
                <ul>
                    <c:forEach items="${page.result}" var="pc" varStatus="vspc">
                    <li>
                        <div class="disInline">
                            <c:if test="${pc.TYPE == 1}">
								<!--现金 红包-->
	                        	<div class="hongbao_end">
	                            	<div class="text_J_end"><i>￥</i><fmt:formatNumber type="number" value="${pc.VALUE} " maxFractionDigits="0"/></div>
	                            </div>
	                        </c:if>
	                        <c:if test="${pc.TYPE == 2}">
								<!-- 返佣红包-->
								<div class="hongbao_endF">
										<div class="text_J_end"><i>￥</i><fmt:formatNumber type="number" value="${pc.VALUE} " maxFractionDigits="0"/></div>
								</div>
	                        </c:if>
                        </div>
                        
                        
                        <div style="height:144px;">
                        <div class="text_T">有效时间：<fmt:formatDate value="${pc.CREATE_TIME}" pattern="yyyy/MM/dd" />-<fmt:formatDate value="${pc.EXPIRE_TIME}" pattern="yyyy/MM/dd" /></div>
                        <div class="text_T">使用时间：<span><fmt:formatDate value="${pc.useTime}" pattern="yyyy/MM/dd HH:mm:ss" /></span></div>
                        <div class="text_T">订单编号：<span>${pc.ID }</span></div>
                        <div class="yt">
                            <p>${pc.ACT_RULES}</p>
                        </div>

                        <div class="ly">来源：${pc.ACT_SOURCE }</div>
	                       <!--  <div class="yt">
	                            <p>投资金额满<span style="color:#f27267">10</span>元可以使用</p>
	                        </div> -->
	                          <!-- 判断是否是购买产品 -->
	                        <c:if test="${fn:contains(pc.USE_TYPE,'2')}">
								<div class="yt">
									<p>投资金额满<span style="color:#f27267">${pc.TENDER_MIN}</span>元可以使用</p>
								</div>
	                        </c:if>
                        
                        	</div>
                        <div class="zt" style="margin:20px auto 0;text-align: center;">
                            <span>
	                            <c:forEach items="${bonusList}" var="info">
									<c:if test="${info.code == pc.STATUS}"><td>${info.cname}</td></c:if>
								</c:forEach>
							</span>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                 <c:if test="${count1 == 0}">
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


   $(".arrowDrop").on("click",function(){
		var val = $(this).attr("value");
		location.href="reward?chaxun="+val;
	});
   //红包使用状态
   $(".code").on("click",function(){
		var val = $(this).attr("value");
		location.href="reward?usestatus="+val;
	});


</script>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>