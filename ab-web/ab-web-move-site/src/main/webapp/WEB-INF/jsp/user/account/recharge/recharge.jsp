<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>华金所</title>
<link href="${css_imagedomain}/move/css/mobile.css" rel="stylesheet" />
<link href="${css_imagedomain}/move/css/secCss.css" rel="stylesheet" />
<script src="${css_imagedomain}/move/js/zepto.min.js"></script>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
<form action="recharge" method="post" id="form" >
<input type="hidden" name="bank" id="bank" value="">
<input type="hidden" id="gateBusiId" name="gateBusiId" value="B2C">
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>充值</h1>
  </div>
  <div class="rechargeLost">
    <p class="pCon1">账户可用余额：</p>
    <p class="pCon2"><b>${userBase.avlBalance}元</b></p>
  </div>
   <div class="rechargeTt">充值银行账户</div>
  <div class="recharge">
    <div class="rechargeMenu"><span class="arrowDown"></span>
      <p >请选择充值方式</p>
      </div>
      <ul id="nav_ul" class="disNone">
        <li class="disNone">请选择充值方式</li>
        <li value="1">网银</li>
        <li value="2">快捷支付</li>
      </ul>
      <div class="rechargeMenu1"><span class="arrowDown"></span>
      <p id="p1">请选择充值银行</p>
    </div>
  
   <ul id="nav1_ul" class="disNone">
        <li class="disNone">请选择充值银行</li>
        <li value="ICBC">中国工商银行</li>
        <li value="CCB">中国建设银行</li>
        <li value="CMB">招商银行</li>
        <li value="CITIC">中信银行</li>
        <li value="SRCB">上海农村商业银行</li>
        <li value="CEB">光大银行</li>
        <li value="CMBC">中国民生银行</li>
        <li value="SPDB">上海浦东发展银行</li>
        <li value="CIB">兴业银行</li>
        <li value="PSBC">中国邮政储蓄银行</li>
        <li value="BOS">上海银行</li>
    </ul>

    <ul class="disNone" id="nav2_ul" >
        <li class="disNone">请选择充值银行</li>
        <li value="CEB">中国光大银行</li>
        <li value="CCB">中国建设银行</li>
        <li value="ABC">中国农业银行</li>
        <li value="PINGAN">平安银行</li>
        <li value="SPDB">上海浦东发展银行</li>
        <li value="CITIC">中信银行</li>
        <li value="CBHB">渤海银行</li>
        <li value="CIB">兴业银行</li>
        <li value="PSBC">中国邮政储蓄银行</li>
        <li value="BOC">中国银行</li>
        <li value="BOS">上海银行</li>
        <li value="ICBC">工商银行</li>
      </ul>
     
</div>
   
    <div class="temptMoney">
     <label>请输入充值金额</label>
      <span class="moneyBor">
      <input type="text" value="" name="amount" placeholder="请输入充值金额" />
      	元</span> </div>
           <div class="errorIllustrate" id="errorMsg" hidden="hidden"></div>
 
  <div class="mobile_sub pLR16"> <a href="javascript:void(0)" onclick="recharge()">立即充值</a></div>
</div>
</form>
</body>
</html>
 <script>
var index ="";
$('#nav_ul li').click(function(){
	 index = $(this).index();
	});

var bank = "";
$('#nav1_ul li').click(function(){
	bank=$(this).attr("value"); //获取每个li的value值

});
$('#nav2_ul li').click(function(){
bank=$(this).attr("value"); //获取每个li的value值

});

function recharge(){
	if(index==0|| index==""){
		alert("请选择充值方式")
		return;
	}
	if(bank==null ||bank==""){
		alert("请选择银行");
		return;
	}else{
		var isNum = /^\d+(\.\d{0,9})?$/;
	  	var isNum1= /^\d+(\.\d{0,2})?$/;
	  	var isNum2=/^([1-9][\d]{0,7}|0)(\.[\d]{0,2})?$/;;
        var money = $("input[name='amount']").val();
        if(money<1){
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请充值金额大于1!");
    		$("#errorMsg").show();
        	//alert("请充值金额大于1");
        	return;
        }
   
        if(!isNum.test(money)){
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请输入正确的金额!");
    		$("#errorMsg").show();
            //alert("请输入正确的金额");
            return;
        } 
        if(!isNum1.test(money)){
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请只保留两位小数!");
    		$("#errorMsg").show();
        	 //alert("请只保留两位小数");
	            return;
        }
        if(!isNum2.test(money)){
        	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请输入金额小于9位!");
    		$("#errorMsg").show();
            //alert("请输入正确的金额");
            return;
        }  
    
    $("#errorMsg").html("");
	$("#bank").val(bank);
	if(index==2){
		$("#gateBusiId").val("QP");
		$("#form").submit();
	}else{
		$("#form").submit();
	}
	
	}
}

</script>

