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
					<form action="usersInfo/listU.do" method="post" name="userForm" id="userForm">
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="checkStatus" id="checkStatus"  style="vertical-align:top;width: 120px;">
							<option <c:if test="${checkStatus == 0 }">selected=selected</c:if> value="0">默认</option>
							<option <c:if test="${checkStatus == 1 }">selected=selected</c:if> value="1">已投资</option>
							<option <c:if test="${checkStatus == 2 }">selected=selected</c:if> value="2">有冻结</option>
					  	</select>
					</td>
					<td style="vertical-align:top;">
					 	<select class="chzn-select" name="status" id="status" style="vertical-align:top;width: 120px;">					
							<option <c:if test="${status == '0' }">selected=selected</c:if> value="0">默认</option>
							<option <c:if test="${status == '1' }">selected=selected</c:if> value="1">有效</option>
							<option <c:if test="${status == '2' }">selected=selected</c:if> value="2">停用</option>
							<option <c:if test="${status == '3' }">selected=selected</c:if> value="3">受限</option>
					  	</select>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="username" value="${checkname }" placeholder="输入会员手机号/用户名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="phone" value="${checkphone }" placeholder="输入推荐人手机号/用户名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
					
					
					<input  name="lastTimeBegin" id="lastTimeBegin" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'lastTimeEnd\')||\'%y-%M-%d\'}'})"  value="<fmt:formatDate value='${checkTimeBegin}' pattern='yyyy-MM-dd' />" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"  title="最近登录开始"/></td>
					<td><input  name="lastTimeEnd" id="lastTimeEnd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'lastTimeBegin\')}',maxDate:'%y-%M-%d'})"  value="<fmt:formatDate value='${checkTimeEnd}' pattern='yyyy-MM-dd' />" type="text" readonly="readonly" style="width:88px;" placeholder="结束日期"  title="最近登录结束"/></td>
					  
					<c:if test="${QX.cha == 1 }">
						<td style="vertical-align:top;"><button class="btn btn-small btn-light" onclick="search();" title="查询">查询</button></td>
						<td style="vertical-align:top;"><span class="btn btn-small btn-light" id="synFadada" title="申请CA证书">申请CA证书</span></td>
					</c:if>
					</form>
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
						<th>推荐人</th>
						<th>投资数量</th>
						<th>投资金额</th>
						<th>账户金额</th>
						<th>冻结金额</th>
						<th>账号状态</th>
						<th>受限状态</th>
						<th>CA客户编号</th>
						<th class="center">操作</th>
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
									<c:if test="${user.hjsUser.username != 'admin' && user.hjsUser.id != '0'}"><label><input type='checkbox' name='ids' value="${user.hjsUser.id }" id="${user.hjsUser.email }" alt="${user.hjsUser.phone }"/><span class="lbl"></span></label></c:if>
									<c:if test="${user.hjsUser.username == 'admin' || user.hjsUser.id == 0}"><label><input type='checkbox' disabled="disabled" /><span class="lbl"></span></label></c:if>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td><a class="td_a" href="javascript:void(0);" onclick="detailUser('${user.id}')">${user.hjsUser.username}</a></td>
								<td>${user.hjsUser.realName }</td>
								<td><fmt:formatDate value="${user.hjsUser.createTime }" pattern="yyyy-MM-dd"/> </td>
								<td>${user.hjsUsersInvite.inviteBase.username }</td>
								<td>${user.hjsUserBase.tenderNum }</td>
								<td>${user.hjsUserBase.tenderAccount }</td>
								<td>${user.hjsUserBase.total }</td>
								<td>${user.hjsUserBase.frost }</td>
								<td><c:if test="${user.hjsUser.status == 1}">有效</c:if><c:if test="${user.hjsUser.status == 2}">停用</c:if></td>
								<td><c:if test="${user.hjsUsersBlack.charge == 1}">限制返佣</c:if><br /><c:if test="${user.hjsUsersBlack.limiteTender == 1}">限制投标</c:if></td>
								<td>${user.hjsUserBase.fadadaCaId }</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>	
										<c:if test="${QX.edit == 1 }">
											<c:if test="${user.hjsUser.username != 'admin' && user.hjsUser.id != '0'}"><a class='btn btn-mini btn-info' title="编辑" onclick="editUser('${user.id }');">编辑</a></c:if>
											<c:if test="${user.hjsUser.username == 'admin' || user.hjsUser.id == '0'}"><a class='btn btn-mini btn-info' title="您不能编辑">编辑</a></c:if>
										</c:if>
											<c:if test="${QX.edit == 1 }">
											<c:choose>
												<c:when test="${user.hjsUserBase.authorEndDate == null || user.hjsUserBase.authorEndDate.getTime()<currentDate.getTime() }">
													<a class='btn btn-mini btn-info' title="授权" onclick="authorTrade('${user.userId }','${user.hjsUserBase.fadadaCaId }');">授权</a>
												</c:when>
												<c:otherwise >
													<a class='btn btn-mini btn-info' disabled="disabled"  title="授权" onclick="javascript:void(0)">授权</a>
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
								<td colspan="13" class="center">您无权查看</td>
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
		
		//同步开通法大大
		$('#synFadada').click(function(){
			alert("点击确定后,申请法大大开始,请内心等待");
			$.ajax({
				type: "post",
				url: "${project_name}/usersInfo/synFadada",
				success: function(data){
					alert(data);
				}
			});
		})

		//修改
		function editUser(user_id){
			top.mainFrame.showTabPage("用户修改",'${project_name}/usersInfo/toEdit.do?id='+user_id);
		}
		
		//授权
		function authorTrade(userId,fadadaCaId) {
		 
			$(this).attr('disabled','disabled');
			$.ajax({
				type: "post",
				async: false,
				url: "${project_name}/account/authorTrade.do?userId="+userId+"&fadadaCaId="+fadadaCaId,
				success: function(data){
					top.mainFrame.showTabPage("用户授权",data);
				}
			});
		}
		//详细
		function detailUser(user_id){
			top.mainFrame.showTabPage("会员详细",'${project_name}/usersInfo/detail.do?id='+user_id);
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

