<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>登录 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/login.css" rel="stylesheet" type="text/css" />
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
		 .yanzheng .imgY{width:38px;height:26px;background:url(${css_imagedomain}/front/images/lock.png) no-repeat center -110px;border-right: 1px solid #d2d2d2;left:0;top:9px;}
		 #codeImg{ position: absolute;left:158px;top:6px;}
         #shuaxin{ position:absolute;width:36px;height:28px;background:url(${css_imagedomain}/front/images/sx.png) no-repeat center center;border-left: 1px solid #d2d2d2;right:0;top:8px;}
		 #shuaxin:hover{background:url(${css_imagedomain}/front/images/sx2.png) no-repeat center center;}
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
            <span class="right_zhu">欢迎登录</span>
        </div>
    </div>
  
</div> -->
<div class="loginH_w">
	<div class="loginH clear">
		<div class="loginH_l fl" style="">
			<a href="${education_domain}" class="vm"><img src="${css_imagedomain}/front/images/logo.png" /></a>
			<i class="vm logo_line"></i>
			<span class="vm welcome">欢迎登录</span>
			<i class="vm ico_p"></i>
			<span class="vm" style="font-size:12px;color:#7b7a7a;">客服热线：</span>
			<strong class="vm" style=" font-size:14px;color:#6b6b6b;">400&nbsp;826&nbsp;5000</strong>
			<span class="vm" style="font-size:12px;color:#a1a0a0;margin-left: 5px;">(8:30-17:30)</span>
		</div>
		<div class="loginH_r fr">
			<a href="${education_domain}" class="vm"><i class="vm"></i>华金所首页</a>
		</div>
		<div class="clear"></div>
	</div>
</div>




<!--登陆页主体-->
<div class="land">
    	<div class="landCont clear">
			<div class="landImg fl">
				<img src="${css_imagedomain}/front/images/loign.png" style="margin: 65px 0 0 45px;" />
			</div>
        	<form id="landForm">
            	<h2 style="font-size: 14px;color:#ababab;margin:30px 0 14px 142px;">还没有加入华金所吗？<a href="${project_name}/toReg" style="color:#ee5e5e;">立即注册</a></h2>
                <div class="nameDiv pr">
                	<i></i>
					<label for="loginname" class="pa iejr"  style="left:26px;top:12px; margin:0;color:#999;display:none;cursor:pointer;">手机号码/邮箱/用户名</label>
                	<input type="text" name="loginname" id="loginname" value="" placeholder="" />
                    <p>请输入手机号码</p>
                </div>
                <div class="passDiv pr">
                	<i></i>
					<label for="password" class="pa iejr"  style="left:26px;top:12px; margin:0;color:#999;display:none;cursor:pointer;">请输入密码</label>
                	<input type="password" name="password" id="password" placeholder="" value="" />
                    <!--<div>此处留作验证填写内容</div>-->
                    <p>请输入密码</p>
                </div>
                <div class="yanzheng pr">
                	<span class="imgY pa"></span>
					<label for="code" class="pa iejr"  style="left:26px;top:12px; margin:0;color:#999;display:none;cursor:pointer;">验证码</label>
                	<input type="text" name="code" id="code" class="yzInput" placeholder="" style="width:298px;height:42px;line-height:42px;border: 1px solid #d2d2d2; text-indent: 48px;border-radius: 4px;" />
                    <img  id="codeImg" alt="点击更换" width="85" height="30" title="点击更换" src=""  />
                    <a href="javascript:void(0);" onclick="changeCode();" id="shuaxin"></a>
                </div>
                <div class="xieyi" style="padding: 0;height: 28px;">
                	<input id="readAgreement" type="checkbox" value="" checked="checked" />
                    <span>我已阅读并同意<a target="_blank" href="serAgreement">《华金所服务协议》</a></span>
                </div>
                <input id="loginbox" type="button" value="登录" class="logoSub" onclick="severCheck()"/>
				<label class="lineH24 jz">
					<input name="form-field-checkbox" id="saveid" type="checkbox" style="padding-top:0px;" />
					<span style="font-size:14px;color: #494646;margin-right: 155px;">记住账号</span>
					<a href="${project_name}/toFindPass" style="color:#f27267">忘记密码？</a>
				</label>
            </form>
        </div>
    </div>
<!--登陆页主体 End-->
<script type="text/javascript">
	tishi();
	function tishi(){
		if ($('#loginname').val() == '') {
			$('#loginname').prev(".iejr").show();
		}
		else {
			$('#loginname').prev(".iejr").hide();
		}
		if ($('#password').val() == '') {
			$('#password').prev(".iejr").show();
		}
		else {
			$('#password').prev(".iejr").hide();
		}
		if ($('#code').val() == '') {
			$('#code').prev(".iejr").show();
		}
		else {
			$('#code').prev(".iejr").hide();
		}
		$('#loginname,#password,#code').focus(function(){
			$(this).parent().find('.iejr').hide();
		});
		$('#loginname,#password').blur(function(){
			if($(this).val()==''){
				$(this).parent().find('.iejr').show();
			}
			else{
				$(this).parent().find('.iejr').hide();
			}
		});
	};
		//服务器校验
		function severCheck(){
			//消除按钮绑定事件
			$("#loginbox").unbind();
			if(check()){
				
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = loginname+",fh,"+password+",fh,"+$("#code").val();
				var autoLogin = $("#saveid").prop("checked");
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,autoLogin:autoLogin,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							$("#loginbox").tips({
								side : 1,
								msg : '正在登录 , 请稍后 ...',
								bg : '#68B500',
								time : 10
							});
							window.location.href="home/index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
						}else if("statuserror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "该用户已停用",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}
						changeCode();
						//验证有错误信息，恢复按钮点击状态，刷新验证码
						setTimeout(function () { 
							$("#loginbox").bind("click", severCheck);
					    }, 4000);
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
			//$("#loginbox").bind("click", severCheck);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				severCheck();
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {

				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {

				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#code").focus();
				return false;
			}
			if (!$("#readAgreement").is(':checked')) {

				$("#readAgreement").tips({
					side : 1,
					msg : '请阅读服务协议',
					bg : '#AE81FF',
					time : 3
				});

				$("#readAgreement").focus();
				return false;
			}			

			return true;
		}

		
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<script type="text/javascript" src="${css_imagedomain}/front/js/jquery.tips.js"></script>
<div style="width:100%; margin:0 auto;height: 50px;line-height: 50px;font-size:14px;color:#9d9c9c; background:#494646;position: fixed;bottom:0px;"><p style="width:1200px;margin:0 auto; text-align:center;">Copyright@2016&nbsp;&nbsp;中创共赢（北京）投资有限公司&nbsp;&nbsp;备案号：<a href="http://www.miitbeian.gov.cn" style="font-size:14px;color:#9d9c9c;" class="icp" target="_blank">京ICP备16016103号-1</a> </p></div>

</body> 
</html>