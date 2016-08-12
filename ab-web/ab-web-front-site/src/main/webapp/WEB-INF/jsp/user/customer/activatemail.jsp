<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>邮箱验证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
      <style>
          .spanText{ margin-left: 56px;}
          .xiuPhone1-top{margin-bottom: 110px;}
          .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
          .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_02.png) no-repeat 8px center; border-bottom: 2px solid #f27267;color:#383838;}
          .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_3.png) no-repeat 8px center;}
          .spanText .sp4{background: url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}
          #email{width:298px;height:42px;line-height:42px;font-size:16px;color:#383838;border-radius:4px;border:1px solid #d2d2d2;margin-left:298px;text-indent:52px;background: url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px -204px;}
          .formVer input{margin-bottom: 14px;}
          #subBtn{}
      </style>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--邮箱验证-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/center/accountall" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">邮箱验证</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="email2">
        	<div class="xiuPhone1-top">
            	
            	 <div class="spanText">
                	<span class="sp1">身份验证</span>
                     <i></i>
                    <span class="sp2 active">输入邮箱</span>
                     <i></i>
                    <span class="sp3">发送邮件</span>
                     <i></i>
                    <span class="sp4">完成</span>
                </div>
               
            </div>
    		<form id="emailForm" name="emailForm" action="sendEmail" method="post">         	
            	<input type="text" name="email" id="email" placeholder="请输入有效邮箱地址" class="emailAdd" validate="{required:true,isEmail:true,messages:{required:'请输入有效邮箱地址',isEmail:'请输入有效邮箱地址'}}" />
                <span style="margin:0;padding:0;"  id="err"></span>
                <input id="subBtn" type="button" value="发送验证邮件" class="rzSub" />
            </form>
        </div>
		
    
    </div>

</div>
<script type="text/javascript">
$(document).ready(function(){
	/*邮箱验证*/
	$.metadata.setType("attr", "validate");
	$("#emailForm").validate({
		onfocusout:false,
		onclick:false,
		onkeyup:false,
		errorElement: "em",//用来创建错误提示信息标签(可自定义)
		errorContainer: $("#warning, #summary"),
		errorPlacement: function(error, element) {
			error.appendTo(document.getElementById("err")); 
		}
	});
	//点击提交按钮
	document.getElementById("subBtn").onclick = function(){
		if($("#emailForm").valid()){			
			$("#emailForm").submit();			
		}
	}
});
</script>
<!--邮箱验证 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>