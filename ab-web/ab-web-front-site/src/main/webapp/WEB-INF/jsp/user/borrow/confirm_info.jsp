<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
<title>确认信息 - 华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/sureComplete.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${css_imagedomain}/front/js/pullNav.js"></script>
<style>
    .spanText{border-bottom:1px solid #e8e8e8;padding-top:46px;margin-bottom:15px;text-align:center;overflow:hidden;}
    .spanText span {display: inline-block;height: 64px; line-height: 64px;padding: 0 8px 0 42px; font-size: 20px;color: #ababab; }
    .spanText i{display: inline-block; width: 7px;height: 12px;background: url(${css_imagedomain}/front/images/ico_next.png) no-repeat 0 center; margin: 0 50px 0 32px;}
    .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_01.png) no-repeat 8px center;  border-bottom: 2px solid #f27267;color:#383838;}
    .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_2.png) no-repeat 8px center;}
    .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_3.png) no-repeat 8px center;}
    .spanText .sp4{background: url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}
</style>
</head>

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--确认信息主体-->
<div class="confirm">
	<!--<div class="information">-->
    <div class="newWidBg">
    	<!--<img src="${css_imagedomain}/front/images/information.png" width="450" height="50" />-->
        <!--<ul class="newsNums">
            <li class="on">
                <span><b class="bbg1"></b>确认信息</span><i>&gt;</i>
            </li>
            <li>
                <span><b class="bbg2"></b>支付确认</span><i>&gt;</i>
            </li>
            <li>
                <span><b class="bbg3"></b>完成</span>
            </li>
        </ul>-->

        <div class="spanText">
            <span class="sp1 active">确认信息</span>
            <i></i>
            <span class="sp2">支付确认</span>
            <i></i>
            <span class="sp3">完成</span>
        </div>

        <h3 class="newsH3Tt"><span></span>投资信息</h3>
        <!--<ul class="informUl">-->
        <ul class="informList319">
        	<li>
            	<span class="spTitle">投资名称/编号:</span>
                ${borrow.bname }：${borrow.id}
            </li>
            <li>
            	<!--<div class="informList">-->
            		<span class="spTitle">预计年化收益率：</span>
                	<fmt:formatNumber value="${borrow.borrowApr }" pattern="#.00#"/>%
                <!--</div>-->
                </li>
            <li>
                <!--<div class="informList informT">-->
            		<span class="spTitle">期限：</span>
                	${borrow.borrowPeriod}${borrow.repayType==1?'月':'天'}
                <!--</div>-->
            </li>
            <li>
            	<!--<div class="informList">-->
            		<span class="spTitle">起息日：</span>
                	<fmt:formatDate value="${borrow.borrowStartTime }" pattern="yyyy年MM月dd日"/>
               <!-- </div>-->
                </li>
            <li>
                <!--<div class="informList informT">-->
            		<span class="spTitle">获取收益方式：</span>
            		<c:forEach items="${repayconfigs}" var="item">
            			<c:if test="${borrow.repayType == item.code}">
            				${item.cname}
            			</c:if>
            		</c:forEach>
                <!--</div>-->
            </li>
        </ul>
        <div class="newsLine"></div>
        <h3 class="newsH3Tt"><span></span>付款信息</h3>
        <!--<div class="amount">投资金额：<span><fmt:formatNumber value="${account}" pattern="#.00#"/>元</span></div>-->
        <ul class="informList319">
            <li class="fontOrange">
                <span class="spTitle">投资金额：</span><fmt:formatNumber value="${account}" pattern="#.00#"/><i style="font-size:20px;color: #383838;">&nbsp;元</i>
            </li>
        </ul>
        <div class="newsLine"></div>
         <div class="readOk">
        	<span><input type="checkbox" id="ischecked" checked="checked"/></span>
            <!--<p class="fl shuoming">-->本人已阅读<a href="risk_info" target="_blank">《投资风险说明书》</a>及<a href="loan_info" target="_blank">《华金所用户借款与服务协议》</a>，并同意<a href="" target="_blank">《华金所电子合同和用户电子签章使用及服务协议》</a>  中关于“投资项目募集资金满额后，用户授权华金所在投资相关协议上使用自己的CA认证，自动完成合同签署”的规定。
        </div>
        <div class="readOk" style="padding:0 186px 40px 210px">本人完全理解和接受上述文件的全部内容。本人的投资决策完全是基于本人的独立自主判断做出，并自愿承担投资标的资产所产生的相关风险和全部后果。</div>


       <div class="nextBtn319"> <a href="javascript:void(0)" onclick="next()">下一步</a></div>
    </div>
</div>
<!--确认信息主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>
<script type="text/javascript">
function next(){
	if($("#ischecked").is(":checked")){
		window.location.href="confirmPay";
	}else{
		alert("请同意《投资风险说明书》及《华金所用户借款与服务协议》");
	}
	
};
</script>