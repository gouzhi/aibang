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
			<form action="usersOpt/listUsers.do" method="post" name="userForm" id="userForm">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="username" value="${pd.username }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input  name="lastTimeBegin" id="lastTimeBegin" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'lastTimeEnd\')||\'%y-%M-%d\'}'})"  value="<fmt:formatDate value="${pd.lastTimeBegin }" pattern="yyyy-MM-dd"/>" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"  title="最近登录开始"/></td>
					<td><input  name="lastTimeEnd" id="lastTimeEnd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'lastTimeBegin\')}',maxDate:'%y-%M-%d'})"  value="<fmt:formatDate value="${pd.lastTimeEnd }" pattern="yyyy-MM-dd"/>" type="text" readonly="readonly" style="width:88px;" placeholder="结束日期"  title="最近登录结束"/></td>
					  <%-- <td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="roleId" id="role_id" data-placeholder="请选择职位" style="vertical-align:top;width: 120px;">
						<option value=""></option>
						<c:forEach items="${roleList}" var="role">
							<option value="${role.id }" <c:if test="${pd.roleId==role.id}">selected</c:if>>${role.roleName }</option>
						</c:forEach>
					  	</select>
					</td> --%>
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="查询">查询</button></td>
					<%--  <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="window.location.href='${project_name}//user/listtabUsers.do';" title="切换模式"><i id="nav-search-icon" class="icon-exchange"></i></a></td>
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>
					<c:if test="${QX.edit == 1 }"><td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="icon-cloud-upload"></i></a></td></c:if>--%>
					</c:if>
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
						<th>编号</th>
						<th>用户名</th>
						<th>姓名</th>
						<!-- <th>职位</th> -->
						<th><i class="icon-envelope"></i>邮箱</th>
						<th><i class="icon-time hidden-phone"></i>最近登录</th>
						<th>上次登录IP</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty userList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${userList}" var="user" varStatus="vs">
									
							<tr>
								<td class='center' style="width: 30px;">
									<c:if test="${user.hjsUser.username != 'admin' && user.hjsUser.id != '0'}"><label><input type='checkbox' name='ids' value="${user.hjsUser.id }" id="${user.hjsUser.email }" alt="${user.hjsUser.phone }"/><span class="lbl"></span></label></c:if>
									<c:if test="${user.hjsUser.username == 'admin' || user.hjsUser.id == 0}"><label><input type='checkbox' disabled="disabled" /><span class="lbl"></span></label></c:if>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td>${user.hjsUser.phone }</td>
								<td><a class="td_a" title="${user.hjsUser.username }">${user.hjsUser.username }</a></td>
								<td></td>
								<!--<td>职位</td>  -->
								<c:if test="${QX.FX_QX == 1 }">
								<td><a title="发送电子邮件" style="text-decoration:none;cursor:pointer;" >${user.hjsUser.email }&nbsp;</a></td>
								</c:if>
								<c:if test="${QX.FX_QX != 1 }">
								<td><a title="您无权发送电子邮件" style="text-decoration:none;cursor:pointer;">${user.hjsUser.email }&nbsp;<%-- <i class="icon-envelope"></i>--%></a></td>
								</c:if>
								<td><fmt:formatDate value="${user.lastTime}" pattern="yyyy/MM/dd HH:mm:ss" /><br/>
								</td>
								<td>${user.lastIp}</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										
										<%--<c:if test="${QX.FW_QX == 1 }">
										<a class='btn btn-mini btn-warning' title="发送短信" onclick="sendSms('${user.phone }');"><i class='icon-envelope'></i></a>
										</c:if>--%>
										
										<c:if test="${QX.edit == 1 }">
											<c:if test="${user.hjsUser.username != 'admin' && user.hjsUser.id != '0'}"><a class='btn btn-mini btn-info' title="编辑" onclick="editUser('${user.id }');">编辑</a></c:if>
											<c:if test="${user.hjsUser.username == 'admin' || user.hjsUser.id == '0'}"><a class='btn btn-mini btn-info' title="您不能编辑">编辑</a></c:if>
										</c:if>
										<c:if test="${QX.del == 1 }">
										<c:choose>										
											<c:when test="${user.hjsUser.username=='admin' || user.hjsUser.id == '0'}">
												<a class='btn btn-mini btn-danger' title="不能删除">删除</a>
											</c:when>
											<c:otherwise>
												 <a class='btn btn-mini btn-danger' title="删除" onclick="delUser('${user.id }','${user.hjsUser.username }');">删除</a>				
											</c:otherwise>
										</c:choose>
										</c:if>
									</div>
								</td>
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
				<td style="vertical-align:top;">
					<c:if test="${QX.add == 1 }">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					</c:if>
					<%-- <c:if test="${QX.FX_QX == 1 }">
					<a title="批量发送电子邮件" class="btn btn-small btn-info" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="icon-envelope-alt"></i></a>
					</c:if>
					<c:if test="${QX.FW_QX == 1 }">
					<a title="批量发送短信" class="btn btn-small btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="icon-envelope"></i></a>
					</c:if> --%>
					<c:if test="${QX.del == 1 }">
					<a title="删除" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" >删除</a>
					</c:if>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		</form>
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
		
		
		//去发送电子邮件页面
		function sendEmail(EMAIL){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送电子邮件";
			 diag.URL = '${project_name}/headsOpt/goSendEmail.do?EMAIL='+EMAIL;
			 diag.Width = 660;
			 diag.Height = 470;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//去发送短信页面
		function sendSms(phone){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送短信";
			 diag.URL = '${project_name}/headsOpt/goSendSms.do?PHONE='+phone+'&msg=appuser';
			 diag.Width = 600;
			 diag.Height = 265;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		//新增
		function add(){
			top.mainFrame.showTabPage("用户新增",'${project_name}/usersOpt/goAddU.do');
		}
		
		//修改
		function editUser(user_id){
			top.mainFrame.showTabPage("用户修改",'${project_name}/usersOpt/goEditU.do?USER_ID='+user_id);
		}
		
		//删除
		function delUser(userId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "${project_name}/usersOpt/deleteU.do?id="+userId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if(data=="success"){
							alert("用户删除成功");
						}
						nextPage(${page.pageNumber});
					});
				}
			});
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '${project_name}/user/deleteAllU.do?tm='+new Date().getTime(),
						    	data: {sysUserIds:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									
									//data=eval("json="+data);
									
									if("success" == data.result){
										alert("批量删除成功");
										if(msg == 'c'){
											top.jzts();
											document.location.reload();
										}else{
											top.jzts();
											window.location.href="user/listUsers.do";
										}
							
									}else if("false" == data.result){
										bootbox.dialog("用户删除失败!", 
										[{
											"label" : "关闭",
											"class" : "btn-small btn-success",
											"callback": function() {
									
											}
										}]);
									}
								}
							});
						}else if(msg == '确定要给选中的用户发送邮件吗?'){
							sendEmail(emstr);
						}else if(msg == '确定要给选中的用户发送短信吗?'){
							sendSms(phones);
						}
						
						
					}
				}
			});
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
		
		//导出excel
		function toExcel(){
			var USERNAME = $("#nav-search-input").val();
			var lastLoginStart = $("#lastLoginStart").val();
			var lastLoginEnd = $("#lastLoginEnd").val();
			var ROLE_ID = $("#role_id").val();
			window.location.href='${project_name}/user/excel.do?USERNAME='+USERNAME+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd+'&ROLE_ID='+ROLE_ID;
		}
		
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="EXCEL 导入到数据库";
			 diag.URL = '${project_name}/user/goUploadExcel.do';
			 diag.Width = 300;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.pageNumber}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.pageNumber});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		</script>
		
	</body>
	<jsp:include page="../../common/alert_message.jsp"  ></jsp:include>
</html>

