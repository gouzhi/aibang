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
			<form action="cash/list" method="post" name="Form" id="Form">
			<table>
				<tr>
				   <td style="vertical-align:top;"> 
					 	<select  name="bankId" id="bankId"  style="vertical-align:top;width: 120px;">
							<option value="">&nbsp;全部类型</option>
							<c:forEach items="${banks}" var="item" varStatus="vs">
							  <option value="${item.id}" ${item.id eq query.bankId?"selected='selected'":""}>${item.bankName }</option>
							</c:forEach>
					  	</select>
					</td>
					<td style="vertical-align:top;"> 
					 	<select  name="status" id="status"   style="vertical-align:top;width: 120px;">
					 	   <option value="">&nbsp;提现状态</option>
					 	   <option value="">&nbsp;全部</option>
					 	   <c:forEach items="${statusTypes}" var="item" varStatus="vs">
							   <option value="${item.code}" ${item.code eq query.status?"selected='selected'":""}>${item.cname}</option>
							</c:forEach>
					  	</select>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="context" value="${query.context}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
		            <td><input class="span10" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询">查询</button></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>提现时间</th>
						<th>用户名</th>
						<th>手机号</th>
						<th>流水号</th>
						<th>提现金额（元）</th>
						<th>手续费（元）</th>
						<th>实际到账金额（元）</th>
						<th>提现方式</th>
						<th>状态</th>
						<th>备注</th> 
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
									    <td><fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>${var.USERNAME}</td>
										<td>${var.PHONE}</td>
										<td>${var.TRADE_ID}</td>
										<td>${var.TOTAL}</td>
										<td>${var.FEE}</td>
										<td>${var.CREDITED}</td>
										<td>${var.BANK_NAME}</td>
										<td>
										  <c:forEach items="${statusTypes}" var="item" varStatus="vs">
										   <c:if test="${item.code eq var.STATUS}">
										   ${item.cname}
										   </c:if>
								          </c:forEach>
                                        </td>
										<td>${var.REMARK}</td>
										<td style="width: 30px;" class="center">
												<div class='hidden-phone visible-desktop btn-group'>
												<c:if test="${QX.cha != 1  }">
												    <span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
												</c:if>
												<c:if test="${QX.cha == 1 }">
												    <div class="hidden-phone visible-desktop btn-group">
													   <a onclick="showDetail('${var.ID}',${var.STATUS});" title="查看" class="btn btn-mini btn-warning">查看</a>
													   <c:if test="${var.STATUS != 1}">
											           <a onclick="sysn(${var.ID});" title="同步" class="btn btn-mini btn-primary">同步</a>
											           </c:if>
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
		<script type="text/javascript" src="${css_imagedomain}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script><!--提示框-->
		<!-- My97DatePicker -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		//详细显示 
		//id 充值记录 state 成功失败 configid=27
		function showDetail(id,state) {
			top.mainFrame.showTabPage("充值详细",'${project_name}/cash/detail/'+id);
		}
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		function sysn(ordId){
			  $.ajax({
		             type: "GET",
		             url: "cash/tradeDetail",
		             data: {ordId:ordId},
		             dataType: "json",
		             success: function(data){
		            	 data = eval(data);
		                  alert(data.msg);
		                  location.reload();
		                   
		                 }
		         });
		}
		</script>
		
	</body>
</html>
