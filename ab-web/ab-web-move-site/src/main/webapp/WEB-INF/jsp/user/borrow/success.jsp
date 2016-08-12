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

	<div class="wapOutside whithBg">
		<div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
			<h1>支付完成</h1>
		</div>
		<div class="appComCon">
			<p class="appComImg"><img src="${css_imagedomain}/move/images/okCircle.png" /></p>
			<p class="appComSm">投资申请已提交</p>
			<p class="con pLR16">您申请投资的资金已经冻结，如投资成功我们将以短信通知您！
				如投资失败，该笔投资将返还到您的支付账户里。</p>
		</div>
		<div class="appComBtn">
			<div class="btnYellowB"> <a href="${project_name}/user/center/accountall.do">我的帐户</a></div>
			<div class="btnBlueB"> <a href="${project_name}/borrow/list.do">其它投资</a></div>
		</div>
	</div>
	</body>
</html>