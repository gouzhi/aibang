<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>个人资料 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/personal.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
  <script src="${css_imagedomain}/front/js/enroll.js" type="text/jscript"></script>
  <script src="${css_imagedomain}/front/js/birthday.js" type="text/jscript"></script>
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <script>
$(function(){
	$('.Close').click(function(){
		$('.maskName').css('display','none');	
		$('.boxName').css('display','none');
		window.location.href="${project_name}/user/customer/toPersonal";
	});
	$('#qd').click(function(){
		$('.maskName').css('display','none');	
		$('.boxName').css('display','none');
		window.location.href="${project_name}/user/customer/toPersonal";
	});
});
</script>
</head> 
 
<body style="background: #e8e8e8;">
<div class="maskName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if> ></div>
<div class="boxName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if>>
    <span class="Close">x</span>
	<p>修改成功</p>
    <a id="qd" href="javascript:void(0);">返回个人资料</a>   
</div> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--个人资料-->
<div class="accountContent clear">
    <div id="nav_point" class="icoPoint">
		<span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span style="font-size: 14px;color:#777;">个人资料</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    
		<div class="ownRight">
			<h3 class="tit">个人资料</h3>
			<div class="own_Wrap">
        		<div class="ownTab">
					<span <c:if test="${tag=='1'}">class="activeO"</c:if> >基本资料</span>
					<span <c:if test="${tag=='2'}">class="activeO"</c:if> >详细资料</span>
					<span <c:if test="${tag=='3'}">class="activeO"</c:if> >个人头像</span>
					<span <c:if test="${tag=='4'}">class="activeO"</c:if> >收货地址</span>
				</div>
            	<div class="ownTabList">
					<div class="ownBasic" <c:if test="${tag=='1'}">style="display:block;"</c:if> >
						<form id="basicForm" name="basicForm" action="editPBaseInfo" method="post">
						<c:choose>
							<c:when test="${isUpdatedUsername == 0}">
								<div class="ownName">
									<span class="tit">用户名</span>
									<%--<b>${sessionUser.username }</b>--%>
									<input type="hidden" value="${username }" id="OldName"  />
									<input type="text"  name="username" value="${username }" placeholder="" readOnly="true" id="naneText"   validate="{required:true,usernameCheck:true,messages:{required:'',usernameCheck:''}}"/>
									<input type="button" value="设置" style="width:40px;height: 44px;line-height: 44px;cursor: pointer;text-indent: 0;" id="Ibtn" />
									<input type="hidden" value="0" name="issetname" id="issetname"/>
									<p style="font-size: 14px;color:#383838;margin-left: 80px;line-height: 26px;">4-16位字符，可使用字母、数字、“-”和“_”</p>
									<p style="font-size: 14px;color:#f27267;margin-left: 80px;line-height: 26px;">设置后不能修改</p>
								</div>
								<div class="newName" style="display: none;">
									<input id="password" name="password" type="password" value="" placeholder="输入登录密码后点击保存" style="width:328px;height:42px;line-height: 42px;border: 1px solid #d2d2d2;border-radius: 4px;text-indent: 10px;margin-left: 80px;margin-bottom: 15px;" />
								</div>
							</c:when>
							<c:otherwise>
								<div class="ownName">
									<span class="tit">用户名</span>
									<%--<b>${sessionUser.username }</b>--%>
									<input type="text" value="${username }" placeholder="" readOnly="true" id="naneText"   />
								</div>
							</c:otherwise>
						</c:choose>
							<script>
								$(function(){
									$('#Ibtn').click(function(){
										if($(this).val()=='设置'){
											$('#issetname').val(1);
											$('#naneText').val('');
											$('#naneText').removeAttr('readOnly');
											$('.newName').show();

											$('#naneText').attr('placeholder','输入用户名');
											$(this).val('取消');
										}
										else if($(this).val()=='取消'){
											$('#issetname').val(0);
											$('.newName').hide();
											$('#naneText').prop('readOnly',true);
											$(this).val('设置');
											$('#naneText').val($('#OldName').val());
										}

									});
								});
							
							</script>
							<!--<div class="ownEmail">
								<span>邮箱地址：</span>
								<input type="text" value="" />
								<b></b>
							</div>-->

							<div class="ownGender">
								<span class="tit">性别</span>
								<label>
									<i <c:if test="${usersInfo.sex ==1 }">class="activeI"</c:if> id="man"></i>
									<span>男</span>
								</label>
								<label>
									<i <c:if test="${usersInfo.sex ==0 }">class="activeI"</c:if> id="female"></i>
									<span>女</span>
								</label>
								<input type="hidden" id="sex" name="sex" value="${usersInfo.sex}" validate="{required:true,messages:{required:'请选择性别'}}" />
							</div>
							<div class="ownYear">
								<span class="tit">生日</span>
								<select id="sel_year" name="year" rel="${year}" validate="{required:true,messages:{required:'请选择年份'}}"></select>

								<select id="sel_month" name="month" rel="${month}" validate="{required:true,messages:{required:'请选择月份'}}">

								</select>
								<select id="sel_day" name="day" rel="${day}" validate="{required:true,messages:{required:'请选择日期'}}">

								</select>
							</div>
							<div class="ownBrief">
								<span class="tit">简介</span>
								<textarea placeholder="不超过600字" id="introduction" name="introduction" onchange="introductionLength();">${usersInfo.introduction}</textarea>
								<b id="intr_b" style="color:red;display:none;">简介最多可输入600个字符</b>
							</div>
							<!-- 开放基本资料 二期设计 -->
							<div class="ownOpn ownOpn_base" style="display:none;">
								<span>开放基本资料：</span>
								<label>
									<i <c:if test="${usersInfo.baseinfoOpen ==1 }">class="activeI"</c:if> id="kf"></i>
									<span>开放</span>
								</label>
								<label>
									<i <c:if test="${usersInfo.baseinfoOpen ==0 }">class="activeI"</c:if> id="bkf"></i>
									<span>不开放</span>
								</label>

							</div>
							<input type="hidden" id="baseinfo" name="baseinfo" value="0" />
							<input id="subBtn" type="button" value="保&nbsp;&nbsp;存" class="ownSub fz18" />
						</form>
					</div>
					<div class="ownBasic" <c:if test="${tag=='2'}">style="display:block;"</c:if> >
						<form id="infoForm" name="infoForm" action="editPDetail" method="post">
							<input type="hidden" id="id" name="id" value="${usersInfo.id}" />
							<div class="ownAddrss">
								<span class="tit1">所在地区</span>

						<select id="area1" name="area1"  class="pro" onchange="changeArea(2);">
									<option value="">请选择省</option>
									<c:if test="${not empty area }">
									<c:forEach var="area" items="${area}" varStatus="status">
									<option value="${area.id }" <c:if test="${area.id == userParentArea.parentId }">selected="selected"</c:if> >${area.areaName }</option>
									</c:forEach>
									</c:if>
								</select>
								<select id="area2" name="area2" class="pro" onchange="changeArea(3);">
									<option value="">全部</option>
									<c:if test="${not empty area1 }">
									<c:forEach var="area" items="${area1}" varStatus="status">
									<option value="${area.id }" <c:if test="${area.id == userArea.parentId }">selected="selected"</c:if> >${area.areaName }</option>
									</c:forEach>
									</c:if>
								</select>
								<select id="area3" name="area3" class="pro"  >
									<option value="">全部</option>
									<c:if test="${not empty area2 }">
									<c:forEach var="area" items="${area2}" varStatus="status">
									<option value="${area.id }" <c:if test="${area.id == userArea.id }">selected="selected"</c:if> >${area.areaName }</option>
									</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="ownQQ">
								<span class="tit1">QQ号码</span>
								<input id="qq" name="qq"  type="text" value="${usersInfo.qq }" validate="{isQq:true,messages:{isQq:'请输入正确QQ号'}}" />
								<b></b>
							</div>
							<div class="ownBlood">
								<span class="tit1">血型</span>
								 <select id="blood" name="blood">
									<option <c:if test="${usersInfo.blood =='A' }">selected="selected"</c:if> value="A">A型</option>
									<option <c:if test="${usersInfo.blood =='B' }">selected="selected"</c:if> value="B">B型</option>
									<option <c:if test="${usersInfo.blood =='AB' }">selected="selected"</c:if> value="AB">AB型</option>
									<option <c:if test="${usersInfo.blood =='O' }">selected="selected"</c:if> value="O">O型</option>
								</select>
							</div>
							<div class="ownSchool">
								<span  class="tit1">毕业院校</span>
								<input id="university" name="university" type="text" value="${usersInfo.university }" />
								<select id="education" name="education">
									<option <c:if test="${usersInfo.education =='' }">selected="selected"</c:if> value="">学历</option>
									<option <c:if test="${usersInfo.education ==1 }">selected="selected"</c:if> value="1">小学</option>
									<option <c:if test="${usersInfo.education ==2 }">selected="selected"</c:if> value="2">初中</option>
									<option <c:if test="${usersInfo.education ==3 }">selected="selected"</c:if> value="3">高中</option>
									<option <c:if test="${usersInfo.education ==4 }">selected="selected"</c:if> value="4">大学</option>
									<option <c:if test="${usersInfo.education ==5 }">selected="selected"</c:if> value="5">硕士</option>
									<option <c:if test="${usersInfo.education ==6 }">selected="selected"</c:if> value="6">博士</option>
								</select>
							</div>
							<div class="ownMarr">
								<span class="tit1">婚姻状况</span>
								<select id=marriage name="marriage">
									<option <c:if test="${usersInfo.marriage ==2 }">selected="selected"</c:if> value="2">已婚</option>
									<option <c:if test="${usersInfo.marriage ==1 }">selected="selected"</c:if> value="1">未婚</option>
									<option <c:if test="${usersInfo.marriage ==0 }">selected="selected"</c:if> value="0">未知或者保密</option>
								</select>
							</div>
							<div class="ownMarr">
								<span class="tit1">信仰</span>
								<select id="faith" name="faith">
									<option <c:if test="${usersInfo.faith ==1 }">selected="selected"</c:if> value="1">佛教</option>
									<option <c:if test="${usersInfo.faith ==2 }">selected="selected"</c:if> value="2">道教</option>
									<option <c:if test="${usersInfo.faith ==3 }">selected="selected"</c:if> value="3">基督教</option>
									<option <c:if test="${usersInfo.faith ==4 }">selected="selected"</c:if> value="4">天主教</option>
									<option <c:if test="${usersInfo.faith ==5 }">selected="selected"</c:if> value="5">伊斯兰教</option>
									<option <c:if test="${usersInfo.faith ==6 }">selected="selected"</c:if> value="6">无神论</option>
									<option <c:if test="${usersInfo.faith ==7 }">selected="selected"</c:if> value="7">其他</option>
								</select>
							</div>

							<!--开放详细资料 二期设计 -->
							<div class="ownOpn ownOpn_info" style="display:none;">
								<span>开放详细资料</span>
								<label>
									<i class="activeI" id="kf"></i>
									<span>开放</span>
								</label>
								<label>
									<i id="bkf"></i>
									<span>不开放</span>
								</label>

							</div>
							<input type="hidden" id="infoOpen" name="infoOpen" value="0" />
							<input id="subBtn1" type="button" value="保存" class="ownSubTwo fz18" />
						</form>
					</div>
					<div class="ownBasic" <c:if test="${tag=='3'}">style="display:block;"</c:if>>
						<div class="ownHead">

							<div class="ownHeadTop">
								<div class="ownHeadTopLeft">
									<%--<h3 class="fz14 lineH26">当前头像</h3>--%>
									<div class="file-box">
										<form id="avatarForm" name="avatarForm" action="editPAvatar" method="post">
											<input type="hidden" id="id" name="id" value="${usersInfo.id}" />
											<input type="hidden" id="headPic" name="headPic" value="${usersInfo.headPic }"/>
											<a href="javascript:void(0);" class="file">请选择新的图片文件
												<input type="file" name="uploadFile" id="fileupload" class="fileupload">
											</a>
											<p>请上传您的真实照片以展示您的个人风采。文件需小于500KB，格式为JPG、BMP、GIF，头像将被转换为190×190px规格。</p>
											<div class="boxImg">
												<c:if test="${not empty usersInfo.headPic}">
													<img id="avatar" name="avatar" src="${imagedomainpublic}${usersInfo.headPic}" width="190" height="190" />

												</c:if>
												<c:if test="${empty usersInfo.headPic}">
													<img id="avatar" name="avatar" src="${css_imagedomain}/front/images/head.png" width="190" height="190" />
												</c:if>
											</div>
											<input id="subBtn2" type="button" class="btn" value="上&nbsp;&nbsp;传" />
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 图片上传 -->
					<script type="text/javascript" src="${css_imagedomain}/common/jqueryfileupload/js/vendor/jquery.ui.widget.js"></script>
					<script type="text/javascript" src="${css_imagedomain}/common/jqueryfileupload/js/jquery.iframe-transport.js"></script>
					<script type="text/javascript" src="${css_imagedomain}/common/jqueryfileupload/js/jquery.fileupload.js"></script>
					<script type="text/javascript" src="${css_imagedomain}/common/js/common.js"></script>
					<script type="text/javascript">
						$('.fileupload').fileupload({
							url : getUploadFullUrl("${upload_pic_path}","image"),
							forceIframeTransport : true,
							singleFileUploads : true,
							maxFileSize : 500000,//最大文件尺寸
							acceptFileTypes : /(\.|\/)(jpeg|jpg|png|gif|bmp)$/i,//文件上传类型正则
							dataType : 'json',//返回数据类型“json”
							messages : {//错误信息提示
								acceptFileTypes : '上传图片类型不正确',
								maxFileSize : '上传图片过大超过500KB',
								minFileSize : '上传图片太小'
							},

							done : function(e, data) {
								if (data.result.result == 'E') {
									alert(data.result.msg);
								} else {
									$("#headPic").val(data.result.data.savePath);
									$("#avatar").attr("src","${imagedomain}"+data.result.data.savePath);
								}
							}
						});
						
						$("#subBtn2").click(
							function(){
								$.ajax({
						  			type: "POST",
									url: '${project_name}/user/customer/editPAvatar',
									data: $("#avatarForm").serialize(),
									dataType:'json',
									success:function(data){
										if("success" == data.result){
											alert("头像上传成功");
											window.location.href="${project_name}/user/customer/toPersonal";
										}else if("error" == data.result){
											alert("请选择上传的图片");
										}
									}
						  		})
							}		
						)
						
					</script>
					<div class="ownBasic" <c:if test="${tag=='4'}">style="display:block;"</c:if>>
						<form id="receiverForm" name="receiverForm" action="editUsersAddress" method="post">
						<input type="hidden" id="addressId" name="addressId" value="${addressInfo.id}" />
							 <div class="ownAdd">
								<span>所在地区</span>
								<select id="area4" name="area4"  class="pro" onchange="addressArea(2);">
									<option value="">请选择省</option>
									<c:if test="${not empty area3 }">
									<c:forEach var="area" items="${area3}" varStatus="status">
									<option value="${area.id }" <c:if test="${area.id == addressParentArea.parentId }">selected="selected"</c:if> >${area.areaName }</option>
									</c:forEach>
									</c:if>
								</select>
								<select id="area5" name="area5" class="pro" onchange="addressArea(3);">
									<option value="">全部</option>
									<c:if test="${not empty area4 }">
									<c:forEach var="area" items="${area4}" varStatus="status">
									<option value="${area.id }" <c:if test="${area.id == addressArea.parentId }">selected="selected"</c:if> >${area.areaName }</option>
									</c:forEach>
									</c:if>
								</select>
								<select id="area6" name="area6" class="pro"  >
									<option value="">全部</option>
									<c:if test="${not empty area5 }">
									<c:forEach var="area" items="${area5}" varStatus="status">
									<option value="${area.id }" <c:if test="${area.id == addressArea.id }">selected="selected"</c:if> >${area.areaName }</option>
									</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="ownDet">
								<span>详细地址</span>
								<input id="address" name="address" type="text" value="${addressInfo.addr}" />
								<strong>详细地址不需要重复填写省市区</strong>
							</div>
							<div class="ownZit">
								<span>邮政编码</span>
								<input id="number" name="number" type="text" value="${addressInfo.post}" validate="{isZipCode:true,messages:{isZipCode:'请输入正确邮政编码'}}"  />
							</div>
							<div class="ownName">
								<span>收货人姓名</span>
								<input id="receiver" name="receiver" type="text" value="${addressInfo.realname}" />
							</div>
							<div class="ownPhone">
								<span>收货人手机号</span>
								<input id="receiverPhone" name="receiverPhone" type="text" value="${addressInfo.tel }" validate="{isMobile:true,messages:{isMobile:'请输入正确手机号'}}" />
								<b></b>
							</div>
						   <input id="subBtn3" type="button" value="保存" class="ownSub fz18" />
						</form>
					</div>
				</div>
			</div>
        </div>
    
    </div>

