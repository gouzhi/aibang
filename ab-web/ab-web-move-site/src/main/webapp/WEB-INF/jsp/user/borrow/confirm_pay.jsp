<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
		<script src="${css_imagedomain}/front/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
	</head>
	<body>
	<form id="form" action="pay" method="post" target="_blank">
	<div class="wapOutside">
		<div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
			<h1>支付确认</h1>
		</div>
		<div class="actualPay"><span>实际支付金额：</span><c:if test="${not empty actBonusUsers}"><c:choose><c:when test="${account-actBonusUsers.value<0}">0.00</c:when><c:otherwise>${account-actBonusUsers.value}</c:otherwise></c:choose></c:if><c:if test="${empty actBonusUsers}"><fmt:formatNumber value="${account}" pattern="#.00#"/></c:if>元</div>
		<div class="confirmCon">
			<div class="payBalance">
				<p class="pBor">
					<label>可用余额：</label>
					${userBase.avlBalance}元</p>
				<p class="pBor">
					<label>活动奖励：</label>
					<span class="num1">${actBonusUsersSize}张可用</span><c:choose><c:when test="${not empty actBonusUsers}"><span class="noUse" onclick="selActBonusUsers()">已抵用<fmt:formatNumber value="${actBonusUsers.value}" pattern="#"></fmt:formatNumber>元<span class="arrowRight"></span></span></c:when><c:otherwise><span class="noUse" onclick="selActBonusUsers()">未使用<span class="arrowRight"></span></span></c:otherwise></c:choose></p>
				<p>
					<label>投资金额：</label>
					<fmt:formatNumber value="${account}" pattern="#.00#"/>元</p>
				<c:if test="${not empty actBonusUsers}">
				<p>
					<label>奖励抵扣：</label>
					-<fmt:formatNumber value="${actBonusUsers.value}" pattern="#"></fmt:formatNumber>元</p>
				<p>
				<p>
					<label>支付金额：</label>
					<c:choose><c:when test="${account-actBonusUsers.value<0}">0.00</c:when><c:otherwise>${account-actBonusUsers.value}</c:otherwise></c:choose>
						元</p>
				</c:if>
				<input type="hidden" name="account" value="${account}">
				<input type="hidden" name="borrowId" value="${borrowId}">
				<input type="hidden" name="payaccount" id="payaccount">
				<input type="hidden" name="bonusUserId" id="bonusUserId" value="${actBonusUsers.id}">
				<div class="regInput landYz">
					<input name="vcode" type="text" placeholder="请输入验证码" />
					<img src="" id="codeImg" alt="点击更换" title="点击更换" /></div>
			</div>
			<div class="mobile_sub pLR9"> <a href="javascript:void(0)" id="subBtn">确认支付</a></div>

		</div>
	</div>
	</form>
	</body>
</html>
<script>
	$(function(){
		changeCode();
		$("#codeImg").bind("click", changeCode);
	});
	function changeCode() {
		$("#codeImg").attr("src", "${project_name}/code.do?t=" + genTimestamp());
	}
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
	function selActBonusUsers(){
		window.location.href="${project_name}/user/investment/payReward?userBaseId=${userBase.id}";
	}
	$(function(){
		/*登录验证模板*/
		$.metadata.setType("attr", "validate");
		$("#form").validate({
			onfocusout:false,
			onclick:false,
			onkeyup:false,
			errorElement: "em",//用来创建错误提示信息标签(可自定义)
			submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
				form.submit();   //提交表单
			},
			errorContainer: $("#warning, #summary"),
			errorPlacement: function(error, element) {
				error.appendTo(element.parent());
			}
		});
		//点击提交按钮
		document.getElementById("subBtn").onclick = function(){
			if($("#form").valid()){
				$("#form").submit();
				//window.location.reload();
//				document.getElementById('afterPay').style.display='block';
//				document.getElementById('RechargeMask').style.display='block';
			}
		}
	});
</script>