<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提现</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<style>
    .cash{ background: #fff; margin-top: 20px;padding:100px 282px 126px;}
    .cashOk{width:636px; background: #fafafa;}
    .cashOk i{width: 58px;height: 58px;left:70px;top:46px;background:url(${css_imagedomain}/front/images/ico_all.png) no-repeat -180px -10px;}
    .cashOk h4.txcg{margin-left: 150px;font-size:20px;color:#6b6b6b;height:48px;line-height:48px;padding-top: 44px;}
    .cashOk .cashFw{font-size: 14px;color: #6b6b6b;margin-left: 150px;width: 420px;line-height: 24px;}
    .cashOk .see{margin-left:150px;font-size: 14px;color: #f27267;line-height: 24px;}
    .cashBut{padding:30px 0 48px;}
    .cashBut .new{display: inline-block;width:120px;height: 34px;line-height: 34px;font-size:16px;color:#fff; background:#ababab;border-radius:4px;margin-left:150px;text-align:center;}
    .cashBut .return{display: inline-block;width:120px;height: 34px;line-height: 34px;font-size:16px;color:#fff; background:#f27267;border-radius:4px; margin-left:6px;text-align: center;}
</style>
</head> 

<body onload="self.opener.location.reload()">
<!--header Start-->
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>


<!--nav End-->
<!--提现主体-->
<div class="accountContent clear">
	<div class="cash">
        <div class="cashOk pr">
            <i class="pa"></i>
            <h4 class="txcg">提现申请已受理，请等待银行处理！</h4>
            <p class="cashFw">
                待第三方支付“汇付天下”确认成功（国家法定节假日汇付天下提现业务或许暂停），预计之后48小时以内转至您的提现银行卡账户，具体到账时间点依据提现银行不同而有所差异，请您注意查收。
            </p>
            <p><a href="${project_name}/user/cash/list" class="see">查看提现记录</a></p>
            <p class="cashBut">
                <a href="${project_name}/user/center/accountall" class="new">返回账户总览</a>
                <a href="${project_name}/user/cash/main" class="return">继续提现</a>
            </p>
        </div>
    </div>

</div>
<!--提现主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>

</body>
</html>