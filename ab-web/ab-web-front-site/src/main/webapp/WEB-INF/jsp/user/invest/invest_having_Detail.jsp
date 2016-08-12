<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>投资详情-华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<!-- My97DatePicker -->
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/front/My97DatePicker/skin/WdatePicker.css" />
<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/lang/zh-cn.js"></script>

</head> 

<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
 <div id="nav_point" class="icoPoint">
     <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
     <span><a href="/user/invest/investCount" style="font-size: 14px;color:#777;">我的投资</a></span>
        <i> &gt; </i>
        <span>投资详情</span>
    </div>
 <%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
   
		<div class="details">
        	<p class="titP clear">
                <span class="fl">投资详情</span>
                <a href="javascript:void(0)"  onclick="javascript: history.go(-1);" class="fr" >[返回]</a>
            </p>
            <div class="detailsProject">
            	<div class="projectList">
                	<div class="projectBill clear">
                    	<span class="spanLeft fl">${borrowTender.B_NAME }</span>
                        <a href="borrowInfo/detail.do?borrowId=${borrowTender.BORROW_ID}" class="spancenter fl">[查看项目详情]</a>
                        <i class="fl lineI"></i>
                        <span class="spanRight fl">投资中</span>
                    </div>
                    <div class="billList clear">
                    	<span class="fl"><i>${borrowTender.TENDER_ACCOUNT }</i>元<br>投资本金</span>
                        <span class="fl"><i>${borrowTender.BORROW_APR }</i>%<br>预期年化收益率</span>
                        <span class="fl"><i><c:if test="${daySub <0}">0</c:if ><c:if test="${daySub >=0}">${daySub }</c:if ></i>天<br>剩余期限</span>
                        <%-- ${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'月':'天'} --%>
                        <span class="fl"><i>${borrowTender.BORROW_PERIOD}</i>${borrowTender.REPAY_TYPE==1?'月':'天'}<br>总期限</span>
                    </div>
                </div>
                <div class="projectList clear">
                	<div class="listLeft fl">
                    	<p>已结清：<span><i>0.00</i>元</span></p>
                        <div>
                        	<span>本金：<i>0.00</i>元</span>
                            <span>收益：<i>0.00</i>元</span>
                        </div>
                    </div>
                    <div class="listRight fl">
                    	<p>待收款：<span><i>${account }</i>元</span></p>
                        <div>
                        	<span>本金：<i>${ borrowTender.TENDER_ACCOUNT}</i>元</span>
                            <span>收益：<i>${account-borrowTender.TENDER_ACCOUNT }</i>元</span>
                        </div>
                    </div>
                </div>
                <div class="projectList">
                	<div class="returnTime">
                        <i></i>预计在<span><fmt:formatDate value="${expectTime }" pattern="yyyy-MM-dd "/> </fmt> </span>将收到<span>${account  }</span>元
                    </div>
                </div>
               
                 <!--<div class="projectList">
                 	<div class="history">
                    	<p>操作历史</p>
                        <div><span><b>${VERIFY_TIME }</b>投资成功</span></div>
                    </div>
                </div>-->
                <div class="projectList">
                 	<div class="history">
                    	<%--<p>相关协议<c:choose><c:when test="${borrowTender.CONTRACT_URL!=null&&borrowTender.CONTRACT_URL!=''}"><a href="${imagedomainpublic}${borrowTender.CONTRACT_URL}" target="_blank">华金所用户借款与服务协议</a></c:when><c:otherwise><a href="${project_name}/user/investment/borrowAgreement?tenderId=${borrowTender.ID}" target="_blank">借款协议</a></c:otherwise></c:choose></p>--%>
                            <p>相关协议<c:if test="${ borrowTender.FILE_STATUS eq 1}"><a href="${ borrowTender.VIEWPDF_URL}" target="_blank">《华金所用户借款与服务协议》</a></c:if></p>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>



<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>