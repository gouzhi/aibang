<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>绑定银行 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
    <script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
  </head> 
<body>
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>查看汇付天下</h1>
  </div>
  <div class="checkCon">
    <p>
      <label>持卡人姓名</label>${realName }
    </p>
    <p>
      <label>持卡人身份证号</label>
      	${cardId }
    </p>
    <p>
      <label>托管方</label>
      	汇付天下
    </p>
    <p>
      <label>托管账户名</label>
      		${hfId }
    </p>
  </div>
  <div class="mobile_sub pLR16"> <a href="loginHF">登录汇付天下</a></div>
</div>
</body> 
</html>