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
	<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
	<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
	<script src="${css_imagedomain}/js/ace.min.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
	<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
	
	<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
	<script  type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
	<script  type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());
	</script>
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
		
		<!-- 检索  -->
			<form action="hjsactbonususersmanual/grantBonusList" method="post" name="Form" id="Form">
	        <div class="span2">
	        	<span class="input-icon">
							<input  id="nav-search-input" type="text" name="context" value="${query.context}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
				</span>
	        </div>
	           <td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
		       <td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
			
			<c:if test="${QX.cha == 1 }">
				<td style="vertical-align:top;">
					<button class="btn btn-mini btn-light" onclick="search();"  title="查询" style="margin-top:-10px;">查询</button>
					<!-- <button class="btn btn-mini btn-light" onclick="grantBonus();"  title="发放" style="margin-top:-10px;">发放</button> -->
				</td>
			</c:if>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover" >
				<thead align="center">
					<tr align="center">
						<!-- <th class="center">
							<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> -->
						<th align="center">手机号</th>
						<th align="center">用户名</th>
						<th align="center">姓    名</th>
						<!-- <th>红包类型</th> -->
						<th align="center">红包名称</th>
						<th align="center">红包面值(元)</th>
						<th align="center">数量(次)</th>
						<th align="center">红包说明</th>
						<th align="center">发放时间</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty typeList}">
						<c:if test="${QX.cha == 1 }">
							<c:forEach items="${typeList}" var="var" varStatus="vs">
								<tr>
											<td align="center">${var.phone}</td>
											<td align="center">${var.username}</td>
											<td align="center">${var.realname}</td>
											<%-- <td>${var.bonusId}</td> --%>
											<td align="center">${var.bname}</td>
											<td align="center">${var.value}</td>
											<td align="center">${var.bonusNum}</td>
											<td align="center">${var.memo}</td>
											<%-- <td>${fn:substring(var.createTime, 0, 19)}</td> --%>
											<td class='left'>
												<fmt:formatDate value="${var.createTime}" pattern="yyyy-MM-dd HH:mm" />
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
					<td style="vertical-align:top;">
						<c:if test="${QX.add == 1 }">
						<a class="btn btn-small btn-success" onclick="grantBonus();">发放</a>
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
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
			$(top.hangge());
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
			
			
			//加载发放红包页面
			function grantBonus()
			{
				top.mainFrame.showTabPage("发放红包",'${project_name}/hjsactbonususersmanual/goAdd.do');
				 
				/* top.jzts();
	         	var diag = new top.Dialog();
	         	diag.Drag=true;
	        	diag.Title ="发放红包";
	        	diag.URL = '${project_name}/hjsactbonususersmanual/goAdd.do';
	        	diag.Width = 680;
	        	diag.Height = 520;
	        	diag.CancelEvent = function(){ //关闭事件
	        	diag.close();
	        	};
	        	diag.show(); */
			}
		</script>
	</body>
</html>

