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
		var editor1=UE.getEditor('editor1');
		var editor2=UE.getEditor('editor2');
		$(function(){
			top.mainFrame.reloadPage(/activity\/list/);
		});
		</script>
	</head>
<body>
	<form action="hjsactinfo/edit.do" name="Form" id="Form" method="post">
	<input type="hidden" value="${actInfo.id}" name="id"/>
		<!-- 标题头部 -->
		<div class="row-fluid">
	    	<div class="span12">活动基本信息</div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动名称：</div>
		    <div class="span4"><input type="text" placeholder="请输入活动名称" class="span11" name="aname" id="aname" value="${actInfo.aname}" maxlength="50"/></div>
         <div class="span2 pl"><span class="required">*</span>开始时间：</div>
         <div class="span4">
             <input class="Wdate span11" type="text"  onclick="var date2=$dp.$('stopTime');WdatePicker({onpicked:function(){stopTime.click();endTime.focus();},minDate:'%y-%M-{%d}',dateFmt:'yyyy-MM-dd'})" id="startTime" name="startTimeString" validate="{required:true,messages:{required:'请选择开始时间'}}" value="<fmt:formatDate value="${actInfo.startTime }" pattern="yyyy-MM-dd"/>"/>
    	 </div>
		</div>
     	<div class="row-fluid">
     <!-- 活动开始/结束时间   start -->
    	 <div class="span2 pl"><span class="required">*</span>结束时间：</div>
    		<div class="span4">
        	<input class="Wdate span11" type="text"  onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\',{d:1});}',dateFmt:'yyyy-MM-dd'})" id="endTime" name="stopTimeString" validate="{required:true,messages:{required:'请选择结束时间'}}" value="<fmt:formatDate value="${actInfo.stopTime }" pattern="yyyy-MM-dd"/>"/>
    	 </div>
		    <div class="span2 pl"><span class="required">*</span>活动预算：</div>
		    <div class="span4"><input type="text" placeholder="请输入活动预算" class="span11" name="budgetTotal" id="budgetTotal" value="${actInfo.budgetTotal}"/></div>
    	</div>
     <!-- 活动开始/结束时间   end --> 
     
     <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动规则：</div>
		    <div class="span4"><input type="text" placeholder="请输入活动规则" class="span11" name="actRules" id="actRules" value="${actInfo.actRules}" maxlength="100"/></div>
		    <div class="span2 pl"><span class="required">*</span>活动来源：</div>
		    <div class="span4"><input type="text" placeholder="请输入活动来源" class="span11" name="actSource" id="actSource" value="${actInfo.actSource}" maxlength="100"/></div>
	 </div>
	 <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动链接：</div>
		    <div class="span4"><input type="text" placeholder="请输入活动链接" class="span11" name="actUrl" id="actUrl" value="${actInfo.actUrl}" maxlength="100"/></div>
		    <div class="span2 pl"><span class="required">*</span>活动类型：</div>
	         <div class="span4">
	             <select class="span11" name="type" validate="{required:true,messages:{required:'请选择活动类型'}}" id="type" value="${actInfo.type}" onclick="setMUR()">
	                 <option value="0">==请选择==</option>
	                <!-- 配置信息 -->
					<c:forEach items="${actType}" var="pc" varStatus="vspc">
						<option value="${pc.code}" ${actInfo.type==pc.code?'selected':''}>${pc.cname}</option>
					</c:forEach>
	            </select>
	         </div>
	 </div>
	 <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动状态：</div>
	         <div class="span4">
	             <select class="span11" name="status" validate="{required:true,messages:{required:'请选择活动状态'}}" id="status" >
	                 <option value="0">==请选择==</option>
	                <!-- 配置信息 -->
					<c:forEach items="${actStatus}" var="pc" varStatus="vspc">
						<option value="${pc.code}" ${actInfo.status==pc.code?'selected':''}>${pc.cname}</option>
					</c:forEach>
	            </select>
	         </div>
		    <div class="span2 pl"><span class="required">*</span>活动红包：</div>
	         <div class="span4">
	             <select class="span11" name="bonusId" validate="{required:true,messages:{required:'请选择活动红包'}}" id="bonusId" value="${actInfo.bonusId}">
					       <option value="0">==请选择==</option>
					       <!-- 1：现金红包    2：返佣红包 -->
							<c:forEach items="${typeList}" var="pc1" varStatus="vspc">
								<c:if test="${pc1.TYPE == 1 }">
									<c:choose>
										<c:when test="${pc1.ID == actInfo.bonusId}">
											<option value="${pc1.ID}" selected="selected">${pc1.B_NAME}</option>
										</c:when>
										<c:otherwise>
										   <option value="${pc1.ID}" >${pc1.B_NAME}</option>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
	            </select>
	         </div>
	 </div>
	 <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>返佣红包：</div>
	         <div class="span4">
	             <select class="span11" name="bonusChargesId"  id="bonusChargesId" value="${actInfo.bonusChargesId}">
	                     <option value="">==请选择==</option>
	                     <!-- 1：现金红包    2：返佣红包 -->
							<c:forEach items="${typeList}" var="pc1" varStatus="vspc">
								<!-- 查询出是现金红包还是返佣红包的活动红包 -->
								<c:if test="${pc1.TYPE == 2 }">
									<c:choose>
										<c:when test="${pc1.ID == actInfo.bonusChargesId}">
											<option value="${pc1.ID}" selected="selected">${pc1.B_NAME}</option>
										</c:when>
										<c:otherwise>
										    <option value="${pc1.ID}" >${pc1.B_NAME}</option>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
	            </select>
	         </div>
	 </div>
	 <div class="row-fluid" hidden="true">
		    <div class="span2 pl"><span class="required">*</span>已使用预算：</div>
		    <div class="span4"><input type="text" placeholder="已使用预算" class="span11" name="budgetUsed" id="actSource" value="${actInfo.budgetUsed}"/></div>
		    <div class="span2 pl"><span class="required">*</span>剩余预算：</div>
		    <div class="span4"><input type="text" placeholder="剩余预算" class="span11" name="budgetLast" id="actUrl" value="${actInfo.budgetLast}"/></div>
		    <div class="span2 pl" ><span class="required">*</span>活动编号：</div>
		    <div class="span4" ><input type="text" placeholder="请输入活动编号" class="span11" name="acode" id="acode" value="${actInfo.acode}" maxlength="10"/></div>
	 </div>
	 
	  <div class="row-fluid" style="display: none" id="bonusScope">
		    <div class="span2 pl"><span class="required">*</span>获取红包范围：</div>
		    <div class="span3">
			    <input type="text" placeholder="获取红包最小金额" style="width: 126px;" class="span11" name="tenderScopeMin" id="tenderScopeMin"  value="${actInfo.tenderScopeMin}"  maxlength="100"/>元---
			    <input type="text" placeholder="获取红包最大金额" style="width: 126px;" class="span11" name="tenderScopeMax" id="tenderScopeMax" value="${actInfo.tenderScopeMax}" maxlength="100"/>元
		    </div>
	 </div>
    <div class="row-fluid">
        <input type="submit" value="修改" class="span2" id="subBtn" />
        <input type="buttom" style="width: 145px;height: 40px;line-height: 40px;border: none;color: #fff;background: #ccc;text-align: center;cursor: pointer;" onclick="top.mainFrame.closeCurrTab()" class="span2" value="关闭" >
    </div>
	</form>
	 
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
						 var stopTime=$("#stopTime").val();//停止时间
						 var aname=$("#aname").val();
						 //var acode=$("#acode").val();
						 var budgetTotal=$("#budgetTotal").val();
						 var actRules=$("#actRules").val();
						 var actSource=$("#actSource").val();
						 var actUrl=$("#actUrl").val();
						 var type=$("#type").val();//活动类型
						 var status=$("#status").val();//活动状态
						 var bonusId=$("#bonusId").val();//活动红包Id
						 var bonusChargesId=$("#bonusChargesId").val();//返佣红包Id
						 
						 if(aname == ""){
							 alert("请输入活动名称。");
							 return false;
						 }
						 if(budgetTotal == ""){
							 alert("请输入活动预算。");
							 return false;
						 }
						 if(actRules == ""){
							 alert("请输入活动规则。");
							 return false;
						 }
						 if(actSource == ""){
							 alert("请输入活动来源。");
							 return false;
						 }
						 if(actUrl == ""){
							 alert("请输入活动链接。");
							 return false;
						 }
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
						 if(!hasP()){
							return false;
						 }else if(!money()){
							return false;
						 }else{
							//提交增加活动基本信息操作
							$("#Form").submit();
						 }			
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
			var type = $('#type').val();
			if(type == 2)
			{
				$('#bonusScope').css('display','block');
			}else{
				$('#bonusScope').css('display','none');
			}
		}
		
		
		//判断最小金额和最大金额
		function money()
		{
			//判断是否选中的是投资状态
			var type = $('#type').val();
			if(type == 2){
			var ref = true;
			var tenderScopeMin = $("#tenderScopeMin").val();//获取红包最小金额
			var tenderScopeMax = $("#tenderScopeMax").val();//获取红包最大金额
			var reg1 = /^(([0-9]+)|([0-9]+\.[0-9]{1,2}))$/;//数字验证
			if(tenderScopeMin == "")
			{
				 alert("输入获取红包最小金额不能为空。");
				 return false; 
			}
			if($.trim($("#tenderScopeMax").val()).length<=0)
			{
				 alert("输入获取红包最大金额不能为空。");
				 return false; 
			}
			if(!reg1.test(tenderScopeMin) || tenderScopeMin <=0){
				alert("获取红包最小金额必须是正数，而且只可以保留两位小数。");
				 return false;
			}
			if(!reg1.test(tenderScopeMax) || tenderScopeMax<=0){
				alert("获取红包最大金额必须是正数，而且只可以保留两位小数。");
				 return false;
			}
			//判断输入红包最小金额不能大于最大金额。
			if(eval($("#tenderScopeMin").val()) > eval($("#tenderScopeMax").val()))
			{
				alert("输入红包最小金额不能大于最大金额。");
				 return false;
			}
			return ref;
			}else{
				//提交增加活动基本信息操作
				$("#Form").submit();
			}
		}
		
		
		//判断活动预算
		function hasP(){
			var budgetTotal=$("#budgetTotal").val();//活动预算
			//var ACODE=$("#acode").val();//活动编号
			var ref = true;
			var reg = /^(([0-9]+)|([0-9]+\.[0-9]{1,2}))$/;//数字验证
			//var reg1 = /^[0-9]+$/;//数字验证
			if(!reg.test(budgetTotal) || budgetTotal<=0){
				alert("活动预算必须为正正数，只可以保留两位小数。");
				ref=false;
			}
			/* if(!reg1.test(ACODE)){
				alert("你输入的活动编号不是数字类型的");
				ref=false;
			} */
			return ref;
		}
		
		//判断红包编号是否存在
		function hasN1(){
			var ANAME=encodeURIComponent(encodeURIComponent($("#aname").val()));//活动名称
			var url = "${project_name}/hjsactinfo/hasN.do?aname="+ANAME;
			var ref = true;
			
				$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       async:false, 
			       contentType : 'application/json;charset=UTF-8',
			       success: function(data){
			    	   if(data=="error"){
							alert("活动名称已存在");
							ref=false;
						}else{
							ref=true;
						}
			       } 
				});
			return ref;
		}
			
	$(top.hangge());
/* 	$(function() {
		//单选框
		$(".chzn-select").chosen(); 
		$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
		//日期框
		$('.date-picker').datepicker();
	}); */
	
	</script>
</body>
</html>