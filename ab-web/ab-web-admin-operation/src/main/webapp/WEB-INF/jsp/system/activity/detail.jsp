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
	<%-- <input type="hidden" value="${var.id}" name="id"/> --%>
	<div class="row-fluid">
	    <div class="span12">活动基本信息</div>
	</div>
    <div class="row-fluid">
	    <div class="span2 pl">活动名称：</div>
	    <div class="span4"><span>${hjsActInfo.aname}</span></div>
	    <div class="span2 pl">活动编号：</div>
	    <div class="span4"><span>${hjsActInfo.acode}</span></div>
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
	    <div class="span2 pl">活动来源：</div>
	    <div class="span4"><span title="${hjsActInfo.actSource}">${hjsActInfo.actSource}</span></div>
	    <div class="span2 pl">活动链接：</div>
	    <div class="span4"><span title="${hjsActInfo.actUrl}">${hjsActInfo.actUrl}</span></div>
	</div>
	
	<div class="row-fluid">
     	<div class="span2 pl">活动类型：</div>
         <div class="span4" onload="setMUR()" >
           <c:forEach items="${actType }" var="item" >
              <c:if test="${hjsActInfo.type eq item.code}"><span>${item.cname }</span></c:if>
           </c:forEach>
         </div>
     	<div class="span2 pl">活动状态：</div>
         <div class="span4">
           <c:forEach items="${actStatus }" var="item">
           <c:if test="${hjsActInfo.status eq item.code}"><span>${item.cname }</span></c:if>
           </c:forEach>
         </div>
     </div>
	<div class="row-fluid">
     	<div class="span2 pl">活动红包：</div>
         <div class="span4">
            <!-- 1：现金红包    2：返佣红包 -->
			<!-- 查询出是现金红包还是返佣红包的活动红包 -->
				<c:forEach items="${typeList}" var="pc1" varStatus="vspc">
					<c:if test="${pc1.ID == hjsActInfo.bonusId}">
						<option value="${pc1.ID}" >${pc1.B_NAME}</option>
					</c:if>
				</c:forEach>
         </div>
     	<div class="span2 pl">返佣红包：</div>
         <div class="span4">
           <!-- 1：现金红包    2：返佣红包 -->
			<!-- 查询出是现金红包还是返佣红包的活动红包 -->
				<c:forEach items="${typeList}" var="pc1" varStatus="vspc">
					<c:if test="${pc1.ID == hjsActInfo.bonusChargesId}">
						<option value="${pc1.ID}" >${pc1.B_NAME}</option>
					</c:if>
				</c:forEach>
         </div>
     </div>
	
	<div class="row-fluid">
	    <div class="span2 pl">已使用预算：</div>
	    <div class="span4"><span>${hjsActInfo.budgetUsed}元</span></div>
	    <div class="span2 pl">剩余预算：</div>
	    <div class="span4"><span>${hjsActInfo.budgetLast}元</span></div>
	</div>
	
	  <div class="row-fluid" style="display: none" id="bonusScope">
	  	<div class="span2 pl">红包最小金额：</div>
	    <div class="span4"><span>${hjsActInfo.tenderScopeMin}元</span></div>
	    <div class="span2 pl">红包最大金额：</div>
	    <div class="span4"><span>${hjsActInfo.tenderScopeMax}元</span></div>
	 </div>
	
	
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