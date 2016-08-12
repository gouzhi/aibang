<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="${project_name}/">
    <meta charset="utf-8" />
	<title>大转盘列表</title>
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
	<!-- My97DatePicker -->
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
			<form action="hjsactinfo/drawList.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input  id="nav-search-input" type="text" name="context" value="${query.context }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<%-- <td><input class="span10" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'createTimeBegin',dateFmt:'yyyy-M-d',createTimeBegin: '%y-%M-%d'  })" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({el:'createTimeEnd',dateFmt:'yyyy-M-d',createTimeEnd: '%y-%M-%d'  })" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/></td> --%>
					<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd"/>" type="text"  readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd"/>" type="text"   readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<!-- <td style="vertical-align:top;"> 
					 	<select  name="field2" id="field2" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">1</option>
							<option value="">2</option>
					  	</select>
					</td> -->
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="查询">查询</button></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<!-- <th class="center">
							<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> -->
						<th>编号</th>
						<th>活动名称</th>
						<th>活动周期</th>
						<th>活动规则</th>
						<th>活动预算(元)</th>
						<!-- <th>已使用预算(元)</th>
						<th>剩余预算(元)</th> -->
						<th>适用平台</th>
						<th>创建时间</th>
						<th class="center">活动状态</th>
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
									<%-- <td class='center' style="width: 30px;">
										<label><input type='checkbox' name='ids' value="${var.HjsActDraw_ID}" /><span class="lbl"></span></label>
									</td> --%>
									<%-- <td class='center' style="width: 30px;">${vs.index+1}</td> --%>
											<td>${var.ID}</td>
											<td align='center'>
												<a href="javascript:void(0)" style="color: blue;"  onclick="showDetail(${var.ID})">${var.A_NAME}</a>
											</td>
											<td align='center' >
												<fmt:formatDate value="${var.START_TIME}" pattern="yyyy-MM-dd " /> - <fmt:formatDate value="${var.STOP_TIME}" pattern="yyyy-MM-dd " />
											</td>
											<%-- <td class="td_b">${var.ACT_RULES}</td> --%>
											<td>
												<span class="td_b" style="width: 100px;">${var.ACT_RULES}</span>
											</td>
											<td>${var.BUDGET_TOTAL}</td>
											<%-- <td>${var.BUDGET_USED}</td>
											<td>${var.BUDGET_LAST}</td> --%>
											<td>${var.SYSTEM_SCOPE}</td>
											<td align='center' >
												<fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td style="width:60px;" class="center">
												<label>
													<input type="checkbox" class="ace-switch ace-switch-3" id="act_statu_${var.ID}" <c:if test="${var.STATUS == 1 }">checked="checked"</c:if>  onclick="checkedActIsOpen('${var.ID}')"/><span class="lbl"></span>
												</label>
											</td>
											
											<!-- <td><button>编辑</button>&nbsp;<button>设置奖品</button>&nbsp;<button>中奖记录</button></td> -->
											<td style="width: 30px;" class="center">
										<div class='hidden-phone visible-desktop btn-group'>
											<c:if test="${QX.edit != 1 && QX.del != 1 }">
											<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:if>
											<div class="inline position-relative">
												<%-- <div class='hidden-phone visible-desktop btn-group'>	
														<a class='btn btn-mini btn-info' title="关联红包" onclick="goBonus(${var.ID });">关联红包</a>
												</div> --%>
												<div class='hidden-phone visible-desktop btn-group'>	
														<a class='btn btn-mini btn-info' title="编辑" onclick="goEdit('${var.ID }');">编辑</a>
												</div>
												<div class='hidden-phone visible-desktop btn-group'>	
														<a class='btn btn-mini btn-info' title="设置奖品" onclick="setAward('${var.ID }','${var.OPT_ID }');">设置奖品</a>
												</div>
												<div class='hidden-phone visible-desktop btn-group'>	
														<a class='btn btn-mini btn-info' title="中奖记录" onclick="goAwardWin('${var.ID }');">中奖记录</a>
												</div>
											</div>
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
					<%-- <td style="vertical-align:top;">
						<c:if test="${QX.add == 1 }">
							<a class="btn btn-small btn-success" onclick="add();">新增</a>
						</c:if>
					</td> --%>
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
	
		<script type="text/javascript">
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//加载修改大转盘基信息页面
		function goEdit(id){
		    top.mainFrame.showTabPage("修改大转盘信息",'${project_name}/hjsactinfo/goDrawEdit.do?id='+id);
		}
		
		//查看大转盘基信息页面
		function showDetail(id){
		    top.mainFrame.showTabPage("查看大转盘",'${project_name}/hjsactinfo/drawDetail.do?id='+id);
		}
		
		//设置奖品
		function setAward(actId,optId){
		    top.mainFrame.showTabPage("奖品设置",'${project_name}/hjsactdraw/goAdd.do?actId='+actId+"&optId="+optId);
		}
		
		//中奖查看
		function goAwardWin(actId){
			top.mainFrame.showTabPage("中奖记录",'${project_name}/hjsactdrawawardwin/list.do?actId='+actId);
		}
		 
		//设置活动是否开启
		function checkedActIsOpen(id){ 
		   $.post("${project_name}/hjsactinfo/actIsOpen.do?id="+id+"&status="+($("#act_statu_"+id).prop("checked")?1:2));
		}
		
		</script>
		
	</body>
</html>

