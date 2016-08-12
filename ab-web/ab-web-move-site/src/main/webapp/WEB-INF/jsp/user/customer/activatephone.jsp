<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
<div class="wapOutside whithBg">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>修改手机号</h1>
  </div>
  <form id="phoneForm" name="phoneForm" action="editPhone" method="post">
  <input type="hidden" id="id" name="id" value="${sessionUser.id}" />
  <input type="hidden" id="oldPhone"  value="${sessionUser.phone}" />
  <div class="pLR16 newTelPT">
    <div class="regInput inputW1">
      <label>新手机号</label>
      <input type="text" value="" name="phone" id="phone" maxlength="11" placeholder="请输入您的手机号" " />
    </div>
    <div class="regInput mailValInput1">
      <label>手机验证码</label>
      <input name="code" type="text" placeholder="请输入手机验证码" id="phonecode"  />
    </div>
    <div class="regYzm"> <span id="code_btn" style="cursor:pointer;" onclick="getSmscode();">获取验证码</span> <span id="regetcode" class="time"><i>60</i>秒后重发</span><br />
      <input type="hidden" id="smscode" name="smscode" value="" />
      <input type="hidden" id="phoneStatus" name="phoneStatus" value="1" />
      <b style="display:none;">请输入验证码</b> </div>
  </div>
  </form>
  <div class="mobile_sub pLR16"> <a id="subBtn" href="javascript:void(0)">确认</a></div>
  <div class="floatAll disNone">
    <div class="firstCon">
      <div class="tt" id="errorMsg" >认证邮件已发送</div>
    </div>
    <div class="btn">知道了</div>
  </div>
  <div class="floatBBg1"></div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#phone').focus(function(){
		if($(this).val().length==0){
			$(this).parent().addClass('errorInput');			
		}else if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#phone').val('').attr('placeholder','请输入有效的手机号');
		})
	});
	$('#phone').blur(function(){
		if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}else{
			$(this).parent().removeClass('errorInput');
			$(this).val('').attr('placeholder','请输入有效的手机号');
		}
	});
	
	$('#phonecode').focus(function(){
		if($(this).val().length==0){
			$(this).parent().addClass('errorInput');			
		}else if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#phonecode').val('').attr('placeholder','请输入手机验证码');
		})
	});
	$('#phonecode').blur(function(){
		if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}else{
			$(this).parent().removeClass('errorInput');
			$(this).val('').attr('placeholder','请输入手机验证码');
		}
	});
	
	
	//点击提交按钮
	document.getElementById("subBtn").onclick = function(){
		if(validatePhone()&&vPhoneCode()){
			$("#phoneForm").submit();
		}else{
			return false;
		}
	}
});
//判断手机号是否已存在
function hasP(){
	var phone = $("#phone").val();
	var id = $("#id").val();
	var url = "${project_name}/hasP.do?phone="+phone+"&id="+id;
	var ref=true;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
	    		   $("#errorMsg").html("手机号已被注册");
	    		   floatAlter();
					ref=false;
				}else{
					ref=true;
				}
	       } 
		});
	return ref;
}
//获取验证码前验证手机是否正确
function validatePhone(){
	var phone = $("#phone").val();
	if(phone==""){
		$("#errorMsg").html("请输入手机号");
		floatAlter();
		return false;
	}
	var length = phone.length;
	if(!( length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(phone))){
		$("#errorMsg").html("请输入正确手机号");
		floatAlter();
		return false;
	}		
	var oldPhone = $("#oldPhone").val();
	if(oldPhone==phone){
		$("#errorMsg").html("该手机号已绑定");
		floatAlter();
		return false;
	}
	return true;
}

//得到手机验证码
function getSmscode(){
	if(validatePhone()&&hasP()){
		var phone = $("#phone").val();
		var url = "${project_name}/smscode/newphonecode";
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false,
		       async:false,
		       dataType: "text",
		       data:"phone="+phone,
			});
	}
}

//验证手机验证码
function vPhoneCode(){
	var phone = $("#phone").val();
	var code = $("#phonecode").val();
	if(code ==""){
		$("#errorMsg").html("请输入手机验证码");
		floatAlter();
		return false;
	}
	var url = "${project_name}/smscode/vphonecode?t=phone&ph="+phone+"&co="+code;
	var ref=true;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
	    		   $("#errorMsg").html("手机验证码不正确");
	    		   floatAlter();
					ref=false;
				}else{
					ref=true;
				}
	       } 
		});
	return ref;
}
/* 出现浮层 */
function floatAlter(){
	$('.floatAll').removeClass('disNone');
	$('.floatBBg1').css('display','block');
}
</script>
</html>