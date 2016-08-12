<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="${project_name}/">
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script> 
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			
			<table>
				
				<tr>
					<form action="usersBlack/list.do" method="post" name="userForm" id="userForm">					
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="checkName" value="${checkname }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
					
					
					<input  name="createTimeBegin" id="createTimeBegin" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})"  value="<fmt:formatDate value='${checkTimeBegin}' pattern='yyyy-MM-dd' />" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"  title="最近登录开始"/></td>
					<td><input  name="createTimeEnd" id="createTimeEnd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})"  value="<fmt:formatDate value='${checkTimeEnd}' pattern='yyyy-MM-dd' />" type="text" readonly="readonly" style="width:88px;" placeholder="结束日期"  title="最近登录结束"/></td>
					  
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-small btn-light" onclick="search();" title="查询">查询</button></td>
					</c:if>
					</form>
				</tr>
				<tr>				
				<td>
					<c:if test="${QX.add == 1 }">
						<a style="margin-right:10px;margin-bottom:10px;" href="javascript:addUser();" class="btn btn-small btn-success">新增</a>
					</c:if>
					<c:if test="${QX.edit == 1 }">
						<a style="margin-right:10px;margin-bottom:10px;" href="javascript:editUser();" class="btn btn-small btn-info">修改</a>
					</c:if>
					<c:if test="${QX.del == 1 }">
						<a style="margin-right:10px;margin-bottom:10px;" href="javascript:delUser();" class="btn btn-small btn-danger">删除</a>
					</c:if>
				</td>
				</tr>
				
				
			</table>
			<!-- 检索  -->
		
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th>序号</th>
						<th>用户名</th>
						<th>真实姓名</th>
						<th>注册时间</th>
						<th>受限状态</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${page.result}" var="user" varStatus="vs">
									
							<tr>
								<td class='center' style="width: 30px;">
									<c:if test="${user.USERENAME != 'admin' && user.ID != '0'}"><label><input type='checkbox' name='ids' value="${user.ID }" id="${user.ID }"/><span class="lbl"></span></label></c:if>
									<c:if test="${user.USERENAME == 'admin' || user.ID == 0}"><label><input type='checkbox' disabled="disabled" /><span class="lbl"></span></label></c:if>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td><a class="td_a" href="javascript:void(0);" >${user.USERNAME}</a></td>
								<td>${user.REALNAME }</td>
								<td><fmt:formatDate value="${user.CREATE_TIME }" pattern="yyyy-MM-dd"/> </td>
								
								<td><c:if test="${user.CHARGE == 1}">限制返佣<br /></c:if><c:if test="${user.LIMITE_TENDER == 1}">限制投标</c:if></td>
							</tr>
						
						</c:forEach>
						</c:if>
						
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="10" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
				
				</tbody>
			</table>
			
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		
		<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">		
		$(top.hangge());		
		//检索
		function search(){
			top.jzts();
			$("#userForm").submit();
		}
		//修改受限会员
		function editUser(){
			var ids=getCheck();
			if(ids==""){
				alert("请选择受限会员");
				return;
			}
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="添加受限会员";
			 diag.URL = '${project_name}/usersBlack/toEdit.do?ids='+ids;
			 diag.Width = 500;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件				
				top.jzts(); 
				setTimeout("location.reload()",100);
				diag.close();
			 };
			 diag.show();
		}
		//添加受限会员
		function addUser(){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="添加受限会员";
			 diag.URL = '${project_name}/usersBlack/toAdd.do';
			 diag.Width = 500;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
					top.jzts(); 
					setTimeout("location.reload()",100);
				diag.close();
			 };
			 diag.show();
		}
		//删除受限会员
		function delUser(){
			var c=confirm("确定要删除吗？");
			if(!c){
				return;
			}
			var ids=getCheck();
			if(ids==""){
				alert("请选择受限会员");
				return;
			}
			var url = "${project_name}/usersBlack/del.do?ids="+ids;
			$.post(url,function(data){
				top.jzts();				
				alert("删除成功");					
				document.location.reload();
			});
		}
		function getCheck(){
			var ids="";
			$("input[name='ids']:checked").each(function(){
				ids+=$(this).val()+","; 
			});	
			return ids;
		}
		</script>
		
		<script type="text/javascript">		
		$(function() {			
			//日期框
			$('.date-picker').datepicker();
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});	
		</script>
		
	</body>
	<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>

