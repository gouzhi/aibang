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
        <h3>投资申请未提交！</h3>
        <div class="fore-line">
            <p>您的投资申请未提交，可以点击“其他投资”继续投资，或进入我的账户</p>
        </div>
        <div class="finishBut">
            <a href="${project_name}/user/center/accountall.do">我的账户</a>
            <a href="${project_name}/borrow/list.do">其他投资项目</a>
        </div>
    </div>
</div>
<!--完成主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>

</html>