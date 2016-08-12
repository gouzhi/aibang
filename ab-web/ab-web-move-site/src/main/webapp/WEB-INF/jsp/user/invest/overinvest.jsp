<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="${css_imagedomain}/move/js/zepto.mdater.js"></script>
</head>
<body>
<div class="wapOutside">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="invistBack"></a>
    <h1>我的投资</h1>
  </div>
  <div class="myInvestMenu">
    <ul>
      <li onclick = "having()">持有中投资</li>
      <li onclick = "over()" class="on">已结清投资</li>
      <li onclick = "record()">申请记录</li>
    </ul>
  </div>
  <!--<div class="investDate">
    <input class="in" type="text" placeholder="选择时间" readonly />
    <input class="in" type="text" placeholder="选择时间" readonly />
  </div>-->
  <div class="myInvesCons">
  <c:forEach items="${overList }" var="item">
   <div class="myInvestList">
      <dl>
        <dt>${item.B_NAME }<span>${item.BORROW_APR }%| ${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'月':'天'}</span></dt>
        <dd>
          <p>
          <span>${item.TENDER_ACCOUNT }</span>
            <label>投资金额（元）</label>
            </p>
          <p>
           
            <span>${item.RECOVER_INTEREST }</span>
             <label>实际收益（元）</label></p>
          <p>
          <span><fmt:formatDate value="${item.RECOVER_YESTIME }" pattern="yyyy-MM-dd"/></span>
            <label>投资结束日</label>
            </p>
        </dd>
    
    </div>
    </c:forEach>
       <c:if test="${empty overList }">
   
     <li style="text-align: center"><span>暂时没有记录</span></li>
    </c:if>
  </div>
</div>
</body>
</html>
<script type="text/javascript">
$('.in').mdater({
	minDate : new Date(2015, 2, 10)
});
</script>
<script>
function having(){
	location.href = "${project_name}/user/invest/havingInvest?a="+Math.random();
}
function record(){
	location.href = "${project_name}/user/invest/recordInvest?a="+Math.random();
}
function over(){
	location.href = "${project_name}/user/invest/overInvest?a="+Math.random();
}
$("#invistBack").click(function(){
	location.href = "${project_name}/user/center/accountall";
})
</script>