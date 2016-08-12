<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>安全验证 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
	  <style>
		 .email .spanText{margin-left: 50px;}
		  .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_01.png) no-repeat 8px center;  border-bottom: 2px solid #f27267;color:#383838;}
		  .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_2.png) no-repeat 8px center;}
		  .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_3.png) no-repeat 8px center;}
		 .spanText .sp4{background: url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}
	  </style>
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--账户安全-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
		<span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
		<span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a> </span>
        <i> > </i>
        <span>安全验证</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
				<h3 style="width: 964px;height: 50px;line-height: 50px;background: #fff;padding-left: 30px;border-left: 6px solid #f27267;margin-bottom: 10px;">账户安全</h3>
            	<c:if test="${vt=='1' }">
            	<div class="email">
        			<div class="xiuPhone1-top">
            			<div class="spanText">
                			<span class="sp1 active">身份验证</span>
							<i></i>
                    		<span class="sp2">输入邮箱</span>
							<i></i>
                    		<span class="sp3">发送邮件</span>
							<i></i>
                    		<span class="sp4">完成</span>
                		</div>
					</div>
            	</c:if>

            	<c:if test="${vt=='2' }">
            	<div class="xiuPhone1">
        			<div class="xiuPhone1-top">
        				<div class="spanText">
            				<!--<span class="sp1 active">身份验证</span>
                    		<span class="sp2">修改手机</span>
                    		<span class="sp3">完成</span>-->
							<span class="sp1 active">身份验证</span>
							<i></i>
							<span class="sp2">输入新手机号</span>
							<i></i>
							<span class="sp3">完成</span>
                		</div>
					</div>
            	</c:if>

            	<c:if test="${vt=='3' }">
            	<div class="xiuPass1">
        			<div class="xiuPass1-top">
        				<div class="spanText">
            				<span class="sp1 active">身份验证</span>
                    		<span class="sp2"><c:choose><c:when test="${not empty sessionUserCustomer.hjsUserBase.payPassword}">修改</c:when><c:otherwise>设置</c:otherwise></c:choose>支付密码</span>
                    		<span class="sp3">完成</span>
                    	</div>
					</div>
            	</c:if>

            <p class="p1"><i></i>为了你的帐号安全，请完成身份验证</p>
            <c:if test="${vt=='2' }">
            <p class="p2"><i></i>已验证手机：<span>${phoneShow }</span></p>
            </c:if>
            <form id="validateform" action="toActivate" method="post">
            	<input type="hidden" id="userId" name="userId" value="${userId}" />
            	<input type="hidden" id="smscode" name="smscode" value="" />
            	<input type="hidden" id="vt" name="vt" value="${vt}" />
                <div class="formVer">
                    <%--<span class="fz14">请填写手机校验码：</span>--%>
                    <input type="text" id="credit" name="credit" value="" validate="{required:true,messages:{required:'请输入手机验证码'}}" placeholder="手机验证码" />
                    <span>
                    <c:if test="${vt=='1' }">
                    <strong class="formVerBut fz14" id="getcode" style="cursor:pointer;" onclick="getSmscode(1);">获取验证码</strong>
                    </c:if>
                    <c:if test="${vt=='2' }">
                    <strong class="formVerBut fz14" id="getcode" style="cursor:pointer;" onclick="getSmscode(2);">获取验证码</strong>
                    </c:if>
                    <c:if test="${vt=='3' }">
                    <strong class="formVerBut fz14" id="getcode" style="cursor:pointer;" onclick="getSmscode(3);">获取验证码</strong>
                    </c:if>
                    <strong class="time fz13" id="regetcode"><i>120</i>秒</strong></span>
                    <i  style="display:none;padding-left:21px;">手机验证码不正确</i>
                </div>
                <div class="yanzheng pr">
                	<%--<span>验证码：</span>--%>
                    <input type="text" name="code" id="code" class="yzInput" placeholder="验证码" />
                	<img  id="codeImg" alt="点击更换" width="85" height="30" title="点击更换" src="" class="pa" />
                    <a href="javascript:void(0);" onclick="changeCode();" class="huan"></a>
                    <i  style="display:none;padding-left:21px;">验证码不正确</i>
                </div>
                <input id="subBtn" type="submit" value="下一步" class="backSub" />
            </form>

	</div>

	</div>
    </div>

</div>
<div class="clear"></div>
<script type="text/javascript">
$(document).ready(function(){
	$('.formVerBut').on("click",validateTimeOver);
	changeCode();
	$("#codeImg").bind("click", changeCode);
	/*登录验证模板*/
	$.metadata.setType("attr", "validate");
	$("#validateform").validate({
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
		if($("#validateform").valid()){		
			if(!vPhoneCode()){
				return false;
			}else if(!vCode()){
				changeCode();
				return false;
			}else{
				$("#validateform").submit();
			}		
		}
	}
});
		
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}
		//更换验证码
		function changeCode() {
			$("#codeImg").attr("src", "${project_name}/code?t=" + genTimestamp());
		}
		var InterValObj; //timer变量，控制时间  
		var count = 120; //间隔函数，1秒执行  
		var curCount;//当前剩余秒数  
		var code = ""; //验证码  
		var codeLength = 6;//验证码长度
		//得到手机验证码
		function getSmscode(v){
			
				curCount = count;
				var uid = $("#userId").val();
				var url = "${project_name}/smscode/emailcode";
				if(v==1){
					url = "${project_name}/smscode/emailcode";
				}else if(v==2){
					url = "${project_name}/smscode/phonecode";
				}else if(v==3){
					url = "${project_name}/smscode/namecode";
				}
				
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
			var u =$("#userId").val();
			var phone = $("#phone").val();
			var code = $("#credit").val();
			var vt =$("#vt").val();
			var tt = "email";
			if(vt==1){
				tt="email";
			}else if(vt==2){
				url = "${project_name}/smscode/phonecode";
				tt="phone"
			}else if(vt==3){
				tt="name";
			}
			var url = "${project_name}/vphonecode?u="+u+"&t="+tt+"&ph="+phone+"&co="+code;
			var ref=true;
			$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       async:false,  
			       success: function(data){
			    	   if(data=="error"){
			    		    $("#credit").siblings('i').html("<font color=red>手机验证码不正确</font>");
							$("#credit").siblings('i').show();
							ref=false;
						}else{
							$("#credit").siblings('i').hide();
							ref=true;
						}
			       } 
				});
			return ref;
		}
		//验证图片验证码
		function vCode(){
			var code = $("#code").val();
			var url = "${project_name}/vcode?code="+code;
			var ref=true;
			if(code ==""){
				$("#code").siblings('i').html("<font color=red>请输入验证码</font>");
				$("#code").siblings('i').show();
				ref=false;
			}else{
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       cache:false, 
				       async:false,  
				       success: function(data){
				    	   if(data=="error"){
				    		   $("#code").siblings('i').html("<font color=red>验证码不正确</font>");
								$("#code").siblings('i').show();
								ref=false;
							}else{
								$("#code").siblings('i').hide();
								ref=true;
							}
				       } 
					});
			}		
			return ref;
		}
</script>
<!--账户安全 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>



</body> 
</html>