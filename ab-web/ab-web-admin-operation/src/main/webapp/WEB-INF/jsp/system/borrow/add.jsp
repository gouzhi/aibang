<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">

<meta charset="utf-8" />
<title>添加产品</title>
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
</head>
<script type="text/javascript">
$(top.hangge());
var projectRemarkEditor = UE.getEditor('porjectRemark');
var borrowUserRemarkEditor = UE.getEditor('borrowUserRemark');
var vouchRemarkEditor = UE.getEditor('vouchRemark');
var windControlEditor = UE.getEditor('windControl');
</script>
<body>
<div class="center centerW">
<form id="productForm" method="post" action="borrow/save.do">
<input type="hidden" name="contractUrl" id="wordPath">
	<div class="row-fluid">
	    <div class="span12">产品基本信息</div>
	</div>
	<div class="row-fluid">
	    <div class="span2 pl"><span class="required">*</span>产品名称：</div>
	    <div class="span4"><input type="text" placeholder="请输入产品名称" class="span11" name="bname" validate="{required:true,remote:'borrow/isBnameExist',messages:{required:'请填写产品名称',remote:'产品名称已经存在'}}"/><br/></div>
	    <div class="span2 pl"><span class="required">*</span>还款方式：</div>
	    <div class="span4">
	        <select class="span11" name="repayType" id="repayType" validate="{required:true,messages:{required:'请选择还款周期'}}">
	           <c:forEach items="${repayconfigs }" var="item">
	           <option value="${item.code }">${item.cname }</option>
	           </c:forEach>
	       </select><br />
	    </div>
	</div>
     <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>关联借款：</div>
         <div class="span4">
         	<select class="span11" name="projectid" id="projectid" validate="{required:true,messages:{required:'请选择关联项目'}}">
         		<option value=""  projectRemark="">==请选择==</option>
         		<c:forEach items="${projects }" var="item">
         			<option value="${item.id }">${item.pname }</option>
         		</c:forEach>
            </select>
            <br />
         </div>
         <div class="span2 pl"><span class="required">*</span>募集开始时间：</div>
         <div class="span4">
             <input class="Wdate span11" type="text" placeholder="点击显示日历" onclick="var date2=$dp.$('tenderEndTime');WdatePicker({onpicked:function(){tenderEndTime.click();tenderEndTime.focus();},minDate:'%y-%M-{%d}',dateFmt:'yyyy-MM-dd'})" id="tenderStartTime" name="tenderStartTimeString" validate="{required:true,messages:{required:'请选择开始时间'}}"/><br/>
    	</div>
     </div>
     <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>产品类型：</div>
         <div class="span4">
             <select class="span11" name="borrowType" validate="{required:true,messages:{required:'请选择产品类型'}}">
                <c:forEach items="${borrowconfigs }" var="item">
	           <option value="${item.code }">${item.cname }</option>
	           </c:forEach>
            </select><br />
         </div>
          <div class="span2 pl"><span class="required">*</span>募集结束时间：</div>
    	<div class="span4">
        	<input class="Wdate span11" type="text" placeholder="点击显示日历" onclick="WdatePicker({minDate:'#F{$dp.$D(\'tenderStartTime\',{d:1});}',dateFmt:'yyyy-MM-dd'})" id="tenderEndTime" name="tenderEndTimeString" validate="{required:true,messages:{required:'请选择结束时间'}}"/><br/>
    	</div>
     </div>
     <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>年化收益：</div>
         <div class="span4">
             <input type="text" readonly="readonly" replaceholder="请输入年化收益" class="span11" name="borrowApr" validate="{required:true,isDigitsDot:true,messages:{required:'请输入年化收益'}}" /><br/>
             <b>%</b>
         </div>
        <div class="span2 pl"><span class="required">*</span>最低投资金额：</div>
    	<div class="span4"><input type="text" placeholder="请输入最低投资金额" class="span11" name="tenderAccountMin" id="tenderAccountMin" validate="{required:true,isIntGtZero:true,maxlength:8,digits:true,messages:{required:'请输入起投金额'}}" maxlength="8"/><br/><b>元</b></div>
     </div>
     <div class="row-fluid">
     	<div class="span2 pl"><span class="required">*</span>借款总额：</div>
         <div class="span4">
             <input type="text" placeholder="请输入资金规模" class="span11" name="account" id="account" validate="{required:true,isIntGtZero:true,maxlength:8,digits:true,maxlength:8,messages:{required:'请输入借款总额'}}"  maxlength="8"/><br/>
             <b>元</b>
         </div>
    	<div class="span2 pl"><span class="required">*</span>递增金额：</div>
    <div class="span4"><input type="text" placeholder="请输入递增金额" class="span11" name="tenderAccountStep" validate="{required:true,isIntGtZero:true,maxlength:8,digits:true,messages:{required:'请输入递增金额'}}"  maxlength="8"/><br/><b>元</b></div>
	</div>
