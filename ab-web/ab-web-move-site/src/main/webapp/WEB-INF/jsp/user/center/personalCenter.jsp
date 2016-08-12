<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
	</head>
	

<script type="text/javascript">
   var flag=${flag};
     if(flag){
	     setTimeout("window.location.href='${project_name}/user/center/accountall'",500);	
}

</script>
<body >
<input id="nav_point" type="hidden" value="个人中心">
<div class="wapOutside">
  <div class="personName">
    <dl>
      <dt>
      		<c:if test="${empty userInfo.headPic }">
              <img src="${css_imagedomain}/move/images/img1.jpg" />
            </c:if>
            <c:if test="${!empty userInfo.headPic }">
              <img src="${imagedomainpublic}${userInfo.headPic }"/>
            </c:if>
      </dt>
      <dd>
        <p class="name1">${loginUser.username }，您好</p>
        <p class="heartList">
        	<span class="glyphicon-star-empty on"></span>
        	<span class="glyphicon-star-empty on"></span>
       		<c:choose>  
			   <c:when test="${safeLevel gt 2}">
			   	    <span class="glyphicon-star-empty on"></span>
			   </c:when>
			   <c:otherwise>
			   		<span class="glyphicon-star-empty"></span>
			   </c:otherwise>  
			</c:choose>
			<c:choose>  
			   <c:when test="${safeLevel gt 3}">
			   	    <span class="glyphicon-star-empty on"></span>
			   </c:when>
			   <c:otherwise>
			   		<span class="glyphicon-star-empty"></span>
			   </c:otherwise>  
			</c:choose>
			<c:choose>  
			   <c:when test="${safeLevel gt 4}">
			   	    <span class="glyphicon-star-empty on"></span>
			   </c:when>
			   <c:otherwise>
			   		<span class="glyphicon-star-empty"></span>
			   </c:otherwise>  
			</c:choose> 
        </p>
      </dd>
    </dl>
    <div class="moneys">账户可用余额：<span>${userBase.avlBalance }</span>元</div>
    <div class="moneysBtn"><a onclick="cash()" class="aYellowBg">提现</a> <a onclick="recharge()" class="aBlueBg">充值</a></div>
  </div>
  <div class="personalList">
    <p><a href="${project_name}/user/invest/havingInvest">我的投资<span class="arrowRight"></span></a></p>
    <p><a href="${project_name}/user/account/findAccountList">资金记录<span class="arrowRight"></span></a></p>
    <p><a href="${project_name}/user/actbonususers/unuse?usestatus=0">活动奖励<span class="arrowRight"></span></a></p>
    <p><a href="${project_name}/user/actbonususers/channelFyc">渠道返佣<span class="arrowRight"></span></a></p>
    <p><a href="${project_name}/user/customer/toSafe">账户安全<span class="arrowRight"></span></a></p>
  </div>
  <div class="personalSafe">
    <p><a href="${project_name}/user/customer/logout">退出登录</a>
</p>  </div>
	  <%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</div>

</body>
<script type="text/javascript">
function recharge(){
	 if('${userBase.usrCustId}'){
		 location.href="${project_name}/user/recharge/main";
	 }else{
		 location.href="${project_name}/user/customer/toActivateName";
		 //$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"您未开通第三方托管账户，请先开通后再进行操作。");
		 //$("#errorMsg").show();
	 }
}
function cash(){
	 if('${hasBank}'== 'true'){
		 location.href="${project_name}/user/cash/cash";
	 }else{
		 if('${!hasHF}'=='true'){
			 location.href="${project_name}/user/customer/toActivateName";
			 //$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"您未开通第三方托管账户，请先开通后再进行操作。");
			 //$("#errorMsg").show();
		 }else if('${!hasBank}'=='true'){
			 location.href="${project_name}/user/customer/toBindBank";
			 //$("#errorMsg").html("<span><img src='${css_imagedomain}/move/images/errorIcon.png'/></span>"+"您还没有绑定银行卡，请先绑定后再进行提现操作。");
			 //$("#errorMsg").show();
		 }
		 
	 }
}
</script>
</html>