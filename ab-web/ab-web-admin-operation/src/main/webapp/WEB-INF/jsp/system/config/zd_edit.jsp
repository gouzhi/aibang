<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${project_name}/">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${css_imagedomain}/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${css_imagedomain}/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
</head>

<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#NAME").val()==""){
			
			$("#NAME").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#NAME").focus();
			return false;
		}
		
		if($("#BIANMA").val()=="" || $("#BIANMA").val()=="此编码已存在!"){
			
			$("#BIANMA").tips({
				side:3,
	            msg:'请输入编码',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#BIANMA").focus();
			$("#BIANMA").val('');
			$("#BIANMA").css("background-color","white");
			return false;
		}
		
		if($("#ORDY_BY").val()==""){
			
			$("#ORDY_BY").tips({
				side:1,
	            msg:'请输入序号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			
			$("#ORDY_BY").focus();
			return false;
		}
		
		if(isNaN(Number($("#ORDY_BY").val()))){
			
			$("#ORDY_BY").tips({
				side:1,
	            msg:'请输入数字',
	            bg:'#AE81FF',
	            time:2
	        });
			
			
			$("#ORDY_BY").focus();
			$("#ORDY_BY").val(1);
			return false;
		}
		
		has();
		
	}
	
	//判断编码是否存在
	function has(){
		var ZD_ID = $("#ZD_ID").val();
		var BIANMA = $("#BIANMA").val();
		var parentId = $("#PARENT_ID").val();
		var url = "config/has.do?bianma="+BIANMA+"&id="+ZD_ID+"&tm="+new Date().getTime();
		if(parentId !="0"){
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
		}else{
			$.get(url,function(data){
			if(data=="error"){
				$("#BIANMA").css("background-color","#D16E6C");
				
				setTimeout("$('#BIANMA').val('此编码已存在!')",500);
				
			}else{
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
			},"text");	
		}
	}
	
</script>


<body>
	<form  action="config/edit.do" name="Form" id="Form" method="post" >
		<input type="hidden" name="id" id="ZD_ID" value="${pd.id }"/>
		<input type="hidden" name="parentId" id="PARENT_ID" value="${pd.parentId }"/>
		<div id="zhongxin">
		<table>
			<tr class="info">
				<td><input type="text" name="cname" id="NAME" placeholder="这里输入名称" value="${pd.cname }" title="名称"/></td>
			</tr>
			<tr class="info">
				<td><input type="text" name="code" id="BIANMA" placeholder="这里输入编码" value="${pd.code }" title="编码"/></td>
			</tr>
			<tr class="info">
				<td><input type="number" name="orderId" id="ORDY_BY" placeholder="这里输入序号" value="${pd.orderId}" title="序号"/></td>
			</tr>
			<tr class="info">
				<td><textarea type="text" name="remark" id="ORDY_BY" placeholder="这里输入备注"  title="备注">${pd.remark}</textarea></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="${css_imagedomain}/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
<script type="text/javascript">
	var msg = '${msg}';
	if(msg == 'no'){
		$("#BIANMA").attr("readonly",true);
	}

</script>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>