<div class="row-fluid">
	<div class="span2 pl"><span class="required">*</span>投资周期：</div>
    <div class="span4">
        <input type="text" placeholder="请输入投资周期" class="span11" name="borrowPeriod" validate="{required:true,isIntGtZero:true,maxlength:8,digits:true,messages:{required:'请输入投资周期'}}"  maxlength="8"/><br/>
        <b id="borrowPeriodType">月</b>
    </div>
    <div class="span2 pl"><span class="required">*</span>最高投资金额：</div>
    <div class="span4"><input type="text" placeholder="请输入最高投资金额" class="span11" name="tenderAccountMax" id="tenderAccountMax" validate="{required:true,isIntGtZero:true,maxlength:8,digits:true,messages:{required:'请输入最高贷款金额'}}"  maxlength="8"/><br/><b>元</b></div>
</div>
<div class="row-fluid">
    <div class="span12">其他信息</div>
</div>
<div class="row-fluid">
    <div class="span2 pL40"><span class="required">*</span>项目信息：</div>
</div>
<div class="row-fluid">
    <div class="span11 pL40">
<!--         <script id="porjectRemark" name="porjectRemark" type="text/plain"></script>
 -->        <textarea rows="" cols="" id="porjectRemark" name="porjectRemark"></textarea>
    </div>
</div>
<div class="row-fluid">
    <div class="span2 pL40"><span class="required">*</span>企业信息：</div> 	
 </div>
<div class="row-fluid">
    <div class="span11 pL40">
        <!-- <script id="borrowUserRemark" name="borrowUserRemark" type="text/plain"></script> -->
        <textarea rows="" cols="" id="borrowUserRemark" name="borrowUserRemark"></textarea>
    </div>
</div>
<%-- <div class="row-fluid">
    <div class="span2 pL40"><span class="required">*</span>担保机构：</div>
    <div class="span4">
     	<select class="span11" name="vouchId" id="vouchId" validate="{required:true,messages:{required:'请选择关联项目'}}">
     		<option value="" descr="">==请选择==</option>
     		<c:forEach items="${enterprices }" var="item">
     			<option value="${item.id }">${item.entName }</option>
     		</c:forEach>
        </select>
       <br />
     </div>
 </div> --%>
 <div class="row-fluid">
    <div class="span2 pL40"><span class="required">*</span>还款来源：</div> 	
 </div>
<div class="row-fluid">
    <div class="span11 pL40">
       <!--  <script id="vouchRemark" name="vouchRemark" type="text/plain"></script> -->
        <textarea rows="" cols="" id="vouchRemark" name="vouchRemark"></textarea>
    </div>
</div>
<div class="row-fluid">
    <div class="span2 pL40"><span class="required">*</span>风险控制：</div> 	
 </div>
<div class="row-fluid">
    <div class="span11 pL40">
        <!-- <script id="windControl" name="windControl" type="text/plain"></script> -->
        <textarea rows="" cols="" id="windControl" name="windControl"></textarea>
    </div>
</div>
<!-- <div class="row-fluid">
    <div class="span12">合同</div>
</div> -->
<%-- <div class="row-fluid">
    <div class="span1"></div>
    <div class="span2 show1" style="display: none;">
    	<img alt="" src="${css_imagedomain}/images/word.jpg" width="75px" height="75px">
    </div>
    <div class="span2 show2" style="display: none;"><a href="#"  style="disay:block;height:75px;line-height:75px;">点击查看</a></div>
    <div class="span6 marTB">
        <form>
            <a href="javascript:void(0);" class="file">点击上传
               <input type="file" name="uploadFile" id="fileupload" field="pic1" class="fileupload">
            </a>
            <input type="hidden" value="" name="isUploadFile" id="isUploadFile" validate="{required:true,messages:{required:'请上传word文件'}}">
        </form>
         <p>word模板另存为html格式</p>
    </div>
    </div> --%>
