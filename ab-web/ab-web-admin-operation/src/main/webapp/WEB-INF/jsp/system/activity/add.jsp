<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="${project_name}/">
		<!-- jsp文件头和头部 -->
	    <%@ include file="../admin/top.jsp"%> 
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
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
	<form action="hjsactinfo/add" name="Form" id="Form" method="post">
		<!-- 标题头部 -->
		<div class="row-fluid">
	    	<div class="span12">添加活动信息</div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动名称：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动名称" class="span11" name="aname" id="aname" validate="{required:true,messages:{required:'请输入活动名称'}}" maxlength="50"/></div>
		   <!--  <div class="span2 pl"><span class="required">*</span>活动编号：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动编号" class="span11" name="acode" id="acode" validate="{required:true,messages:{required:'请输入活动编号'}}" maxlength="10" /></div> -->
			 <div class="span2 pl"><span class="required">*</span>开始时间：</div>
         <div class="span3">
             <input class="Wdate span11" type="text" placeholder="点击显示日历" onclick="var date2=$dp.$('stopTime');WdatePicker({onpicked:function(){stopTime.click();endTime.focus();},minDate:'%y-%M-{%d}',dateFmt:'yyyy-MM-dd'})" id="startTime" name="startTimeString" validate="{required:true,messages:{required:'请选择开始时间'}}"/>
    	 </div>
		</div>
     	<div class="row-fluid">
    	 <div class="span2 pl"><span class="required">*</span>结束时间：</div>
    		<div class="span3">
        	<input class="Wdate span11" type="text" placeholder="点击显示日历" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\',{d:1});}',dateFmt:'yyyy-MM-dd'})" id="endTime" name="stopTimeString" validate="{required:true,messages:{required:'请选择结束时间'}}"/>
    	 </div>
    	 <div class="span2 pl"><span class="required">*</span>活动预算：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动预算" class="span11" name="budgetTotal" id="budgetTotal" validate="{required:true,messages:{required:'请输入活动预算'}}" /></div>
    	</div>
     <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动规则：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动规则" class="span11" name="actRules" id="actRules" validate="{required:true,messages:{required:'请输入活动规则'}}" maxlength="100"/></div>
		    <div class="span2 pl"><span class="required">*</span>活动来源：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动来源" class="span11" name="actSource" id="actSource" validate="{required:true,messages:{required:'请输入活动来源'}}" maxlength="100"/></div>
	 </div>
    
	 <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动链接：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动链接" class="span11" name="actUrl" id="actUrl" validate="{required:true,messages:{required:'请输入活动链接'}}" maxlength="100"/></div>
	 		<div class="span2 pl"><span class="required">*</span>活动状态：</div>
	         <div class="span3">
	             <select class="span11" name="status" validate="{required:true,messages:{required:'请选择活动状态'}}" id="status">
	                <option value="">==请选择==</option>
	                <!-- 配置信息 -->
					<c:forEach items="${actStatus}" var="pc" varStatus="vspc">
						<option value="${pc.code}">${pc.cname}</option>
					</c:forEach>
	            </select>
	         </div>
	 </div>
	 <div class="row-fluid">
		    <div class="span2 pl">&nbsp;&nbsp;活动红包：</div>
	         <div class="span3">
	             <select class="span11" name="bonusId"  id="bonusId">
	                <option value="">==请选择==</option>
							<!-- 1：现金红包    2：返佣红包 -->
							<!-- 查询出是现金红包还是返佣红包的活动红包 -->
							<c:forEach items="${typeList}" var="pc1" varStatus="vsp">
								<c:if test="${pc1.TYPE == 1}">
										<option value="${pc1.ID}" >${pc1.B_NAME}</option>
								</c:if>
							</c:forEach>
	            </select>
	         </div>
		    <div class="span2 pl"><span class="required">*</span>活动类型：</div>
	         <div class="span3">
	             <select class="span11" name="type" validate="{required:true,messages:{required:'请选择活动类型'}}" id="type" onchange="setMUR()" >
	                <option value="">==请选择==</option>
	                <!-- 配置信息 -->
					<c:forEach items="${actType}" var="pc" varStatus="vspc">
						<!-- 判断活动的类型 -->
						<option value="${pc.code}" >${pc.cname}</option>
					</c:forEach>
	            </select>
	         </div>
	 </div>
	 <div class="row-fluid">
		    <div class="span2 pl">&nbsp;&nbsp;返佣红包：</div>
	         <div class="span3">
	             <select class="span11" name="bonusChargesId"  id="bonusChargesId">
	                <option value="">==请选择==</option>
	                        <!-- 1：现金红包    2：返佣红包 -->
							<!-- 查询出是现金红包还是返佣红包的活动红包 -->
							<c:forEach items="${typeList}" var="pc1" varStatus="vspc">
								<c:if test="${pc1.TYPE == 2}">
										<option value="${pc1.ID}" >${pc1.B_NAME}</option>
								</c:if>
							</c:forEach>
	            </select>
	         </div>
	        <div class="row-fluid" style="display: none" id="bonusScope">
		    <div class="span2 pl" style="margin-left:-24px;"><span class="required">*</span>获取条件：</div>
		    <div class="span4" style="margin-left:14px;">
			    <input type="text" placeholder="投资最小金额" style="width: 130px;" class="span11" name="tenderScopeMin" id="tenderScopeMin"  maxlength="7"/>&nbsp;元-
			    <input type="text" placeholder="投资最大金额" style="width: 130px;" class="span11" name="tenderScopeMax" id="tenderScopeMax" maxlength="7"/>&nbsp;元
		    </div>
		    </div>
	 </div>
	  
    <div class="row-fluid">
        <input type="submit" value="确定" class="span2" id="subBtn" />
        <input type="button" style="width: 145px;height: 40px;line-height: 40px;border: none;color: #fff;background: #ccc;text-align: center;cursor: pointer;" onclick="top.mainFrame.closeCurrTab()" class="span2" value="关闭">
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
						 var acode=$("#acode").val();
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
						 if(!hasU()){
								return false;	
							}else if(!hasN()){
								return false;
							}else{
							//提交增加活动基本信息操作
							if(type == 2)
							{
								//判断是否为投资状态
								if(!money()){
									return false;
								}
								$("#Form").submit();
							}else{
								$("#Form").submit();
							}
						 }			
					 }
				});
			
		});
		
		
		//判断最小金额和最大金额
		function money()
		{
			var ref = true;
			var tenderScopeMin=$("#tenderScopeMin").val();//获取投资最小金额
			var tenderScopeMax=$("#tenderScopeMax").val();//获取投资最大金额
			//var reg1 = /^(([0-9]+)|([0-9]+\.[0-9]{1,2}))$/;//数字验证
			var reg1 = /^[0-9]+$/;//数字验证
			if(tenderScopeMin == "")
			{
				 alert("输入投资最小金额不能为空。");
				 return false; 
			}
			if(tenderScopeMax == "")
			{
				 alert("输入投资最大金额不能为空。");
				 return false; 
			}
			if(tenderScopeMax > 1000000)
			{
				 alert("输入投资最大金额应小于1000000元。");
				 return false; 
			}
			if(tenderScopeMin > 1000000)
			{
				 alert("输入投资最小金额应小于1000000元。");
				 return false; 
			}
			if(!reg1.test(tenderScopeMin) || tenderScopeMin<=0){
				alert("获取投资最小金额必须是正数。");
				return false;
			}
			if(!reg1.test(tenderScopeMax) || tenderScopeMax<=0){
				alert("获取投资最大金额必须是正数。");
				return false;
			}
			//判断输入红包最小金额不能大于最大金额。
			if(eval($("#tenderScopeMin").val()) > eval($("#tenderScopeMax").val()))
			{
				alert("输入红包最小金额不能大于最大金额。");
				return false;
			}
			return ref;
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
		
		
		
		//判断红包编号是否存在
		function hasU(){
			//var ACODE=$("#acode").val();//活动编号
			var budgetTotal=$("#budgetTotal").val();//活动预算
			//var url = "${project_name}/hjsactinfo/hasU.do?acode="+ACODE;
			var ref = true;
			//var reg = /^[0-9]+$/;//数字验证
			var reg1 = /^(([0-9]+)|([0-9]+\.[0-9]{1,2}))$/;//数字验证
			/* if(!reg.test(ACODE)){
				alert("你输入的活动编号不是数字类型的");
				ref=false;
			}else */ 
			if(!reg1.test(budgetTotal) || budgetTotal<=0){
				alert("活动预算必须为正正数，只可以保留两位小数。");
				ref=false;
			}
			/* else{
				$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       async:false,  
			       success: function(data){
			    	   if(data=="error"){
							alert("活动编号已存在");
							ref=false;
						}else{
							ref=true;
						}
			       } 
				});
			} */
			return ref;
		}
		//判断红包编号是否存在
		function hasN(){
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