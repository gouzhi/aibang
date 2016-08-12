<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html >
	<head>
		<base href="${project_name}/">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
        <link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
        <script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>		
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
		<!-- 共用js -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/jquery.validation/css/validate.css">
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.metadata.js"></script>
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.validate.js"></script>
    	<script type="text/javascript" src="${css_imagedomain}/jquery.validation/validate-methods.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
		<script type="text/javascript">
    $(function(){
    	top.mainFrame.reloadPage(/usersInfo\/listU/);
    });
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
</script>
	</head>
<body>
<div class="center centerW">
	<div class="row-fluid"><input type="hidden" name="id" id="user_id" value=""/>
	    <div class="span12">基本信息</div>
	</div>
	<div class="row-fluid">
		<div class="span2 pl">用户状态：</div> 
		<div class="span6">
			<c:if test="${usersInfo.hjsUser.status ==1}">有效</c:if>
			<c:if test="${usersInfo.hjsUser.status ==2}">停用</c:if>
			<c:if test="${usersInfo.hjsUser.status ==3}">受限</c:if>
			<c:if test="${not empty blackInfo}">
				(<c:if test="${blackInfo.charge==1}">返佣受限，</c:if><c:if test="${blackInfo.limiteTender==1}">投资受限</c:if>)
			</c:if>   
		</div><br />
	    <div class="span2 pl">登陆名称：</div> <div class="span2">${usersInfo.hjsUser.username }</div>
	    <div class="span2 pl">邮箱：</div> <div class="span3">${usersInfo.hjsUser.email }</div>
	    <div class="span2 pl">生日：</div> <div class="span2"><fmt:formatDate value="${usersInfo.birthday }" pattern="yyyy-MM-dd"/></div>
	    <div class="span2 pl">注册时间：</div> <div class="span2"><fmt:formatDate value="${usersInfo.hjsUser.createTime }" pattern="yyyy-MM-dd"/></div>
	    <div class="span2 pl">简介：</div> <div class="span6">${usersInfo.introduction }</div>
	</div>
	<div class="row-fluid"><input type="hidden" name="id" id="user_id" value=""/>
	    <div class="span12">详细信息</div>
	</div>
    <div class="row-fluid">
     	<div class="span2 pl">真实姓名：</div> <div class="span2">${rn.realname }</div>
	    <div class="span2 pl">身份证号：</div> <div class="span3">${rn.cardId }</div>
	    <div class="span2 pl">所在区域：</div> <div class="span2">${usersInfo.hjsSysArea.areaName }</div>
	    <div class="span2 pl">QQ号码：</div> <div class="span2">${usersInfo.qq }</div>
	    <div class="span2 pl">血型：</div> <div class="span3">${usersInfo.blood }</div>
	    <div class="span2 pl">信仰：</div> 
	    <div class="span2">
	    	<c:choose>
	    		<c:when test="${usersInfo.faith == 0 }">未选择</c:when>
	    		<c:when test="${usersInfo.faith == 1 }">佛教</c:when>
	    		<c:when test="${usersInfo.faith == 2}">道教</c:when>
	    		<c:when test="${usersInfo.faith == 3}">基督教</c:when>
	    		<c:when test="${usersInfo.faith == 4}">天主教</c:when>
	    		<c:when test="${usersInfo.faith == 5}">伊斯兰教</c:when>
	    		<c:when test="${usersInfo.faith == 6}">无神论</c:when>
	    	</c:choose>
	    </div>
	    <div class="span2 pl">最高学历：</div> 
	    <div class="span2">
	    	<c:choose>
	    		<c:when test="${usersInfo.education == 0 }">未选择</c:when>
	    		<c:when test="${usersInfo.education == 1 }">小学</c:when>
	    		<c:when test="${usersInfo.education == 2}">初中</c:when>
	    		<c:when test="${usersInfo.education == 3}">高中</c:when>
	    		<c:when test="${usersInfo.education == 4}">大学</c:when>
	    		<c:when test="${usersInfo.education == 5}">硕士</c:when>
	    		<c:when test="${usersInfo.education == 6}">博士</c:when>
	    		<c:when test="${usersInfo.education == 7}">博士后</c:when>
	    	</c:choose>
	    </div>
	    <div class="span2 pl">毕业院校：</div> 
	    <div class="span3">${usersInfo.university}</div>
	    <div class="span2 pl">婚姻状况：</div> 
	    <div class="span2">
	    	<c:choose>
	    		<c:when test="${usersInfo.marriage == 0 }">保密</c:when>
	    		<c:when test="${usersInfo.marriage == 1}">未婚</c:when>
	    		<c:when test="${usersInfo.marriage == 2}">已婚</c:when>
	    	</c:choose>
	    </div>
    </div>
    <div class="row-fluid"><input type="hidden" name="id" id="user_id" value=""/>
	    <div class="span12">其他信息</div>
	</div>
    <div class="row-fluid">
     	<div class="span2 pl">头像：</div> <div class="span2"><img style="width:100px;height:100px;" src="${imagedomainpublic}${usersInfo.headPic }"  alert="头像图片" title="头像图片" /></div>
    </div>
    <div class="row-fluid"><input type="hidden" name="id" id="user_id" value=""/>
	    <div class="span12">资金信息</div>
	</div>
    <div class="row-fluid">
     	<div class="span2 pl">投资金额：</div> <div class="span2">${usersInfo.hjsUserBase.tenderAccount } 元</div>
	    <div class="span2 pl">可用金额：</div> <div class="span3">${usersInfo.hjsUserBase.avlBalance } 元</div>
	    <div class="span2 pl">冻结金额：</div> <div class="span2">${usersInfo.hjsUserBase.frost } 元</div>
	    <div class="span2 pl">待收金额：</div> <div class="span2">${usersInfo.hjsUserBase.await } 元</div>
	    <div class="span2 pl">现金红包：</div> <div class="span3"></div>
	    <!-- <div class="span2 pl">抵扣券：</div> <div class="span2 pl"></div>
	    <div class="span2 pl">减满券：</div> <div class="span2 pl"></div>
	    <div class="span2 pl">增利券：</div> <div class="span2 pl"></div> -->
    </div>
    <div class="row-fluid"><input type="hidden" name="id" id="user_id" value=""/>
	    <div class="span12">银行卡</div>
	</div>
    <div class="row-fluid">
     	<div class="span2 pl">开户行：</div> <div class="span10">${bankName }</div>
	    <div class="span2 pl">银行卡号：</div> <div class="span3">${account }</div>
    </div>
    <div class="row-fluid">
        <input type="buttom" value="关闭" class="span2" onclick="top.mainFrame.closeCurrTab()"/>
    </div>
</div>
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>	
<script type="text/javascript">
$(function(){
	$("#projectid").change(function(){
		var projectRemark = $("#projectid").find("option:selected").attr("projectRemark");
		projectRemarkEditor.setContent(projectRemark);
	});
	$("#vouchId").change(function(){
		var descr = $("#vouchId").find("option:selected").attr("descr");
		vouchRemarkEditor.setContent(descr);
	});
});
</script>