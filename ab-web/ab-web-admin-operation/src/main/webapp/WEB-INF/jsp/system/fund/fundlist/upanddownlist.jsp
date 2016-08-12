<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<base href="${project_name}/">
    <meta charset="utf-8" />
	<title>
<c:if test="${type==0}">下架</c:if>
<c:if test="${type==1}">上架</c:if>
</title>
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
<script type="text/javascript" src="${css_imagedomain}/js/ace-elements.min.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/ace.min.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>

</head>
<body>
<form id="form" action="" method="post">
<p style="text-align:center;line-height:100px;">确认进行<c:if test="${type==0}">下架</c:if><c:if test="${type==1}">上架</c:if>操作?</p>
<p style="text-align:center">
<input type="hidden" name="fundsinfoIds" value="${fundsinfoIds}">
<input type="hidden" name="type" value="${type}">
<input type="button" onclick = "sure()" value="确认" style="margin-right:50px;color:blue;width: 108px;line-height: 34px;text-align: center;border: 1px solid #287ad2;border-radius: 5px;font-size: 16px;color: #383838;" />
<input type="button" onclick="top.Dialog.close();" value="取消" style="margin-left:50px;color:blue;width: 108px;line-height: 34px;text-align: center;border: 1px solid #287ad2;border-radius: 5px;font-size: 16px;color: #383838;" />
</p>
</form>
</body>
</html>

<script>
function sure(){
		 $.ajax({
			url:"hjsfundfundsinfo/sureOperate.do",
			type:"post",
			data:$("#form").serialize(),
			dataType:"json",
			success:function(data){
			
				if(data.state == '0'){
					alert(data.msg);
					alert(11);
					//window.location.href="${project_name}/hjsfundfundsinfo/list";
					top.Dialog.close();
					//alert(12);
					//top.mainFrame.reloadPage(/hjsfundfundsinfo\/list/);
					//alert(13);
				}else{
					alert(data.msg);
					top.Dialog.close();
					
					window.location.href="${project_name}/hjsfundfundsinfo/list";
				}
			}
		}); 

}
</script>