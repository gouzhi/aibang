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
	<form action="hjsactbonususersmanual/add.do" name="Form" id="Form" method="post">
		<!-- 标题 -->
		<div class="row-fluid">
	    	<div class="span12">发放红包</div>
		</div>
		<div class="row-fluid">
			    <div class="span2 pl"><span class="required">*</span>手机号：</div>
			    <div class="span3"><input type="text" placeholder="请输入手机号" class="span11" name="phone" id="phone" validate="{required:true,messages:{required:'请输入手机号'}}" maxlength="11" /></div>
	 	</div>		
	 	<div class="row-fluid">	
		    <div class="span2 pl"><span class="required">*</span>红包类型：</div>
	         <div class="span3">
	             <select class="span11" name="type" validate="{required:true,messages:{required:'请选择紅包类型'}}" id="type" onchange="bonusType();">
	                <option value="">==请选择==</option>
	                <!-- 配置信息 -->
					<c:forEach items="${bonusType1}" var="pc" varStatus="vspc">
						<!-- 隐藏显示红包ID -->
						<option value="${pc.id}" hidden="true"></option>
						<option value="${pc.code}" <c:if test="${pc.parentId == 31}" ></c:if>>${pc.cname}</option>
					</c:forEach>
	             </select>
	         </div>
	 </div>
	 <div class="row-fluid">
		 <div class="span2 pl"><span class="required">*</span>选择红包：</div>
	      <div class="span3">
	        <select class="span11" name="bonusId" validate="{required:true,messages:{required:'请选择紅包'}}" id="bonusId" >
	          <option value="">==请选择==</option>
	           <!-- 配置信息 -->
				<c:forEach items="${bonusType2}" var="pc" varStatus="vspc">
					<option value="${pc.id}">${pc.B_NAME}</option>
				</c:forEach>
	           </select>
	      </div>
	 </div>				
	<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包数量：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包数量" class="span11" name="bonusNum" id="bonusNum" validate="{required:true,messages:{required:'请输入红包数量'}}" maxlength="3"/></div>
	</div>				
	<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>红包说明：</div>
		    <div class="span3"><input type="text" placeholder="请输入红包说明" class="span11" name="memo" id="memo" validate="{required:true,messages:{required:'请输入红包说明'}}" maxlength="100"/></div>
	</div>		
			
	<div class="row-fluid">
		<div class="span7">
        	<input type="submit" value="确定" class="span2" id="subBtn" />
        	<input type="button" style="width: 145px;height: 40px;line-height: 40px;border: none;color: #fff;background: #ccc;text-align: center;cursor: pointer;" onclick="top.mainFrame.closeCurrTab()" class="span2" value="关闭" >
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
		 if($("#Form").valid()){
			    if(!bonusCount()){//校验红包数量是否为正整数
					return false;	
				}else if(!isUser()){
					return false;
				}else{ 
					/* var phone = $('#phone').val();//用户ID
					var ref = true;
					//校验手机号
					 $.ajax({ 
						url:"${project_name}/hjsactbonususersmanual/add.do",
						type:"post",
						data:$("#Form").serialize(),
						dataType:"json",
					    success:function(data){
					    	alert(data);
					    	if(data == 1)
					    	{
					    		alert("发放红包成功。");
					    		 ref= false;
					    	}else{
					    		alert("发放红包失败，请检查输入信息。");
					    	}
					     } 
					 });*/
					$("#Form").submit();
				} 
			 }
		});
   });
	
	
	//判断红包类型
	function bonusType()
	{
		var bonusType = $('#type').val();
		var url = "${project_name}/hjsactbonus/bonusType.do?bonusType="+bonusType;
		//判断红包类型选择是否为空
		if("" == bonusType || null == bonusType)
		{
			alert("红包类型选择不能为空。");
			return false;
		}else{//执行关联红包操作
			$.ajax({ 
			   type: "post", 
		       url: url, 
		       dataType:"json",
		       success: function(data){
		    	   var bonus = $('#bonusId');
		    	   var options = null;
		    	   $.each( data, function(i, n){
		    		   //选择的红包默认选择第一个
		    		   options += "<option value="+n.ID+">"+n.B_NAME+"</option>";
		    	   });
		    	   bonus.html(options);
		       } 
		    });
		}
	}
	
	//判断红包数量(正整数)
	function bonusCount(){
		var bonusNum=$("#bonusNum").val();//红包数量
		var ref = true;
		var reg = /^[0-9]*[1-9][0-9]*$/;//数字验证-正整数
		//判断红包数量输入是否为空
		if("" == bonusNum || null == bonusNum)
		{
			alert("输入红包个数不能为空。");
			return false;
		}
		if(!reg.test(bonusNum)){
			alert("红包个数必须为正整数。");
			ref=false;
		}
		//判断红包数量限制 最大为99
		if(bonusNum > 99)
		{
			alert("请输入100以内的数值。");
			ref=false;
		}
		return ref;
	}
	
	//判断用户是否存在
	function isUser()
	{
		var phone = $('#phone').val();//用户ID
		var ref = true;
		if("" == phone || null == phone)
		{
			alert("用户手机号不能为空");
			return  false;
		}
		var url = "${project_name}/hjsactbonususersmanual/checkuser.do";
			$.ajax({ 
			       type: "post", 
    		       url: url, 
    		       cache:false,
    		       async:false,
    		       dataType: "text",
    		       data:$("#Form").serialize(),
			       success:function(data){
			      	   if(data == "0")
			    	   {
			    		   alert("此用户不存在，请检查手机号。");
			    		   ref= false;
			    	   }else{
			    		   ref= true;
			    	   }
			       } 
			 });
			return ref;
	}
	
	$(top.hangge());
	
	</script>
</body>
</html>