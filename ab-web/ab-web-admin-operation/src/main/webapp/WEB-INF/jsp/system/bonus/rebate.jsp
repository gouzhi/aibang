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
		<form action="hjsactbonususers/rebateList.do" method="post" name="Form" id="Form">
			<div class="row-fluid row_header">
	        <div class="span2">
	        	<span class="input-icon">
							<input  id="nav-search-input" type="text" name="context" value="${query.context}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
				</span>
	        </div>
	        <%-- <td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
			<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td> --%>
			<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
			<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
			<c:if test="${QX.cha == 1 }">
				<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询" style="margin-top:-10px;">查询</button></td>
			</c:if>
		</div>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
			    <thead>
					<tr>
						<!-- <th class="center">
							<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> -->
						<!-- <th width="200">编号</th> -->
						<th>用户名</th>
						<th>手机号</th>
						<th>姓名</th>
						<th>关联的活动</th>
						<th>返佣金额(元)</th>
						<th>创建时间</th>
						<!-- <th>使用时间</th> -->
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty hjsActBonusUsers}">
							<c:forEach items="${hjsActBonusUsers}" var="var" varStatus="vs">
								<tr>
									<!-- <td class='center' style="width: 30px;">
										<label><input type='checkbox' name='ids'  /><span class="lbl"></span></label>
									</td> -->
									<%-- <td align="center">
										<span class="td_a">${var.BU_CODE}</span>
									</td> --%>
									<td align="center">${var.USERNAME}</td>
									<td align="center">${var.PHONE}</td>
									<td align="center">${var.REALNAME}</td>
									<!-- 关联的活动 -->
									<td align='center'>
										<a href="javascript:void(0)" style="color: blue;" onclick="showDetail(${var.ID})">${var.A_NAME}</a>
									</td>
									<td align="center">${var.VALUE}</td>
									<td align="center">${fn:substring(var.CREATE_TIME, 0, 19)}</td>
									<%-- <td align="center">${fn:substring(var.CREATE_TIME, 0, 19)}</td> --%>
								</tr>
							</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
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
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
	<script type="text/javascript">
		$(top.hangge());
		
		//检索
		/* function search()
		{
			top.jzts();
			//$("#Form").submit();
			 top.mainFrame.showTabPage("修改活動信息",'${project_name}/hjsactbonususers/list.do');
		} */
		
	/**
    	查看活动详细信息
    */
    function showDetail(id)
	{
    	top.jzts();
     	var diag = new top.Dialog();
     	diag.Drag=true;
    	diag.Title ="详情";
    	diag.URL = '${project_name}/hjsactinfo/detail.do?id='+id;
    	diag.Width = 950;
    	diag.Height = 380;
    	diag.CancelEvent = function(){ //关闭事件
    	diag.close();
    	};
    	diag.show();
    } 
	</script>
		<script type="text/javascript">
		
		$(function() {
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
</html>

