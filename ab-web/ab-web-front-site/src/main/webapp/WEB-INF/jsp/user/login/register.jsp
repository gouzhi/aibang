<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>会员注册 - 华金所</title>
	<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
	<link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
	<link href="${css_imagedomain}/front/css/zhuce.css" rel="stylesheet" type="text/css" />
	<!-- 表单验证 -->
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
	<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/front/js/zhuce.js"></script>
	<style>
		/*login头部*/
		.loginH_w{width:100%; background: #fff;}
		.loginH{width:1200px; margin:0 auto;}
		.loginH_l,.loginH_r{height:48px;line-height:48px;padding:14px 0;}
		.loginH_l .logo_line{display:inline-block;width:1px;height:40px;background:url(${css_imagedomain}/front/images/logo_line.png) no-repeat;margin:0 30px;}
		.welcome{ font-size:24px;color:#494646;font-family:"Microsoft YaHei"; margin-right:30px;}
		.ico_p{display:inline-block;width:21px;height:21px;background:url(${css_imagedomain}/front/images/ico_p.png) no-repeat;}
		.loginH_r a{font-size:16px;color:#383838;}
		.loginH_r a:hover{color:#f27267;}
		.loginH_r i{display:inline-block;width:20px;height:18px;background:url(${css_imagedomain}/front/images/back.png) no-repeat; margin-right:8px;margin-top: -4px;}
		.vm{ vertical-align:middle;}
		#codeImg{ position: absolute;left: 158px;top:7px;}
		#shuaxin{position: absolute;width: 45px;height: 28px;background: url(${css_imagedomain}/front/images/sx.png) no-repeat center center; border-left: 1px solid #d2d2d2;left:258px;top: 8px;}
		#shuaxin:hover{background: url(${css_imagedomain}/front/images/sx2.png) no-repeat center center;}
		.icp{font-size:14px;color:#9d9c9c;}
		.icp:hover{color:#c2c2c2;}
	</style>
</head>

<body>
<!--<div class="subnav">
	<div class="subnav-top clear">
		<div class="left fl">
			<div class="Logo clear">
				<a href="${education_domain}" class="fl"><img src="${css_imagedomain}/front/images/Logo.png" alt="logo" class="marT10" /></a>

			</div>
		</div>
		<div class="right right_zhuR fl">
			<span class="right_zhu">欢迎注册</span>
		</div>
	</div>
</div>-->

<div class="loginH_w">
	<div class="loginH clear">
		<div class="loginH_l fl" style="">
			<a href="${education_domain}" class="vm"><img src="${css_imagedomain}/front/images/logo.png" /></a>
			<i class="vm logo_line"></i>
			<span class="vm welcome">欢迎注册</span>
			<i class="vm ico_p"></i>
			<span class="vm" style="font-size:12px;color:#7b7a7a;">客服热线：</span>
			<strong class="vm" style=" font-size:14px;color:#f27267;margin-right: 5px;">400&nbsp;826&nbsp;5000</strong>
			<span class="vm" style="font-size:12px;color:#a1a0a0;">(8:30-17:30)</span>
		</div>
		<div class="loginH_r fr">
			<a href="${education_domain}" class="vm"><i class="vm"></i>华金所首页</a>
		</div>
		<div class="clear"></div>
	</div>
</div>

<!--注册信息-->
<div class="contentReg">
	<div class="contentReg-Con">
		<%-- <p>我已注册，<a href="${project_name}/login">请登录</a></p> --%>
		<div class="formSub">
			<form id="regForm" name="regForm" action="reg" method="post">

				<!-- 渠道用户参数 -->
				<input type="hidden"  name="uid" value="${uid}"/>
				<input type="hidden"  name="uname" value="${uname}"/>
				<input type="hidden"  name="chlid" value="${chlid}"/>
				<input type="hidden"  name="logo" value="${logo}"/>
					<div class="formPhone formInput pr" style="padding-top: 36px;">
						<%--<span class="fz14">手机号码:</span>--%>
						<label for="phone" class="pa iejr"  style=" font-size:16px;color:#a7a7a7;left:48px;top:47px; margin:0;color:#a6a6a6;display:none;">手机号码</label>
						<input type="text" value="" name="phone" id="phone" maxlength="11" validate="{required:true,isMobile:true,messages:{required:'请输入正确手机号'}}" />
						<b style="color:#ccc; font-size: 14px;">请输入11位手机号码</b>
						<i  style="display:none;padding-left:8px;color:#f07a7a;">手机号已经被注册</i>
					</div>

					<div class="formVer pr">
						<%--<span class="fz14">验证码:</span>--%>
							<label for="code" class="pa iejr"  style="font-size:16px;left:48px;top:11px; margin:0;color:#a6a6a6;">验证码</label>
						<input type="text" name="code" id="code" class="" validate="{required:true,messages:{required:''}}" placeholder="" />
						<img   id="codeImg" alt="" width="85" height="30" onclick=" changeCode();" title="" src="" />
						<a href="javascript:void(0);" onclick="changeCode();" id="shuaxin"></a>
						<b >请输入验证码</b>
						<i id="yzm" style="display:none;padding-left:8px;color:#f07a7a;">请输入正确的验证码</i>
					</div>

					<div class="formVer pr clear">
						<label for="phonecode" class="pa iejr"  style="font-size:16px;left:48px;top:11px; margin:0;color:#a6a6a6;">手机验证码</label>
						<input id="phonecode" class="phone_code" name="phonecode" type="text" value="" validate="{required:true,messages:{required:'请输入手机验证码'}}" placeholder="" style="width:178px;height:42px;line-height:42px;border:1px solid #d2d2d2;margin-right: 6px;background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 8px -105px;vertical-align: middle;;" />
						<strong class="formVerBut fz16" id="getcode" style="cursor:pointer;margin: 0;padding: 0;" onclick="getSmscode();">获取验证码</strong>
						<strong class="time fz13" id="regetcode"  style="display: none;padding:10px 38px; background:#c1c1c1;font-size:16px;color:#fff; text-align:center;border-radius: 4px;"><i>120</i>秒</strong>
						<input type="hidden" id="phoneStatus" name="phoneStatus" value="1" /><!-- 暂时定死，等待短信借口完善 -->
						<b >请输入手机验证码</b>
						<i  style="display:none;padding-left:8px;color:#f07a7a;">手机验证码不正确</i>
					</div>

					<div class="formPass formInput pr">
						<%--<span class="fz14">密码:</span>--%>
						<span style="display: inline-block;width: 700px;">
							<label for="password" class="pa iejr"  style="font-size:16px;left:48px;top:11px; margin:0;color:#a6a6a6;display: none;">请输入密码</label>
							<input type="password" name="password" id="password" maxlength="32" onKeyUp="pwStrength(this.value);" onBlur="pwStrength(this.value);" value="" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'6~32位字符，至少包含字母、数字和符号的两种以上组合'}}" />
							<b style="position:absolute;">6~32位字符，至少包含字母、数字和符号的两种以上组合</b>
						</span>
						<div class="qiangdu clear" style="margin-top:10px;margin-left: 12px;">
							<span class="fz14 fl" style=" font-size:14px;display: inline-block;width: 75px; color: #494646;">密码强度:</span>
							<table width="210" border="1" cellspacing="0" cellpadding="1" bordercolor="#eeeeee" height="14" style='display:inline' class="fl">
								<tr align="center" bgcolor="#95dbff" height="14" style="color:#fff;">
									<td width="50" height="14" id="strength_L">弱</td>
									<td width="50" height="14" id="strength_M">中</td>
									<td width="50" height="14" id="strength_H">强</td>
								</tr>
							</table>
						</div>
						<input type="hidden" id="passwordLevel" name="passwordLevel" value="" />
					</div>

					<div class="formInput formPassSure pr">
						<%--<span class="fz14">确认密码:</span>--%>
						<label for="chkpwd" class="pa iejr"  style="font-size:16px;left:48px;top:11px; margin:0;color:#a6a6a6;display: none;">请确认密码</label>
						<input type="password" name="chkpwd" id="chkpwd" maxlength="32" value="" validate="{required:true,equalTo:'#password',messages:{required:'两次密码不一致'}}" />
						<%--<b>重复输入上面的密码</b>--%>
					</div>

					<div class="formInput formInvit pr">
						<%--<span class="fz14">邀请码:</span>--%>
						<label for="invitecode" class="pa iejr"  style="font-size:16px;left:48px;top:11px; margin:0;color:#a6a6a6;display: none;">请输入邀请码（非必填）</label>
						<input type="text" name="invitecode" id="invitecode" maxlength="32" value="${inviteCode}"  />
					</div>
					<label class="read pr">
						<input id="agree" type="checkbox" checked="checked" />
            			<span>我已阅读并同意
            				<!--<a target="_blank" href="${project_name}/serAgreement.do">《华金所个人会员服务协议》</a>-->
                			<a target="_blank" href="${project_name}/regAgreement.do">《华金所个人会员注册协议》</a><br/>和
                			<a target="_blank" href="${project_name}/proAgreement.do">《华金所个人隐私权保护规则》</a>
            			</span>
					</label>
					<div class="ljzc">
						<input type="button" id="subBtn" value="立即注册" class="recSub fz14" />
					</div>
					<div class="logining">
						<span>已有账号？</span>
						<a class="ljdl colorAll" href="login" style="color:#f27267">请登录</a>
					</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout("changeCode()", 200);
		$("#codeImg").bind("click", changeCode);
	});

	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}

	function changeCode() {
		$("#codeImg").attr("src", "${project_name}/code.do?t=" + genTimestamp());
	}
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
		//点击提交按钮
		document.getElementById("subBtn").onclick = function(){
			if($("#regForm").valid()){
				 if(!vCode()){
					 changeCode();
					return false;
				}else if(!hasP()){
					return false;
				}else if(!vPhoneCode()){
					return false;
				}else if(!hasRead()){
					return false;
				}else if(!hasU()){
					return false;
				}else{
					$("#regForm").submit();
				}
			}
		}
	});
	//判断用户名是否已存在
	 function hasU(){
		var USERNAME = $("#phone").val();
		var url = "${project_name}/hasU.do?username="+USERNAME;
		var ref = true;
		$.ajax({
			type: "post",
			url: url,
			cache:false,
			async:false,
			success: function(data){
				if(data=="error"){
					$("#phone").siblings('i').html("<font color=red>手机号已被注册</font>");
					$("#phone").siblings('i').show();
					ref=false;
				}else{
					$("#phone").siblings('i').hide();
					ref=true;
				}
			}
		});
		return ref;
	} 
	//判断手机号是否已存在
	function hasP(){
		var phone = $("#phone").val();
		if(phone != null && phone != ""){
			var url = "${project_name}/hasP.do?phone="+phone;
			var ref=true;
			$.ajax({
				type: "post",
				url: url,
				cache:false,
				async:false,
				success: function(data){
					if(data=="error"){
						$("#phone").siblings('i').html("<font color=red>手机号已被注册</font>");
						$("#phone").siblings('i').show();
						ref=false;
					}else{
						$("#phone").siblings('i').hide();
						ref=true;
					}
				}
			});
			return ref;
		}
	}
	//判断用户已阅读协议
	function hasRead(){
		var ref=true;
		if(!$("#agree").is(":checked")){
			alert("请阅读声明与协议");
			ref=false;
		}
		return ref;
	}
	//获取验证码前验证手机是否正确
	function validatePhone(){
		var phone = $("#phone").val();
		if(phone==""){
			//alert("请输入手机号");
			//$("#phone").focus();
			return false;
		}
		var length = phone.length;
		if(length == 11 && /^(((13[0-9]{1})|(17[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(phone)){
			return true;
		}else{
			//alert("请输入正确手机号");
			//$("#phone").focus();
			return false;
		}
	} 
	//验证手机验证码
	function vPhoneCode(){
		var phone = $("#phone").val();
		var code = $("#phonecode").val();
		var url = "${project_name}/vphonecode?t=reg&ph="+phone+"&co="+code;
		var ref=true;
		$.ajax({
			type: "post",
			url: url,
			cache:false,
			async:false,
			success: function(data){
				if(data=="error"){
					$("#phonecode").siblings('i').html("<font color=red>手机验证码不正确</font>");
					$("#phonecode").siblings('i').show();
					ref=false;
				}else{
					$("#phonecode").siblings('i').hide();
					ref=true;
				}
			}
		});
		return ref;
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
		O_color="#95dbff";
		L_color="#2cb7ff";
		M_color="#2cb7ff";
		H_color="#2cb7ff";
		if (pwd==null||pwd==''){
			Lcolor=Mcolor=Hcolor=O_color;
		}else{
			S_level=checkStrong(pwd);
			switch(S_level) {
				case 0:
					Lcolor=Mcolor=Hcolor=O_color;
				case 1:
					Lcolor=L_color;
					Mcolor=Hcolor=O_color;
					break;
				case 2:
					Lcolor=Mcolor=M_color;
					Hcolor=O_color;
					break;
				default:
					Lcolor=Mcolor=Hcolor=H_color;
			}
			document.getElementById("passwordLevel").value=S_level;
		}
		document.getElementById("strength_L").style.background=Lcolor;
		document.getElementById("strength_M").style.background=Mcolor;
		document.getElementById("strength_H").style.background=Hcolor;
		return;
	}

	var InterValObj; //timer变量，控制时间
	var count = 120; //间隔函数，1秒执行
	var curCount;//当前剩余秒数
	var code = ""; //验证码
	var codeLength = 6;//验证码长度
	//得到手机验证码
	function getSmscode(){
		if(validatePhone()&&hasP()&&hasU()){
			curCount = count;
			var phone = $("#phone").val();
			var url = "${project_name}/smscode/regist";
			var code = $("#code").val();
			InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
			$("#yzm").hide();
			$("#getcode").hide();
			$("#regetcode").attr("class","showtime fz13");
			$("#regetcode").show();
			$("#regetcode").html(curCount+"秒");
			$.ajax({
				type: "post",
				url: url,
				cache:false,
				async: false,
				dataType: "text",
				data:"phone="+phone+"&code="+code,
				success: function(data){
					if(data===0){
						alert("发送手机验证码失败");
						window.clearInterval(InterValObj);// 停止计时器
						$("#regetcode").hide();
						$("#getcode").show();
						return false;
					}else if(data==-1){
						$("#yzm").show();
						window.clearInterval(InterValObj);// 停止计时器
						$("#regetcode").hide();
						$("#getcode").show();
						return false;
					}
				}
			});
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
	//验证图片验证码
	function vCode(){
		var code = $("#code").val();
		var url = "${project_name}/vcode?code="+code;
		var ref=true;
		if(code == ""){
			$("#code").siblings('i').html("<font color=red>请输入正确的验证码</font>");
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
<!--注册信息 End-->
<div style="width:100%; margin:0 auto;height: 50px;line-height: 50px;font-size:14px;color:#9d9c9c; background:#494646;">
	<p style="width:1200px;margin:0 auto; text-align:center;">Copyright@2016&nbsp;&nbsp;中创共赢（北京）投资有限公司&nbsp;&nbsp;备案号：<a href="http://www.miitbeian.gov.cn" class="icp" target="_blank">京ICP备16016103号-1</a> </p>
</div>
</body>
</html>