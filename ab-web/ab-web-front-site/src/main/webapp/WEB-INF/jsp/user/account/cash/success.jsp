<%--
  Created by IntelliJ IDEA.
  User: zhaoyu
  Date: 2015/9/17
  Time: 12:44
  To change this template use File | Settings | File Templates.
  提现界面
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>提现 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--header Start-->
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--header End-->
<!--提现主体-->
<div class="accountContent clear">
  <div id="nav_point" class="icoPoint">
    <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
    <i> &gt; </i>
    <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金记录</a></span>
    <i> &gt; </i>
    <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金明细</a></span>
    <i> &gt; </i>
    <span>提现</span>
  </div>
  <%@ include file="/WEB-INF/jsp/common/left.jsp"%>
  <div class="account-Right fl">
    <div class="cash">
      <h3>提现</h3>
       <div class="account-Right fl">
		<div class="cash">
          <h3>提现</h3>
            <div class="cashOk">

            	<h4 class="fz16 color5 lineH48">提现申请已经提交，请等待银行处理！</h4>
                <p>
                	<a href="${project_name}/cash/main" class="colorAll">继续提现</a>
                    <a href="${project_name}/cash/list" class="colorAll">查看提现记录</a>
                    <a href="${project_name}//user/center/accountall" class="colorAll">返回账户总览</a>
                </p>
            </div>
        </div>
    </div>
       
        
      </div>
    </div>
  </div>

</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
<input type="hidden" value="${project_name}" id="projectName"/>
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
<script type="text/javascript" src="${css_imagedomain}/front/js/fund.js"></script>
<script type="text/javascript">
  /**
   * 页面验证 jquery validator
   */
  $(document).ready(function(){
	$('.formVerBut').on("click",validateTimeOver);
    $.metadata.setType("attr", "validate");
    $("#formcash").validate({
      onfocusout:true,
      onclick:false,
      onkeyup: function(element) { $(element).valid(); },
      errorElement: "em",//用来创建错误提示信息标签(可自定义)
      errorContainer: $("#warning, #summary"),
      errorPlacement: function(error, element) {
        error.appendTo(element.parent());
      }
    });
  });
</script>
</body>
</html>