<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${project_name}/">

<meta charset="utf-8" />
<title>修改项目信息</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
	top.mainFrame.reloadPage(/project\/list/);
});
</script>
</head>
<body>
<div class="center centerW">
<form id="projectForm"  method="post"  action="project/edit.do">
<input type="hidden" value="${hbp.id}" name="id"/>
	<div class="row-fluid">
		<div class="span12">修改项目信息</div>
	</div>
	<div class="row-fluid">
		<div class="span2 pl"><span class="required">*</span>项目名称：</div>
		<div class="span4">
			<input type="text" value="${hbp.pname}" class="span11" name="pname" id="pname"  validate="{required:true,remote:'project/isPnameExist?projectId=${hbp.id}',messages:{required:'请输入项目名称',remote:'项目名称已经存在'}}"/><br />
		</div>
	</div>
	<div class="row-fluid pr">
		<div class="span2 pl"><span class="required">*</span>项目类型：</div>
		<div class="span4">
			<select class="span11" name="projectType" validate="{required:true,messages:{required:'请选择项目类型'}}">
	            <c:forEach items="${projectConfigs}" var="pc" varStatus="vspc">
					<option value="${pc.code}"<c:if test="${pc.code eq hbp.projectType}">selected="selected"</c:if>>${pc.cname}</option>
				</c:forEach>
			
			</select><br />
		</div>

	
	</div>
	
 	<div class="row-fluid">
		<div class="span2 pl"><span class="required">*</span>贷款金额：</div>
		<div class="span4">
			<input class="Wdate span11" type="text" value="<fmt:parseNumber integerOnly="true" value="${hbp.borrowAmountMin}" />"  name="borrowAmountMin" id="borrowAmountMin" maxlength="8"  validate="{required:true,digits:true,maxlength:8,messages:{required:'请输入最小贷款金额'}}"/><br /><b>万</b>
			<span style="margin-left: 2px;">至</span>
		</div>
		<div class="span4">
			<input class="Wdate span11"  type="text" value="<fmt:parseNumber integerOnly="true" value="${hbp.borrowAmountMax}" />"   name="borrowAmountMax" id="borrowAmountMax" maxlength="8" validate="{required:true,digits:true,maxlength:8,messages:{required:'请输入最大贷款金额'}}"/><br /><b>万</b>
		</div>
	</div> 

	<div class="row-fluid">
		<div class="span2 pl"><span class="required">*</span>贷款期限：</div>
		<div class="span4">
			<input class="Wdate span11" type="text" value="${hbp.borrowSdate}"  name="borrowSdate" id="borrowSdate" maxlength="8" validate="{required:true,digits:true,maxlength:8,messages:{required:'请输入贷款最小的期限'}}"/><br /><b>月</b>
			<span style="margin-left: 2px;">至</span>
		</div>
		<div class="span4">
			<input class="Wdate span11" type="text" value="${hbp.borrowEdate}"  name="borrowEdate" id="borrowEdate" maxlength="8" validate="{required:true,digits:true,maxlength:8,messages:{required:'请输入贷款最大的期限'}}"/><br /><b>月</b>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span2 pl"><span class="required">*</span>贷款利率：</div>
		<div class="span4">
			<input class="Wdate span11" type="text" placeholder="请输入" class="span11" value="${hbp.projectApr}" name="projectApr" id="projectApr" validate="{required:true,isDigitsDot:true,messages:{required:'请输入贷款利率',isDigitsDot:'请输入正确的贷款利率'}}" /><br /><b>%</b>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span2 pl"><span class="required">*</span>贷款主体：</div>
		<div class="span4">
			<select class="span11" name="loanType" >
				 <c:forEach items="${loanConfigs}" var="lc" varStatus="vslc">
				    <c:if test="${lc.code  eq hbp.loanType}">
				    <option id="${lc.code}" value="${lc.code}" >${lc.cname}</option>
 				</c:if>
 				</c:forEach> 
			</select><br />
		</div>
		<div class="span4">
			<select class="span11" name="userId">
			  <c:forEach items="${enterprices}" var="ep" varStatus="eplc">
	              <option  id="${ep.id}" value="${ep.userId}" <c:if test="${ep.userId eq hbp.userId}">selected="selected"</c:if>>${ep.entName}</option>
	          </c:forEach>
			</select><br />
		</div>
	</div>
	<div class="row-fluid">
		<div class="span2 pl">项目特点：</div>
		<div >
        	<textarea class="span8" style="width: 450px;" name="projectPoint" >${hbp.projectPoint}</textarea>
        </div>
	</div>
	 <div class="row-fluid">
          <div class="span12">其它信息</div>
      </div>
	<div class="row-fluid">
		<div class="span2 pL40">项目信息：</div>
	</div>
	<div class="row-fluid" >
		<div class="span11 pL40" >
			 <textarea rows="" cols="" id="editor1" name="projectRemark">${hbp.projectRemark}</textarea>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span2 pL40">其它信息：</div>
	</div>
      <div class="row-fluid">
          <div class="span11 pL40">
                 <textarea rows="" cols="" id="editor2" name="otherRemark">${hbp.otherRemark}</textarea>
          </div>
      </div>
	<div class="row-fluid">
		<input type="submit"   value="修改" class="span2" id="subBtn" style="width: 145px; height: 40px;line-height: 40px;border: none;color: #fff;background: #438eb9;text-align: center; margin-left:312px;"/> 
		<input type="buttom" value="关闭" class="span2" onclick="top.mainFrame.closeCurrTab()" style="width: 145px;height: 40px;line-height: 40px;border: none;color: #fff;background: #ccc;text-align: center;cursor: pointer;"/>
	</div>
</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	/*登录验证模板*/
	$.metadata.setType("attr", "validate");
	$("#projectForm").validate({
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
		if($("#projectForm").valid()){
            
			 var borrowAmountMin=parseInt($("#borrowAmountMin").val());
			 var borrowAmountMax=parseInt($("#borrowAmountMax").val());
			 var borrowSdate=parseInt($("#borrowSdate").val());
			 var borrowEdate=parseInt($("#borrowEdate").val());
			 var projectPointLength=$("#projectPoint").val().length;
             var pname=$("#pname").val().length;
             if(pname>100){
 				alert("输入内容在100个字以内");
 				return false; 
 			}
			 
			 if(projectPointLength>200){
				 alert("输入内容在200个字以内");
				 return false; 
			 }
			 
			 
			 if(borrowAmountMax<borrowAmountMin){
				 alert("最大贷款金额应大于或等于最小贷款金额");
				 return false;
			 }
	        if(borrowEdate<borrowSdate){
	       	 alert("最大贷款期限应大于或等于最小贷款期限");
	       	 return false;
			 }
			 $("#projectForm").submit();
		 }
		
	});
	
});

</script>
</body>
<jsp:include page="../../common/alert_message.jsp"></jsp:include>
</html>