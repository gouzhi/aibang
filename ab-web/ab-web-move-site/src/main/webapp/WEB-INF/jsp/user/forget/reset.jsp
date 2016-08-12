<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script> 
	</head>
<body>
<form id="passForm" name="passForm" action="${project_name}/resetPass" method="post">
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>重置密码</h1>
  </div>
 <div class="pLR16">
    <p class="loadTt">您正在找回密码的账号是：${user.username }</p>
    <div class="regInput inputW1">
      <label>新密码</label>
      <input onKeyUp="pwStrength(this.value);" onBlur="pwStrength(this.value);" id="newPass" name="newPass" type="password" maxlength="32" value="" class=""  placeholder="输入新密码" />
      <span class="glyphicon-remove-sign"></span> 
    </div>
    <div class="regInput inputW1">
      <label>确认密码</label>
      <input id="resetpass" name="resetpass" maxlength="32" type="password" value="" class="" placeholder="确认新密码" />
      <span class="glyphicon-remove-sign"></span> 
    </div>
    <div class="mobile_sub"> <a id="subBtn" href="javascript:void(0)">确定</a></div>
  </div>
  <input type="hidden" id="passwordLevel" name="passwordLevel" value="" /> 
</div>
</form>
	<script type="text/javascript">			
			function validateFrom()
			{
				var r1 = /^([\w]|[_-]){6,32}$/;
				if(!r1.test($("#newPass").val())){
					alert("6-32位字符，最佳为英文、数字、符号组合");
					return false;
				}
				if($("#newPass").val()!=$("#resetpass").val())
				{
					alert("密码不一致，请重新输入");
					return false;
				}
				return true;
			}
			$(document).ready(function(){
				//点击提交按钮
			    $("#subBtn").click(function(){
					if(validateFrom()){
						$("#passForm").submit();							
					}
				});
			    $(".glyphicon-remove-sign").on("click",function(){
					$(this).prev().val("");
				});
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
				if (pwd!=null||pwd!=''){   
					S_level=checkStrong(pwd);  
					document.getElementById("passwordLevel").value=S_level;
				}   
				return;  
			}
	</script>
</body>
</html>