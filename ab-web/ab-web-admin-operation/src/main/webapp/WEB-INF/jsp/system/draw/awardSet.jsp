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
	<!-- 基本设置 -->
	<form action="hjsactdraw/add" name="Form" id="Form" method="post">
	<input type="hidden" value="${hjsActDraw.actId}" id="actId" name="actId">
	<input type="hidden" value="${hjsActDraw.id}" id="drawId" name="id">
		<!-- 标题头部 -->
		<div class="row-fluid">
	    	<div class="span12">基本设置</div>
		</div>
		<div class="row-fluid">
		    <div class="span2 pl"><span class="required">*</span>抽奖基数：</div>
		    <div class="span3">
		    	<input type="text" placeholder="请输入抽奖基数" class="span11" name="baseNum" id="baseNum" validate="{required:true,messages:{required:'请输入抽奖基数'}}" maxlength="50" value="${baseNum}" />
		    </div>
		   <!--  <div class="span2 pl"><span class="required">基数越大，中奖率越高。</span></div> -->
		    <div class="span3"></div>
		</div>
		<div class="row-fluid">
			<div class="span2 pl"><span class="required">*</span>每人参与次数：</div>
	        <div class="span3">
	             <select style="width: 130px;" name="limitType" id="limitType" onchange="limType();">
	             <option value="${item.id}"  ${item.id eq corporationId?"selected='selected'":""}>${item.companyName}</option>
	                <option value="">请选择</option>
	             	<option value="1" id="personLimit" <c:if test="${limitType == 1}">selected</c:if>>次</option>
	             	<option value="2" id="dayLimit"  <c:if test="${limitType == 2}">selected</c:if> >次/天</option>
	             </select>
	             <c:if test="${limitType == 1}">
		             <input type="text" placeholder="请输入次数" class="span11"  validate="{required:true,messages:{required:'请输入次数'}}" maxlength="50" style="width: 160px;" id="type1" value="${personLimit}" name="personLimit"/>
	             </c:if>
	             <c:if test="${limitType == 2}">
	             	<input type="text" placeholder="请输入次数" class="span11"  validate="{required:true,messages:{required:'请输入次数'}}" maxlength="50" style="width: 160px;" id="type1" value="${dayLimit}" name="dayLimit"/>
	             </c:if>
	             <c:if test="${limitType == null}">
	             	<input type="text" placeholder="请输入次数" class="span11"  validate="{required:true,messages:{required:'请输入次数'}}" maxlength="50" style="width: 160px;" id="type1" />
	             </c:if>
	             
	    	</div>
		</div>
		<div class="row-fluid">
		<div class="span7">
        	<input type="button" value="确定" class="span2" id="subBtn" />
    	</div>
    </div>
   </form>	
   
   <!-- 奖项设置 -->
   <div class="row-fluid">
		<div class="span12">奖项设置</div>
   </div> 
   <form action="${project_name}/hjsactdrawaward/addDrawAward.do" name="Form" id="biaodan" method="post">
		   			<!-- 模板开始 -->
					<div id="prpLpersonMLossFee_perRowTemp" style="display: none;">
						<!-- 隐藏属性值 -->
					   <input type="hidden" value="" id="actId" name="actId">
					   
							<div class="row-fluid" id="row-fluid" style="margin-left:20px;">
								<div class="span1" style="width:100px;text-align:center; margin-right:25px;">
									 <div class="span8" style="width:100px;"><span class="required">*</span>奖项名称</div>
									 <div class="span8" style="width:100px;text-align:center;">
										  <input type="text" placeholder="奖品名称"  name="awardName" id="awardName" validate="{required:true,messages:{required:'请输入名称'}}" maxlength="50" style="width: 100px;"/>
									 </div>
								</div>
								<div class="span2" style="width:100px;text-align:center; margin-right:20px;">
									 <div class="span10" style="width:100px;"><span class="required">*</span>奖品类型</div>
									 <div class="span10" style="width:100px;text-align:center;">
									 	<select name="awardType" id="awardType" validate="{required:true,messages:{required:'请选择类型'}}" style="width: 100px;" onchange="bonusType(this);">
												<option value="">请选择</option>
												<option value="1"  <c:if test="${var.awardType == 1}">selected</c:if>>红包</option>
												<%-- <option value="2"  <c:if test="${var.awardType == 2}">selected</c:if>>实物</option> --%>
										</select>
									 </div>
								</div>
								<div class="span2" style="width:100px;text-align:center; margin-right:20px;">
									  <div class="span10" style="width:100px;"><span class="required">*</span>奖品</div>
									  <div class="span10" style="width:100px;text-align:center;">
									  	   <select style="width:100px;" name="bonusId" validate="{required:true,messages:{required:'请选择紅包'}}" style="width: 100px;"  id="bonusId" >
										        <option value="">请选择</option>
												<c:forEach items="${bonus}" var="pc" varStatus="vspc">
													<option>${pc.bname}</option>
												</c:forEach>
										   </select>
									  </div>
								</div>
								<div class="span2" style="width:110px;text-align:center; margin-right:20px;">
									  <div class="span10" style="width:110px;"><span class="required">*</span>奖品数量(个)</div>
									  <div class="span10" style="width:110px;text-align:center;">
										   <input type="text" placeholder="数量" style="width:100px;" name="awardNum" id="awardNum" validate="{required:true,messages:{required:'请输入数量'}}" maxlength="50" />
									  </div>
								</div>
								<div class="span2" style="width:130px;text-align:center; margin-right:20px;">
									 <div class="span10" style="width:130px;"><span class="required">*</span>最小奖值</div>
									 <div class="span10" style="width:130px;text-align:center;">
									    <input type="text" placeholder="请输入整数" style="width:100px;" name="minValue" id="minValue" validate="{required:true,messages:{required:'最小奖值'}}" maxlength="50" />
									 </div>
								</div>
								<div class="span2" style="width:120px;text-align:center; margin-right:20px;">
									<div class="span10" style="width:120px;"><span class="required">*</span>最大奖值</div>
									<div class="span10" style="width:120px;text-align:center;">
										<input type="text" placeholder="请输入整数" style="width:100px;" name="maxValue" id="maxValue" validate="{required:true,messages:{required:'最大奖值'}}" maxlength="50" />
									</div>
								</div>
								<div class="span2" style="width:120px;text-align:center; margin-right:20px;">
									<div class="span10" style="width:120px;"><span class="required">*</span>排序</div>
									<div class="span10" style="width:120px;text-align:center;">
										<input title="排序"  name="orderNo" id="orderNo" style="width:30px;height:100%;text-align:center; padding-top: 5px;padding-bottom: 3px;"  validate="{required:true,messages:{required:'奖项排序'}}" type="number"/>
									</div>
								</div>
								<div class="span1" style="width:32px;text-align:center;margin-top:32px;">
									 <input type="button"   name="subBtn1"   value="确定" onclick="subBtn(this);"/>
								</div>
								<div class="span1" style="width:32px;text-align:center;margin-top:32px;">
									<img src="${project_name}/static/images/COL.png" id="remove" width="25" height="25" style="cursor:pointer"  />
								</div>
							</div>
			      	</div>
		   			<!-- 模板结束 -->
	
   		<%-- 	<c:when test="${hjsActDrawAward != null}"> --%>
   				<!-- 循环遍历奖品信息 -->
		<!-- 		<input type="text" value="" id="optId"/> -->
					  
				<div id="rowFluids">
					<c:forEach items="${hjsActDrawAward}" var="var" varStatus="vs">
						  <input type="hidden" value="${var.id}" id="id"/>
						  <input type="hidden" value="${var.actId}" id="actId1" name="actId">
							<div class="row-fluid" id="row-fluid" style="margin-left:20px;">
								<div class="span1" style="width:100px;text-align:center; margin-right:25px;">
									 <div class="span8" style="width:100px;"><span class="required">*</span>奖项名称</div>
									 <div class="span8" style="width:100px;text-align:center;">
										  <input type="text" placeholder="奖品名称"  name="awardName" id="awardName1" validate="{required:true,messages:{required:'请输入名称'}}" maxlength="50" style="width: 100px;" value="${var.awardName}"/>
									 </div>
								</div>
								<div class="span2" style="width:100px;text-align:center; margin-right:20px;">
									 <div class="span10" style="width:100px;"><span class="required">*</span>奖品类型</div>
									 <div class="span10" style="width:100px;text-align:center;">
									 	<select name="awardType" id="awardType1" validate="{required:true,messages:{required:'请选择类型'}}" style="width: 100px;" onchange="bonusType1(this);">
												<option value="">请选择</option>
												<option value="1"  <c:if test="${var.awardType == 1}">selected</c:if>>红包</option>
												<%-- <option value="2"  <c:if test="${var.awardType == 2}">selected</c:if>>实物</option> --%>
										</select>
									 </div>
								</div>
								<div class="span2" style="width:100px;text-align:center; margin-right:20px;">
									  <div class="span10" style="width:100px;"><span class="required">*</span>奖品</div>
									  <div class="span10" style="width:100px;text-align:center;">
									  	   <select style="width:100px;" validate="{required:true,messages:{required:'请选择紅包'}}"id="bonusId1" name="bonusId">
										        <option value="" >请选择</option>
												<c:forEach items="${bonus}" var="pc" varStatus="vspc">
													<c:if test="${var.awardType == 1}">
														<c:if test="${pc.type == 1 }">
															<option <c:if test="${var.bonusId == pc.id}">selected</c:if> value="${pc.id}">${pc.bname}</option>
														</c:if>
													</c:if>
													<c:if test="${var.awardType == 2}">
														<c:if test="${pc.type == 2 }">
															<option <c:if test="${var.bonusId == pc.id}">selected</c:if> value="${pc.id}">${pc.bname}</option>
														</c:if>
													</c:if>
													<%-- <option <c:if test="${var.bonusId == pc.id}">selected</c:if> value="${pc.id}">${pc.bname}</option> --%>
												</c:forEach>
										   </select>
									  </div>
								</div>
								<div class="span2" style="width:110px;text-align:center; margin-right:20px;">
									  <div class="span10" style="width:110px;"><span class="required">*</span>奖品数量(个)</div>
									  <div class="span10" style="width:110px;text-align:center;">
										   <input type="text" placeholder="数量" style="width:100px;" name="awardNum" id="awardNum1" validate="{required:true,messages:{required:'请输入数量'}}" maxlength="50" value="${var.awardNum}"/>
									  </div>
								</div>
								<div class="span2" style="width:130px;text-align:center; margin-right:20px;">
									 <div class="span10" style="width:130px;"><span class="required">*</span>最小奖值</div>
									 <div class="span10" style="width:130px;text-align:center;">
									    <input type="text" placeholder="请输入整数" style="width:100px;" name="minValue" id="minValue1" validate="{required:true,messages:{required:'最小奖值'}}" maxlength="50" value="${var.minValue}"/>
									 </div>
								</div>
								<div class="span2" style="width:120px;text-align:center; margin-right:20px;">
									<div class="span10" style="width:120px;"><span class="required">*</span>最大奖值</div>
									<div class="span10" style="width:120px;text-align:center;">
										<input type="text" placeholder="请输入整数" style="width:100px;" name="maxValue" id="maxValue1" validate="{required:true,messages:{required:'最大奖值'}}" maxlength="50" value="${var.maxValue}"/>
									</div>
								</div>
								<div class="span2" style="width:120px;text-align:center; margin-right:20px;">
									<div class="span10" style="width:120px;"><span class="required">*</span>排序</div>
									<div class="span10" style="width:120px;text-align:center;">
										<input title="排序"  name="orderNo" id="orderNo1" value="${var.orderNo}" style="width:30px;height:100%;text-align:center; padding-top: 5px;padding-bottom: 3px;"  validate="{required:true,messages:{required:'奖项排序'}}" type="number"/>
									</div>
								</div>
						<%-- 		<c:choose>
									<c:when test="${var.id == null}">
										<div class="span1" style="width:32px;text-align:center;margin-top:32px;">
											 <input type="hidden" value="${var.id }" id="id"/>
											 <input type="button"  value="保存"  name="subBtn1" id="subBtn1" onclick="subBtn(this);"/>
										</div>
									</c:when>
									<c:otherwise>
										<div class="span1" style="width:32px;text-align:center;margin-top:32px;">
											 <input type="hidden" value="${var.id }" id="id1"/>
											 <input type="button"  value="更新"  name="subBtn2" onclick="edit(this);"/>
										</div>
									</c:otherwise>
								</c:choose> --%>
								<div class="span1" style="width:32px;text-align:center;margin-top:32px;">
											 <input type="hidden" value="${var.id }" id="id1"/>
											 <input type="button"  value="更新"  name="subBtn2" onclick="edit(this);"/>
								</div>
								
								<div class="span1" style="width:32px;text-align:center;margin-top:32px;">
									<img src="${project_name}/static/images/COL.png" id="remove" width="25" height="25" style="cursor:pointer" />
								</div>
			      			</div>
			      			</c:forEach>
								</div>
   					<%-- </c:when> --%>
   				
			  <div class="row-fluid" style="margin-left:25px;">
	      		<img src="${project_name}/static/images/add_ico.png" id="add" width="25" height="25" style="cursor:pointer;margin-left: -1260px;"  />
	      	  <span>新增奖项</span>
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
			}); 
			
			//添加模板
			$(function(){
				
				$("img").click(function(){
					var id=$(this).attr("id");
					if(id=="add"){

						 $("#rowFluids").append($("#prpLpersonMLossFee_perRowTemp").html());
						 var length=$("#rowFluids .row-fluid").length-1;
						 $("#rowFluids .row-fluid").eq(length).find(".awardName").val("");
						 $("#rowFluids .row-fluid").eq(length).find(".awardType").val("");
						 $("#rowFluids .row-fluid").eq(length).find("#bonusId").val("");
						 $("#rowFluids .row-fluid").eq(length).find("#awardNum").val("");
						 $("#rowFluids .row-fluid").eq(length).find("#minValue").val("");
						 $("#rowFluids .row-fluid").eq(length).find("#maxValue").val("");
						 $("#rowFluids .row-fluid").eq(length).find("#orderNo").val("");
						 $("#rowFluids .row-fluid").eq(length).find("#id").val("");
						 $("#rowFluids .row-fluid").eq(length).find("#remove").bind("click", remove);
						 $("#rowFluids .row-fluid").eq(length).find("em.error").remove();
						
					}
					else if(id=="remove"){
						
						//默认给长度加1.因为最少存在一项列表
						 var length=$("#rowFluids .row-fluid").length+1;
						
						if(length==1){
							alert("必须保留一项奖项。");
							return false;
						}else{
							var awardId = $(this).parent().parent().find('#id1').val();
							//判断是不是空数据 如果是空数据直接删除，否则进行活动开启状态验证
							if(awardId == "")
							{
								$(this).parent().parent().remove();
								//删除当前元素
								//length = length-1;
								//alert("删除这行以后的长度是："+length);
							}else{
								//存在(判断活动状态是否开启，只有关闭状态才可以进行删除。)
								var actId = $('#actId').val();//活动ID
								//var id = $('#id1').val();//ID
								 $.ajax({ 
									   type: "post", 
								       url: "${project_name}/hjsactdrawaward/del.do?actId="+actId+"&id="+awardId, 
								       cache:false,
					    		       async:false,
					    		       dataType: "text",
								       success: function(data){
								    	   if(data == 'fail')
								    	   {
								    		   alert("此活动为开启状态不能进行删除操作。");
								    		   return false;
								    	   }else if(data == 'success'){
								    		   $(this).parent().parent().remove()
								    		   alert("删除成功。");
								    		   window.location.reload();
								    		   return false;
								    	   }else{
								    		   alert("删除失败。");
								    		   return false;
								    	   }
								       } 
								});				
							} 
						}
						//$(this).parent().parent().remove()
					}
					
				});
			

			});
			
			//删除
			function remove()
			{
				    //alert($(this).parent().parent().html());
					//默认给长度加1.因为最少存在一项列表
					var length=$("#rowFluids .row-fluid").length+1;
					
					//alert("删除之前的长度是："+length);
					if(length==1){
						alert("必须保留一项奖项。");
						return false;
					}else{
						
						//var delId = $(this).parent().parent().find('#id1').val();
						//alert($(this).parent().html()+"aaaaaaaaaaa");
						//判断是不是空数据 如果是空数据直接删除，否则进行活动开启状态验证
						if($("#rowFluids").val() == "")
						{
							$(this).parent().parent().remove();
							
						}else{
							//存在(判断活动状态是否开启，只有关闭状态才可以进行删除。)
							var actId = $('#actId').val();//活动ID
							var id = $('#id').val();//ID
							 $.ajax({ 
								   type: "post", 
							       url: "${project_name}/hjsactdrawaward/del.do?actId="+actId+"&id="+id, 
							       cache:false,
				    		       async:false,
				    		       dataType: "text",
							       success: function(data){
							    	   if(data == 'fail')
							    	   {
							    		   alert("此活动为开启状态不能进行删除操作。");
							    		   return false;
							    	   }else if(data == 'success'){
							    		   $(this).parent().parent().remove()
							    		   alert("删除成功。");
							    		   window.location.reload();
							    		   return false;
							    		   
							    	   }else{
							    		   alert("删除失败。");
							    		   return false;
							    	   }
							       } 
							});				
						}
					}
					//$(this).parent().parent().remove()
			}
			
			
			//大转盘活动处理校验
			$("#subBtn").click(function(){
				 if($("form").valid()){
					 	 var reg = /^[0-9]*[1-9][0-9]*$/;//正数验证
					 	 var ref = true;
						 var actId = $('#actId').val();//活动ID
						 var drawId = $('#drawId').val();//活动ID
						 var baseNum = $('#baseNum').val();//抽奖基数
						 var limitType = $('#limitType').val();//参与次数
						 var type1 = $('#type1').val();
						 
						 //校验抽奖基数是否为正数
						 if(!reg.test(baseNum))
						 {
							 alert("抽奖基数必须为正数。");
							 return false;
						 }
						 //判断抽奖基数大小限制   小于10000000
						 if(baseNum > 10000000)
						 {
							 alert("输入抽奖基数应小于10000000。");
							 return false;
						 }
						 
						 if(!reg.test(limitType))
						 {
							 alert("参与次数必须为正数。");
							 return false;
						 }
						 
						 //校验参与次数为正整数
						 if(!reg.test($('#type1').val()))
						 {
							 alert("参与次数必须为正整数。");
							 return false;
						 }
						 
						 //判断每人参与总数限制   小于1000
						 if(limitType == 1 && $('#type1').val() > 1000)
						 {
							alert("每人参与总数应小于1000。");
							return false;
						 }
						
						 //判断每人每天参与次数限制   小于1000
						 if($('#type1').val() > 100 && limitType == 2)
						 {
							alert("每人每天参与次数小于100。");
							return false;
						 }
						 
						 $.ajax({ 
							   type: "post", 
						       data:$("#Form").serialize(),
						       url: "${project_name}/hjsactdraw/add.do?actId="+actId, 
						       cache:false,
			    		       async:false,
			    		       dataType: "text",
						       success: function(data){
						    	   if(data == '1')
						    	   {
						    		   alert("添加成功");
						    		   return false;
						    	   }else if(data == '2'){
						    		   alert("更新成功。");
						    		   return false;
						    	   }else{
						    		   alert("添加失败。");
						    		   return false;
						    	   }
						       } 
						});						 
				    }
				});
			

	//删除奖励
	function del(id)
	{
		//非空校验
		$.ajax({ 
		   type: "post", 
	       url: "${project_name}/hjsactdrawaward/delete.do?id="+id, 
	       cache:false, 
	       async:false, 
	       contentType : 'application/json;charset=UTF-8',
	       success: function(data){
	    	   if(data == 'success')
	    	   {
	    		  var appendForm = $('form:this').html();
	    		  //追加form表单
	    		  $('#copyForm').remove(appendForm);
	    	   }
	       } 
		});
	}
	
	
	//新增判断红包类型
	function bonusType(obj)
	{
		var bonusType = $(obj).val();
		//alert(bonusType);
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
		    	   var bonus = $(obj).parent().parent().next().find('#bonusId');
		    	   //alert($(obj).parent().parent().next().html());
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
	
	//修改判断红包类型
	function bonusType1(obj)
	{
		var bonusType = $(obj).val();
		//alert(bonusType);
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
		    	   var bonus = $(obj).parent().parent().next().find('#bonusId1');
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
	 
	//大转盘次数选择操作   1：一共多少次   2：每人/天多少次
	function limType()
	{
		var ref = true;
		var value = $("#limitType").find("option:selected").val();
		//判断选中的是 1：一共多少次   2：每人/天可以多少次
		if(value == 1)
		{
			$('#type1').attr('name','personLimit');
		}
		if(value == 2)
		{
			$('#type1').attr('name','dayLimit');
		}
	}
	
	
    /**
      *	新增/更新奖励奖品操作
    */
	function subBtn(obj)
	{
    	//新增属性值
		var reg = /^[0-9]*[1-9][0-9]*$/;//正整数验证
		var reg1 = /^[1-9]\d*|0$/;//正整数验证
		var actId = $('#actId').val();//活动ID
		var awardName = $(obj).parent().parent().find('#awardName').val();//奖励名称
		var awardType = $(obj).parent().parent().find('#awardType').val();//奖励类型
		var bonusId   = $(obj).parent().parent().find('#bonusId').val();//选择奖品
		var awardNum  = $(obj).parent().parent().find('#awardNum').val();//数量
		var minValue  = $(obj).parent().parent().find('#minValue').val();//最小范围
		var maxValue  = $(obj).parent().parent().find('#maxValue').val();//最大范围
		var orderNo   = $(obj).parent().parent().find('#orderNo').val();//奖励顺序
		var baseNum   = $('#baseNum').val();//奖励顺序
		var id   = $(obj).parent().parent().find('#id').val();
		
		 if(awardName == ""){
			 alert("请输入奖励名称。");
			 return false;
		 }
		 if(awardType == ""){
			 alert("请选择奖励类型。");
			 return false;
		 }
		 if(bonusId == ""){
			 alert("请选择奖品。");
			 return false;
		 }
		 if(awardNum == ""){
			 alert("请输入数量。");
			 return false;
		 }
		 if(minValue == ""){
			 alert("请输入最小范围。");
			 return false;
		 }
		 
		 //判断奖值范围不能大于抽奖基数
		 if(eval(minValue) > baseNum)
		 {
			 alert("奖值范围不能大于抽奖基数.");
			 return false;
		 }
		 if(eval(maxValue) > baseNum)
		 {
			 alert("奖值范围不能大于抽奖基数.");
			 return false;
		 }
		 if(maxValue == ""){
			 alert("请输入最大范围。");
			 return false;
		 }
		 
		 //判断最小范围不能大于最大范围
		 if(eval(minValue) > eval(maxValue))
		 {
			 alert("奖品范围最小值不能大于最大值。");
			 return false;
		 }
		 if(orderNo == ""){
			 alert("请输入排序顺序。");
			 return false;
		 }
		 if(awardNum > 1000000){
			 alert("奖项数量在1000000以内。");
			 return false;
		 }
		
		 
		 //校验数量必须为正数
		 if(!reg.test(awardNum))
		 {
			 alert("输入数量必须为正数。");
			 return false;
		 }
		 //校验最小范围必须为正数
		 if(!reg1.test(minValue))
		 {
			 alert("输入最小范围必须为正数。");
			 return false;
		 }
		 //校验最大范围必须为正数
		 if(!reg1.test(maxValue))
		 {
			 alert("输入最大范围必须为正数。");
			 return false;
		 }
		 //校验奖励顺序必须为正整数
		 if(!reg.test(orderNo))
		 {
			 alert("输入顺序必须为正数。");
			 return false;
		 }
		 //判断当前活动奖品名称是否存在
		 if(hasN(actId,awardName,""))
		 {
			 alert("当前活动奖品名称已存在。");
			 return false;
		 }
		 
		 //判断id是否为空
		 if(id == null || '' == id || 'undefined' == id)
		 {
			 $.ajax({ 
				   type: "post",
			       //data:$("#rowFluids:last").serialize(),
			       url: "${project_name}/hjsactdrawaward/addDrawAward.do?awardName="+awardName+"&awardType="+awardType+"&awardNum="+awardNum+
			    		   "&minValue="+minValue+"&maxValue="+maxValue+"&orderNo="+orderNo+"&actId="+actId+"&bonusId="+bonusId,
			       success: function(data){
			    	   if(data == '1')
			    	   {
			    		  alert("添加成功。");
			    		  window.location.reload();
			    		  return false;
			    	   }
			    	   if(data == '2')
			    	   {
			    		   alert("更新成功。");
			    		   window.location.reload();
			    		   return false;
			    	   }
			       } 
			});
		 }else{
			 $.ajax({ 
				   type: "post",
			       //data:$("#rowFluids:last").serialize(),
			       url: "${project_name}/hjsactdrawaward/addDrawAward.do?awardName="+awardName+"&awardType="+awardType+"&awardNum="+awardNum+
			    		   "&minValue="+minValue+"&maxValue="+maxValue+"&orderNo="+orderNo+"&id="+id+"&actId="+actId+"&bonusId="+bonusId,
			       success: function(data){
			    	   
			    	   if(data == '1')
			    	   {
			    		  //判断奖品信息是否唯一
			    		  window.location.reload();
			    		  return false;
			    	   }
			    	   if(data == '2')
			    	   {
			    		   alert("更新成功。");
			    		   return false;
			    		   parent.location.reload();
			    	   }
			       } 
			});
		 }
	}
    
    
	//判断奖品信息是否唯一
	function hasN(actId,awardName,awardId){
		awardName=encodeURIComponent(encodeURIComponent(awardName));//活动名称
		var ref = true;
		$.ajax({
		   type: "post", 
	       url: "${project_name}/hjsactdrawaward/hasN.do?awardname="+awardName+"&actId="+actId+"&awardId="+awardId, 
	       cache:false, 
	       async:false, 
	       dataType : 'json', 
	       success: function(data){
	    	    if(data=="true")
	    	    {
	    	    	ref=true;
	    	    }
	    	    if(data=="false")
	    	    {
	    	    	ref=false;
	    	    }
	       } 
		});
		return ref;
	}
    
    
    
    
    //修改奖品信息
    function edit(obj)
    {
    	//新增属性值
		var reg = /^[0-9]*[1-9][0-9]*$/;//正整数验证
		var reg1 = /^[1-9]\d*|0$/;//正整数验证
		var actId = $('#actId1').val();//活动ID
		var awardName = $(obj).parent().parent().find('#awardName1').val();//奖励名称
		var awardType = $(obj).parent().parent().find('#awardType1').val();//奖励类型
		var bonusId   = $(obj).parent().parent().find('#bonusId1').val();//选择奖品
		var awardNum  = $(obj).parent().parent().find('#awardNum1').val();//数量
		var minValue  = $(obj).parent().parent().find('#minValue1').val();//最小范围
		var maxValue  = $(obj).parent().parent().find('#maxValue1').val();//最大范围
		var orderNo   = $(obj).parent().parent().find('#orderNo1').val();//奖励顺序
		var baseNum   = $('#baseNum').val();//奖励顺序
		var id   = $(obj).parent().parent().find('#id1').val();
		
		 if(awardName == ""){
			 alert("请输入奖励名称。");
			 return false;
		 }
		 if(awardType == ""){
			 alert("请选择奖励类型。");
			 return false;
		 }
		 if(bonusId == ""){
			 alert("请选择奖品。");
			 return false;
		 }
		 if(awardNum == ""){
			 alert("请输入数量。");
			 return false;
		 }
		 if(minValue == ""){
			 alert("请输入最小范围。");
			 return false;
		 }
		 if(maxValue == ""){
			 alert("请输入最大范围。");
			 return false;
		 }
		 if(orderNo == ""){
			 alert("请输入排序顺序。");
			 return false;
		 }
		 if(awardNum > 1000000){
			 alert("奖项数量在1000000以内。");
			 return false;
		 }
		//判断奖值范围不能大于抽奖基数
		 if(eval(minValue) > baseNum)
		 {
			 alert("奖值范围不能大于抽奖基数.");
			 return false;
		 }
		 if(eval(maxValue) > baseNum)
		 {
			 alert("奖值范围不能大于抽奖基数.");
			 return false;
		 }
		 //判断最小范围不能大于最大范围
		 if(eval(minValue) > eval(maxValue))
		 {
			 alert("奖品范围最小值不能大于最大值。");
			 return false;
		 }
		 //校验数量必须为正数
		 if(!reg.test(awardNum))
		 {
			 alert("输入数量必须为正数。");
			 return false;
		 }
		 //校验最小范围必须为正数
		 if(!reg1.test(minValue))
		 {
			 alert("输入最小范围必须为正数。");
			 return false;
		 }
		 //校验最大范围必须为正数
		 if(!reg1.test(maxValue))
		 {
			 alert("输入最大范围必须为正数。");
			 return false;
		 }
		 //校验奖励顺序必须为正数
		 if(!reg.test(orderNo))
		 {
			 alert("输入最大范围必须为正数。");
			 return false;
		 }
		 
		 //判断当前活动奖品名称是否存在
		 if(hasN(actId,awardName,id))
		 {
			 alert("当前活动奖品名称已存在。");
			 return false;
		 }
		 
		 //判断id是否为空
		 if(id != null || '' != id || 'undefined' != id)
		 {
			 $.ajax({ 
				   type: "post",
			       url: "${project_name}/hjsactdrawaward/editDrawAward.do?awardName="+awardName+"&awardType="+awardType+"&awardNum="+awardNum+
	    		   "&minValue="+minValue+"&maxValue="+maxValue+"&orderNo="+orderNo+"&id="+id+"&actId="+actId+"&bonusId="+bonusId,
			       success: function(data){
			    	   if(data == '1')
			    	   {
			    		   alert("更新成功。");
			    		   window.location.reload();
			    		   return false;
			    	   }
			       } 
			});
		 }
    }
    
    
	</script>
</body>
</html>