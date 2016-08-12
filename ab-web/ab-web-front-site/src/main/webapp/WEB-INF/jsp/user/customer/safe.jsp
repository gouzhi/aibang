<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>账户安全 - 华金所</title>
   <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
 
  <script src="${css_imagedomain}/front/js/trading.js"></script>
  <script>
$(function(){
	$('#btnbinding').click(function(){
		$('.bindingMask').show();	
		$('#binding').show();		
	});
	$('.close').click(function(){
		$('.bindingMask').hide();	
		$('#binding').hide();
		$('#bindingok').hide();
	});
	$('#btnbindingok').click(function(){
		$('.bindingMask').show();
		$('#bindingok').show();
	})
});
</script>
</head> 
 
<body style="background: #e8e8e8;">
<div class="bindingMask" style="display:none;"></div>
<div id="binding" class="binding" style="display:none;">
    <i class="tishi"></i>
    <span class="off close pa">x</span>
    <h3 class="pr">提示</h3>
	<p class="top">您未开通第三方托管账户</p>
    <p class="bot">请先开通后再进行绑定提现银行卡操作</p>
    <p>
        <a target="_blank" href="toActivateName" class="open">开通理财账户</a>
        <%--<a href="#" class="close">取消</a>--%>
    </p>
</div>
<div class="binding" id="bindingok" style="display:none;">
    <h3>提示</h3>
	<p class="topOne">绑定银行卡操作完成，返回当前页面</p>
    <p><a href="javascript:document.location.reload();" class="open">确定</a></p>  
</div>  
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--账户安全-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point" style="padding-left:0;height:36px;line-height:36px;">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="safety">
        	<h3>账户安全</h3>
            <ul class="safetyList">
            	<li>
                	<i class="ico_right"></i>
                	<span class="spanTitle">登录密码</span>
                    <span class="spanExplan">互联网账号存在被盗风险，建议您定期更改密码以保护账户安全。</span>
                    <a href="${project_name}/user/customer/toEditPass">[修改]</a>
                </li>

                <li>
                	<i class="ico_right"></i>
                	<span class="spanTitle">手机验证</span>
                    <span class="spanExplan">验证手机：<b>${phone }</b>，若已丢失或停用，请立即更换，避免账户被盗</span>
                    <a href="pv?vt=2">[修改]</a>
                </li>
                <%--
                 <li>
                	<i class="ico7"></i>
                	<c:if test="${!hasPayPass }">
                		<span class="spanTitle">支付密码<img src="${css_imagedomain}/front/images/wrong.png" /></span>
                		<span class="spanExplan">建议您设置高强度的密码。</span>
                    	<a href="pv?vt=3">设置</a>
                	</c:if>
                	<c:if test="${hasPayPass }">
                		<span class="spanTitle">支付密码<img src="${css_imagedomain}/front/images/yes.png" /></span>
                		<span class="spanExplan">如果您忘记支付密码，请联系客服！</span>
                    	<a href="pv?vt=3">修改</a>
                	</c:if>              
                </li> 
                 <li>
                	<i class="ico3"></i>
                	<c:if test="${!hasRealName }">
                	<span class="spanTitle">实名认证<img src="${css_imagedomain}/front/images/wrong.png" /></span>
                    <span class="spanExplan">投资前，审核投资人的有效身份</span>
                    <a href="toActivateName">设置</a>
                    </c:if>
                    <c:if test="${hasRealName }">
                    <span class="spanTitle">实名认证<img src="${css_imagedomain}/front/images/yes.png" /></span>
                    <span class="spanExplan">
						姓名：${sessionUser.realName }   身份证号：${cardId }
					</span>              
                    </c:if>
                </li>
                 --%>
                <%--   --%>
				<c:choose>
                <c:when test="${not empty HFID}">
                <li style="disabled:true;">
                    <i class="ico_right"></i>
                    <span class="spanTitle">汇付天下</span>
                    <span class="spanExplan">第三方托管账户，保证您的资金安全</span>
                    <a href="detailHF">[查看]</a>
                </li>
                </c:when>
                <c:otherwise>
                <li style="disabled:true;">
                    <i class="ico_error"></i>
                    <span class="spanTitle">汇付天下</span>
                    <span class="spanExplan">第三方托管账户，保证您的资金安全</span>
                    <a target="_blank" href="toActivateName">[开通]</a>
                </li>
                </c:otherwise>
                </c:choose>
                <%-- --%>
                <c:choose>
               <c:when test="${not empty HFID}">

                   <c:if test="${hasBank}">
                   <li>
                   <i class="ico_right"></i>
                   <span class="spanTitle">提现银行卡</span>
                   <span class="spanExplan">${bankName}(尾号${account})</span>
                   <a href="checkBank">[查看]</a>
                   </li>
                   </c:if>
                    <c:if test="${!hasBank }">
                    <li>
                   <i class="ico_error"></i>
                   <span class="spanTitle">提现银行卡</span>
                   <span class="spanExplan">保障资金安全，提现前需绑定提现银行卡</span>
                   <a target="_blank" href="toBindBank" id="btnbindingok" class="useNo">[绑定]</a>
                   </li>
                   </c:if>
               </c:when>
               <c:otherwise>
                    <c:if test="${!hasBank }">
                    <li disabled="disabled">
                   <i class="ico_error"></i>
                   <span class="spanTitle">提现银行卡</span>
                   <span class="spanExplan" >保障资金安全，提现前需绑定提现银行卡</span>
                   <a href="javascript:void(0);" class="useNo" id="btnbinding">[绑定]</a>
                   </li>
                   </c:if>
               </c:otherwise>
               </c:choose>
				<li>
					<c:choose>
						<c:when test="${emailStatus == 0 }">
							<i class="ico_error"></i>
							<span class="spanTitle">邮箱验证</span>
							<span class="spanExplan">请验证您的邮箱地址，便于登录、找回密码、接收活动信息。</span>
							<a href="pv?vt=1">[设置]</a>
						</c:when>
						<c:otherwise>
							<i class="ico_right"></i>
							<span class="spanTitle">邮箱验证</span>
							<span class="spanExplan">您验证的邮箱：<b>${email }</b></span>
							<a href="pv?vt=1">[修改]</a>
						</c:otherwise>
					</c:choose>
				</li>
            </ul>
        </div>
    
    </div>

</div>
<!--账户安全 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>