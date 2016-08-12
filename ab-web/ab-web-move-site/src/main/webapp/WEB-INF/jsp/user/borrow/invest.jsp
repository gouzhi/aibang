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
	<form id="myForm" method="post" action="${project_name}/user/investment/confirmInfo.do">
		<input name="borrowId" type="hidden" value="${borrow.id}"/>
	<div class="wapOutside whithBg">
		<div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
			<h1>${borrow.bname}</h1>
		</div>
		<div class="investAmount">可投金额：${enableAmount}</div>
		<div class="yieldMaturity">到期收益：￥<span id="allAccount"></span></div>
		<div class="investForm">
			<p class="form1">
				<input name="account" id="amountBtn" type="text"  onblur="calAmount()" <c:choose><c:when test="${borrow.tenderAccountMin>enableAmount}">value="${enableAmount}"   readonly="readonly" </c:when><c:otherwise>placeholder="${borrow.tenderAccountMin}元起投,以${borrow.tenderAccountStep}元为单位递增" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"</c:otherwise></c:choose> maxlength="8">
				元</p>
			<div class="errorIllustrate" id="errorMsg" hidden="hidden"></div>
			<p class="form2">
				<input name="" type="checkbox" value="" checked id="agreeBtn">我同意<a href="${project_name}/borrowInfo/serAgreement.do"><span>《华金所服务协议》</span></a>
			</p>
		</div>
		<div class="mobile_sub pLR9"> <a href="javascript:void(0)" id="investBtn">立即投资</a></div>

	</div>
	</form>
	</body>
<script>
	$(function(){

		$("#investBtn").click(function(){
			if(!$("#agreeBtn").attr("checked")){
				alert("请阅读并同意《华金所服务协议》");
				return false;
			}
			if(${sessionUser!=null}){
				var amount=$("#amountBtn").val();
				var amountMin=${borrow.tenderAccountMin};
				var amountStep=${borrow.tenderAccountStep};
				var enableAmount=${enableAmount};
				var subAmount=amount-amountMin;
				if((amount<=enableAmount && subAmount%amountStep==0 && amount>=amountMin && amountMin<=enableAmount)||(amountMin>enableAmount && amount<=enableAmount)){
					$.ajax({
						type: "POST",
						url: "goToValidation.do",
						data:{
							"account":$("#amountBtn").val(),
							"loginId":'${sessionUser.id}',
							"userId":'${sessionUserCustomer.hjsUserBase.id}'
						},
						dataType:'json',
						cache: false,
						success: function(data){
							if(data.result==1){
								alert("账户可用余额不足");
								window.location.href="${project_name}/user/recharge/main";
							}else if(data.result==2){
								$("#myForm").submit();
							}else if(data.result==3){
								window.location.href="${project_name}/login.do";
							}
						}
					});

				}
			}else{
				window.location.href="${project_name}/login.do";
			}

		});

	});
	function calAmount(){
		var enableAmount=${enableAmount};
		var amount=$("#amountBtn").val();
		var amountMin=${borrow.tenderAccountMin};
		var amountStep=${borrow.tenderAccountStep};
		var subAmount=amount-amountMin;
		if((amount<=enableAmount && subAmount%amountStep==0 && amount>=amountMin && amountMin<=enableAmount)||(amountMin>enableAmount && amount<=enableAmount)){
			$("#errorMsg").hide();
			$("#investBtn").prop('disabled',false);
			var condi = {
				"account":$("#amountBtn").val(),
				"id":'${borrow.id}'
			}
			$.ajax({
				url:"getAppr.do",
				type:"post",
				data:condi,
				dataType:"json",
				success:function(result){
					$("#allAccount").html(result);
				}
			});

		}else if(amount>enableAmount){

			$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"投资金额不能超过可投金额!");
			$("#errorMsg").show();
			$("#allAccount").html("");
			$("#investBtn").prop('disabled',true);
		}else if(amount>amountMin && subAmount%amountStep!=0 ){
			$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"金额必须等于\"递增金额${borrow.tenderAccountStep}的整数倍+起投金额${borrow.tenderAccountMin}\"");
			$("#errorMsg").show();
			$("#allAccount").html("");
			$("#investBtn").prop('disabled',true);
		}else if(amount<amountMin && amountMin<=enableAmount){
			$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"起投金额为"+amountMin);
			$("#errorMsg").show();
			$("#allAccount").html("");
			$("#investBtn").prop('disabled',true);
		}
	}
</script>
</html>