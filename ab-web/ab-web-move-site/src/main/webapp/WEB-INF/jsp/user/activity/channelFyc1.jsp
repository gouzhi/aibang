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
<script src="${css_imagedomain}/move/js/iscroll.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/zepto.min.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/zepto.min.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
<div class="wapOutside">
  <div class="header"><a class="arrowLeft" href="${project_name}/user/center/accountall.do"></a>
    <h1>渠道返佣</h1>
  </div>
  <div class="fycMenu">
	  <span onclick="recommend()">我要推荐</span>
	  <span onclick="rebate()" class="on">返佣结算</span>
  </div>
  <div class="fycConList">
    <div class="jiesuan disNone">
      <ul>
        <li>
          <p class="name"><span><b class="moneyIcon"></b>我推荐的返佣</span>佣金总额</p>
          <p class="money">
          	<span>
	          	<!-- 判断金额是否为空 -->
	            <c:if test="${rebateSum.val != null}">${rebateSum.val}</c:if>
	            <c:if test="${rebateSum.val == null}">0</c:if>
          	</span>元
          </p>

        </li>
        <li>
          <p class="name"><span><b class="yongIcon"></b>我要赚取佣金</span>我的邀请码：${inviteCode }</p>
          <p class="money mobile_sub"><a href="javascript:void(0)">点击复制</a></p>
        </li>
      </ul>
      <div class="mobile_sub pLR16"><a href="javascript:void(0)">立即邀请</a> </div>
    </div>
    <div class="fanyong">
      <div class="allMoney">
	      <c:if test="${total[0].total != null}">
	      <div class="total" >
		      <span>${total[0].total}<b>元</b></span>
		  </div>
		                总计
	      </c:if>
	      <c:if test="${total[0].total == null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无记录！
		  </c:if>
      </div>
                
      <ul>
	       <c:forEach items="${page.result}" var="pc">
		        <li>
		          <p><span><b>${pc.VALUE }</b>元</span><fmt:formatDate value="${pc.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm" /></p>
		              ${pc.A_NAME }</li>
		        <li>
	       </c:forEach>
      </ul>
    </div>
  </div>
</div>
</body>
</html>
<script type="text/javascript">
	
	
	//我要推荐链接地址
	function recommend(){
		location.href="channelFyc";
	}
	
	   //返佣结算链接地址
	  function rebate(){
			location.href="rebateSum";
	  }
</script>