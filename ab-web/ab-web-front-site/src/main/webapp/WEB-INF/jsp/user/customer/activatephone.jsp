<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>修改手机 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
	  <style>
		  .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
		  .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_02.png) no-repeat 8px center;  color:#383838;border-bottom: 2px solid #f27267;}
		  .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_3.png) no-repeat 8px center;}
		  .formVer input{margin-bottom: 14px;}
		  #subBtn{width:300px;line-height:24px;margin: 0 0 220px 324px; background: #f27267;font-size: 24px;color:#fff;}
	  </style>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改手机-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">修改手机</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="xiuPhone1">
        	<div class="xiuPhone1-top">
            	 <div class="spanText">
					 <span class="sp1">身份验证</span>
					 <i></i>
					 <span class="sp2 active">输入新手机号</span>
					 <i></i>
					 <span class="sp3">完成</span>
                </div>
            </div>
            <form id="phoneForm" name="phoneForm" action="editPhone" method="post">
                <input type="hidden" id="id" name="id" value="${sessionUser.id}" />
                <input type="hidden" id="smscode" name="smscode" value="" />

                 <div class="formVer" style="margin-top:90px;">
                    <input id="phone" name="phone" type="text" placeholder="手机号码" class="phoneText" validate="{required:true,isMobile:true,messages:{required:'请输入手机号',isMobile:'请输入有效手机号码'}}" />
					 <span style="margin:0;padding:0;"  id="err"></span>
                    <br />

                    <input id="code" name="code" type="text" value="" placeholder="验证码" />
                    <span><strong class="formVerBut fz14" id="getcode" style="cursor:pointer;" onclick="getSmscode();">获取验证码</strong>
                    <strong class="time fz13" id="regetcode"><i>120</i>秒</strong></span>
                    <i style="display:none;padding-left:21px;">手机验证码不正确</i>                   
                </div>
                <input id="subBtn" type="button" value="下一步" class="backSub" />            
            </form>
        </div>
		
    
    </div>

</div>
<script type="text/javascript">
$(document).ready(function(){
	//$('.formVerBut').on("click",validateTimeOver);
	/*手机验证*/
	$.metadata.setType("attr", "validate");
	$("#phoneForm").validate({
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
		if(!$("#phoneForm").valid()){			
			return false;		
		}else if(!hasP()){
			return false;
		}else if(!vPhoneCode()){
			return false;	
		}else{
			$("#phoneForm").submit();
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
					alert("手机号已被注册");
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
		alert("请输入手机号");
		$("#phone").focus();
		return false;
	}
	var length = phone.length;
	if(length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(phone)){				
		return true;
	}else{
		alert("请输入正确手机号");
		$("#phone").focus();
		return false;
	}		
}
var InterValObj; //timer变量，控制时间  
var count = 120; //间隔函数，1秒执行  
var curCount;//当前剩余秒数  
var code = ""; //验证码  
var codeLength = 6;//验证码长度
//得到手机验证码
function getSmscode(){
	if(validatePhone()&&hasP()){
		curCount = count;
		var phone = $("#phone").val();
		var url = "${project_name}/smscode/newphonecode";
		$("#getcode").hide();
		$("#regetcode").show();
		$("#regetcode").html(curCount+"秒");
		InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false,
		       async:false,
		       dataType: "text",
		       data:"phone="+phone,
		       success: function(data){
		    	   if(data===0){
						alert("发送失败");
						window.clearInterval(InterValObj);// 停止计时器
						$("#regetcode").hide();
						$("#getcode").show();
						return false;
					}else{
						$("#smscode").val(data);
					}
		       } 
			});
	}else{
		return false;
	}
}
//timer处理函数  
function SetRemainTime() {
    if (curCount == 0) {                  
        window.clearInterval(InterValObj);// 停止计时器    
        $("#regetcode").hide();
		$("#getcode").show();    
    }else {  
        curCount--;  
        $("#regetcode").html(curCount+"秒");
    }  
}

//验证手机验证码
function vPhoneCode(){
	var phone = $("#phone").val();
	var code = $("#code").val();
	if(code != null && code != ""){
		var url = "${project_name}/vphonecode?t=phone&ph="+phone+"&co="+code;
		var ref=true;
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false,  
		       success: function(data){
		    	   if(data=="error"){
		    		   $("#code").siblings('i').html("<font color=red>手机验证码不正确</font>");
						$("#code").siblings('i').show();
						ref=false;
					}else{
						$("#code").siblings('i').hide();
						ref=true;
					}
		       } 
			});
		return ref;
	}else{
		$("#code").siblings('i').html("<font color=red>请输入验证码</font>");
		$("#code").siblings('i').show();
	}	
}
</script>
<!--修改手机 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>