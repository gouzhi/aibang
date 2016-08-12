<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>渠道返佣</title>
<link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
<script src="${css_imagedomain}/front/js/jquery-1.9.1.min.js"></script>
<script src="${css_imagedomain}/common/js/common.js"></script>

</head> 

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
     <div id="nav_point" class="icoPoint">
		 <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span>渠道返佣</span>
     </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
	<form action="rebateSum.do" method="post" id="form">
    <div class="account-Right fl">
		<div class="crumbNav329">渠道返佣</div>
    	<div class="whiteR329">
        	<div class="channelTab">
            	<span onclick="recommend()" >我要推荐</span>
                <span onclick="rebate()" class="channelActive">返佣结算</span>
            </div>
            <div class="channelList" style="display:block;">
            	<table class="channelList-head">
                	<tr>
                    	<th class="channelSp1">时间</th>
                        <th class="channelSp2">税前金额（元）</th>
                        <th class="channelSp3">备注</th>
                    </tr>
                    <c:forEach items="${page.result}" var="pc">
	                	<tr class="channelList-Ul" >
	                    	<td class="channelSp1"><fmt:formatDate value="${pc.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm" /></td>
		                    <td class="channelSp2">${pc.VALUE }</td>
		                    <td class="channelSp3">${pc.A_NAME }</td>
	                    </tr>
                    </c:forEach>
					</table>
					<c:if test="${total[0].total != null}">
						<div class="total" >
		                	<span class="channelSp1">总计</span>
		                    <span class="channelSp2">${total[0].total} 元</span>
	                    </div>
					</c:if>
					<c:if test="${total[0].total == null}">
						<div style="width: 900px;height:150px;line-height: 150px; text-align:center;">暂无记录！</div>
					</c:if>
               <%--  <div class="total" >
                	<span class="channelSp1">总计</span>
                    <span class="channelSp2">
	                    <!-- 判断金额是否为空 -->
	            		<c:if test="${total[0].total != null}">${total[0].total}</c:if>
	            		<c:if test="${total[0].total == null}">0</c:if>
                                                  元</span>
                </div> --%>
	            <div class="pagination" style="width:900px;margin-left:-50px;">
						${page.frontPageStr} 
				</div>
            </div>
        </div>
    </div>
    </form>
</div>
<!--渠道返佣 End-->

<script type="text/javascript">
	
	
      //返佣结算链接地址
	  function rebate(){
			location.href="rebateSum";
	  }
	
	  //提交
	  function submitForm()
	  {
		  $("form").submit();
	  }
	//我要推荐链接地址
	function recommend(){
		location.href="rebate";
	}
</script>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>