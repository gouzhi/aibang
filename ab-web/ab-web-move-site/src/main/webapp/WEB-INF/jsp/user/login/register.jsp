<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>华金所 - 手机注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="${css_imagedomain}/move/css/index_mobile.css" type="text/css" rel="stylesheet" />
<script src="${css_imagedomain}/move/js/jquery.js" type="text/javascript"></script>

<script src="${css_imagedomain}/move/js/TouchSlide.1.1.js"></script>
<!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
</head>
<script type="text/javascript">
//JavaScript Document

$(function(){
	var ok1=false;
	var ok2=false;
	var ok3=false;
	var ok4=false;
	/*手机号验证*/
	var rp=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
	$('#phone').blur(function(){
		if(!rp.test($(this).val())){
			
			$(this).next().next('b').css('display','inline-block');
			return false;
		}
		else{
			//$(this).next().next('b').hide();
			ok1=true;
			};
	});
	/*手机验证码*/
	$('#code_btn').on("click",function(){
		$(this).hide();
		$(this).next().css('display','inline-block');
		var sTime=$('.time').children('i');
		
		var iNub=60;
		var iSpeed=1;
		var timer=null;
		timer=setInterval(function(){
			iNub-=iSpeed;
				if(iNub==0)
				{
					$('.time').hide();
					$('#code_btn').show();
					clearInterval( timer );
				}
			$('.time').children('i').text(iNub);
		},1000);
	});
	$('#xy').blur(function(){
		if($(this).val()==''||$(this).val().length !==6){
			
			$(this).parent().parent().find('b').css('display','inline-block');
		}
		else{
			ok2=true;
		};
	});
	/*密码*/
	var r1 = /^([\w]|[_-]){6,16}$/;
	$('#password').blur(function(){
		//alert('1');
		if(!r1.test($(this).val())){
			$(this).next().next('b').css('display','inline-block');
			return false;
		}
		else{
			//$(this).next().next('b').hide();
			ok3=true;
		}
	});
	$('#mobile_sub').click(function(){
		if(ok1 && ok2 && ok3){
			$('#mobile_sub').submit();
			alert('ok');
		}
		else{
			alert('no');
			return false;
		}
	});	
	/*弹窗*/
	$('#but a').click(function(){
		$('.maskMobil').show();
		$('.boxMobile').show();
	});
	$('.sure').click(function(){
		$('.maskMobil').hide();
		$('.boxMobile').hide();
	});
	/* 安全验证 */
	$('.safeCon p').click(function(){
		$(this).css('display','none');
		$(this).next().css('display','block');
	})
	$('.safeCon > span').click(function(){
		$(this).next('p').css('display','none');
		$(this).parent().find('ul').css('display','block');
	})
	$('.safeCon ul li').click(function(){
		$(this).parent().css('display','none');
		var vall=$(this).html();
		$(this).parent().prev().html(vall).css('display','block');
		var aa=$('.safeCon p').html();
		if(aa.indexOf("邮箱")>=0||aa.indexOf('身份方式')>=0){
			$('.smsCode').css('display','none');
		}else{
			$('.smsCode').css('display','block');
		}
	})
	
	/* 产品列表小导航 */
	$('.proListSmallNav p').click(function(){
		$(this).css('display','none');
		$(this).next('ul').css('display','block');
		var oLi=$(this).next('ul').find('li');
		oLi.click(function(){
			$(this).parent().css('display','none');
			var valls=$(this).html();
			$(this).parent().prev().html(valls).css('display','block');
		})
	})
	/* 是否用券 */
	$('.rewardMenu a').click(function(){
		var nIndex=$(this).index();
		$(this).addClass('on').siblings().removeClass('on');
		$(this).parent().next().children('div').eq(nIndex).css('display','block').siblings().css('display','none');
	})
	/* 返回上一页 */
	$("#back").on("click", function(){			
		var c = window.location.href;
		if (/#back/.test(c)) {
			window.history.go(-2);
			window.location.load(window.location.href)
		} else {
			window.history.back()
		}
	});
	/* 我的投资 */
	$('.myInvestMenu li').click(function(){
		$(this).addClass('on').siblings().removeClass('on');
		var nIndex=$(this).index();
		$('.myInvesCons .myInvestList').eq(nIndex).removeClass('disNone').siblings().addClass('disNone');
	})
});
</script>
<body>
<div class="maskMobil"></div>
<div class="boxMobile">
	<p>请完成注册后邀请好友</p>
    <div class="close_btn">
    	<input type="button" value="确定" class="sure" />
    </div>
