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
	<style>
	.condition{height:36px;line-height:36px;margin-bottom:15px;}
	.condition span{display:inline-block;width:70px;font-size:14px;color:#383838;}
	.condition select{min-width:100px;height:34px;line-height:34px;vertical-align:top;} 
	.condition i{font-style:normal;margin:0 10px; display:inline-block;height:36px;line-height:36px;}
	</style>
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索  -->
			<form action="hjsfundfundsinfo/list.do" method="post" name="Form" id="Form">
				<div class="condition">
					<span>创建日期</span><input class="span10" name="createTimeBegin" id="createTimeBegin" value="<fmt:formatDate value="${hjsFundFundsinfoQuery.createTimeBegin}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" type="text" readonly="readonly" style="width:88px;" placeholder="开始日期"/>
					<i>至</i><input class="span10" name="createTimeEnd" id="createTimeEnd" value="<fmt:formatDate value="${hjsFundFundsinfoQuery.createTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" type="text"  readonly="readonly" style="width:88px;" placeholder="结束日期"/>
					<span style="margin-left:400px;">基金公司</span> 
						<select  name="corporation" id="field2" data-placeholder="请选择">
							<option value="">不限</option>
							<c:forEach items="${findNotStopCompany }" var="item">
	               			<option value="${item.companyName }" <c:if test="${hjsFundFundsinfoQuery.corporation eq item.companyName}">selected="selected"</c:if>>${item.companyName }</option>
	                		</c:forEach>
					  	</select>
				</div>
				<div class="condition">
					<span>基金类型</span>
					 	<select  name="type" id="field2" data-placeholder="请选择">
							<option value="">全部</option>
							<option value="FUND_STOCK" ${hjsFundFundsinfoQuery.type eq 'FUND_STOCK' ?"selected='selected'":""}> 股票基金</option>
							<option value="FUND_BOND" ${hjsFundFundsinfoQuery.type eq 'FUND_BOND' ?"selected='selected'":""}>债券基金</option>
							<option value="FUND_MONEY" ${hjsFundFundsinfoQuery.type eq 'FUND_MONEY' ?"selected='selected'":""}>货币基金</option>
							<option value="FUND_MIX" ${hjsFundFundsinfoQuery.type eq 'FUND_MIX' ?"selected='selected'":""}>混合基金</option>
							<option value="FUND_INDEX" ${hjsFundFundsinfoQuery.type eq 'FUND_INDEX' ?"selected='selected'":""}>指数基金</option>
							<option value="FUND_PRESERV" ${hjsFundFundsinfoQuery.type eq 'FUND_PRESERV' ?"selected='selected'":""}>保本</option>
							<option value="FUND_ETF" ${hjsFundFundsinfoQuery.type eq 'FUND_ETF' ?"selected='selected'":""}>ETF</option>
							<option value="FUND_QDII" ${hjsFundFundsinfoQuery.type eq 'FUND_QDII' ?"selected='selected'":""}>QDII</option>
							<option value="FUND_OTHER" ${hjsFundFundsinfoQuery.type eq 'FUND_OTHER' ?"selected='selected'":""}>其他</option>
					  	</select>
					<span style="margin-left:391px;">上下架状态</span>
					 	<select  name="verifyStatus" id="field2" data-placeholder="请选择" >
							<option value="">全部</option>
							<option value="1" ${hjsFundFundsinfoQuery.verifyStatus eq 1? "selected='selected'":"" }>上架</option>
							<option value="0" ${hjsFundFundsinfoQuery.verifyStatus eq 0 ?"selected='selected'":"" }>下架</option>
					  	</select>
					</div>
					<div class="condition">
					<span>查询基金</span>
					<input type="text" placeholder="基金简称/代码" name="context" value="${hjsFundFundsinfoQuery.context }" style="height:35px;font-size:14px ;font-weight:400;width: 270px;">
					<c:if test="${QX.cha == 1 }">
					<button class="btn btn-mini btn-light" onclick="search();"style="height:35px;font-size:14px ;font-weight:400;width:52px;" title="查询">查询</button>
					</c:if>
					</div>
		<a  class="btn btn-mini btn-primary" id="putaway"  >上架</a>
		<a class="btn btn-mini btn-primary" id="unshelve"  >下架</a>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th>基金代码</th>
						<th>基金简称</th>
						<th>基金类型</th>
						<th>基金公司</th>
						<th>创建日期</th>
						<th>产品状态</th>
						<th>操作人</th>
						<th>操作时间</th>
						<th>上下架状态</th>
					</tr>
				</thead>
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:if test="${QX.cha == 1 }">
							<c:forEach items="${page.result}" var="var" varStatus="vs">
								<tr>
									<td class='center' style="width: 30px;">
										<label><input type='checkbox' name='ids' value="${var.ID}" /><span class="lbl"></span></label>
									</td>
											<td>${var.FUNDCODE}</td>
											<td><a href="hjsfundfundsinfo/fundDetail?id=${var.ID}">${var.ABBREV}</a></td>
											
											<td>
											<c:if test="${var.TYPE=='FUND_STOCK'}">
											股票基金
											</c:if>
											<c:if test="${var.TYPE=='FUND_BOND'}">
											债券基金
											</c:if>
											<c:if test="${var.TYPE=='FUND_MONEY'}">
											货币基金
											</c:if>
											<c:if test="${var.TYPE=='FUND_MIX'}">
											混合基金
											</c:if>
											<c:if test="${var.TYPE=='FUND_INDEX'}">
											指数基金
											</c:if>
											<c:if test="${var.TYPE=='FUND_PRESERV'}">
											保本
											</c:if>
											<c:if test="${var.TYPE=='FUND_ETF'}">
											ETF
											</c:if>
											<c:if test="${var.TYPE=='FUND_QDII'}">
											QDII
											</c:if>
											<c:if test="${var.TYPE=='FUND_OTHER'}">
											其他
											</c:if>
											</td>
											<td>${var.CORPORATION} </td>
											<td>${var.CREATE_TIME}</td>
											<td>
											<c:if test="${var.PURCHASE_STATUS==0 || var.PURCHASE_STATUS==2}">暂停购买</c:if>
											<c:if test="${var.PURCHASE_STATUS==1 || var.PURCHASE_STATUS==3}">立即申购</c:if>
											<c:if test="${var.PURCHASE_STATUS==4}">立即认购</c:if>
											</td>
											<td>${var.VERIFY_NAME}</td>
											<td>${var.VERIFY_TIME}</td>
											<td>
											<c:if test="${var.VERIFY_STATUS==0}">下架</c:if>
											<c:if test="${var.VERIFY_STATUS==1}">上架</c:if>
											</td>

										
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

		</form>
		
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
		
		</script>
		
	</body>
</html>
<script>
//上架操作
$("#putaway").click(function(){
	var fundsinfoIds = new Array();
	$("input[name='ids']").each(function(){
		if($(this).is(":checked")){
			fundsinfoIds.push($(this).attr("value"));
		}
	});
          
	if(null == fundsinfoIds || "" == fundsinfoIds){
		alert("请选择需要操作的产品");return false;
	}
 	var diag = new top.Dialog();
 	diag.Title="上架";
 	diag.Drag=true;
	diag.URL = '${project_name}/hjsfundfundsinfo/upOrDown?fundsinfoIds='+fundsinfoIds+"&type="+1;
	diag.Width = 600;
	diag.Height = 270;
	diag.CancelEvent = function(){ //关闭事件
	 	/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			top.jzts();
			setTimeout("self.location.reload()",100);
			
		}  */
		top.mainFrame.reloadPage(/hjsfundfundsinfo\/list/);
		diag.close();
	};
	diag.show();
})


//下架操作
$("#unshelve").click(function(){
	var fundsinfoIds = new Array();
	$("input[name='ids']").each(function(){
		if($(this).is(":checked")){
			fundsinfoIds.push($(this).attr("value"));
		}
	});
          
	if(null == fundsinfoIds || "" == fundsinfoIds){
		alert("请选择需要操作的产品");return false;
	}
 	var diag = new top.Dialog();
 	
 	diag.Drag=true;
	diag.URL = '${project_name}/hjsfundfundsinfo/upOrDown?fundsinfoIds='+fundsinfoIds+"&type="+0;
	diag.Width = 600;
	diag.Height = 270;
	
	diag.CancelEvent = function(){ //关闭事件
	/* 	 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			top.jzts();
			setTimeout("self.location.reload()",100);
			
		}  */
		top.mainFrame.reloadPage(/hjsfundfundsinfo\/list/);
		diag.close();
	};
	diag.show();
})


</script>
