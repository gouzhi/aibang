<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提现-失败</title>


</head> 

<body onload="self.opener.location.reload()">

<!--nav End-->
<!--提现主体-->
<div >
	<div >
        <div >
            <h4 >提现申请未提交！</h4>
            <p>
                <a href="${project_name}/user/cash/cash" >继续提现</a>
                <a href="${project_name}/user/user/account/findAccountList" >查看提现记录</a>
              
            </p>
        </div>
    </div>

</div>
<!--提现主体 End-->
<!--footer-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
<!--footer End-->
</body>
</html>