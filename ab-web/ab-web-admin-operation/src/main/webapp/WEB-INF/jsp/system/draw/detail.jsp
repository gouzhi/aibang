<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${project_name}/">
		<!-- jsp文件头和头部 -->
	    <%@ include file="../admin/top.jsp"%> 
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
		<!-- My97DatePicker -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>
		<!-- ueditor -->
		<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.all.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/lang/zh-cn/zh-cn.js"></script>
		<!-- jquery.validate -->
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/jquery.validation/css/validate.css">
		<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.metadata.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/jquery.validation/jquery.validate.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/jquery.validation/validate-methods.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		var windControlEditor = UE.getEditor('windControl',{readonly:true});
		</script>
	</head>
<body>
	<div class="row-fluid">
	    <div class="span12">基本信息</div>
	</div>
    <div class="row-fluid">
	    <div class="span2 pl">活动编号：</div>
	    <div class="span4"><span>${hjsActInfo.acode}</span></div>
	    <div class="span2 pl">活动名称：</div>
	    <div class="span4"><span>${hjsActInfo.aname}</span></div>
	</div>
	
	<div class="row-fluid">
		 <div class="span2 pl">开始时间：</div>
         <div class="span4"><span><fmt:formatDate value="${hjsActInfo.startTime }" pattern="yyyy-MM-dd"/></span></div>
		 <div class="span2 pl">结束时间：</div>
         <div class="span4"><span><fmt:formatDate value="${hjsActInfo.stopTime }" pattern="yyyy-MM-dd"/></span></div>
	</div>
	
	<div class="row-fluid">
	    <div class="span2 pl">活动预算：</div>
	    <div class="span4"><span>${hjsActInfo.budgetTotal}元</span></div>
	    <div class="span2 pl">活动规则：</div>
	    <div class="span4"><span title="${hjsActInfo.actRules}">${hjsActInfo.actRules}</span></div>
	</div>

	
	
	<div class="row-fluid">
	    <div class="span2 pl">已使用预算：</div>
	    <div class="span4"><span>${hjsActInfo.budgetUsed}元</span></div>
	    <div class="span2 pl">剩余预算：</div>
	    <div class="span4"><span>${hjsActInfo.budgetLast}元</span></div>
	</div>
	
	<div class="row-fluid">
	    <div class="span12">适用权限</div>
	</div>
	<div class="row-fluid">
	  	 <div class="span2 pl"><span class="required"></span>适用平台：</div>
	    <div class="span4">
	    	<span>
		    	<c:if test="${fn:contains(hjsActInfo.systemScope,'1')}">Web,</c:if>
			    <c:if test="${fn:contains(hjsActInfo.systemScope,'2')}">Android,</c:if>
			    <c:if test="${fn:contains(hjsActInfo.systemScope,'3')}">Ios,</c:if>
			    <c:if test="${fn:contains(hjsActInfo.systemScope,'4')}">H5</c:if>
	        </span>
	    </div>
	</div>
	<div class="row-fluid">
	    <div class="span12">奖项设置</div>
	</div>
	<div class="row-fluid">
	    <div class="span2 pl">抽奖基数：</div>
	    <div class="span4"><span>${hjsActDraw.baseNum}</span></div>
	    <div class="span2 pl">每人参与次数：</div>
	    <div class="span4">
	    	<span>
	    		<c:if test="${hjsActDraw.limitType == 1 }">
	    			${hjsActDraw.personLimit}次
	    		</c:if>
	    		<c:if test="${hjsActDraw.limitType == 2 }">
	    			${hjsActDraw.dayLimit}次/天
	    		</c:if>
	    	</span>
	    </div>
	</div>
	<div class="row-fluid">
	    <div class="span2 pl">奖品：</div>
	    <div class="span4"><span></span></div>
	</div>
	
	<table id="table_report" class="table table-striped table-bordered table-hover">
	         <thead>
					<tr>
						<th>奖品类型</th>
						<th>奖品名称</th>
						<th>奖品数量(个)</th>
						<th>奖值范围</th>
					</tr>
			</thead>
			<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty result1}">
						<c:if test="${QX.cha == 1 }">
							<c:forEach items="${result1}" var="var" varStatus="vs">
								<tr>
									<td>${var.AWARD_TYPE}</td>
									<td>${var.AWARD_NAME}</td>
									<td>${var.AWARD_NUM}</td>
									<td>${var.MIN_VALUE}-${var.MAX_VALUE}</td>
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
			<div class="page-header position-relative">
				<table style="width:100%;">
					<tr>
						<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page1.pageStr}</div></td>
					</tr>
				</table>
			</div>
			<div class="row-fluid">
		        <input type="button" style="width: 145px;height: 40px;line-height: 40px;border: none;color: #fff;background: #ccc;text-align: center;cursor: pointer;margin-left: 560px;" onclick="top.mainFrame.closeCurrTab()" class="span2" value="关闭">
		    </div>
	</table>
	<script type="text/javascript">
		$(document).ready(function(){
			/*登录验证模板*/
			$.metadata.setType("attr", "validate");
			$("#Form").validate({
				onfocusout:false,
				onclick:false,
				onkeyup:false,
				errorElement: "em",//用来创建错误提示信息标签(可自定义)
				errorContainer: $("#warning, #summary"),
				errorPlacement: function(error, element) {
					error.appendTo(element.parent()); 
				}
			});
			
			$("#subBtn").click(function(){
				 if($("Form").valid()){
		                 var startTime=$("#startTime").val();//开始时间
						 alert(startDate);
						 var stopTime=$("#stopTime").val();//停止时间
						 var type=$("#type").val();//活动类型
						 var status=$("#status").val();//活动状态
						 var bonusId=$("#bonusId").val();//活动红包Id
						 var bonusChargesId=$("#bonusChargesId").val();//返佣红包Id
						 
						 if(startTime == ""){
							 alert("输入开始时间不能为空。");
							 return false; 
						 }
						 if(stopTime == ""){
							 alert("输入停止时间不能为空。");
							 return false; 
						 }
						 if(type == ""){
							 alert("请输入活动类型。");
							 return false;
						 }
						 if(status == ""){
							 alert("请输入红包类型。");
							 return false;
						 }
						 if(bonusChargesId == ""){
							 alert("请输入返佣红包类型。");
							 return false;
						 }
						 alert("success")
						 //提交增加活动基本信息操作
						 $("#Form").submit();
					 }
				});
		});
	
		//加载投资状态信息
		window.onload = function ()
		{ 
			 setMUR();
		} 
		
		//判断活动类型是否是投资状态
		function setMUR()
		{
			//js中使用jstl中得到的值
			var result = "${hjsActInfo.type}"; 
			if(result == 2)
			{
				$('#bonusScope').css('display','block');
			}else{
				$('#bonusScope').css('display','none');
			}
		}
		
	$(top.hangge());
	$(function() {
		//单选框
		$(".chzn-select").chosen(); 
		$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
		//日期框
		$('.date-picker').datepicker();
	});
	
	</script>
</body>
</html>