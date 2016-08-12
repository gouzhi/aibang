<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>绑定银行 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
</head> 
 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改密码-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">更换银行卡</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<div class="replaces">
            <h3>账户安全</h3>
        	<div class="replaces_border">
                <div class="replaces_con">
                    <p class="icdImg">
                        <img src="${css_imagedomain}/front/images/bank/${BankId}.gif" width="156" height="40" />
                    </p>
                    <p class="icdP">${CardId }</p>
                    <p class="icdP1">${UsrName }</p>
                </div>
                <p style="width:358px;margin: 0 auto;">
                <c:choose>
                    <c:when test="${ExpressFlag == 'Y'}">
                    	<p style="width: 358px;margin: 0px auto 30px;color: rgb(56, 56, 56);font-size: 12px;line-height: 18px;">您已绑定快捷卡，该卡同时成为您唯一取现卡。如需解绑快捷卡，请在绑定后7天登录：<br/><span style="font-size:12px;color: #a6a6a6;"><a href="https://c.chinapnr.com/p2puser/" target="_blank" style="font-size:12px;color:#a6a6a6;">https://c.chinapnr.com/p2puser/</a> 操作。如有疑问，请联系华金所客服：400-826-5000。</span></p>
                    	<a href="toSafe" style="display: block;width: 120px;height: 34px;line-height: 34px;background: #f27267;color: #fff;text-align: center;border-radius: 4px;margin-left: 35px;margin: 0 auto;">返回账户安全</a></c:when>
                    <c:otherwise>
                    	<a href="${project_name}/user/customer/toSafe" class="callback">返回</a>
                    	<a target="_blank" href="toBindBank" class="replace">更换银行卡</a>
                    </c:otherwise>
                </c:choose>
                </p>
            </div>

            
        </div>
    </div>
</div>
<!--修改密码 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>