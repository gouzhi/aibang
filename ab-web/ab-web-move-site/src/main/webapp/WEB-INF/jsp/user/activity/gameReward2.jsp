<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>华金所</title>
<link href="${css_imagedomain}/static/move/css/mobile.css" rel="stylesheet" />
<link href="${css_imagedomain}/static/move/css/secCss.css" rel="stylesheet" />
<script src="${css_imagedomain}/static/move/js/zepto.min.js"></script>
<script src="${css_imagedomain}/static/move/js/zhuce_mobile.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/iscroll.js" type="text/javascript"></script>
</head>
<body>
<div class="wapOutside">
<div class="header "> <a class="arrowLeft" href="${project_name}/user/center/accountall.do"></a>
  <h1>活动奖励</h1>
</div>
<form id="form" action="${project_name}/user/actbonususers/failure?usestatus=2" method="post">   
<input type="hidden" name="pageNumber" value="${query.pageNumber}" />
<div class="rewardMenu">
	<a href="${project_name}/user/actbonususers/unuse?usestatus=0" name="usestatus" val="0" >未使用</a>
	<a href="${project_name}/user/actbonususers/use?usestatus=1" name="usestatus" val="1"  >已使用</a>
	<a href="${project_name}/user/actbonususers/failure?usestatus=2" name="usestatus" val="2"  class="on">已过期</a>
</div>
<div class="noReward" id="rewardsBg">
	 <!--  <div id="scroller"> -->
	  <div class="canReward">
      	<%-- <div id="canReward"></div>
	  	   <span class="pullDownIcon"></span><span class="pullDownLabel"></span>
			  <c:choose>
				<c:when test="${not empty page.result }">
					<div class="proDlList" id="thelist"> --%>
					  <c:forEach items="${page}" var="pc" varStatus="vspc">
							    <ul>
							      <li>
								        <p class="zhuangtai">${pc.ACT_RULES }<span>可提现</span><span>可投资</span></p>
								        <p class="name1">
								        	<c:forEach items="${actBonus}" var="info">
													<c:if test="${info.code == pc.TYPE}"><td class='center'>${info.cname}</td></c:if>
											</c:forEach>
								        </p>
								        <p>有效期：<fmt:formatDate value="${pc.CREATE_TIME}" pattern="yyyy/MM/dd" />-<fmt:formatDate value="${pc.EXPIRE_TIME}" pattern="yyyy/MM/dd" /></p>
								        <div class="moneys"><span>￥<fmt:formatNumber type="number" value="${pc.VALUE}" maxFractionDigits="0"/></span> </div>
							      </li>
							    </ul>
					    </c:forEach>
					    </div>
			  <%--  	</c:when>
			  </c:choose>
	   <div id="pullUp"> <span class="pullUpIcon"></span><span class="pullUpLabel"></span> </div>
	  </div>
	  <div class="myScrollbarV">
      	<div></div>
      </div>
  </div> --%>
  </div>

</form>
</div>
</body>
</html>
<script type="text/javascript">

	function unuse(){
		window.location.href="${project_name}/user/actbonususers/failure?usestatus=2";
	}

	

</script>