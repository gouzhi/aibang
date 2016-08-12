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
		<div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
			<h1>确认信息</h1>
		</div>
		<div class="invesInfo pLR9">
			<dl>
				<dt>投资信息</dt>
				<dd>
					<p>
						<label>项目名称/编号：</label>
						${borrow.bname }：${borrow.id}</p>
					<p>
						<label>预计年化收益率：</label>
						<fmt:formatNumber value="${borrow.borrowApr }" pattern="#.00#"/>%</p>
					<p>
						<label>期限：</label>
						${borrow.borrowPeriod}${borrow.repayType==1?'月':'天'}</p>
					<p>
						<label>起息日：</label>
						<fmt:formatDate value="${borrow.borrowStartTime }" pattern="yyyy年MM月dd日"/></p>
					<p>
						<label>获取收益方式：</label>
						<c:forEach items="${repayconfigs}" var="item">
							<c:if test="${borrow.repayType == item.code}">
								<span>${item.cname}</span>
							</c:if>
						</c:forEach></p>
				</dd>
			</dl>
		</div>
		<div class="payInfo pLR9">
			<dl>
				<dt>付款信息</dt>
				<dd>
					<div><span><fmt:formatNumber value="${account}" pattern="#.00#"/>元</div>
					<p>
						<input id="ischecked" type="checkbox" value="" checked>本人已阅读<a href="risk_info">《投资风险说明书》</a>及<a href="loan_info">《借款协议》</a><a href="${css_imagedomain}/move/contract/dzqz.html">《华金所电子合同和用户电子签章使用及服务协议》</a>，并已完全理解和接受上述文件的全部内容。本人的投资决策完全是基于本人的独立自主判断做出，并自愿承担投资标的资产所产生的相关风险和全部后果</p>
				</dd>
			</dl>
		</div>
		<div class="mobile_sub pLR9"> <a href="javascript:void(0)" onclick="next()">下一步</a></div>
	</div>
	</body>
</html>
<script type="text/javascript">
	function next(){
		if($("#ischecked").is(":checked")){
			window.location.href="confirmPay";
		}else{
			alert("请同意《投资风险说明书》,《质押借款协议》和《华金所电子合同和用户电子签章使用及服务协议》");
		}

	}
</script>