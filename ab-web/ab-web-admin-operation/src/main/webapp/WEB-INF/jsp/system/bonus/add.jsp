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
		
	</head>
<body>
	<form action="hjsactbonus/add.do" name="Form" id="Form" method="post">
	
		<!-- 标题 -->
		<div class="row-fluid">
	    	<div class="span12">添加活动信息</div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包类型：</div>
	         <div class="span3">
	             <select class="span11" name="type" validate="{required:true,messages:{required:'请选择紅包类型'}}" id="type" onchange="bonusType();">
	                <option value="">==请选择==</option>
	                <!-- 配置信息 -->
					<c:forEach items="${actBonus}" var="pc" varStatus="vspc">
						<option value="${pc.code}">${pc.cname}</option>
					</c:forEach>
	            </select>
	         </div>
	 	</div>
	 <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包名称：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包名称" class="span11" name="bname" id="bname" validate="{required:true,messages:{required:'请输入紅包名称'}}" maxlength="50"/></div>
	</div>				
	<!-- <div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包编号：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包编号" class="span11" name="bcode" id="bcode" validate="{required:true,messages:{required:'红包编号位数不超过11位'}}" maxlength="11"/></div>
	</div>		 -->		
	<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包周期：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包周期天数" class="span11" name="avlDays" id="avlDays" validate="{required:true,messages:{required:'请输入紅包周期'}}" maxlength="4"/>天</div>
	</div>				
	<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包面值：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包面值" class="span11" name="value" id="value" validate="{required:true,messages:{required:'红包面值必须为正数'}}" maxlength="10"/></div>
	</div>		
	<div class="row-fluid" id="use_type">
		    <div class="span2 pl"><span class="required">*</span>使用方式：</div>
		    <div class="span3"  >
			    提现&nbsp;&nbsp;<input type="checkbox" placeholder="提现"  name="useType" class="useType"   value="1" style="width: 16px;"/><span class="lbl"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    购买产品&nbsp;&nbsp;<input type="checkbox" placeholder="购买产品"  name="useType" class="useType"  value="2" style="width: 16px;line-height: 16px;" onclick="buy();"/><span class="lbl"></span>
		    </div>
	</div>		
	<div class="row-fluid" id="buyProduct" style="display: none;">
		    <div class="span2 pl"><span class="required">*</span>投资金额满：</div>
		    <div class="span3"><input type="text" placeholder="请输入金额" class="span11" name="tenderMin" id="tenderMin"  maxlength="10" style="width: 226px;"/>元可以使用</div>
	</div>		
			
	<div class="row-fluid">
		<div class="span7">
        	<input type="submit" value="确定" class="span2" id="subBtn" />
        	<input type="buttom" style="width: 145px;height: 40px;line-height: 40px;border: none;color: #fff;background: #ccc;text-align: center;cursor: pointer;" onclick="top.mainFrame.closeCurrTab()" class="span2" value="关闭" >
    	</div>
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
		
	//表单验证
	$("#subBtn").click(function(){
		 if($("Form").valid()){
			  /*   if(!hasU()){
					return false;	
				}else  */
				if(!hasP()){
					return false;
				}else if(!test()){
					return false;
				}else{
					//提交增加红包基本信息操作
					$("#Form").submit();
				}
			 }
		});
   });
	
	//判断红包类型
	function bonusType()
	{
		var bonusType = $('#type').val();
		//判断是现金券还是返佣现金如果是返佣现金隐藏使用方式
		if(bonusType == 1)
		{
			$('#use_type').css('display','block');
		}else{
			$('#use_type').css('display','none');
		}
	}
	
	
	function test()
	{
		var bonusType = $('#type').val();
		//判断是现金券还是返佣现金如果是返佣现金隐藏使用方式
		if(bonusType == 1){
		var ref = true;
		if($("input[name='useType']:checkbox:checked").length>0){
			//判断使用方式
			$("input[type=checkbox]").each(function(){
			    //var chk = $(this).find("[checked]");
			    if(this.checked){
			    	//alert($(this).val());
			    	//判断使用方式
			    	if($(this).val() == 2)
			    	{
			    		if(!useType()){
			    			ref=false;
						}else{
							//提交增加红包基本信息操作
							 $("#Form").submit();
						}
			    	}else if($(this).val() == 2 && $(this).val() == 1){
			    		if(!useType()){
			    			ref=false;
						}else{
							//提交增加红包基本信息操作
							$("#Form").submit();
						}
			    	}else{
			    		//提交增加红包基本信息操作
						$("#Form").submit();
			    	}
			    }
			}); 
		  }else{
			  alert('至少选择一项使用方式。');
			  ref=false;
		  }
		}else{
			//提交增加红包基本信息操作
			$("#Form").submit();
		}
		return ref;
	}
	
	
	//判断购买产品复选框是否选中
	function useType()
	{
		var ref = true;
		var tenderMin = $("#tenderMin").val();
		//var reg1 = /^(([0-9]+)|([0-9]+\.[0-9]{1,2}))$/;//数字验证
		var reg = /^[0-9]+$/;//数字验证
		if(tenderMin == "")
		{
			 alert("输入投资使用下限金额不能为空。");
			 ref=false;
		}
		
		if(!reg.test(tenderMin) || tenderMin<=0){
			alert("输入投资使用下限金额必须为正整数。");
			ref=false;
		}
		return ref;
	}
	
	
	//购买产品操作
	function buy()
	{
		if($("input[type='checkbox']").is(':checked'))
		{
			$('#buyProduct').css('display','block');
		}else{
			$('#buyProduct').css('display','none');
		}
	} 
	
	
	//判断红包编号是否存在
	function hasU1(){
		var BCODE = $("#bcode").val();
		var url = "${project_name}/hjsactbonus/hasU.do?bcode="+BCODE;
		var ref = true;
		var reg = /^[0-9]+$/;//数字验证
		if(!reg.test(BCODE)){
			alert("你输入的红包编号不是数字类型的");
			ref=false;
		}else{
			$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false,  
		       success: function(data){
		    	   if(data=="error"){
						alert("红包编号已存在");
						ref=false;
					}else{
						ref=true;
					}
		       } 
			});
		}
		return ref;
	}
	
	//判断红包面值和红包周期
	function hasP(){
		
		var avlDays=$("#avlDays").val();//红包周期
		var value=$("#value").val();//红包面值
		var ref = true;
		var reg = /^[0-9]*[1-9][0-9]*$/;//数字验证
		var reg1 = /^(([0-9]+)|([0-9]+\.[0-9]))$/;//数字验证
		if(!reg.test(avlDays)){
			alert("红包周期必须为正整数。");
			ref=false;
		}
		//判断红包周期是否在范围内
		if(avlDays > 1000)
		{
			alert("请输入1000以内的红包周期(天)。");
			ref=false;
		}
		if(!reg1.test(value) || value<=0){
			alert("红包面值必须为正整数。");
			ref=false;
		}
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