<div class="row-fluid">
    <input type="submit" value="确定" class="span2" id="subBtn"/>
    <input type="buttom" value="关闭" class="span2" onclick="top.mainFrame.closeCurrTab()"/>
</div>
</form>
</div>
</body>
<%@include file="../../common/alert_message.jsp"%>
</html> 
<!-- 图片上传 -->
<script type="text/javascript" src="${css_imagedomain}/plugins/jqueryfileupload/js/vendor/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${css_imagedomain}/plugins/jqueryfileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="${css_imagedomain}/plugins/jqueryfileupload/js/jquery.fileupload.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	/*登录验证模板*/
	$.metadata.setType("attr", "validate");
	$("#productForm").validate({
		onfocusout:false,
		onclick:false,
		onkeyup:false,
		errorElement: "em",//用来创建错误提示信息标签(可自定义)
		errorContainer: $("#warning, #summary"),
		errorPlacement: function(error, element) {
			error.appendTo(element.parent()); 
		}
	});
	
	//点击提交按钮
	document.getElementById("subBtn").onclick = function(){
		if($("#productForm").valid()){
			var bnameLength=$("input[name='bname']").val().length;
			if(bnameLength>100){
				alert("输入内容在100个字以内");
				return false; 
			}
			if(projectRemarkEditor.getContentTxt() == ""){alert("请填写项目信息");return false};
			if(borrowUserRemarkEditor.getContentTxt() == ""){alert("请填写企业信息");return false};
			if(vouchRemarkEditor.getContentTxt() == ""){alert("请填写担保信息");return false};
			if(windControlEditor.getContentTxt() == ""){alert("请填写风险控制");return false};
			var tenderAccountMin = parseInt($("#tenderAccountMin").val());
			var tenderAccountMax = parseInt($("#tenderAccountMax").val());
			var account = parseInt($("#account").val());
			if (tenderAccountMin > account) {alert("最低投资金额应小于或等于借款总额");return false}
			if (tenderAccountMax < tenderAccountMin) {alert("最高投资金额应大于或等于最低投资金额");return false}
			if (tenderAccountMax > account) {alert("最高投资金额应小于或等于借款总额");return false}
			$("#productForm").submit();
		}
	};
});
$(function(){
	$("#repayType").change(function(){
		var repayType = $("#repayType").find("option:selected").attr("value");
		if(repayType == 1){$("#borrowPeriodType").html("月")}
		if(repayType == 2){$("#borrowPeriodType").html("天")}
	});
	$("#projectid").change(function(){
		var idValue = $(this).val();
		//采用POST方式调用服务
		if("" != idValue){
			$.post('borrow/findProject', { id: idValue }, function (text, status) {
				projectRemarkEditor.setContent(text.projectRemark);
				$("input[name='borrowApr']").val(text.projectApr);
			},"json");
		}else{
			$("input[name='borrowApr']").val("");
			projectRemarkEditor.setContent("");
		}
	　　　
	});
	$("#vouchId").change(function(){
		var idValue = $(this).val();
		//采用POST方式调用服务
		if("" != idValue){
			$.post('borrow/findVouch', { id: idValue }, function (text, status) {
				vouchRemarkEditor.setContent(text.descr);
			},"json");
		}else{
			vouchRemarkEditor.setContent("");
		}
	});
})
$('.fileupload').fileupload({
	url : getUploadFullUrl("${upload_pic_path}","word"),
	forceIframeTransport : true,
	singleFileUploads : true,
	maxFileSize : 5000000,//最大文件尺寸
	acceptFileTypes : /(\.|\/)(doc?x)$/i,//文件上传类型正则
	dataType : 'json',//返回数据类型“json”
	messages : {//错误信息提示
		acceptFileTypes : '上传word类型不正确',
		maxFileSize : '上传word过大',
		minFileSize : '上传word太小'
	}, 

	done : function(e, data) {
		if (data.result.result == 'E') {
			alert(data.result.msg);
		} else {
			$("#wordPath").val(data.result.data.savePath);
			$("#isUploadFile").val("1");
			$("#" + $(e.target).attr("field")).val(data.result.data.savePath);
			$(".show1").show();
			$(".show2").show();
		} 
	}
});

</script>