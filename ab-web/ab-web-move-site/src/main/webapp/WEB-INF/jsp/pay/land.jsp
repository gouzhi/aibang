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
	<div class="wapOutside">
					<div class="mobile_sub">
						<a onclick="onBridgeReady()">微信支付</a>
					</div>
				</div>
				<input type="text" id="appId" value="${appId }">
				<input type="text" id="timeStamp" value="${timeStamp }">
				<input type="text" id="nonceStr" value="${nonceStr }">
				<input type="text" id="packageValue" value="${packageValue }">
				<input type="text" id="paySign" value="${paySign }">
	</body>
	<script type="text/javascript">
	$(function(){
		
	});
	function onBridgeReady(){
		var appId = $("#appId").val();
		var timeStamp = $("#timeStamp").val();
		var nonceStr = $("#nonceStr").val();
		var packageValue = $("#packageValue").val();
		var paySign = $("#paySign").val();

	   WeixinJSBridge.invoke(
	       'getBrandWCPayRequest', {
	           "appId" :appId,     //公众号名称，由商户传入     
	           "timeStamp":timeStamp,         //时间戳，自1970年以来的秒数     
	           "nonceStr" : nonceStr, //随机串     
	           "package" : packageValue,     
	           "signType" : "MD5",         //微信签名方式：     
	           "paySign" : paySign //微信签名 
	       },
	       function(res){  
	    	   alert(res.err_msg);
	           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
	        	   alert("location微信支付成功!");  
	           }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
	           else{
	        	   alert("location微信支付失败!"); 
	           }
	       }
	   ); 
	}
	
	</script>
</html>