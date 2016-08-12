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
<script src="${css_imagedomain}/move/js/zepto.min.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/iscroll.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/jquery.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/creat.js"></script>
</head>
<body>
<div class="wapOutside">
  <div class="header"><a class="arrowLeft" href="${project_name}/user/center/accountall.do"></a>
    <h1>渠道返佣</h1>
  </div>
  <div class="fycMenu">
	  <span onclick="recommend()" class="on" >我要推荐</span>
	  <span onclick="rebate()">返佣结算</span>
  </div>
  <div class="fycConList">
    <div class="jiesuan">
      <ul>
        <li>
          <p class="name"><span><b class="moneyIcon"></b>我推荐的返佣</span>佣金总额</p>
          <p class="money">
          	<span>
	          	<!-- 判断金额是否为空 -->
	            <c:if test="${rebateSum.val != null}">${rebateSum.val}</c:if>
	            <c:if test="${rebateSum.val == null}">0</c:if>
          	</span>元
          </p>

        </li>
        <li>
          <p class="name"><span><b class="yongIcon"></b>我要赚取佣金</span>我的邀请码：<i><input name="" type="text"  class="span_num" id="con0" value="${inviteCode }"></i></p>
          <!-- <p class="money mobile_sub"><a href="javascript:void(0)" onclick="addr()">点击复制</a></p> -->
           <p class="money mobile_sub copyConA"><a href="javascript:void(0)" >点击复制</a></p>
        </li>
      </ul>
      <div class="mobile_sub pLR16"><a href="invintFriend.do" >立即邀请</a> </div>
    </div>
    <div class="fanyong disNone">
      <div class="allMoney">
	      <c:if test="${total[0].total != null}">
	      <div class="total" >
		      <span>${total[0].total}<b>元</b></span>
		  </div>
		                总计
	      </c:if>
	      <c:if test="${total[0].total == null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无记录！
		  </c:if>
      </div>
      <ul>
	       <c:forEach items="${page.result}" var="pc">
		        <li>
		          <p><span><b>${pc.VALUE }</b>元</span><fmt:formatDate value="${pc.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm" /></p>
		              ${pc.A_NAME }</li>
		        <li>
	       </c:forEach>
      </ul>
    </div>
  </div>
  
<div class="floatAll disNone">
    <div class="firstCon">
      <div class="tt">你已复制到剪贴板</div>
    </div>
    <div class="btn">知道了</div>
  </div>
  
  <%-- <div class="floatAllImg disNone">
    <div class="firstCon">
      <div class="imgName"><img src="${css_imagedomain}/move/images/evm1.png"/></div>
    </div>
    <div class="btn">知道了</div>
  </div> --%>
  <div class="floatBBg1"></div>
</div>
</body>
</html>
<script type="text/javascript">
	
	$(function(){	
		$('.copyConA a').click(function(){
			
			var nIndex=$(this).index();
			//获取邀请码的value
			var e=document.getElementById("con"+nIndex);
			var inviteCode = e.value;//获取验证码的值
			var url="http://"+location.host+"/toReg?inviteCode="+inviteCode;//链接地址
			//alert(url);
			$(".span_num").val(url);
			//拼接链接
			e.select();
			document.execCommand("Copy");
			//显示邀请码
			$(".span_num").val(inviteCode);
			$('.floatAll').removeClass('disNone');
			$('.floatBBg1').css('display','block');
		});
	})
	
		//返佣结算链接地址
		function rebate(){
			location.href="rebateSum";
	    }
		//我要推荐链接地址
		function recommend(){
			location.href="channelFyc";
	    }
		
		//给图片复制链接
		function weixin()
		{
			
		}
					
	  
</script>