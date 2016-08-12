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
		
		<script type="text/javascript">
			$(top.hangge());	
			$(document).ready(function(){
				    var parentId = "${empty parent || parent.parentId eq 0 ? service.parentId : parent.parentId}";
					//if($("#serviceId").val()!=""){
						//alert(${parent.parentId});
						if(parentId=="0"){
							$("#pId").prop("disabled",true);
							$("#subServiceId").hide();
						}else{
							$("#pId").val(parentId);
							$("#form-field-radio1").prop("disabled",true);
							$("#form-field-radio2").prop("disabled",true);
							$("#form-field-radio1").prop("checked",false);
							$("#form-field-radio2").prop("checked",false);
							showSubService(parentId,
							function (){
								$("#subServiceId").val($("#parentId").val());
							});
						
						
						}
					//}
					
					 
					
				});
				
				var serviceNamespace = "";
				function setMUR(){
					serviceNamespacey = $("#serviceNamespace").val();
					if(serviceNamespacey != ''){serviceNamespace = serviceNamespacey;}
					if($("#pId").val()=="0"){
						$("#subServiceId").hide();
						$("#serviceNamespace").prop("readonly",true);
						$("#serviceNamespace").val("");
						$("#form-field-radio1").prop("disabled",false);
						$("#form-field-radio2").prop("disabled",false);
					}else{
						$("#serviceNamespace").prop("readonly",false);
						$("#serviceNamespace").val(serviceNamespace);
						$("#form-field-radio1").prop("disabled",true);
						$("#form-field-radio2").prop("disabled",true);
						$("#form-field-radio1").prop("checked",false);
						$("#form-field-radio2").prop("checked",false);
						showSubService($("#pId").val());
					}
					var parentId = $("#pId").val();
					$("#parentId").val(parentId);
				}
				
				
				//二级目录改变事件 
				function setSub()
				{
					$("#parentId").val($("#subServiceId").val());
				}
				
				function showSubService(serviceId,callBack)
				{
					$("#subServiceId").html("").hide();
					var url = "${project_name}/service/sub.do?serviceId="+serviceId+"&guid="+new Date().getTime();
					$.get(url,function(data){
						if(data.length>0){
							var html = "";
							$.each(data,function(i){
								//if(this.isFinal!=1)
								//{
								  html+="<option value='"+this.id+"' >"+this.serviceName+"</option>"
								//}
							});
							
							if(html!="")
							{
							  $("#subServiceId").append("<option value='0' >选择二级目录</option>"+html);
							  $("#subServiceId").show();
							}
							
							if(callBack!=null)
							{
								callBack();
							}
						}
					},"json");
				}
				
				//保存
				function save(){
					if($("#serviceName").val()==""){
						
						$("#serviceName").tips({
							side:3,
				            msg:'请输入菜单名称',
				            bg:'#AE81FF',
				            time:2
				        });
						
						$("#serviceName").focus();
						return false;
					}
					if($("#serviceNamespace").val()==""){
						$("#serviceNamespace").val('#');
					}
					if($("#serviceOrder").val()==""){
						
						$("#serviceOrder").tips({
							side:1,
				            msg:'请输入菜单序号',
				            bg:'#AE81FF',
				            time:2
				        });
						
						$("#serviceOrder").focus();
						return false;
					}
					
					if(isNaN(Number($("#serviceOrder").val()))){
						
						$("#serviceOrder").tips({
							side:1,
				            msg:'请输入菜单序号',
				            bg:'#AE81FF',
				            time:2
				        });
						
						$("#serviceOrder").focus();
						$("#serviceOrder").val(1);
						return false;
					}
					
					$("#serviceForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				}
				
				function setType(value){
					$("#serviceType").val(value);
				}
		</script>
		
	</head>
	
	<body>
		<form action="service/edit.do" name="serviceForm" id="serviceForm" method="post">
			<input type="hidden" name="id" id="id" value="${service.id}"/>
			<input type="hidden" name="parentId" id="parentId" value="${service.parentId}"/>
			<input type="hidden" name="serviceType" id="serviceType" value="${service.serviceType }"/>
			<div id="zhongxin">
			<table>
				<tr>
					<td>
						<select name="pId" id="pId" onchange="setMUR()" title="菜单">
							<option value="0" <c:if test="${service.parentId=='0'}">selected="selected"</c:if>>顶级菜单</option>
							<c:forEach items="${serviceList}" var="service">
								<option value="${service.id }">${service.serviceName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
				    <td>
						<select name="subServiceId" id="subServiceId" class="input_txt" onchange="setSub()"  title="二级目录">
						 
						</select>
					</td>
			    </tr>
				<tr>
					<td><input type="text" name="serviceName" id="serviceName" placeholder="这里输入菜单名称" value="${service.serviceName }" title="名称"/></td>
				</tr>
				<tr>
					<td><input type="text" name="serviceNamespace" id="serviceNamespace" placeholder="这里输入链接地址" value="${service.serviceNamespace }" title="地址"/></td>
				</tr>
				<tr>
					<td><input type="number" name="serviceOrder" id="serviceOrder" placeholder="这里输入序号" value="${service.serviceOrder}" title="序号"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<label style="float:left;padding-left: 32px;"><input name="form-field-radio" id="form-field-radio1" onclick="setType('1');" <c:if test="${service.serviceType == '1' }">checked="checked"</c:if> type="radio" value="icon-edit"><span class="lbl">平台服务</span></label>
						<label style="float:left;padding-left: 5px;"><input name="form-field-radio" id="form-field-radio2" onclick="setType('2');" <c:if test="${service.serviceType != '1' }">checked="checked"</c:if> type="radio" value="icon-edit"><span class="lbl">个人服务</span></label>
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
</html>