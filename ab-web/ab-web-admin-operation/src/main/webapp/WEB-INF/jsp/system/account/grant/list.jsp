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
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索  -->
			<form action="grant/list" method="post" name="Form" id="Form">
		 
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>产品名称</th>
						<th>关联借款</th>
						<th>产品金额</th>
						<th>实际投标金额</th>
						<th>满标时间</th>
						<th>状态</th>
						<th class="center">操作</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:if test="${QX.cha == 1 }">
							<c:forEach items="${page.result}" var="var" varStatus="vs">
								<tr>
									<td>${var.ID}</td>
									<td><a href="javascript:void(0)" style="color: blue;" onclick="showDetail(${var.ID })">${var.B_NAME }</a></td>
									<td>${var.P_NAME}</td>
									<td>${var.ACCOUNT}</td>
									<td>${var.BORROW_ACCOUNT_YES}</td>
									<td><fmt:formatDate value="${var.AU_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
									<c:choose>
									  <c:when test="${ var.VERIFY_STATUS==3}">待放款</c:when>
									  <c:when test="${ var.VERIFY_STATUS==5}">已放款</c:when>
									  <c:when test="${ var.VERIFY_STATUS==6}">未通过</c:when>
									</c:choose>
									</td>
									<td style="width: 30px;" class="center">
										<div class='hidden-phone visible-desktop btn-group'>
											<c:if test="${QX.cha != 1  }">
											    <span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:if>
											<c:if test="${QX.audit == 1 and var.VERIFY_STATUS!=5 }">
											    <div class="hidden-phone visible-desktop btn-group">
												   <a onclick="grantAudit('${var.ID}',${var.VERIFY_STATUS});" title="操作" class="btn btn-mini btn-purple">操作</a>
										        </div>
										    </c:if>
										    <c:if test="${QX.audit == 1 and var.VERIFY_STATUS==5 }">
											    <div class="hidden-phone visible-desktop btn-group">
												   <a   title="已操作" class="btn btn-mini ">已操作</a>
										        </div>
										    </c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
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
		<script type="text/javascript" src="${css_imagedomain}/plugins/jsCalendar/WdatePicker.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		$(top.hangge());
		 
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
        //拨款审核 2 待审 4 未通过		
		function grantAudit(id,state)
		{
			top.jzts();
		 	var diag = new top.Dialog();
		 	diag.Drag=true;
			diag.Title ="操作";
			diag.URL = '${project_name}/grant/auditing.do?id='+id;
			diag.Width = 600;
			diag.Height = 270;
			diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts();
				setTimeout("self.location.reload()",100);
				
			}
			top.mainFrame.reloadPage(/grant\/list/);
			diag.close();
			};
			diag.show();
		}
        
		//显示详情
		function showDetail(borrowid){
			top.jzts();
		 	var diag = new top.Dialog();
		 	diag.Drag=true;
			diag.Title ="详情";
			diag.URL = '${project_name}/borrow/detail.do?borrowid='+borrowid;
			diag.Width = 950;
			diag.Height = 1500;
			diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts();
				setTimeout("self.location.reload()",100);
				
			}
			//top.mainFrame.reloadPage(/borrow\/fullscale.do/);
			diag.close();
			};
			diag.show();
		}
		</script>
	</body>
</html>

