<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>确认账号 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/retrieve.css" rel="stylesheet" />
	  <link href="${css_imagedomain}/front/css/commen_new.css" rel="stylesheet" />
  <!-- 表单验证 -->
  <link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
  <script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>

	  <style>
		  /*找回密码*/
		  .process{width:1100px;margin:0 auto 70px;border-bottom:1px solid #d2d2d2;height:66px;padding-top: 26px;}
		  .processSpan{height:64px;line-height:64px;margin-left:150px;}
		  .processSpan span{ display:inline-block;height:64px;line-height:64px;padding:0 10px 0 44px;font-size:20px;color:#ababab;}
		  .processSpan span.sp1{ background:url(${css_imagedomain}/front/images/ico_01.png) no-repeat 8px center;border-bottom:2px solid #f27267;}
		  .processSpan span.sp2{ background:url(${css_imagedomain}/front/images/ico_2.png) no-repeat 8px center;}
		  .processSpan span.sp3{ background:url(${css_imagedomain}/front/images/ico_3.png) no-repeat 8px center;}
		  .processSpan span.sp4{ background:url(${css_imagedomain}/front/images/ico_4.png) no-repeat 8px center;}
		  .processSpan i{ display:inline-block;width:7px;height:12px; background:url(${css_imagedomain}/front/images/ico_next.png) no-repeat 0 center; margin:0 32px;}
		  .processSpan span.activeS{color:#494646;}

		  .backName input{background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 8px 6px;}
		  .yzInput{background:url(${css_imagedomain}/front/images/spirits.png) no-repeat 8px -48px;}
		  #codeImg{position:absolute;left:158px;top:7px;}
		  #shuaxin{ position:absolute;width:44px;height:28px;background:url(${css_imagedomain}/front/images/sx.png) no-repeat center center;border-left: 1px solid #d2d2d2;left:254px;top:8px;}
		  #shuaxin:hover{background:url(${css_imagedomain}/front/images/sx2.png) no-repeat center center;}
		   .icp{font-size:14px;color:#9d9c9c;}
		  .icp:hover{color:#c2c2c2;}
	  </style>

</head> 
 
<body> 
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--找回密码-->
<div class="ownContent">
	<div class="own">
        <div class="ownRight">

			<div class="process">
				<div class="processSpan">
					<span class="sp1 activeS">确认账号</span>
					<i></i>
					<span class="sp2">安全验证</span>
					<i></i>
					<span class="sp3">重置密码</span>
					<i></i>
					<span class="sp4">完成</span>
				</div>
			</div>

        	<p style="font-size:16px;color:#494646;text-align:left;margin-left: 450px; margin-bottom:15px;">请填写您需要找回的账号</p>
            <form id="passForm" name="passForm" action="toValidate" method="post">
            	<div class="backName pr">
            		<%--<span class="fz14">账号：</span>--%>
					<label for="name" class="pa iejr"  style="left:48px;top:11px; margin:0;font-size:16px;color:#a6a6a6;cursor:pointer;">手机号/用户名/邮箱</label>
                	<input type="text" value="" name="name" id="name" placeholder="" validate="{required:true,messages:{required:'请输入用户名/手机号/邮箱'}}" />
                    <b>您输入有误！请重新输入</b>
            	</div>
                <div class="yanzheng pr">
                	<%--<span class="fz14">验证码:</span>--%>
						<label for="code" class="pa iejr"  style="left:48px;top:11px; margin:0;font-size:16px;color:#a6a6a6;cursor:pointer;">验证码</label>
                	<input type="text" name="code" id="code" class="yzInput" validate="{required:true,messages:{required:'请输入验证码'}}" placeholder="" />
                	<img  id="codeImg" alt="点击更换" width="85" height="30" title="点击更换" src="" />
                	<a href="javascript:void(0);" onclick="changeCode();" id="shuaxin"></a>
                	<i id="yzm" style="display:none;padding-left:8px;color:#f07a7a;">验证码不正确</i>
                </div>
                <input type="button" id="subBtn" value="下一步" class="backSub" />
            </form>
        </div>
    </div>  	
</div>
<script type="text/javascript">	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
			tishi();
		});
		function tishi(){
			if ($('#name').val() == '') {
				$('#name').prev(".iejr").show();
			}
			else {
				$('#name').prev(".iejr").hide();
			}
			$('#name').focus(function(){
				$(this).parent().find('.iejr').hide();
			})
			$('#name').blur(function(){
				if($(this).val()==''){
					$(this).parent().find('.iejr').show();
				}
				else{
					$(this).parent().find('.iejr').hide();
				}
			});

			if ($('#code').val() == '') {
				$('#code').prev(".iejr").show();
			}
			else {
				$('#code').prev(".iejr").hide();
			}
			$('#code').focus(function(){
				$(this).parent().find('.iejr').hide();
			})
			$('#code').blur(function(){
				if($(this).val()==''){
					$(this).parent().find('.iejr').show();
				}
				else{
					$(this).parent().find('.iejr').hide();
				}
			});


		};
		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "${project_name}/code.do?t=" + genTimestamp());
		}
		
		//验证图片验证码
		function vCode(){
			var code = $("#code").val();
			var url = "${project_name}/vcode?code="+code;
			var ref=true;
			if(code == ""){
				$("#code").siblings('i').html("<font color=red>请输入验证码</font>");
				$("#code").siblings('i').show();
				ref=false;
			}else{
				$.ajax({
					   type: "post",
				       url: url,
				       cache:false,
				       async:false,
				       success: function(data){
				    	   if(data=="error"){
				    		   $("#code").siblings('i').html("<font color=red>验证码不正确</font>");
								$("#code").siblings('i').show();
								ref=false;
							}else{
								$("#code").siblings('i').hide();
								ref=true;
							}
				       }
					});
			}
			return ref;
		}
		
		$(document).ready(function(){
			/*帐号验证*/
			$.metadata.setType("attr", "validate");
			$("#passForm").validate({
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
		//点击提交按钮
		document.getElementById("subBtn").onclick = function(){
			if($("#passForm").valid() && vCode()){
				$("#passForm").submit();							
			}else{
				changeCode();
			}
		}
		</script>
<!--找回密码 End-->
<div style="width:100%; margin:0 auto;height: 50px;line-height: 50px;font-size:14px;color:#9d9c9c; background:#494646;position: fixed;bottom:0px;">
	<p style="width:1200px;margin:0 auto; text-align:center;">Copyright@2016&nbsp;&nbsp;中创共赢（北京）投资有限公司&nbsp;&nbsp;备案号：<a href="#" class="icp">京ICP备16016103号-1</a> </p>
</div>
</body> 
</html>