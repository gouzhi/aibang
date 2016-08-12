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
<form name="form" id="form" action="recharge" method="post">
<input type="hidden" name="quickBank" value="${BankId }">
<input type="hidden" name="gateBusiId" value="QP"/>
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>充值</h1>
  </div>
  <div class="rechargeLost">
    <p class="pCon1">账户可用余额：</p>
    <p class="pCon2"><b>${userBase.avlBalance}元</b></p>
  </div>
  <div class="recharge">
    <div class="rechargeBank">
    <div class="bankLogo"><img src="${css_imagedomain}/move/images/bank/${ BankId}.jpg" /></div>
    <div class="bankCard">${fn:substring(cardId,0,4)}************${fn:substring(cardId,cardId.length()-4,cardId.length())}</div>
    <div class="bankName">
    <c:if test="${BankId=='ABC' }">农业银行</c:if>
    <c:if test="${BankId=='CCB' }">建设银行</c:if>
    <c:if test="${BankId=='BOC' }">中国银行</c:if>
    <c:if test="${BankId=='CEB' }">光大银行</c:if>
    <c:if test="${BankId=='CIB' }">兴业银行</c:if>
    <c:if test="${BankId=='CITIC' }">中信银行</c:if>
    <c:if test="${BankId=='PINGAN' }">平安银行</c:if>
    <c:if test="${BankId=='BOS' }">上海银行</c:if>
    <c:if test="${BankId=='CBHB' }">渤海银行</c:if>
    <c:if test="${BankId=='PSBC' }">邮储银行</c:if>
    <c:if test="${BankId=='SPDB' }">浦发银行</c:if>
    <c:if test="${BankId=='ICBC' }">工商银行</c:if>
    | 快捷卡</div>
    </div>
    <div class="temptMoney">
    <label>请输入充值金额</label>
    <span class="moneyBor">
      <input type="text" value=""  name ="amount" placeholder="请输入充值金额" />
      <span>元</span> </div>
      <div class="errorIllustrate" id="errorMsg" hidden="hidden"></div>
      <!-- <div id="validate1" style="color:red" value=""></div> -->
  </div>
  <div class="mobile_sub pLR16"> <a href="javascript:void(0)" onclick = "recharge()">立即充值</a></div>
</div>
</form>
</body>
</html>

<script>
function recharge(){
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
    	//$("#validate1").html("请输入正确的金额");
        //alert("请输入正确的金额");
        return;
    } 
    if(!isNum1.test(money)){
    	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请只保留两位小数!");
		$("#errorMsg").show();
    	//$("#validate1").html("请只保留两位小数");
    	 //alert("请只保留两位小数");
            return;
    }
    if(!isNum2.test(money)){
    	$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"请输入金额小于9位!");
		$("#errorMsg").show();
    	//$("#validate1").html("请输入金额小于9位");
        //alert("请输入正确的金额");
        return;
    }  
    $("#errorMsg").html("");
	$("#form").submit();
}
</script>