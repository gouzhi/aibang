<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>安全验证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/retrieve.css" rel="stylesheet" />
	  <link href="${css_imagedomain}/front/css/commen_new.css" rel="stylesheet" />
  <script src="${css_imagedomain}/front/js/enroll.js" type="text/jscript"></script>
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <style>
	  /*找回密码*/
	  .process{width:1100px;margin:0 auto 70px;border-bottom:1px solid #d2d2d2;height:66px;padding-top: 26px;}
	  .processSpan{height:64px;line-height:64px;margin-left:150px;}
	  .processSpan span{ display:inline-block;height:64px;line-height:64px;padding:0 10px 0 44px;font-size:20px;color:#ababab;}
	  .processSpan span.sp1{ background:url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
	  .processSpan span.sp2{ background:url(${css_imagedomain}/front/images/ico_02.png) no-repeat 8px center;border-bottom:2px solid #f27267;}
	  .processSpan span.sp3{ background:url(${css_imagedomain}/front/images/ico_3.png) no-repeat 8px center;}
	  .processSpan span.sp4{ background:url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}
	  .processSpan i{ display:inline-block;width:7px;height:12px; background:url(${css_imagedomain}/front/images/ico_next.png) no-repeat 0 center; margin:0 32px;}
	  .processSpan span.activeS{color:#494646;}
	  .ownRight{ padding-bottom: 90px;}
	  .backName input{background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px 6px;}

	  .dropInp .ico_b{left:8px;top:7px;width:31px;height:28px;background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 0px 0px;}
	  .formVer .ico_b{left:8px;top:7px;width:31px;height:28px;background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 0px -112px;}
	  .icp{font-size:14px;color:#9d9c9c;}
	  .icp:hover{color:#c2c2c2;}
  </style>
</head> 
 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--找回密码-->
<div class="ownContent">
	<div class="own">

        <div class="ownRight">

			<div class="process">
				<div class="processSpan">
					<span class="sp1">确认账号</span>
					<i></i>
					<span class="sp2 activeS">安全验证</span>
					<i></i>
					<span class="sp3">重置密码</span>
					<i></i>
					<span class="sp4">完成</span>
				</div>
			</div>
				<p style="font-size:16px;color:#494646;text-align:left;margin-left: 442px; margin-bottom:15px;">为了你的帐号安全，请完成身份验证</p>
            <div class="ver" style="margin: 0 0 14px 442px;">
                <%--<span style="font-size: 16px;color: #494646;">验证方式：</span>--%>
                <div class="dropInp pr">
                	<input id="validateType" name="validateType" type="text" placeholder="请输入验证方式" value="${phone }" />
					<b class="pa ico_b"></b>
                    <ul style="z-index: 2;">
                    	<c:if test="${not empty phone }">
                    		<li>手机号<i>${phone }</i></li>
                    	</c:if>
                        <c:if test="${not empty email }">                        
                        	<li>邮箱<i>${email }</i></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <form id="phoneForm" name="phoneForm" class="optionTab formOne" style="display:block;" action="phoneValidate" method="post">
            	<input id="userId" name="userId" type="hidden" value="${user.id }" />
            	<input type="hidden" id="smscode" name="smscode" value="" />
                <div class="formVer pr">
                    <%--<span class="fz14">请填写手机校验码：</span>--%>
                    <input id="code" name="code" type="text" value="" validate="{required:true,messages:{required:'请输入验证码'}}" />
						<b class="pa ico_b"></b>
                    <span>
						<strong class="formVerBut fz14" id="getcode" style="cursor:pointer;" onclick="getSmscode();" >获取验证码</strong>
                    	<strong class="time fz14" id="regetcode"><i>120</i>秒</strong>
					</span>
                    <i  style="display:none;padding-left:120px;">手机验证码不正确</i>
                </div>
                <input id="subBtn" type="submit" value="下一步" class="backSub" />
            </form>
            <form class="optionTab formTwo" id="emailForm" name="emailForm" action="sendEmail" method="post">
            	<input id="userId" name="userId" type="hidden" value="${user.id }" />
                <input id="subBtn1" type="submit" value="发送验证邮件" class="setEmail" />
            </form>
        </div>
    </div>    	
</div>
<script type="text/javascript">			
		$(document).ready(function(){
			$('.formVerBut').on("click",validateTimeOver);
			/*帐号验证*/
			$.metadata.setType("attr", "validate");
			$("#phoneForm").validate({
				onfocusout:false,
				onclick:false,
				onkeyup:false,
				errorElement: "em",//用来创建错误提示信息标签(可自定义)
				errorContainer: $("#warning, #summary"),
				errorPlacement: function(error, element) {
					error.appendTo(element.parent()); 
				}
			});
			//点击提交按钮
			document.getElementById("subBtn").onclick = function(){
				if(!vPhoneCode()){
					return false;
				}else if($("#phoneForm").valid()){
					$("#phoneForm").submit();							
				}
			}
			/*帐号验证*/
			$.metadata.setType("attr", "validate");
			$("#emailForm").validate({
				onfocusout:false,
				onclick:false,
				onkeyup:false,
				errorElement: "em",//用来创建错误提示信息标签(可自定义)
				errorContainer: $("#warning, #summary"),
				errorPlacement: function(error, element) {
					error.appendTo(element.parent()); 
				}
			});
			//点击提交按钮
			document.getElementById("subBtn1").onclick = function(){
				if($("#emailForm").valid()){
					$("#emailForm").submit();							
				}
			}
		});
		
		var InterValObj; //timer变量，控制时间  
		var count = 120; //间隔函数，1秒执行  
		var curCount;//当前剩余秒数  
		var code = ""; //验证码  
		var codeLength = 6;//验证码长度
		//得到手机验证码
		function getSmscode(){
				curCount = count;
				var uid = $("#userId").val();
				var url = "${project_name}/smscode/passcode";
				$("#getcode").hide();
				$("#regetcode").show();
				$("#regetcode").html(curCount+"秒");
				InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       cache:false, 
				       dataType: "text",
				       data:"id="+uid,
				       success: function(data){
				    	   if(data===0){
								alert("发送失败");
								window.clearInterval(InterValObj);// 停止计时器
								$("#regetcode").hide();
								$("#getcode").show();
								return false;
							}else if(data==1){
								alert("每天最多可找回密码5次，您已经超出");
								window.clearInterval(InterValObj);// 停止计时器
								$("#regetcode").hide();
								$("#getcode").show();
								return false;
							}else{
								$("#smscode").val(data);
							}
				       } 
					});
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
			var u = $("#userId").val();
			var code = $("#code").val();
			var url = "${project_name}/vphonecode?u="+u+"&t=pass&co="+code;
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
		}
		</script>
<!--找回密码 End-->
<div style="width:100%; margin:0 auto;height: 50px;line-height: 50px;font-size:14px;color:#9d9c9c; background:#494646;">
	<p style="width:1200px;margin:0 auto; text-align:center;">Copyright@2016&nbsp;&nbsp;中创共赢（北京）投资有限公司&nbsp;&nbsp;备案号：<a href="#" class="icp">京ICP备16016103号-1</a> </p>
</div>
</body> 
</html>