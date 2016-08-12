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
			<form action="${project_name}/hjsuserschannelrecord/list/${chlid}" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span>
							渠道方用户名:<input autocomplete="off" id="nav-search-input" type="text" name="chlUsername" value=""  />
							类别:<input autocomplete="off" id="nav-search-input" type="text" name="typeNo" value=""  />
							<!-- <i id="nav-search-icon" class="icon-search"></i> -->
						</span>
					</td>
					<td><input class="span10" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.updateTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'createTimeBegin',dateFmt:'yyyy-M-d',createTimeBegin: '%y-%M-%d'  })" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'createTimeEnd',dateFmt:'yyyy-M-d',createTimeEnd: '%y-%M-%d'  })" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<!-- <td style="vertical-align:top;"> 
					 	<select  name="field2" id="field2" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">1</option>
							<option value="">2</option>
					  	</select>
					</td> -->
					<%-- <c:if test="${QX.cha == 1 }"> --%>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询">查询</button></td>
					<%-- </c:if> --%>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="importExl();"  title="导出">导出</button></td>
					<td>
						<input type="hidden" value="0" name="importFlag" id="importFlag"/>
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类别说明：0注册，1开户，2绑卡，3投资，4放款
					</td>

				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<!-- <th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> 
						<th>序号</th>-->
						<!-- <th>ID</th>
						<th>类型  0注册 1投资</th> -->
						<th>渠道方用户ID</th>
						<th>渠道方用户名</th>
						<th>渠道方ID</th>
						<th>渠道方LOGO</th>
						<!-- <th>渠道方基表ID</th> -->
						<!-- <th>我方用户BASEID</th> -->
						<th>平台用户名</th>
						<th>首次投资金额</th>
						<th>类别</th>
						<th>标ID</th>
						<th>日期</th>
						<!-- <th class="center">操作</th> -->
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty list}">
							<c:forEach items="${list}" var="hcr" varStatus="vs">
								<tr>
									<%-- <td class='center' style="width: 30px;">
										<label><input type='checkbox' name='ids' value="${hcr.HjsUsersChannelRecord_ID}" /><span class="lbl"></span></label>
									</td> 
									<td class='center' style="width: 30px;">${vs.index+1}</td>--%>
											<%-- <td>${hcr.ID}</td>
											<td>${hcr.TYPE_NO}</td> --%>
											<td>${hcr.CHL_USERID}</td>
											<td>${hcr.CHL_USERNAME}</td>
											<td>${hcr.CHLID}</td>
											<td>${hcr.LOGO}</td>
											<%--<td>${hcr.USERID}</td> --%>
											<td>${hcr.USERNAME}</td>
											<td>${hcr.TENDER_ACCOUNT}</td>
											<td>${hcr.TYPE_NO}</td>
											<td>${hcr.BORROWID}</td>
											<td>${hcr.CREATE_TIME}</td>
									
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
		<!--
		<div class="page-header position-relative">
			<table style="width:100%;">
				<tr>
					<td style="vertical-align:top;">
						
						
						
					</td>
					<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
				</tr>
			</table>
		</div>
		</form>
	</div>
	 PAGE CONTENT ENDS HERE -->
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
		/* $(top.hangge()); */
		
		//检索
		function search(){
			
			$("#importFlag").val("0");
			$("#Form").submit();
		}
		
		function importExl(){
			$("#importFlag").val("1");
			$("#Form").submit();
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