</div>
<div class="wrap">
    <div id="headBox">
        <a href="javascript:;" tppabs="" class="logo"></a>
    </div>
    <div id="banner" class="slideBox">
        <div class="bd">
      		<ul>
        		<li><a class="pic" href="#"><img src="${css_imagedomain}/move/images/dengluImg1.jpg" /></a> </li>

      		</ul>
    	</div>
    	<div class="hd">
      		<ul>
      		</ul>
    	</div>
    </div>
    <div id="explain">
        <p class="head_p">华金所 全新上线</p>
    <p>马上注册华金所 <br />
      投资100元送现金5元<br />
     </p>
    </div>
    <%--<div id="but">邀请好友注册，即得现金券10元/位！</div>--%>
    <form id="regForm" name="regForm" action="reg" method="post">
        <input type="hidden" id="passwordLevel" name="passwordLevel" value="" />
        <div id="zhuce">
            <div>
                <input type="text" value="" name="phone" id="phone" maxlength="11" placeholder="请输入手机号" validate="{required:true,isMobile:true,messages:{required:'请输入正确手机号'}}" /><br />
                <b>请输入手机号</b>
                <bb  style="display:none;">手机号已被注册</bb>
            </div>
            <div class="phone_yz">
                <input name="phonecode" type="text" placeholder="请输入您的手机验证码" id="xy" validate="{required:true,messages:{required:'请输入手机验证码'}}" />
                <span id="code_btn" style="cursor:pointer;" onclick="getSmscode();">获取验证码</span>
                <span id="regetcode" class="time"><i>60</i>秒后重发</span><br />	
                <input type="hidden" id="smscode" name="smscode" value="" />
                <input type="hidden" id="phoneStatus" name="phoneStatus" value="1" />
                <b>请输入验证码</b>
            </div>
            <div>
            	
                <input onKeyUp="pwStrength(this.value);" onBlur="pwStrength(this.value);" type="password" placeholder="请设置您的登录密码" id="password" name="password" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'6~32位字符，至少包含字母、数字和符号的两种以上组合'}}"  /><br />
                <b>6-32位字符，最佳为英文、数字、符号组合</b>
            </div>
            <div>
            <input id="invitecode" name="invitecode" type="text" value="${inviteCode}" placeholder="邀请码（非必填）" />
            </div>
            <div>
                <input type="button" value="立即注册" id="mobile_sub" />
            </div>
        </div>
    </form>
    <div class="title_p">
        <p>华金所是什么？</p>
    </div>
    <div class="columnContent">
        <ul>
            <li>
                <p>“投资者教育运营商”为您打造最专业、最全面的投资理财教育平台，开启您的财富之门。</p>
                <img src="${css_imagedomain}/move/images/computer.png" width="110" height="95" />
            </li>
            <li>
                <p>“互联网金融超市”为您打造最合理、最优质的全品类金融产品超市，助您到达财富巅峰。</p>
                <img src="${css_imagedomain}/move/images/cup.png" width="95" height="95" />
            </li>
        </ul>
    </div>
    <div class="foot_explain">
        <p>本活动最终解释权归华金所所有</p>
        <p>最终收益以实际为准</p>
    </div>
</div>
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
			//点击提交按钮
			document.getElementById("mobile_sub").onclick = function(){
				if($("#regForm").valid()){
					if(!hasU()){
						return false;	
					}else if(!hasP()){
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
			var ref = true;
			if(USERNAME!=""){
				var url = "${project_name}/hasU.do?username="+USERNAME;
				$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       async:false,
			       dataType:"text",
			       success: function(data){
			    	   if(data=="error"){
							$("#phone").siblings('bb').html("<font color=red>手机号已被注册</font>");
							$("#phone").siblings('bb').show();
							ref=false;
						}else{
							$("#phone").siblings('bb').hide();
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
			var url = "${project_name}/hasP.do?phone="+phone;
			var ref=true;
			if(phone!=""){
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       cache:false, 
				       async:false,
				       dataType:"text",
				       success: function(data){	   
				    	   if(data=="error"){
				    		   $("#phone").siblings('bb').html("<font color=red>手机号已被注册</font>");
								$("#phone").siblings('bb').show();
								ref=false;
							}else{
								$("#phone").siblings('bb').hide();
								ref=true;
							}
				       } 
					});
			}
			
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
				var url = "${project_name}/smscode/regist";
				var code = $("#code").val();
				$("#code_btn").hide();
				$("#regetcode").show();
				$("#regetcode").html(curCount+"秒后重发");
				InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       cache:false, 
				       dataType: "text",
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
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
		TouchSlide({ 
			slideCell:"#banner",
			titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
			mainCell:".bd ul", 
			effect:"leftLoop", 
			autoPage:true,//自动分页
			autoPlay:true //自动播放
		});
	</script>
</body> 
</html>