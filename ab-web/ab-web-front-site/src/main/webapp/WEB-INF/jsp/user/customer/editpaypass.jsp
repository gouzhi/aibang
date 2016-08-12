<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>修改支付密码 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
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
});
</script> 
</head> 
 
<body>
<div class="maskName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if> ></div>
<div class="boxName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if> >
    <span class="Close">x</span>
	<p><c:choose><c:when test="${not empty oldpass}">修改</c:when><c:otherwise>设置</c:otherwise></c:choose>支付密码成功</p>
    <a href="toSafe">返回账户安全</a>
   	
    
</div> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改支付密码-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a> </span>
        <i> > </i>
        <span><c:choose><c:when test="${not empty oldpass}">修改</c:when><c:otherwise>设置</c:otherwise></c:choose>支付密码</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="xiuPass1">
    		<div class="xiuPass1-top">          	
            	 <div class="spanText">
                	<span class="sp1">安全验证</span>
                    <span class="sp2 active"><c:choose><c:when test="${not empty oldpass}">修改</c:when><c:otherwise>设置</c:otherwise></c:choose>支付密码</span>
                    <span class="sp3">完成</span>
                </div>
        		<img src="${css_imagedomain}/front/images/liu2.png" />
            </div>
        	<p>请确保支付密码与登录密码不同！</p>
        	<form id="passForm" name="passForm" action="editPayPass" method="post">
            <c:if test="${not empty oldpass}">       
            <label>
            	<span>原支付密码：</span>
                <input id="oldPass" name="oldPass" type="password" value=""  validate="{required:true,messages:{required:'请输入原支付密码'}}" />    
            </label>
            </c:if>
            <label>
            	<span>新支付密码：</span>
                <input onKeyUp="pwStrength(this.value);" onBlur="pwStrength(this.value);" maxlength="32" id="payPass" name="payPass" type="password" value="" validate="{required:true,isPwd:true,messages:{required:'请输入密码',isPwd:'6~32位字符，至少包含字母、数字和符号的两种以上组合'}}" />    
            </label>
            <div class="qiangdu clear" style="margin-top:15px;margin:0 0 15px 328px;">
                	 
                	<table width="210" border="1" cellspacing="0" cellpadding="1" bordercolor="#eeeeee" height="22" style='display:inline' class="fl">  
                        <tr align="center" bgcolor="#f5f5f5">  
                        <td width="50" id="strength_L">弱</td>  
                        <td width="50" id="strength_M">中</td>  
                        <td width="50" id="strength_H">强</td>  
                    </tr>  
                	</table>
            	 </div>
            <label>
            	<span>确认新密码：</span>
                <input id="repayPass" name="repayPass" type="password" maxlength="32" value="" validate="{required:true,equalTo:'#payPass',messages:{required:'请输入确认密码',equalTo:'两次密码不一致'}}" />
            </label>
            <input id="subBtn" type="submit" value="确定" class="backSub" />
            </form>
        </div>
		
    
    </div>

</div>
<script type="text/javascript">
$(document).ready(function(){
	/*手机验证*/
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
O_color="#eeeeee";  
L_color="#FF0000";  
M_color="#FF9900";  
H_color="#33CC00";  
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
}  
document.getElementById("strength_L").style.background=Lcolor;  
document.getElementById("strength_M").style.background=Mcolor;  
document.getElementById("strength_H").style.background=Hcolor;  
return;  
}
</script>
<!--修改支付密码 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>