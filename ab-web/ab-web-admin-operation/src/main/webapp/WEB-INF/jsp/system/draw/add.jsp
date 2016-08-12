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
	<form action="hjsactinfo/addDraw" name="Form" id="Form" method="post">
		<!-- 标题头部 -->
		<div class="row-fluid">
	    	<div class="span12">基本信息</div>
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
        	<input class="Wdate span11" type="text" placeholder="点击显示日历" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\',{d:0});}',dateFmt:'yyyy-MM-dd'})" id="endTime" name="stopTimeString" validate="{required:true,messages:{required:'请选择结束时间'}}"/>
    	 </div>
    	 <div class="span2 pl"><span class="required">*</span>活动预算：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动预算" class="span11" name="budgetTotal" id="budgetTotal" validate="{required:true,messages:{required:'请输入活动预算'}}" maxlength="8"/></div>
    	</div>
     <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>活动规则：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动规则" class="span11" name="actRules" id="actRules" validate="{required:true,messages:{required:'请输入活动规则'}}" maxlength="100"/></div>
	 		 <div class="span2 pl"><span class="required">*</span>活动链接：</div>
		    <div class="span3"><input type="text" placeholder="请输入活动链接" class="span11" name="actUrl" id="actUrl" validate="{required:true,messages:{required:'请输入活动链接'}}" maxlength="100"/></div>
	 </div>
    <div class="row-fluid">
	    	<div class="span12">适用权限</div>
	</div>
	 <div class="row-fluid" id="use_type">
		    <div class="span2 pl"><span class="required">*</span>适用平台：</div>
		    <div class="span3"  >
			    <input type="checkbox" placeholder="Web"  name="systemScope" class="systemScope"   value="1" style="width: 16px;"/><span class="lbl"></span>&nbsp;&nbsp;Web&nbsp;&nbsp;
			    <input type="checkbox" placeholder="Android"  name="systemScope" class="systemScope"  value="2" style="width: 16px;line-height: 16px;"/><span class="lbl"></span>&nbsp;&nbsp;Android&nbsp;&nbsp;
			    <input type="checkbox" placeholder="Ios"  name="systemScope" class="systemScope"   value="3" style="width: 16px;"/><span class="lbl"></span>&nbsp;&nbsp;Ios&nbsp;&nbsp;
			    <input type="checkbox" placeholder="H5"  name="systemScope" class="systemScope"  value="4" style="width: 16px;line-height: 16px;"/><span class="lbl"></span>&nbsp;&nbsp;H5&nbsp;&nbsp;
		    </div>
	</div>	
	  
    <div class="row-fluid">
        <input type="button" value="确定" class="span2" id="subBtn" style="width: 145px;height: 40px;line-height: 40px;border: none;color: #fff;background: #438eb9;text-align: center;cursor: pointer;"/>
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
					     var reg1 = /^(([0-9]+)|([0-9]+\.[0-9]{1,2}))$/;//数字验证
		                 var startTime=$("#startTime").val();//开始时间
						 var endTime=$("#endTime").val();//停止时间
						 var actName=$("#aname").val();
						 var budgetTotal=$("#budgetTotal").val();
						 var actRules=$("#actRules").val();
						 var actSource=$("#actSource").val();
						 var actUrl=$("#actUrl").val();
						 var systemScope=$("#systemScope").val();
						 
						 if(actName == ""){
							 alert("请输入活动名称。");
							 return false;
						 }
						 if(budgetTotal == ""){
							 alert("请输入活动预算。");
							 return false;
						 }
						 //判断活动预算最大为10000000
						 if(budgetTotal > 10000000)
						 {
							 alert("最大预算不能大于1000000.");
							 return false;
						 }
						 //判断活动预算必须为正整数
						 if(budgetTotal==0 ||!reg1.test(budgetTotal))
						 {
							 alert("活动预算为1-10000000.");
							 return false;
						 }
						 if(actRules == ""){
							 alert("请输入活动规则。");
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
						 if(endTime == ""){
							 alert("输入停止时间不能为空。");
							 return false; 
						 }
						 //判断开始时间不能大于结束时间
						 if(startTime > endTime)
						 {
							 alert("开始时间不能大于结束时间。");
							 return false;
						 } 
						 if(!test()){
						    alert('至少选择一项使用方式。');
							return false;	
						 }
						 
						 if(!hasN()){
							alert("活动名称已存在");
							return false;	
						 } 
						 
						 $("#Form").submit();
				    }
				});
			
		});
	 
	//适用平台至少选择一项
	function test()
	{
		return $("input:checkbox[name='systemScope']:checked").length>0?true:false;
	}
	
	//判断大转盘活动重复
	function hasN(){
		var ANAME=encodeURIComponent(encodeURIComponent($("#aname").val()));//活动名称
		var url = "${project_name}/hjsactinfo/hasN.do?aname="+ANAME;
		var ref = true;
			$.ajax({
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false, 
		       dataType : 'json', 
		       success: function(data){
		    	   if(data=="error"){
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