<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
<title>完成 - 华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/sureComplete.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${css_imagedomain}/front/js/pullNav.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--完成主体-->
<div class="confirm">
	<div class="finish">
    	<img src="${css_imagedomain}/front/images/finish.png" width="450" height="50" />
        <h3>投资申请已提交</h3>
        <div class="fore-line">
       		<p>您所申请投资的资金已经冻结，如投资成功，我们将以短信通知您！</p> 
        	<p>如投资失败，该笔投资将返还到您华金所账户里。</p>
        </div>
        <div class="finishBut">
        	<a href="${project_name}/user/center/accountall">我的账户</a>
        	<a href="${project_name}/borrow/list">其他投资项目</a>
        </div>
    </div>
</div>
<!--完成主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>

</html>