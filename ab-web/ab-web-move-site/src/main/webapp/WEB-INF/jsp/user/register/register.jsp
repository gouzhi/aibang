<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
	<title>华金所</title>
	<%@ include file="/WEB-INF/jsp/common/head.jsp" %> 
	<script type="text/javascript"> 
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
			//获取验证码 add
			if(!getSmscode())
			{
				return;
			}
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
			if(validateFrom())
		    {
			  $('#regForm').submit();
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
	<script type="text/javascript">
	function validateFrom()
	{
		var rp=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
		if(!rp.test($("#phone").val())){
			alert("请输入手机号");
			return false;
		} 
		if($("#xy").val()==''||$("#xy").val().length !==6){
			alert("请输入验证码");
			return false;
		}
		var r1 = /^([\w]|[_-]){6,16}$/;
		if(!r1.test($("#password").val())){
			alert("6-32位字符，最佳为英文、数字、符号组合");
			return false;
		}
		if($("#c_password").val()!=$("#password").val())
		{
			alert("密码与确认密码不一致");
			return false;
		}
		
		if(!$("#checkbox-1-1").prop("checked"))
		{
			return false;
		}
		
		return true;
	}
	function getSmscode()
	{
		if(validatePhone()){
			var url = "${project_name}/smscode/regist";
			var phone = $("#phone").val();
			var code = $("#code").val();
			$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       dataType: "text",
			       data:"phone="+phone+"&code="+code,
			       success: function(data){
			    	   if(data===0){
							alert("发送失败"); 
							return false;
						}else if(data==-1){
							alert("验证码不正确"); 
							return false;
						}
			       } 
			});
			return true;
		}else
		{
			return false;
		}
	}
	//获取验证码前验证手机是否正确
	function validatePhone(){
		var phone = $("#phone").val();
		if(phone==""){
			alert("请输入手机号");
			$("#phone").focus();
			return false;
		}else
		{
			if(!hasP())
			{
			  return false;	
			}
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
	//判断手机号是否已存在
	function hasP(){
		var phone = $("#phone").val();
		var url = "${project_name}/register/hasP.do?phone="+phone;
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
			    		    alert("手机号已被注册");
							ref=false;
						}else{
							ref=true;
						}
			       } 
				});
		}
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
		if (pwd==null||pwd==''){    
		}else{  
			S_level=checkStrong(pwd);  
			document.getElementById("passwordLevel").value=S_level;
		}   
		return;  
		}
	</script>
</head>
<body>
<input id="nav_point" type="hidden" value="个人中心">
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>注册</h1>
  </div>
  
  <div class="regBanner">
	  <a href="http://mp.weixin.qq.com/s?__biz=MzIxNzMzODU4NQ==&mid=100000031&idx=1&sn=e16528652e027c5d1436f855af093db8#rd" target="_blank">
		  <img src="http://www.huafax.com/u/cms/www/201605/17175850f9pe.jpg" />
	  </a>
  </div>
  <div class="yingxiaowenan"><!-- 营销文案占位 --></div>
   
  <%--<div class="yingxiaowenan">营销文案占位</div>--%>
  <form id="regForm" name="regForm" action="${project_name}/register" method="post">
    <input type="hidden" id="passwordLevel" name="passwordLevel" value="" />
    <!-- 渠道用户参数 -->
	<input type="hidden"  name="uid" value="${uid}"/>
	<input type="hidden"  name="uname" value="${uname}"/>
	<input type="hidden"  name="chlid" value="${chlid}"/>
	<input type="hidden"  name="logo" value="${logo}"/>
    <div id="zhuce" class="zhuce">
      <div class="regInput inputW1">
        <label>手机号</label>
        <input type="text" value="" name="phone" id="phone" maxlength="11" placeholder="请输入您的手机号" validate="{required:true,isMobile:true,messages:{required:'请输入您的手机号'}}" />
        <br />
        <b>请输入手机号</b>
        <bb style="display:none;">手机号已被注册</bb>
      </div>
      <div class="regInput phone_yz">
        <label>验证码</label>
        <input name="phonecode" type="text" placeholder="请填写验证码" id="xy" validate="{required:true,messages:{required:'请填写验证码'}}" />
      </div>
      <div class="regYzm">
        <span id="code_btn" style="cursor:pointer;"  >获取验证码</span> <span id="regetcode" class="time"><i>60</i>秒后重发</span><br />
        <input type="hidden" id="smscode" name="smscode" value="" />
        <input type="hidden" id="phoneStatus" name="phoneStatus" value="1" />
        <b style="display:none;">请输入验证码</b> 
      </div>
        <div class="regInput inputW1">
        <label>密码</label>
        <input onKeyUp="pwStrength(this.value);" onBlur="pwStrength(this.value);" type="password" placeholder="请设置您的登录密码" id="password" name="password" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'6~32位字符，至少包含字母、数字和符号的两种以上组合'}}"  />
        <br />
        <b>6-32位字符，最佳为英文、数字、符号组合</b> </div>
        <div class="regInput  inputW1">
        <label>确认密码</label>
        <input type="password" placeholder="请再次输入登录密码" id="c_password" name="c_password"  />
      </div>
      <div class="regInput  inputW1">
        <label>邀请码</label>
        <input id="invitecode" name="invitecode" type="text" value="${inviteCode}" placeholder="邀请码（非必填）" />
      </div>
      <div class="regYesNo"> <input type="checkbox" id="checkbox-1-1"  checked="checked" class="regular-checkbox" /><label for="checkbox-1-1"></label>
        已阅读并同意<a href="${project_name}/regAgreement" style="color:#f45724;"> 《华金所个人会员服务协议》</a></div>
      <div class="mobile_sub">
        <a href="javascript:void(0)" id="mobile_sub" />立即注册</a>
      </div>
    </div>
  </form>
  <%-- <div class="alreadyEnter">已有账号？<a href="${project_name}/login">登录</a></div> --%>
  <%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</div>
</body>
</html>