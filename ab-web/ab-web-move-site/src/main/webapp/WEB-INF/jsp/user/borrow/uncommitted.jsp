<%@ page language="java"  pageEncoding="UTF-8"%>
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
        <h1>完成</h1>
    </div>
    <div class="pLR9">
        <div class="regInputOk">
            <p class="glyphicon-ok-circle">投资申请未提交</p>
            <p>您的投资申请未提交，可以点击“其他投资”继续投资，或进入我的账户</p>
        </div>

        <div class="appComBtn">
            <div class="btnYellowB"> <a href="${project_name}/user/center/accountall.do">我的帐户</a></div>
            <div class="btnBlueB"> <a href="${project_name}/borrow/list.do">其他投资项目</a></div>
        </div>
    </div>
</div>
</body>

</html>