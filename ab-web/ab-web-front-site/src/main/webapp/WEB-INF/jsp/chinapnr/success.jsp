<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>成功 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
 
  <script src="${css_imagedomain}/front/js/trading.js"></script>
  <style>
	  .cash{ background: #fff; margin-top: 20px;padding:200px 0 238px;}
	  .cash{ background: #fff; margin-top: 20px;padding:200px 0 238px;}
	  .cashOk h4.hfcg{font-size: 20px;color:#6b6b6b;height:58px;line-height:58px;padding-left:490px; }
	  .cashBut{ margin-top:60px;}
	  .cashBut .new{display: inline-block;width:180px;height: 36px;line-height: 36px;font-size:16px;color:#fff; background:#f27267;border-radius:4px;margin-left:415px;text-align: center;}
	  .cashBut .return{display: inline-block;width:180px;height: 36px;line-height: 36px;font-size:16px;color:#fff; background:#ababab;border-radius:4px; margin-left:6px;text-align: center;}
  </style>
</head> 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--汇付帐号-->
<div class="accountContent clear">
<input type="hidden" value="RECV_ORD_ID_${TrxId}"/>
	<div class="cash">
        <div class="cashOk">
            <c:choose>
        		<c:when test="${resultType == 'kh' }">
        			<h4 class="hfcg">恭喜，您的汇付天下账户已开通！</h4>
            		<p class="cashBut">
                		<a href="${project_name}/user/customer/detailHF" class="new">查看汇付天下账户</a>
                		<a href="${project_name}/user/center/accountall" class="return">返回账户总览</a>
            		</p>
        		</c:when>
        		<c:when test="${resultType == 'bk' }">
        			<h4 class="hfcg">恭喜，您绑定提现银行卡成功！</h4>
            		<p class="cashBut">
                		<a href="${project_name}/user/customer/checkBank" class="new">查看提现银行卡</a>
                		<a href="${project_name}/user/center/accountall" class="return">返回账户总览</a>
            		</p>
        		</c:when>
        		<c:otherwise></c:otherwise>
        	</c:choose>
        </div>
    </div>

</div>
<!--汇付帐号 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>