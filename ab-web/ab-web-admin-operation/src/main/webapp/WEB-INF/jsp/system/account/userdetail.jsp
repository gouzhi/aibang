<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>用户账户详细</title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
	    <link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${css_imagedomain}/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific ugin styles -->
		<!-- ace styles --> 
		<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="css/ace-ie.min.css" />
		<![endif]-->
        <link rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
        <script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
	</head>
<body>
 
<div class="center">
	<form>
        <div class="row-fluid">
            <div class="span12">用户详情</div>
        </div>
		<div class="row-fluid">
		    <div class="span2 pL35">用户名：</div>
			<div class="span2">
				${userDetail.USERNAME }
				
			</div>
			<div class="span2 pl">真实姓名：</div>
			<div class="span2">
				${userDetail.REALNAME }
			</div> 
			<div class="span2 pl">性别：</div>
			<div class="span2">
				<c:choose>
				  <c:when test="${userDetail.SEX =='1'}">男</c:when>
				  <c:when test="${userDetail.SEX =='0'}">女</c:when>
				  <%-- <c:otherwise>暂无</c:otherwise> --%>
				</c:choose>
			</div> 
		</div>
		<div class="row-fluid">
		    <div class="span2 pL48">邮箱：</div>
               <div class="span4">
                   <div class="span9">   ${userDetail.EMAIL }
                   </div>
                   <div class="span3">
                   <c:choose>
                    <c:when test="${userDetail.EMAIL_STATUS =='1'}"><span class="autOk">已认证</span></c:when>
				    <c:when test="${userDetail.EMAIL_STATUS =='0'}"><span class="autNo">未认证</span></c:when>
                   </c:choose>
                   </div>
               </div>
			<div class="span2 pL52">
               	<div class="span3"></div>
               	手机：
            </div>
			<div class="span4">
                   <div class="span9">
                       ${userDetail.PHONE }
                   </div>
                   <div class="span3">
                     <c:choose>
                    <c:when test="${userDetail.PHONE_STATUS =='1'}"><span class="autOk">已认证</span></c:when>
				    <c:when test="${userDetail.PHONE_STATUS =='0'}"><span class="autNo">未认证</span></c:when>
                   </c:choose>
                   </div>
               </div>
	     </div>
		<div class="row-fluid">
			    <div class="span2 pl">注册时间：</div>
				<div class="span4">
				   <fmt:formatDate value="${userDetail.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
				<div class="span3 pl">最后登录时间：</div>
				<div class="span3">
					<fmt:formatDate value="${userDetail.LAST_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div> 
	     </div>
        <div class="row-fluid">
            <div class="span12">账号资金</div>
        </div>
        <div class="row-fluid">
			<div class="span2 pl">可用金额：</div>
			<div class="span4">
				${userDetail.AVL_BALANCE }元
			</div>
			<div class="span2 pL35">总金额：</div>
			<div class="span4">
				${userDetail.TOTAL }元
			</div>
		</div>
		<div class="row-fluid">
			<div class="span2 pl">冻结金额：</div>
			<div class="span4">
				${userDetail.FROST }元
			</div>
			<div class="span2 pl">待收金额：</div>
			<div class="span4">
				${userDetail.AWAIT }元
			</div>
		</div>
    </form>
</div>
</body>
</html>
