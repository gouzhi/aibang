<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>修改密码 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/modify.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <script>
$(function(){
	$('.Close').click(function(){
		$('.maskName').css('display','none');	
		$('.boxName').css('display','none');	
	});
	$('.Close').mouseover(function(){
		$('.Close').removeClass('CloseNom');
		$(this).addClass('CloseOn');
	});
	$('.Close').mouseout(function(){
		$('.Close').removeClass('CloseOn');
		$(this).addClass('CloseNom');
	});
});
</script>
</head> 
 
<body style="background: #e8e8e8;">
<div class="maskName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if> ></div>
<div class="boxName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if>>
	<i class="tishi"></i>
	<h3><span>提示</span></h3>
	<span class="Close CloseNom pa"></span>
	<p><i class="ico_Y"></i>密码修改成功</p>
    <a href="toSafe">返回账户安全</a>
</div>


<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改密码-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a> </span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a> </span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">修改密码</a> </span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="xiuPassword">
			<h3>账户安全</h3>
        	<form name="passForm" id="passForm" action="editPass" method="post">
				<p class="prompt">定期更换密码可以让你的账户更加安全。请确保登录密码与支付密码不同！</p>
            	<div class="pr">
                	<%--<span>旧密码：</span>--%>
						<b class="lock"></b>
					<i for="oldPass" class="fz16 pa iejr"  style="fz16;left:48px;top:11px; margin:0;color:#999;">旧密码</i>
                    <input type="password" name="oldPass" id="oldPass" placeholder="" validate="{required:true,messages:{required:'请输入旧密码'}}"  value="" />
                </div>
                <div class="pr" style="margin-top: 30px;">
                	<%--<span>新密码：</span>--%>
						<b class="lock"></b>

					<i for="newPass" class="fz16 pa iejr"  style="left:48px;top:11px; margin:0;color:#999;">新密码</i>
                    <input onKeyUp="pwStrength(this.value);" onBlur="pwStrength(this.value);" maxlength="32" type="password" name="newPass" id="newPass" placeholder="" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'6~32位字符，至少包含字母、数字和符号的两种以上组合'}}"  value="" />
                </div>
                <div class="qiangdu clear" style="margin-top:15px;margin:8px 0 2px;">
					<span class="fz14 fl" style=" font-size:14px;display: inline-block;width: 75px;height: 14px;line-height: 14px; color: #494646;">密码强度:</span>
					<table width="210" border="1" cellspacing="0" cellpadding="1" bordercolor="#eeeeee" height="22" style='display:inline' class="fl">
						<tr align="center" bgcolor="#fac7c2" style="color:#fff;height: 14px;line-height: 14px;">
							<td width="50" id="strength_L">弱</td>
							<td width="50" id="strength_M">中</td>
							<td width="50" id="strength_H">强</td>
						</tr>
					</table>
            	 </div>  
            	 <input type="hidden" id="passwordLevel" name="passwordLevel" value="" />
                <div class="pr">
                	<%--<span>确认新密码：</span>--%>
						<b class="lock"></b>
					<i for="renewPass" class="fz16 pa iejr"  style="left:48px;top:11px; margin:0;color:#999;">确认新密码</i>
                    <input type="password" name="renewPass" maxlength="32" id="renewPass" placeholder="" validate="{required:true,equalTo:'#newPass',messages:{required:'两次密码不一致'}}" value="" />
                </div>
				<div class="but clear">
					<a href="${project_name}/user/customer/toSafe" class="return fl">返回</a>
					<a href="#" id="subBtn" class="baoSub fl">保存</a>
					<%--<input type="button" id="subBtn" value="保存" class="baoSub fl" />--%>
				</div>

            </form>
        </div>
		<script type="text/javascript">
		$(document).ready(function(){
			/*登录验证模板*/
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
			/*兼容IE--stare*/
			tishi();
			function tishi(){
				$('#oldPass,#newPass,#renewPass').focus(function(){
					$(this).prev('.iejr').hide();
				})
				$('#oldPass,#newPass,#renewPass').blur(function(){
					if($(this).val()==''){
						$(this).prev('.iejr').show();
					}
					else{
						$(this).prev('.iejr').hide();
					}
				});
			};


			/*兼容IE--End*/
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
			O_color="#fac7c2";
			L_color="#f27267";
			M_color="#f27267";
			H_color="#f27267";
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
				Lcolor=Hcolor=O_color;
			break;  
			default:
				Lcolor=Mcolor=O_color;
				Hcolor=H_color;
			}
			document.getElementById("passwordLevel").value=S_level;
		}  
		document.getElementById("strength_L").style.background=Lcolor;  
		document.getElementById("strength_M").style.background=Mcolor;  
		document.getElementById("strength_H").style.background=Hcolor;  
		return;  
		}
		</script>
    
    </div>

</div>
<!--修改密码 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>