<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>实名认证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
  </head> 
<body>
<div class="wapOutside whithBg">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>开通汇付天下账户</h1>
  </div>
  <form id="nameForm" name="nameForm" action="toHF" method="post">
  <div class="pLR16 openAcPB">
    <p class="openAcTt">为了确保您的利益，请提交您的真实有效的身份证件信息，您所提交的信息，我们将同时在中国金融认证中心为您申请数字证书，以便您用于签署电子合同。</p>
    <div class="regInput inputW1">
      <label>真实姓名</label>
      <input type="text" id="realName" name="realName" value="" placeholder="请输入您的真实姓名" />
    </div>
    <div class="regInput inputW1">
      <label>身份证号</label>
      <input type="text" id="cardId" name="cardId" value="" placeholder="请输入您的身份证号" />
    </div>
  </div>
  </form>
  <div class="mobile_sub pLR16"> <a id="subBtn" href="javascript:void(0)">开通</a></div>
  
  <p class="comXieyi pLR16" style="padding-top:0.3rem;">
   <input type="checkbox" id="checkboxYes"  checked="checked" class="regular-checkbox" /><label for="checkboxYes"></label>
    我已阅读并同意<br /><br /><a href="${css_imagedomain}/move/contract/dzqz.html">《华金所电子合同和用户电子签章使用及服务协议》</a></p>
  
  <div class="floatAll disNone">
    <div class="firstCon">
      <div class="tt" id="errorMsg" >认证邮件已发送</div>
    </div>
    <div class="btn">知道了</div>
  </div>
  <div class="floatBBg1"></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#realName').focus(function(){
		if($(this).val().length==0){
			$(this).parent().addClass('errorInput');			
		}else if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#realName').val('').attr('placeholder','请输入您的真实姓名');
		})
	});
	$('#realName').blur(function(){
		if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}else{
			$(this).parent().removeClass('errorInput');
			$(this).val('').attr('placeholder','请输入您的真实姓名');
		}
	});
	
	
	$('#cardId').focus(function(){
		if($(this).val().length==0){
			$(this).parent().addClass('errorInput');			
		}else if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#cardId').val('').attr('placeholder','请输入您的身份证号');
		})
	});
	$('#cardId').blur(function(){
		if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}else{
			$(this).parent().removeClass('errorInput');
			$(this).val('').attr('placeholder','请输入您的身份证号');
		}
	});
	
	
	document.getElementById("subBtn").onclick = function(){
		if(checkName()&&checkCardId()&&chackContract()){
			$("#nameForm").submit();
		}else{
			return false;
		}
	}
});
function chackContract(){
	if($("#checkboxYes").is(":checked")){
		return true;
	}else{
		$("#errorMsg").html("请同意《华金所电子合同和用户电子签章使用及服务协议》");
		floatAlter();
		return false;
	}
}
function checkName(){
	var name = $("#realName").val();
	if(name ==""){
		$("#errorMsg").html("请输入您的真实姓名");
		floatAlter();
		return false;
	}
	return true;
}

//校验身份证号
function checkCardId(){
	var card = $("#cardId").val();
	if(card ==""){
		$("#errorMsg").html("请输入您的身份证号");
		floatAlter();
		return false;
	}
	if(!checkBirthday(card)){
		$("#errorMsg").html("该身份证持有者未满18岁");
		floatAlter();
		return false;
	}
	return true;
}

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

/* 出现浮层 */
function floatAlter(){
	$('.floatAll').removeClass('disNone');
	$('.floatBBg1').css('display','block');
}
</script>
</body> 
</html>