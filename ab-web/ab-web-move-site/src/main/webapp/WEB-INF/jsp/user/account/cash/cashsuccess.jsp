<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提现</title>
</head> 

<body onload="self.opener.location.reload()">
<!--header Start-->


<!--nav End-->
<!--提现主体-->
<div class="">
	
	<div class="">
        <div class="">
            <h4 class="">提现申请已经提交，请等待银行处理！</h4>
            <p>
                <a href="${project_name}/user/cash/cash" >继续提现</a>
                <a href="${project_name}/user/account/findAccountList">查看提现记录</a>
               
            </p>
        </div>
    </div>

</div>
<!--提现主体 End-->


</body>
</html>