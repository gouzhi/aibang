<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
 <base href="${project_name}/">
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>华金所</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${css_imagedomain}/move/css/mobile.css" rel="stylesheet" />
        <link href="${css_imagedomain}/move/css/secCss.css" rel="stylesheet" />
        <script src="${css_imagedomain}/move/js/zepto.min.js"></script>
        <script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
        <link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
        <script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>		
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
		<!-- 共用js -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/jquery.validation/css/validate.css">
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.validate.js"></script>
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.metadata.js"></script>
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/validate-methods.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
</head>
<body>
<form action="${project_name}/user/cash/outcash" method="post" id="form" >
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>提现</h1>
  </div>
  <div class="temptList">
    <dl>
      <dt>银行卡</dt>
      <dd>【${bankName}】${firstNum}*************${lastNum}</dd>
    </dl>
    <dl>
      <dt>持卡人</dt>
      <dd>${hjsUser.realName}</dd>
    </dl>
    <dl>
      <dt>可用余额</dt>
      <dd>${userBase.avlBalance}元</dd>
    </dl>
    <dl>
      <dt>预计到账日期</dt>
      <dd>T+1个工作日（T日21:00之前申请）</dd>
    </dl>
  </div>
  <div class="temptMoney">
    <label>请输入提现金额</label>
    <span class="moneyBor">
      <input type="text"  placeholder="请输入取现金额" onchange="cashAmountlimit()" id="cashMoney" name="cashMoney" validate="{required:true,isRightCashAmount:true,isZeroAmountCash:true,isBigAmountCash:true,isLittleAmountCash:true,isBigAmountCash:true,messages:{required:'请输入金额'}}"/>
             元</span> 
  
    <p class="money1">手续费：<span>0</span>元</p>
    
    <!--  <strong class="time fz13" id="refreshamonut"  style="padding: 2px; display: none;position:absolute;width:802px; font-weight:normal;color:red;margin-top:-20px;">低于1000元的金额每月限两笔，请输入大于或等于1000的金额</strong> -->
  </div>
   <div class="errorIllustrate" id="errorMsg" hidden="hidden"></div>
  <div class="mobile_sub pLR16"> <a href="javascript:void(0)" onclick="cash()">立即取现</a></div>
</div>
</form>
</body>
</html>
<script>
function cash(){ 
	    var isNum = /^\d+(\.\d{0,9})?$/;
	  	var isNum1= /^\d+(\.\d{0,2})?$/;
	  	var isNum2=/^([1-9][\d]{0,7}|0)(\.[\d]{0,2})?$/;;
        var money = $("input[name='cashMoney']").val();
        var avlBalance=${userBase.avlBalance};
        /*  if(!cashAmountlimit()){
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请输入大于1000的金额");
    		$("#errorMsg").show();
    		return;
         } */  
        if(money<1){
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"取现金额最低1元!");
    		$("#errorMsg").show();
        	//alert("请充值金额大于1");
        	return;	
        }
        if(money>avlBalance){
    	 //$("#validate1").html("取现金额大于可用余额，无法取现");
     	 $("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"取现金额大于可用余额，无法取现");
		 $("#errorMsg").show();
    	//alert("请充值金额大于1");
    	 return;
       }
        if(!isNum.test(money)){
        	//$("#validate1").html("请输入正确的金额");
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请输入正确的金额");
    		$("#errorMsg").show();
    		return;
        } 
        if(!isNum1.test(money)){
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"只保留两位小数");
    		$("#errorMsg").show();
    		return;
        }
	$("#form").submit();
	
}

/**
 * 提现金额验证
 */
function cashAmountlimit(){

	    var cashMoney=$("#cashMoney").val();	
		var url = "${project_name}/user/cash/cashAmountlimit.do";
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false,
		       async:false,
		       dataType: "text",
		       data:"amount="+cashMoney,
		       success:function(data){
		    	   if(data=="0"){
		    		$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"低于1000元的金额每月限两笔请输入大于或等于1000的金额");
		    		$("#errorMsg").show();
				    $("#cashMoney").val("");  
					$("#cashMoney").focus();
					return false;
					}
		    		$("#errorMsg").hide();
                return true;
		       } 
			});
		
	
}
</script>