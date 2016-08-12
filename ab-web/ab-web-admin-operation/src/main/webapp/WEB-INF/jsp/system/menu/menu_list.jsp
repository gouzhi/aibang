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
	function addmenu(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增菜单";
		 diag.URL = '${project_name}/menu/toAdd.do';
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
	function editmenu(menuId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑菜单";
		 diag.URL = '${project_name}/menu/toEdit.do?menuId='+menuId;
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
	function editTb(menuId){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑图标";
		 diag.URL = '${project_name}/menu/toEditicon.do?menuId='+menuId;
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
	
	function delmenu(menuId,isParent){
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
			var url = "${project_name}/menu/del.do?menuId="+menuId+"&guid="+new Date().getTime();
			$.get(url,function(data){
				top.jzts();
				document.location.reload();
			});
		}
	}
	
	function openClose(menuId,curObj,trIndex,level){
		var txt = $(curObj).text();
		if(txt=="展开"){
			$(curObj).text("折叠");
			$("#tr"+menuId).after("<tr id='tempTr"+menuId+"'><td colspan='5'>数据载入中</td></tr>");
			if(trIndex%2==0){
				$("#tempTr"+menuId).addClass("main_table_even");
			}
			var url = "${project_name}/menu/sub.do?menuId="+menuId+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if(data.length>0){
					var html = "";
					$.each(data,function(i){
						html = "<tr style='height:24px;line-height:24px;' name='subTr"+menuId+"' id='tr"+this.id+"'>";
						html += "<td></td>";
						html += "<td><span style='width:"+(80+40*(level-1))+"px;display:inline-block;'></span>";
						if(i==data.length-1)
							html += "<img src='static/images/joinbottom.gif' style='vertical-align: middle;'/>";
						else
							html += "<img src='static/images/join.gif' style='vertical-align: middle;'/>";
						html += "<span style='width:100px;text-align:left;display:inline-block;'>"+this.menuName+"</span>";
						html += "</td>";
						html += "<td>"+this.menuUrl+"</td>";
						html += "<td class='center'>"+this.orderId+"</td>";
						html += "<td>";
						if((this.menuUrl == '' || this.menuUrl == '#')&&level!=2)
						{
						  html += "<a class='btn btn-mini btn-warning' onclick=\"openClose('"+this.id+"',this,"+i+","+(level+1)+")\" >展开</a>";
						}
						html += "<c:if test='${QX.edit == 1 }'><a class='btn btn-mini btn-info' title='编辑' onclick='editmenu(\""+this.id+"\")'>编辑</a></c:if><c:if test='${QX.del == 1 }'> <a class='btn btn-mini btn-danger' title='删除' onclick='delmenu(\""+this.id+"\",false)'>删除</a></c:if></td>";
						html += "</tr>";
						$("#tempTr"+menuId).before(html);
					});
					$("#tempTr"+menuId).remove();
					if(trIndex%2==0){
						$("tr[name='subTr"+menuId+"']").addClass("main_table_even");
					}
				}else{
					$("#tempTr"+menuId+" > td").html("没有相关数据");
				}
			},"json");
		}else{
			$("#tempTr"+menuId).remove();
			$("tr[name='subTr"+menuId+"']").each(function(i){
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
			<c:when test="${not empty menuList}">
				<c:forEach items="${menuList}" var="menu" varStatus="vs">
				<tr id="tr${menu.id }">
				<td class="center">${vs.index+1}</td>
				<td class='center'><i class="${menu.menuIcon }">&nbsp;</i>${menu.menuName }&nbsp;
					<c:if test="${menu.typeId == '1' }">
					<span class="label label-success arrowed">平台</span>
					</c:if>
					<c:if test="${menu.typeId == '2' }">
					<span class="label label-important arrowed-in">个人</span>
					</c:if>
				</td>
				<td>${menu.menuUrl == '#'? '': menu.menuUrl}</td>
				<td class='center'>${menu.orderId }</td>
				<td style="width: 25%;">
				<a class='btn btn-mini btn-warning' onclick="openClose('${menu.id }',this,${vs.index },1)" >展开</a>
				<c:if test="${QX.edit == 1 }">
				<a class='btn btn-mini btn-purple' title="图标" onclick="editTb('${menu.id }')" ><i class='icon-picture'></i></a>
				<a class='btn btn-mini btn-info' title="编辑" onclick="editmenu('${menu.id }')" >编辑</a>
				</c:if>
				<c:if test="${QX.del == 1 }">
				<a class='btn btn-mini btn-danger' title="删除"  onclick="delmenu('${menu.id }',true)">删除</a>
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
			&nbsp;&nbsp;<c:if test="${QX.add == 1 }"><a class="btn btn-small btn-success" onclick="addmenu();">新增</a></c:if>
		</div>
	</div>
	
</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>