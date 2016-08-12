<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<#assign objectNameUpper = table.className>   
<#assign objectNameLower = objectNameUpper?uncap_first> 
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="${r"${project_name}"}/">
    <meta charset="utf-8" />
	<title></title>
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="${r"${css_imagedomain}"}/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${r"${css_imagedomain}"}/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/ace.min.css" />
	<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="${r"${css_imagedomain}"}/css/ace-skins.min.css" />
	<script type="text/javascript" src="${r"${css_imagedomain}"}/js/jquery-1.7.2.js"></script>
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索  -->
			<form action="${objectNameLower}/list.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="field1" value="" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${r"${query.updateTimeEnd}"}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'createTimeBegin',dateFmt:'yyyy-M-d',createTimeBegin: '%y-%M-%d'  })" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${r"${query.createTimeEnd}"}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'createTimeEnd',dateFmt:'yyyy-M-d',createTimeEnd: '%y-%M-%d'  })" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<#--<td style="vertical-align:top;">--> 
					<#--<select class="chzn-select" name="field2" id="field2" data-placeholder="请选择" style="vertical-align:top;width: 120px;">-->
					<#--		<option value="">1</option>-->
					<#--		<option value="">2</option>-->
					<#--  	</select>-->
					<#--</td>-->
					<td style="vertical-align:top;"> 
					 	<select  name="field2" id="field2" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">1</option>
							<option value="">2</option>
					  	</select>
					</td>
					<c:if test="${r"${QX.cha == 1 }"}">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询">查询</button></td>
					<#--<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL">导出</a></td>-->
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
				        <#list table.columns as column>
						<th>${column.columnAlias}</th>
				        </#list>
						<th class="center">操作</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${r"${not empty page.result}"}">
						<c:if test="${r"${QX.cha == 1 }"}">
							<c:forEach items="${r"${page.result}"}" var="var" varStatus="vs">
								<tr>
									<td class='center' style="width: 30px;">
										<label><input type='checkbox' name='ids' value="${r"${var."}${objectNameUpper}_ID${r"}"}" /><span class="lbl"></span></label>
									</td>
									<td class='center' style="width: 30px;">${r"${vs.index+1}"}</td>
									<#list table.columns as column>
											<td>${r"${var."}${column.columnNameLower}${r"}"}</td>
									</#list>
									<td style="width: 30px;" class="center">
										<div class='hidden-phone visible-desktop btn-group'>
										
											<c:if test="${r"${QX.edit != 1 && QX.del != 1 }"}">
											<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:if>
											<div class="inline position-relative">
											<button class="btn btn-mini btn-info" data-toggle="dropdown"><i class="icon-cog icon-only"></i></button>
											<ul class="dropdown-menu dropdown-icon-only dropdown-light pull-right dropdown-caret dropdown-close">
												<c:if test="${r"${QX.edit == 1 }"}">
												<li><a style="cursor:pointer;" title="编辑" onclick="edit('${r"${var."}${objectNameUpper}_ID${r"}"}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green">编辑</span></a></li>
												</c:if>
												<c:if test="${r"${QX.del == 1 }"}">
												<li><a style="cursor:pointer;" title="删除" onclick="del('${r"${var."}${objectNameUpper}_ID${r"}"}');" class="tooltip-error" data-rel="tooltip" title="" data-placement="left"><span class="red">删除</span> </a></li>
												</c:if>
											</ul>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${r"${QX.cha == 0 }"}">
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
						<c:if test="${r"${QX.add == 1 }"}">
						<a class="btn btn-small btn-success" onclick="add();">新增</a>
						</c:if>
						
						<#--<c:if test="${r"${QX.del == 1 }"}">-->
						<#--<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a>-->
						<#--</c:if>-->
						
					</td>
					<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${r"${page.pageStr}"}</div></td>
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
		<script src="${r"${css_imagedomain}"}/js/bootstrap.min.js"></script>
		<script src="${r"${css_imagedomain}"}/js/ace-elements.min.js"></script>
		<script src="${r"${css_imagedomain}"}/js/ace.min.js"></script>
		<script type="text/javascript" src="${r"${css_imagedomain}"}/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="${r"${css_imagedomain}"}/plugins/jsCalendar/WdatePicker.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="${r"${css_imagedomain}"}/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script type="text/javascript" src="${r"${css_imagedomain}"}/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '${r"${project_name}"}/${objectNameLower}/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${r"${page.currentPage}"}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${r"${page.currentPage}"});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "${r"${project_name}"}/${objectNameLower}/delete.do?${objectNameUpper}_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${r"${page.currentPage}"});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '${r"${project_name}"}/${objectNameLower}/goEdit.do?${objectNameUpper}_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${r"${page.currentPage}"});
				}
				diag.close();
			 };
			 diag.show();
		}
		</script>
		
		<script type="text/javascript">
		$(function() {
			<#--//下拉框-->
			<#--$(".chzn-select").chosen(); -->
			<#--$(".chzn-select-deselect").chosen({allow_single_deselect:true}); -->
			<#--//日期框-->
			<#--$('.date-picker').datepicker();-->
			
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
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
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
								url: '${r"${project_name}"}/${objectNameLower}/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${r"${page.currentPage}"});
									 });
								}
							});
						}
					}
				}
			});
		}
		
		<#--//导出excel-->
		<#--function toExcel(){-->
		<#--	window.location.href='${r"${project_name}"}/${objectNameLower}/excel.do';-->
		<#--}-->
		</script>
		
	</body>
</html>

