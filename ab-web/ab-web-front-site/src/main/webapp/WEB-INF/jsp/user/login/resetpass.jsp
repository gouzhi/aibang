<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>重置密码 - 华金所</title>
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
	  .process{width:1100px;margin:28px auto 70px;border-bottom:1px solid #d2d2d2;height:66px;}
	  .processSpan{height:64px;line-height:64px;margin-left:150px;}
	  .processSpan span{ display:inline-block;height:64px;line-height:64px;padding:0 8px 0 42px;font-size:20px;color:#ababab;}
	  .processSpan span.sp1{ background:url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
	  .processSpan span.sp2{ background:url(${css_imagedomain}/front/images/ico_022.png) no-repeat 8px center;}
	  .processSpan span.sp3{ background:url(${css_imagedomain}/front/images/ico_03.png) no-repeat 8px center;border-bottom:2px solid #f27267;}
	  .processSpan span.sp4{ background:url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}
	  .processSpan i{ display:inline-block;width:7px;height:12px; background:url(${css_imagedomain}/front/images/ico_next.png) no-repeat 0 center; margin:0 50px 0 32px;}
	  .processSpan span.activeS{color:#494646;}
	  .ownRight{ padding-bottom: 90px;}
	  .backName input{background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px 6px;}
	  /* .yzInput{background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 12px -48px;}
  #codeImg{position:absolute;left:158px;top:6px;}
  #shuaxin{ position:absolute;width:36px;height:28px;background:url(${css_imagedomain}/front/images/sx.png) no-repeat center center;border-left: 1px solid #d2d2d2;left:260px;top:8px;}*/
	  .mima .ico_b{left:8px;top:7px;width:31px;height:28px;background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 0px -168px;}
	  .sur_mima .ico_b{left:8px;top:7px;width:31px;height:28px;background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 0px -168px;}
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
        	<form id="passForm" name="passForm" action="resetPass" method="post">
                <!--<div class="process">
                     <div class="processSpan">
                        <span>确认账号</span>
                        <span>安全验证</span>
                        <span class="activeS">重置密码</span>
                        <span>完成</span>
            		</div>
                    <img src="${css_imagedomain}/front/images/liuThree.png" />
                </div>-->

				<div class="process">
					<div class="processSpan">
						<span class="sp1">确认账号</span>
						<i></i>
						<span class="sp2">安全验证</span>
						<i></i>
						<span class="sp3 activeS">重置密码</span>
						<i></i>
						<span class="sp4">完成</span>
					</div>
				</div>

                <p style="text-align:left;margin-left:450px;margin-bottom:15px;font-size: 16px;color: #494646;">您正在找回密码的帐号是：<span>${user.username }</span></p>
                
                <div class="passwordSet">
                	<label class="mima pr">
                    	<%--<span>重置密码：</span>--%>
                        <input onKeyUp="pwStrength(this.value);" onBlur="pwStrength(this.value);" id="newPass" name="newPass" type="password" maxlength="32" value="" class="" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'6~32位字符，至少包含字母、数字和符号的两种以上组合'}}" />
                        <b></b>
						<i class="ico_b pa"></i>
                    </label>
					<div class="qiangdu clear" style="margin-bottom:5px;margin-left: 12px;">
						<span class="fz14 fl" style=" font-size:14px;display: inline-block;width: 75px; color: #494646;">密码强度:</span>
						<table width="210" border="1" cellspacing="0" cellpadding="1" bordercolor="#eeeeee" height="22" style='display:inline' class="fl">
                        <tr align="center" bgcolor="#95dbff"  style="color:#fff;">
                        <td width="50" id="strength_L">弱</td>  
                        <td width="50" id="strength_M">中</td>  
                        <td width="50" id="strength_H">强</td>  
                    </tr>  
                	</table>
            	 </div>  
            	 <input type="hidden" id="passwordLevel" name="passwordLevel" value="" />
                    <label class="sur_mima pr">
                    	<%--<span>确认密码：</span>--%>
                        <input id="resetpass" name="resetpass" maxlength="32" type="password" value="" class="" validate="{required:true,equalTo:'#newPass',messages:{required:'两次密码不一致'}}" />
                        <b></b>
							<i class="ico_b pa"></i>
                    </label>
                </div>
                <input type="submit" value="确定" class="backSub" />
            </form>
        </div>
    </div>    	
</div>
<script type="text/javascript">			
		$(document).ready(function(){
			/*帐号验证*/
			$.metadata.setType("attr", "validate");
			$("#passForm").validate({
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
				if($("#passForm").valid()){
					$("#passForm").submit();							
				}
			}
			
		});
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
		</script>
<!--找回密码 End-->
<div style="width:100%; margin:0 auto;height: 50px;line-height: 50px;font-size:14px;color:#9d9c9c; background:#494646;">
	<p style="width:1200px;margin:0 auto; text-align:center;">Copyright@2016&nbsp;&nbsp;中创共赢（北京）投资有限公司&nbsp;&nbsp;备案号：<a href="#" class="icp">京ICP备16016103号-1</a> </p>
</div>
</body> 
</html>