</div>
<script type="text/javascript">
  $(function () { 
	    $.ms_DatePicker({ 
	            YearSelector: "#sel_year", 
	            MonthSelector: "#sel_month", 
	            DaySelector: "#sel_day" 
	    }); 
	});
  //表单提交基本信息
  $(document).ready(function(){
		/*登录验证模板*/
		$.metadata.setType("attr", "validate");
		$("#basicForm").validate({
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
			 if($("#basicForm").valid()&&introductionLength()==true&&validatePassword()&&validateUsername()&&hasP()){
				$("#basicForm").submit();				
			} 
		};
		//判断用户登陆密码是否正确
		function validatePassword(){
			var issetname = $("#issetname").val();
			if(issetname == 1){
				var password = $("#password").val();
				var url = "${project_name}/user/customer/validatePassword";
				var ref=true;
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       data:"password="+password,
				       cache:false, 
				       async:false,  
				       success: function(data){
				    	   if(data=="errorOldW"){
				    		    /* $("#password").siblings('i').html("<font color=red></font>");
								$("#password").siblings('i').show();  */
								alert("密码输入错误");
								ref=false;
							}else{
								 /* $("#code").siblings('i').hide();  */
								ref=true;
							}
				       } 
					});
				return ref;
			}
			return true;
		}
		
		//判断手机号是否已存在
		function hasP(){
			var issetname = $("#issetname").val();
			if(issetname == 1){
				var phone = $("#naneText").val();
				var id = $("#id").val();
				var url = "${project_name}/hasP.do?phone="+phone+"&id="+id;
				var ref=true;
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       cache:false, 
				       async:false,  
				       success: function(data){
				    	   if(data=="error"){
								alert("用户名已经存在");
								ref=false;
							}else{
								ref=true;
							}
				       } 
					});
				return ref;
			}
			return true;
		}
		//判断用户名是否已存在
		 function hasU(){
			var issetname = $("#issetname").val();
			if(issetname == 1){
				var USERNAME = $("#naneText").val();
				var url = "${project_name}/hasU.do?username="+USERNAME;
				var ref = true;
				$.ajax({
					type: "post",
					url: url,
					cache:false,
					async:false,
					success: function(data){
						if(data=="error"){
							$("#phone").siblings('i').html("<font color=red>手机号已被注册</font>");
							$("#phone").siblings('i').show();
							ref=false;
						}else{
							$("#phone").siblings('i').hide();
							ref=true;
						}
					}
				});
				return ref;
			}
			return true;
		}
		//前端判断用户名是否存在
		function validateUsername(){
			var issetname = $("#issetname").val();
			if(issetname == 1){
				var username = $("#naneText").val();
				var url = "${project_name}/user/customer/validateUsername";
				var ref=true;
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       data:"username="+username,
				       cache:false, 
				       async:false,  
				       success: function(data){
				    	   if(data=="error"){
				    		    /* $("#password").siblings('i').html("<font color=red></font>");
								$("#password").siblings('i').show();  */
								alert("用户名已经存在");
								ref=false;
							}else{
								 /* $("#code").siblings('i').hide();  */
								ref=true;
							}
				       } 
				});
				return ref;
			}
			return true;
		}
		
		$.metadata.setType("attr", "validate");
		$("#infoForm").validate({
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
		document.getElementById("subBtn1").onclick = function(){
			if($("#infoForm").valid()){
				$("#infoForm").submit();				
			}
		};
		
		$.metadata.setType("attr", "validate");
		$("#receiverForm").validate({
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
		document.getElementById("subBtn3").onclick = function(){
			if($("#receiverForm").valid()){
				$("#receiverForm").submit();				
			}
		};
	});
	//下拉列表级联查询
	function changeArea(areaId){			
		$.ajax({
			type: "POST",
			url: 'changeArea',
	    	data: {areaId:areaId,parentId:$("#area"+(areaId-1)).val()},
			dataType:'json',
			cache: false,
			success: function(data){
				$("#area"+areaId).empty();
				var o = $("<option>").val("").text("全部");
				$("#area"+areaId).append(o);
				if(data.area!=null){
					for(var area in data.area){
						var option = $("<option>").val(data.area[area].id).text(data.area[area].areaName);
						$("#area"+areaId).append(option);
					}
				}
			}
		});
	}
	//下拉列表级联查询
	function addressArea(areaId){			
		$.ajax({
			type: "POST",
			url: 'changeArea',
	    	data: {areaId:areaId,parentId:$("#area"+(areaId+2)).val()},
			dataType:'json',
			cache: false,
			success: function(data){
				$("#area"+(areaId+3)).empty();
				var o = $("<option>").val("").text("全部");
				$("#area"+(areaId+3)).append(o);
				if(data.area!=null){
					for(var area in data.area){
						var option = $("<option>").val(data.area[area].id).text(data.area[area].areaName);
						$("#area"+(areaId+3)).append(option);
					}
				}
			}
		});
	}
	
	function introductionLength(){
		var len=$("#introduction").val().length;
		var res = true;
		if(len>600){
			$("#intr_b").show();
			res = false;
		}else{
			$("#intr_b").hide();
		}
		return res;
	}
  </script>
<!--个人资料 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>