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
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		
<script type="text/javascript">
	
	$(top.hangge());
	
	//新增
	function add(PARENT_ID){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '${project_name}/config/toAdd.do?parentId='+PARENT_ID;
		 diag.Width = 223;
		 diag.Height = 238;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.pageNumber}';
			 	if(num == '0'){
			 		top.jzts();
			 		location.href = location.href;
			 	}else{
			 		document.location.reload();
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	//修改
	function edit(ZD_ID){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '${project_name}/config/toEdit.do?id='+ZD_ID;
		 diag.Width = 223;
		 diag.Height = 238;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 document.location.reload();
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	//删除
	function del(ZD_ID){
		var flag = false;
		if(confirm("确定要删除该数据吗?")){
			flag = true;
		}
		if(flag){
			top.jzts();
			var url = "${project_name}/config/del.do?id="+ZD_ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
			data=eval("json="+data);
				if("success" == data.result){
					top.jzts();
					document.location.reload();
				}else{
					top.hangge();
					alert("删除失败，请先删除其下级数据!"); 
				}
			});
		}
	}
	
</script>
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	
	<!-- 检索  -->
	<form action="${project_name}/config.do" method="post" name="userForm" id="userForm">
	<input name="parentId" id="PARENT_ID" type="hidden" value="${pd.parentId }" />
	<table>
		<tr>
			<td><font color="#808080"></font></td>
			<td>
				<span class="input-icon">
				<input autocomplete="off" id="nav-search-input" type="text" name="cname" value="${pd.cname }" placeholder="这里输入关键词" />
				<i id="nav-search-icon" class="icon-search"></i>
				</span>
			</td>
			<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();">查询</button></td>
			<c:if test="${pd.parentId != 0}">
				<c:choose>
				<c:when test="${not empty varsList}">
				<td style="vertical-align:top;"><a href="${project_name}/config.do?parentId=0" class="btn btn-mini btn-purple" title="查看">顶级<i class="icon-arrow-right  icon-on-right"></i></a></td>
				<c:forEach items="${varsList}" var="var" varStatus="vsd">
				<td style="vertical-align:top;"><a href="${project_name}/config.do?parentId=${var.id }" class="btn btn-mini btn-purple" title="查看">${var.cname }<i class="icon-arrow-right  icon-on-right"></i></a></td>
				</c:forEach>
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>
			</c:if>
			
		</tr>
	</table>
	<!-- 检索  -->

	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>名称</th>
			<th class='center'>当前编码</th>
			<th class='center'>完整编码</th>
			<th class='center'>级别</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<tr>
				<td class="center">${var.orderId }</td>
				<td class='center'><a href="${project_name}/config.do?parentId=${var.id }" title="查看下级"><i class="icon-arrow-right  icon-on-right"></i>&nbsp;${var.cname }</a></td>
				<td class='center'>${var.code }</td>
				<td class='center'>${var.pcode }</td>
				<td class='center' style="width:35px;"><b class="green">${var.layer }</b></td>
				<td style="width: 86px;">
				<c:if test="${QX.edit == 1 }">
				<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.id }')" >编辑</a>
				</c:if>
				<c:if test="${QX.edit == 1 }">
				<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.id }')">删除</a>
				</c:if>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100" class="center">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<c:if test="${QX.add == 1 }">
				<td style="vertical-align:top;width:50px;"><a class="btn btn-small btn-success" onclick="add('${pd.parentId}');">新增</a></td>
				</c:if>
				<c:if test="${pd.parentId != 0}">
					<td style="vertical-align:top;" class="left"><a class="btn btn-small btn-info" onclick="location.href='${project_name}/config.do?parentId=${pdp.parentId }';">返回</a></td>
				</c:if>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	
	</form>
</div>
</div>

</body>
<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>