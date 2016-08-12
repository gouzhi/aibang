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

<script type="text/javascript">
	$(top.hangge());	
	
	//新增
	function addservice(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增菜单";
		 diag.URL = '${project_name}/service/toAdd.do';
		 diag.Width = 223;
		 diag.Height = 326;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	//修改
	function editservice(serviceId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑菜单";
		 diag.URL = '${project_name}/service/toEdit.do?serviceId='+serviceId;
		 diag.Width = 223;
		 diag.Height = 326;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	//编辑顶部菜单图标
	function editTb(serviceId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑图标";
		 diag.URL = '${project_name}/service/toEditicon.do?serviceId='+serviceId;
		 diag.Width = 530;
		 diag.Height = 150;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	
	function delservice(serviceId,isParent){
		var flag = false;
		if(isParent){
			if(confirm("确定要删除该菜单吗？其下子菜单将一并删除！")){
				flag = true;
			}
		}else{
			if(confirm("确定要删除该菜单吗？")){
				flag = true;
			}
		}
		if(flag){
			top.jzts();
			var url = "${project_name}/service/del.do?serviceId="+serviceId+"&guid="+new Date().getTime();
			$.get(url,function(data){
				top.jzts();
				document.location.reload();
			});
		}
	}
	
	function openClose(serviceId,curObj,trIndex,level){
		var txt = $(curObj).text();
		if(txt=="展开"){
			$(curObj).text("折叠");
			$("#tr"+serviceId).after("<tr id='tempTr"+serviceId+"'><td colspan='5'>数据载入中</td></tr>");
			if(trIndex%2==0){
				$("#tempTr"+serviceId).addClass("main_table_even");
			}
			var url = "${project_name}/service/sub.do?serviceId="+serviceId+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if(data.length>0){
					var html = "";
					$.each(data,function(i){
						html = "<tr style='height:24px;line-height:24px;' name='subTr"+serviceId+"' id='tr"+this.id+"'>";
						html += "<td></td>";
						html += "<td><span style='width:"+(80+40*(level-1))+"px;display:inline-block;'></span>";
						if(i==data.length-1)
							html += "<img src='static/images/joinbottom.gif' style='vertical-align: middle;'/>";
						else
							html += "<img src='static/images/join.gif' style='vertical-align: middle;'/>";
						html += "<span style='width:100px;text-align:left;display:inline-block;'>"+this.serviceName+"</span>";
						html += "</td>";
						html += "<td>"+this.serviceNamespace+"</td>";
						html += "<td class='center'>"+this.serviceOrder+"</td>";
						html += "<td>";
						if((this.serviceNamespace == '' || this.serviceNamespace == '#')&&level!=2)
						{
						  html += "<a class='btn btn-mini btn-warning' onclick=\"openClose('"+this.id+"',this,"+i+","+(level+1)+")\" >展开</a>";
						}
						html += "<c:if test='${QX.edit == 1 }'><a class='btn btn-mini btn-info' title='编辑' onclick='editservice(\""+this.id+"\")'>编辑</a></c:if> <c:if test='${QX.del == 1 }'><a class='btn btn-mini btn-danger' title='删除' onclick='delservice(\""+this.id+"\",false)'>删除</a></c:if></td>";
						html += "</tr>";
						$("#tempTr"+serviceId).before(html);
					});
					$("#tempTr"+serviceId).remove();
					if(trIndex%2==0){
						$("tr[name='subTr"+serviceId+"']").addClass("main_table_even");
					}
				}else{
					$("#tempTr"+serviceId+" > td").html("没有相关数据");
				}
			},"json");
		}else{
			$("#tempTr"+serviceId).remove();
			$("tr[name='subTr"+serviceId+"']").each(function(i){
				 $("tr[name='subTr"+$(this).attr("id").split("tr")[1]+"']").remove();
				 $(this).remove();
			});
			$(curObj).text("展开");
		}
	}
</script>
</head>

<body>
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>名称</th>
			<th class='center'>资源路径</th>
			<th class='center'>排序</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty serviceList}">
				<c:forEach items="${serviceList}" var="service" varStatus="vs">
				<tr id="tr${service.id }">
				<td class="center">${vs.index+1}</td>
				<td class='center'><i class="${service.serviceIcon }">&nbsp;</i>${service.serviceName }&nbsp;
					<c:if test="${service.serviceType == '1' }">
					<span class="label label-success arrowed">平台</span>
					</c:if>
					<c:if test="${service.serviceType == '2' }">
					<span class="label label-important arrowed-in">个人</span>
					</c:if>
				</td>
				<td>${service.serviceNamespace == '#'? '': service.serviceNamespace}</td>
				<td class='center'>${service.serviceOrder }</td>
				<td style="width: 25%;">
				<a class='btn btn-mini btn-warning' onclick="openClose('${service.id }',this,${vs.index },1)" >展开</a>
				<c:if test="${QX.edit == 1 }">
				<a class='btn btn-mini btn-purple' title="图标" onclick="editTb('${service.id }')" ><i class='icon-picture'></i></a>
				<a class='btn btn-mini btn-info' title="编辑" onclick="editservice('${service.id }')" >编辑</a>
				</c:if>
				<c:if test="${QX.del == 1 }">
				<a class='btn btn-mini btn-danger' title="删除"  onclick="delservice('${service.id }',true)">删除</a>
				</c:if>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	<div class="page_and_btn">
		<div>
			&nbsp;&nbsp;<c:if test="${QX.add == 1 }"><a class="btn btn-small btn-success" onclick="addservice();">新增</a></c:if>
		</div>
	</div>
	
</body>
</html>