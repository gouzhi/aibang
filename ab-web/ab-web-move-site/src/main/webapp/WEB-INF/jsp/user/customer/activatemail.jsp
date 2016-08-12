<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
<div class="wapOutside whithBg">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>输入邮箱</h1>
  </div>
  <form id="emailForm" name="emailForm" action="sendEmail" method="post">   
  <div class="pLR16">
    <div class="regInput entryEamilM">
      <label>邮箱地址</label>
      <input name="email"  id="email" type="text" placeholder="请输入有效的邮箱地址"   />
      <span class="glyphicon-remove-sign"></span>
    </div>
  </div>
  </form>
  <div class="mobile_sub pLR16"> <a id="subBtn" href="javascript:void(0)">点击发送认证邮件</a></div>
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
	
	$('#email').focus(function(){
		if($(this).val().length==0){
			$(this).parent().addClass('errorInput');			
		}else if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#email').val('').attr('placeholder','请输入有效的邮箱');
		})
	});
	$('#email').blur(function(){
		if($(this).val().length!=0){
			$(this).parent().removeClass('errorInput');
		}else{
			$(this).parent().removeClass('errorInput');
			$(this).val('').attr('placeholder','请输入有效的邮箱');
		}
	});
	
	/*点击提交按钮*/
	document.getElementById("subBtn").onclick = function(){
		if(validEmail()&&asyncValidEmail()){			
			$("#emailForm").submit();			
		}
	}
});

/*验证邮箱格式*/
function validEmail(){
	var emailValue = $('#email').val();
	if(emailValue==''){
		$("#errorMsg").html("请输入邮箱地址!");
		floatAlter();
	   	return false;
	}
	var emailRegex = /^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/g; 
	if(!emailRegex.test(emailValue)){
		$("#errorMsg").html("请输入有效的邮箱地址!");
		floatAlter();
	   	return false;
	}else{
		return true;
	}
}
function asyncValidEmail(){
	var url = "${project_name}/user/customer/validEmail?email="+$('#email').val();
	var ref=false;
	$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false, 
	       async:false,  
	       dataType:"json",
	       success: function(data){
	    	   var code = data.code;//0是成功，1是失败
	    	   if(code=="1"){
	    		   $("#errorMsg").html(data.msg);
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