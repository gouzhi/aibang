<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>绑定银行 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <script>
$(function(){
	$('.Close').click(function(){
		$('.maskName').css('display','none');	
		$('.boxName').css('display','none');	
	});
});
</script>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改密码-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">汇付账户</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
        <h3 class="titH">账户安全</h3>
		<div class="replace">
            <div class="replaceW">
                <p><span class="tit">持卡人姓名：</span><span>${realName }</span></p>
                <p><span class="tit">持卡人身份证号：</span><span>${cardId }</span></p>
                <p><span class="tit">托管方：</span><span>汇付天下</span></p>
                <p><span class="tit">托管方账户名：</span><span>${hfId }</span></p>
            </div>
            <a href="${project_name}/user/customer/toSafe" style="">返回</a>
            <a target="_blank" href="loginHF" style="margin:0px 0 0 5px;background:#f27267;">登录汇付天下</a>

        </div>
    </div>
</div>
<!--修改密码 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>