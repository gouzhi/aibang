<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
    <title>华金所_项目详情</title>
	<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
	<script src="${css_imagedomain}/move/js/zepto.min.js"></script>
	<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
   <div class="wapOutside whithBg">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>项目详情</h1>
  </div>
  <div class="proDetailsBg">
    <ul class="detailCon">
      <li class="name">${borrow.bname}</li>
      <li class="time"> 发布时间：<fmt:formatDate value="${borrow.verifyTime}" pattern="yyyy-MM-dd"/></li>
    </ul>
    <div class="proDetailYield"><span><b><fmt:formatNumber value="${borrow.borrowApr}" pattern="#0.00#"/></b>％</span> 预期年化收益率</div>
    <ul class="proDetMTB">
      <li><span><b>${borrow.account}</b>元</span>资金规模</li>
      <li><span><b>满标后T+1</b></span>起息日</li>
      <li><span><b>${borrow.borrowPeriod}</b>${borrow.repayType==1?'个月':'天'}</span>投资期限</li>
    </ul>
    <ul class="proDetailWay">
      <li>
        <label>回款方式：</label>
        <c:forEach items="${repayconfigs}" var="item">
               <c:if test="${borrow.repayType == item.code}">
                   ${item.cname}
               </c:if>
          </c:forEach>
      </li>
      <li>
        <label>担保方式：</label>
        100%本息担保
      </li>
    </ul>
    <div class="detailMenu"> <a href="javascript:void(0)" class="on">产品详情</a> <a href="javascript:void(0)">企业信息</a> <a href="javascript:void(0)">担保详情</a> <a href="javascript:void(0)">风险控制</a> </div>
    <div class="detailConList">
      <div class="list1">
         <p>
         ${borrow.porjectRemark}
         </p> 
      </div>
      <div class="list2 disNone">
         <p>
         ${borrow.borrowUserRemark}
         </p>
      </div>
      <div class="list3 disNone">
         <p>
         ${borrow.vouchRemark}
         </p>
      </div>
      <div class="list4 disNone">
         <p>
         ${borrow.windControl}
         </p>
      </div>
    </div>
  </div>
  <jsp:useBean id="now" class="java.util.Date" />
  <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>
  <fmt:formatDate value="${borrow.tenderEndTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="tenderEndTime"/>
  <fmt:formatDate value="${borrow.tenderStartTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="tenderStartTime"/>
  <c:if test="${borrow.verifyStatus eq 2 && today >= tenderStartTime && today <= tenderEndTime && borrow.borrowAccountYes lt borrow.account}">
     <p class="mobile_sub proDetailBtn"><a href="javascript:;" onclick="invite()">立即投资</a></p>
  </c:if>
  <c:if test="${(borrow.verifyStatus eq 3 || borrow.verifyStatus eq 6||borrow.verifyStatus eq 12 || borrow.verifyStatus eq 13 || borrow.verifyStatus eq 4) || (borrow.verifyStatus eq 2 && today > tenderEndTime) || (borrow.verifyStatus eq 2 && borrow.tenderScale eq 100 ) }">
           <p class="btnGray proDetailBtn"><a href="javascript:;">投资结束</a></p>
  </c:if>                     
  <c:if test="${borrow.verifyStatus eq 5 || borrow.verifyStatus eq 11}">
           <p class="btnGray proDetailBtn"><a href="javascript:;">还款中</a></p>
  </c:if>
  <c:if test="${borrow.verifyStatus eq 8 || borrow.verifyStatus eq 10}">
            <p class="btnGray proDetailBtn"><a href="javascript:;">已结清</a></p>
  </c:if>
  <c:if test="${borrow.verifyStatus eq 2 && today < tenderStartTime }">
            <p class="btnGray proDetailBtn">
                 <a href="javascript:;" class="formatTime"></a>
            </p>
  </c:if>
</div>

  <script>
	function invite(){
		$.ajax({ 
		    type: "POST", 
		    url: "isOpenChinaPNR.do",
		    dataType:'json',
			cache: false,
		    success: function(data){
		 	        if(data==1){//立即投资
		 	           window.location.href="${project_name}/borrowInfo/invest?borrowId=${borrow.id}";
					}else if(data==0){//未开通汇付账号
			 	       window.location.href="${project_name}/user/customer/toActivateName";
					}else if(data==2){//未登陆
			 	       window.location.href="${project_name}/login";
					}
		    } 
		});
	}
	
	 function timer(intDiff){
		 var str="";
         window.setInterval(function(){
                 var day=0,
                     hour=0,
                     minute=0,
                     second=0;//时间默认值
                     var mi =60;  
 					 var hh = mi * 60;  
 					 var dd = hh * 24;  
             if(intDiff > 0){
                 day =Math.floor(intDiff / (dd));
                 hour = Math.floor((intDiff - day * dd) / hh);
			     minute = Math.floor((intDiff - day * dd - hour * hh) / mi);
			     second = Math.floor(intDiff - day * dd - hour * hh - minute * mi);
             }
             if (minute <= 9) { minute = '0' + minute;}
             if (second <= 9) {second = '0' + second;}
                if(day>0){
			    	str=str+day+"天";
			    }
			    if(hour>=0){
			    	str=str+hour+'时';
			    }
			    if(minute>=0){
			    	str=str+minute+'分';
			    }
			    if(second>=0){
			    	str=str+second+'秒';
			    }
             $(".formatTime").html(str);
             intDiff--;
             str="";
         }, 1000);
     }
	 
	 $(function(){
		  if(0!='${intDiff}'){
			 var intDiff=${intDiff};
	         timer(intDiff);
		 } 
        
     });

</script>
</body>

</html>