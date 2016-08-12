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

<body>
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
                        <span class="spanRight fr">已结清</span>
                    </div>
                    <div class="billList">
                    	<span>项目本金：<i>${borrowTender.TENDER_ACCOUNT }</i>元</span>
                        <span>年化收益率：<i>${borrowTender.BORROW_APR }</i>%</span>
                        <span>总期限：${borrowTender.BORROW_PERIOD}${borrowTender.REPAY_TYPE==1?'月':'天'}</span>
                    </div>
                </div>
                <div class="projectList clear">
                	<div class="listLeft fl">
                    	<p>已结清：<span><i>${ account}</i>元</span></p>
                        <div>
                        	<span>本金：<i>${borrowTender.TENDER_ACCOUNT }</i>元</span>
                            <span>收益：<i>${account- borrowTender.TENDER_ACCOUNT}</i>元</span>
                        </div>
                    </div>
                    
                </div>
                <div class="projectList">
                	<div class="returnTime">
                    	已于<span>
                    	<fmt:formatDate value="${borrowTender.RECOVER_YESTIME }" pattern="yyyy-MM-dd "/> </fmt> </span>，收到<span>${account  }</span>元
                    </div>
                </div>
                 <!--<div class="projectList">
                 	<div class="history">
                    	<p>操作历史</p>
                        <div><span><b>${VERIFY_TIME}</b>投资成功</span></div>
                    </div>
                </div>-->
                <div class="projectList">
                 	<div class="history">
                    	<%--<p>相关协议<c:choose><c:when test="${borrowTender.CONTRACT_URL!=null&&borrowTender.CONTRACT_URL!=''}"><a href="${imagedomainpublic}${borrowTender.CONTRACT_URL}" target="_blank">借款协议</a></c:when><c:otherwise><a href="${project_name}/user/investment/borrowAgreement?tenderId=${borrowTender.ID}" target="_blank">借款协议</a></c:otherwise></c:choose></p>--%>
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