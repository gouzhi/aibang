<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${project_name}/">
		
		<meta charset="utf-8" />
		<title>菜单</title>
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
	$(document).ready(function(){		
		/*if($("#menuId").val()!=""){
			var parentId = "${menu.parentId}";
			if(parentId==""){
				$("#parentId").attr("disabled",false);
			}else{
				$("#parentId").val(parentId);
			}
		}*/
		setMUR();
	}); 
	
	//一级目录改变事件
	function setMUR(){
		$("#parentId").val($("#fistMenu").val());
		
		if($("#fistMenu").val()=="0"){
			$("#form-field-radio1").prop("disabled",false);
			$("#form-field-radio2").prop("disabled",false);
			$("#form-field-radio1").prop("checked",true);
			$("#subMenuId").hide();
		}else{
			$("#form-field-radio1").prop("disabled",true);
			$("#form-field-radio2").prop("disabled",true);
			$("#form-field-radio1").prop("checked",false);
			$("#form-field-radio2").prop("checked",false);
			showSubMenu($("#fistMenu").val());
		}
	}
	
	 
	//二级目录改变事件
	function setSub()
	{
		$("#parentId").val($("#subMenuId").val());
		$("#menuUrl").val("#");
	}
	
	function showSubMenu(menuId)
	{
		$("#subMenuId").html("").hide();
		var url = "${project_name}/menu/sub.do?menuId="+menuId+"&guid="+new Date().getTime();
		$.get(url,function(data){
			if(data.length>0){
				var html = "";
				$.each(data,function(i){
					//if(this.isFinal!=1)
					//{
					  html+="<option value='"+this.id+"' >"+this.menuName+"</option>"
					//}
				});
				
				if(html!="")
				{
				  $("#subMenuId").append("<option value='0' >选择二级目录</option>"+html);
				  $("#subMenuId").show();
				}
			}
		},"json");
	}

 
	//保存
	function save(){
		if($("#menuName").val()==""){
			
			$("#menuName").tips({
				side:3,
	            msg:'请输入菜单名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#menuName").focus();
			return false;
		}
		if($("#menuUrl").val()==""){
			$("#menuUrl").val('#');
		}
		if($("#orderId").val()==""){
			
			$("#orderId").tips({
				side:1,
	            msg:'请输入菜单序号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#orderId").focus();
			return false;
		}
		
		if(isNaN(Number($("#orderId").val()))){
			
			$("#orderId").tips({
				side:1,
	            msg:'请输入菜单序号',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#orderId").focus();
			$("#orderId").val(1);
			return false;
		}
		if($("#typeId").val()==""){
			$("#typeId").val("1");
		}
		$("#menuForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	function setType(value){
		$("#typeId").val(value);
	}
	
	/*function setIsFinal(value)
	{
		if(value=='0')
		{
			$("#menuUrl").val("");
			$("#menuUrl").prop("readonly",true);
		}else
		{
			$("#menuUrl").prop("readonly",false);
		}
		
		$("#isFinal").val(value);
	}*/
	
</script>


<body>
	<form  action="menu/add.do" name="menuForm" id="menuForm" method="post" >
		<input type="hidden" name="id" id="id" value=""/>
		<input type="hidden" name="typeId" id="typeId" value=""/>
		<input type="hidden" name="isFinal" id="isFinal" value=""/>
		<input type="hidden" name="parentId" id="parentId" value=""/>
		<div id="zhongxin">
		<table>
			<tr>
				<td>
					<select  id="fistMenu" name="fistMenu" class="input_txt" onchange="setMUR()"  title="一级目录">
						<option value="0">顶级菜单</option>
						<c:forEach items="${menuList}" var="menu">
							<option value="${menu.id }" onclick="">${menu.menuName }</option>
						</c:forEach>
					</select>
				</td>
				
			</tr>
			<tr>
			    <td>
					<select name="subMenuId" id="subMenuId" class="input_txt" onchange="setSub()"  title="二级目录">
					 
					</select>
				</td>
		    </tr>
			<tr>
				<td><input type="text" name="menuName" id="menuName" placeholder="这里输入菜单名称" value="" title="名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="menuUrl" id="menuUrl" placeholder="这里输入链接地址" value="" title="地址"/></td>
			</tr>
			<tr>
				<td><input type="number" name="orderId" id="orderId" placeholder="这里输入序号" value="" title="序号"/></td>
			</tr>
			
			 
			
			<tr>
				<td style="text-align: center;">
					<label style="float:left;padding-left: 32px;"><input name="form-field-radio" id="form-field-radio1" onclick="setType('1');" checked="checked" type="radio" value="icon-edit"><span class="lbl">平台菜单</span></label>
					<label style="float:left;padding-left: 5px;"><input name="form-field-radio" id="form-field-radio2" onclick="setType('2');" type="radio" value="icon-edit"><span class="lbl">个人中心</span></label>
				</td>
			</tr>
			<tr>
				<td style="text-align: center; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="${css_imagedomain}/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>