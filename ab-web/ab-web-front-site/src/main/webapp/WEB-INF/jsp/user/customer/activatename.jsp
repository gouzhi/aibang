<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>实名认证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <script src="${css_imagedomain}/common/js/jquery.tips.js"></script>
  <script>
$(function(){
	$('.Close').click(function(){
		$('.maskName').css('display','none');	
		$('.boxName').css('display','none');
		top.window.location.href="toSafe";
	});
});
</script>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--邮箱验证-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">开通汇付账户</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="open_hf">
            <h3>账户安全</h3>
        	<form id="nameForm" name="nameForm" action="toHF" method="post">
            	<p>为了确保您的利益，请提交您的真实有效的身份证件信息，您所提交的信息，我们将同时在中国金融认证中心为您申请数字证书，以便您用于签署电子合同。</p>
                <div class="hf_name hf pr">
                	<%--<span>姓名：</span>--%>
                    <i for="newPass" class="fz16 pa iejr"  style="left:10px;top:11px; margin:0;color:#999;">请输入姓名</i>
                    <input id="realName" name="realName" type="text" value="" validate="{required:true,messages:{required:'请输入真实姓名'}}" />
                </div>
                <%--<input id="realName" name="realName" type="hidden" value="" style="width:160px;"  />--%>
                <div class="hf_id hf pr">
                	<%--<span>身份证号：</span>--%>
                    <i for="newPass" class="fz16 pa iejr"  style="left:10px;top:11px; margin:0;color:#999;">身份证号</i>
                    <input id="cardId" name="cardId" type="text" value="" maxlength="18" validate="{required:true,isIdCardNo:true,messages:{required:'请输入有效身份证号',isIdCardNo:'请输入有效身份证号'}}" />
                	<bb id="err" style="display:none;color:red;padding-left:21px;" for="cardId" generated="true">该身份证持有者未满18岁</bb>
                </div>
                <div style="position: relative;left:-90px;top:0;">
                    <input id="fadada" type="checkbox" checked="checked" style="width: 24px;height: 14px;vertical-align: middle;"><span style="vertical-align: middle;">我已阅读并同意</span><a href="tofadadaAgreement" target="_Blank" style="display:inline-block;vertical-align: middle;color:#f27267;">《华金所电子合同和用户电子签章使用及服务协议》</a>
                </div>
                <a id="subBtn" href="javascript:void(0);" class="baoSub">立即开通汇付托管账户</a>
                <!-- <input id="subBtn" type="button" value="保存" class="baoSub" /> -->
            </form>
            <script>
                $(function(){
                    $('.hf input').val('');
                    $('.hf input').focus(function(){
                            $(this).prev('.iejr').hide();
                    });
                    $('.hf input').blur(function(){
                        if($(this).val()!=''){
                            $(this).prev('.iejr').hide();
                        }
                        else{
                            $(this).prev('.iejr').show();
                        };
                    });
                });

            </script>
        </div>
		
    
    </div>

</div>
<script type="text/javascript">
$(document).ready(function(){
	/*邮箱验证*/
	$.metadata.setType("attr", "validate");
	$("#nameForm").validate({
		onfocusout:false,
		onclick:false,
		onkeyup:false,
		errorElement: "em",//用来创建错误提示信息标签(可自定义)
		errorContainer: $("#warning, #summary"),
		errorPlacement: function(error, element) {
			error.appendTo(element.parent()); 
		}
	});
	//点击提交按钮<em class="error" for="cardId" generated="true">请输入有效身份证号</em>
	document.getElementById("subBtn").onclick = function(){
		var card = $("#cardId").val();
		$("#err").hide();
		if(!$("#nameForm").valid()){			
					
		}else if(!checkBirthday(card)){
			$("#err").show();
		}else if (!$("#fadada").is(':checked')) {
			$("#fadada").tips({
				side : 1,
				msg : '请阅读服务协议',
				bg : '#AE81FF',
				time : 3
			});

			$("#readAgreement").focus();
			return false;
		}else{
			$("#err").hide();
			$("#nameForm").submit();
		}
	}
});

//检查生日是否正确
function checkBirthday(card){
 var len = card.length;
 //身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
 if(len == '15'){ 
     var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
     var arr_data = card.match(re_fifteen);
     var year = arr_data[2];
     var month = arr_data[3];
     var day = arr_data[4];
     var birthday = new Date('19'+year+'/'+month+'/'+day);
     return verifyBirthday('19'+year,month,day,birthday);
 }
 //身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
 if(len == '18'){
     var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X|x)$/;
     var arr_data = card.match(re_eighteen);
     var year = arr_data[2];
     var month = arr_data[3];
     var day = arr_data[4];
     var birthday = new Date(year+'/'+month+'/'+day);
     return verifyBirthday(year,month,day,birthday);
 }
 return false;
}

//校验日期
function verifyBirthday(year,month,day,birthday){
 var now = new Date();
 var now_year = now.getFullYear();
 //年月日是否合理
 if(birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day)
 {
     //判断年份的范围（18岁到100岁之间)
     var time = now_year - year;
     if(time >= 18)
     {
         return true;
     }
     return false;
 }
 return false;
}
</script>
<!--邮箱验证 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>