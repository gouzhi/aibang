<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
<div class="wapOutside">
	<div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
		<h1>
			<c:if test="${vt=='1' }">
	    		验证邮箱
	       	</c:if>
	       	<c:if test="${vt=='2' }">
	       		修改手机号
	       	</c:if>
	       	<c:if test="${vt=='3' }">
	       	</c:if>
		</h1>
	</div>
	
  	<form id="validateform" action="toActivate" method="post">
  	
  	<input type="hidden" id="userId" name="userId" value="${userId}" />
   	<input type="hidden" id="smscode" name="smscode" value="" />
   	<input type="hidden" id="vt" name="vt" value="${vt}" />
   	
  	<div class="pLR16">
    	<p class="mailValFont1">为了你的帐号安全，请完成身份验证</p>
    	<p class="mailValFont2">已验证手机：${phoneShow }</p>
    	<div class="regInput mailValInput1">
	      	<label>手机验证码</label>
	      	<input name="credit" id="phoneCode" type="text" placeholder="请输入手机验证码"  />
    	</div>
	    <div class="regYzm"> 
	    	
	    	<c:if test="${vt=='1' }">
            <span id="code_btn" style="cursor:pointer;" onclick="getSmscode(1);">获取验证码</span>
            </c:if>
            <c:if test="${vt=='2' }">
            <span id="code_btn" style="cursor:pointer;" onclick="getSmscode(2);">获取验证码</span>
            </c:if>
            <c:if test="${vt=='3' }">
            <span id="code_btn" style="cursor:pointer;" onclick="getSmscode(3);">获取验证码</span>
            </c:if>
	    	<span class="time" id="regetcode"><i>60</i>秒后重发</span><br>
	    	
	      	<input type="hidden" value="1" name="phoneStatus" id="phoneStatus">
		    <b style="display:none;" id="smsError">请输入验证码</b> 
	    </div>
	    <div class="regInput mailValInput2">
	      <label>验证码</label>
	      <input name="code" id="code" type="text" placeholder="请输入验证码" />
	      <img id="codeImg"  /><span class="glyphicon-repeat"></span><br>
	    </div>
    	<div class="mobile_sub"> <a id="subBtn" href="javascript:void(0)">下一步</a></div>
  	</div>
  	<div class="floatAll disNone">
    <div class="firstCon">
      <div class="tt" id="errorMsg">请输入手机验证码</div>
    </div>
    <div class="btn">知道了</div>
  	</div>
  	<div class="floatBBg1"></div>
  	</form>
</div>

</body>
<script type="text/javascript">
$(document).ready(function(){
	
	/*更换验证码*/
	changeCode();
	$("#codeImg").bind("click", changeCode);
	
	$('#phoneCode').focus(function(){
		if($(this).val().length==0){
			$(this).parent().addClass('errorInput');			
		}else if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#phoneCode').val('').attr('placeholder','请输入有效的手机验证码');
		})
	});
	$('#phoneCode').blur(function(){
		if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}else{
			$(this).parent().removeClass('errorInput');
			$(this).val('').attr('placeholder','请输入有效的手机验证码');
		}
	});
	$('#code').focus(function(){
		if($(this).val().length==0){
			$(this).parent().addClass('errorInput');			
		}else if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#phoneCode').val('').attr('placeholder','请输入有效的图片验证码');
		})
	});
	$('#code').blur(function(){
		if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}else{
			$(this).parent().removeClass('errorInput');
			$(this).val('').attr('placeholder','请输入有效的图片验证码');
		}
	});
	
	document.getElementById("subBtn").onclick = function(){
		if(!vPhoneCode()){
			return false;
		}else if(!vCode()){
			return false;
		}else{
			$("#validateform").submit();
		}		
	}
});
		
/*更换验证码*/
function genTimestamp() {
	var time = new Date();
	return time.getTime();
}
function changeCode() {
	$("#codeImg").attr("src", "${project_name}/code?t=" + genTimestamp());
}

/*获取手机验证码*/
function getSmscode(v){
		var uid = $("#userId").val();
		var url = "${project_name}/smscode/emailcode";
		if(v==1){
			url = "${project_name}/smscode/emailcode";
		}else if(v==2){
			url = "${project_name}/smscode/phonecode";
		}else if(v==3){
			url = "${project_name}/smscode/namecode";
		}
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       dataType: "text",
		       data:"id="+uid,
		});
}

/*客户端校验*/
/*验证手机验证码*/
function vPhoneCode(){
	var u =$("#userId").val();
	var phoneCode = $("#phoneCode").val();
	if(phoneCode ==""){
		$("#errorMsg").html("请输入短信验证码!");
		floatAlter();
		return false;
	}
	var vt =$("#vt").val();
	var tt = "email";
	if(vt==1){
		tt="email";
	}else if(vt==2){
		tt="phone"
	}else if(vt==3){
		tt="name";
	}
	var url = "${project_name}/smscode/vphonecode?u="+u+"&t="+tt+"&co="+phoneCode;
	var ref=true;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
	    		   $("#errorMsg").html("手机验证码不正确!");
	    		   floatAlter();
	    		   ref=false;
				}else{
					ref=true;
				}
	       } 
		});
	return ref;
}
//验证图片验证码
function vCode(){
	var code = $("#code").val();
	var url = "${project_name}/code/vcode?code="+code;
	if(code ==""){
		$("#errorMsg").html("请输入验证码!");
		floatAlter();
		return false;
	}
	var ref=true;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       success: function(data){
	    	   if(data=="error"){
	    		    changeCode();
	    		    $("#errorMsg").html("图片验证码不正确!");
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