<%@ page language="java"  pageEncoding="UTF-8"%>
<form id="regForm" name="regForm" action="" method="post">
    <input type="hidden" id="passwordLevel" name="passwordLevel" value="" />
    <div id="zhuce" class="zhuce">
      <div>
        <input type="text" value="" name="phone" id="phone" maxlength="11" placeholder="请输入手机号" validate="{required:true,isMobile:true,messages:{required:'请正确输入手机号'}}"  />
        <br />
        <b style="display:none;">手机号已被注册</b>
      </div>
      <div class="phone_yz">
      	<input type="hidden" id="smscode" name="smscode" value="" />
        <input type="hidden" id="phoneStatus" name="phoneStatus" value="1" />
        <input name="phonecode" type="text" placeholder="请输入您的手机验证码" id="xy" validate="{required:true,messages:{required:'请输入手机验证码'}}" />
        <span id="code_btn" style="cursor:pointer;" onclick="getSmscode();">获取验证码</span> <span id="regetcode" class="time"><i>60</i>秒后重发</span><br />
        <b>请输入验证码</b> </div>
      <div>
        <input type="password" placeholder="请设置您的登录密码" id="password" name="password" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'6~32位字符，至少包含字母、数字和符号的两种以上组合'}}"  />
        <br />
        <b>6-32位字符，最佳为英文、数字、符号组合</b> </div>
      <div>
        <input id="invitecode" name="invitecode" type="text" value="${inviteCode}" placeholder="邀请码或实惠码（非必填）" />
      </div>
      <div>
        <input type="button" value="立即注册" onclick="onsub();" id="mobile_sub" />
      </div>
    </div>
  </form>
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <style type="text/css">
  em.error {
  	color:#333;
	font-style:normal;
	font-size: 1.2rem;
	margin-top: 0.3rem;
    padding-left: 0.5rem;
    font-weight:bold;
}
  </style>
  <script type="text/javascript">
  $(document).ready(function(){
	  /*登录验证模板*/
		$.metadata.setType("attr", "validate");
		$("#regForm").validate({
			onfocusout:false,
			onclick:false,
			onkeyup:false,
			errorElement: "em",//用来创建错误提示信息标签(可自定义)
			errorContainer: $("#warning, #summary"),
			errorPlacement: function(error, element) {
				error.appendTo(element.parent()); 
			}
		});
		document.getElementById("phone").onblur = function(){
			$("#phone").valid();
		}
		document.getElementById("xy").onblur = function(){
			$("#xy").valid();
		}
		document.getElementById("password").onblur = function(){
			$("#password").valid();
		}
		//点击提交按钮
		document.getElementById("mobile_sub").onclick = function(){
			if($("#regForm").valid()){
				if(!hasU()){
					return false;	
				}else if(!hasP()){
					return false;
				}else{
					toReg();
				}			
			}
		}
	  
	});
  	function toReg(){
  		var url = "http://${web_name}${web_domain}${project_name}/regAct";  		
  		$.ajax({ 
		   type: "post", 
	       url: url, 
	       cache:false,
	       data:$('#regForm').serialize(),
	       async:false,
	       dataType:"json",
	       success: function(data){
	    	   data = eval("json="+data);
	    	   if(data.state=="1"){	    		   
					alert(data.msg);
					return false;
				}else{					
					top.location.href= "http://${web_name}${web_domain}${project_name}/regSuccess?code="+data.msg;
				}
	       } 
		});
  	}
	//判断用户名是否已存在
	function hasU(){
		var USERNAME = $("#phone").val();
		var ref = true;
		if(USERNAME!=""){
			var url = "http://${web_name}${web_domain}${project_name}/hasU.do?username="+USERNAME;
			$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false,
		       success: function(data){
		    	   if(data=="error"){
						$("#phone").siblings('b').html("<font color=red>手机号已被注册</font>");
						$("#phone").siblings('b').show();
						ref=false;
					}else{
						$("#phone").siblings('b').hide();
						ref=true;
					}
		       } 
			});
		}
		
		return ref;
	}
	//判断手机号是否已存在
	function hasP(){
		var phone = $("#phone").val();
		var url = "http://${web_name}${web_domain}${project_name}/hasP.do?phone="+phone;
		var ref=true;
		if(phone!=""){
			$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       async:false,
			       success: function(data){	   
			    	   if(data=="error"){
			    		   $("#phone").siblings('b').html("<font color=red>手机号已被注册</font>");
							$("#phone").siblings('b').show();
							ref=false;
						}else{
							$("#phone").siblings('b').hide();
							ref=true;
						}
			       } 
				});
		}
		
		return ref;
	}
	//获取验证码前验证手机是否正确
	function validatePhone(){
		return $("#phone").valid();			
	}
	
	//判断输入密码的类型  
	function CharMode(iN){  
	if (iN>=48 && iN <=57) //数字  
	return 1;  
	if (iN>=65 && iN <=90) //大写  
	return 2;  
	if (iN>=97 && iN <=122) //小写  
	return 4;  
	else  
	return 8;   
	}  
	//bitTotal函数  
	//计算密码模式  
	function bitTotal(num){  
	modes=0;  
	for (i=0;i<4;i++){  
	if (num & 1) modes++;  
	num>>>=1;  
	}  
	return modes;  
	}  
	//返回强度级别  
	function checkStrong(sPW){  
	if (sPW.length<=4)  
	return 0; //密码太短  
	Modes=0;  
	for (i=0;i<sPW.length;i++){  
	//密码模式  
	Modes|=CharMode(sPW.charCodeAt(i));  
	}  
	return bitTotal(Modes);  
	}  
	  
	//显示颜色  
	function pwStrength(pwd){   
	if (pwd==null||pwd==''){    
	}else{  
		S_level=checkStrong(pwd);  
		document.getElementById("passwordLevel").value=S_level;
	}   
	return;  
	}
	
	var InterValObj; //timer变量，控制时间  
	var count = 60; //间隔函数，1秒执行  
	var curCount;//当前剩余秒数  
	var code = ""; //验证码  
	var codeLength = 6;//验证码长度
	//得到手机验证码
	function getSmscode(){
		if(validatePhone()&&hasP()){
			curCount = count;
			var phone = $("#phone").val();
			var url = "http://${web_name}${web_domain}${project_name}/smscode/regist";
			var code = $("#code").val();
			$("#code_btn").hide();
			$("#regetcode").show();
			$("#regetcode").html(curCount+"秒后重发");
			InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
			$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false,
			       data:"phone="+phone+"&code="+code,
			       success: function(data){
			    	   if(data===0){
							alert("发送失败");
							window.clearInterval(InterValObj);// 停止计时器
							$("#regetcode").hide();
							$("#code_btn").show();
							return false;
						}else if(data==-1){
							alert("验证码不正确");
							window.clearInterval(InterValObj);// 停止计时器
							$("#regetcode").hide();
							$("#code_btn").show();
							return false;
						}
			       } 
				});
		}else{
			$("#regetcode").hide();
			$("#code_btn").show();
		}
	}
	//timer处理函数  
	function SetRemainTime() {
	    if (curCount == 0) {                  
	        window.clearInterval(InterValObj);// 停止计时器    
	        $("#regetcode").hide();
			$("#code_btn").show();    
	    }else {  
	        curCount--;  
	        $("#regetcode").html(curCount+"秒后重发");  
	    }  
	}  
  
  </script>