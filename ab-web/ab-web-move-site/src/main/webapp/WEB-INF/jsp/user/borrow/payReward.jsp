<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
	</head>
	<body>
	<div class="wapOutside">
		<div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
			<h1>使用奖励</h1>
		</div>
		<div class="rewardMenu"><a href="javascript:void(0);" class="on">可用奖励（${actBonusUsersSize}）</a><a href="javascript:void(0);">不可用奖励（0）</a></div>
		<div class="rewardsBg">
			<div class="canReward">
				<c:forEach items="${typeList }" var="item">
				<ul>
					<li><a href="confirmPay.do?actBonusId=${item.ID}">
						<p><c:choose><c:when test="${item.TYPE==1 }">可支付购买产品</c:when><c:when test="${item.TYPE==2}">可直接提现或支付购买产品</c:when></c:choose></p>
						<p class="name1"><c:choose><c:when test="${item.TYPE==1 }">现金券</c:when><c:when test="${item.TYPE==2}">返佣红包</c:when></c:choose></p>
						<p>有效期：<fmt:formatDate value="${item.EXPIRE_TIME }" pattern="yyyy-MM-dd"/></p>
						<div class="moneys"><span>￥</span><fmt:formatNumber value="${item.VALUE }" pattern="#"></fmt:formatNumber></div></a>
					</li>
				</ul>
				</c:forEach>
			</div>
			<div class="noReward" style="display:none;">
				<ul>
					没有查到符合条件的数据
				</ul>
				<%--<ul>
					<li>
						<p>可用于购买理财投资</p>
						<p class="name1">现金券</p>
						<p>有效期：2015/06/15-2015/06/20</p>
						<div class="moneys"><span>￥</span>800</div>
					</li>
				</ul>
				<ul>
					<li>
						<p>可用于购买理财投资</p>
						<p class="name1">现金券</p>
						<p>有效期：2015/06/15-2015/06/20</p>
						<div class="moneys"><span>￥</span>800</div>
					</li>
				</ul>--%>
			</div>
		</div>
		</div>
	</body>
</html>