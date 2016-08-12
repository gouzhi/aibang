<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>华金所</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%> 
		<script type="text/javascript">
		  $(function(){
			  /* 安全验证 */
				$('.safeCon p').click(function(){
					$(this).css('display','none');
					$(this).next().css('display','block');
				})
				$('.safeCon > span').click(function(){
					$(this).next('p').css('display','none');
					$(this).parent().find('ul').css('display','block');
				})
				$('.safeCon ul li').click(function(){
					$(this).parent().css('display','none');
					var vall=$(this).html();
					$(this).parent().prev().html(vall).css('display','block');
					var aa=$('.safeCon p').html();
					if(aa.indexOf("邮箱")>=0||aa.indexOf('身份方式')>=0){
						$('.smsCode').css('display','none');
					}else{
						$('.smsCode').css('display','block');
					}
					
					$("#form_type_id").val("0");
					if(aa.indexOf("邮箱")>=0)
					{
						$("#form_type_id").val("1");
					}
					
					if(aa.indexOf("手机号")>=0)
					{
						$("#form_type_id").val("2");
					}
					
					
				})
		  });
		</script>
		
		<script type="text/javascript">
		var InterValObj; //timer变量，控制时间  
		var count = 60; //间隔函数，1秒执行  
		var curCount;//当前剩余秒数  
		var code = ""; //验证码  
		var codeLength = 6;//验证码长度
		//得到手机验证码
		function getSmscode(){
				curCount = count;
				var uid = $("#userId").val();
				var url = "${project_name}/smscode/passcode";
				$("#code_btn").hide();
				$("#regetcode").show();
				$("#regetcode").html(curCount+"秒后重发");
				InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       cache:false, 
				       dataType: "text",
				       data:"id="+uid,
				       success: function(data){
				    	   if(data==1){
								alert("发送失败");
								window.clearInterval(InterValObj);// 停止计时器
								$("#regetcode").hide();
								$("#code_btn").show();
								return false;
							}else if(data==2){
								alert("每天最多可找回密码5次，您已经超出");
								window.clearInterval(InterValObj);// 停止计时器
								$("#regetcode").hide();
								$("#code_btn").show();
								return false;
							} 
				       } 
					});
		}
		//timer处理函数  
		function SetRemainTime() {
		    if (curCount == 0) {                  
		        window.clearInterval(InterValObj);// 停止计时器    
		        $("#regetcode").hide();
				$("#code_btn").show();    
		    }else {  
		        curCount--;  
		        $("#regetcode").html(curCount+"秒后重发");  
		    }  
		} 
		
		  $(function(){
			  $("#mobile_sub").click(function(){
				  //邮箱
				  if($("#form_type_id").val()=="1")
				  {
					  $("#emailForm").submit();
				  }
				  //手机号
				  if($("#form_type_id").val()=="2")
				  {
					  if($.trim($("#xy").val())=="")
					  {
						 alert("请输入您的短信验证码");
					  }else
					  {
						  $.ajax({
							   type: "POST",
							   url: "${project_name}/phoneValidate",
							   data: $("#phoneForm").serialize(),
							   cache:false, 
							   async: false,
							   dataType:"json", 
							   success: function(data){
								   if(data!="0")
								   {
									   $("#xy").val("");
                                       alert(data);
								   }else
								   {
									   $("#phoneForm").submit();   
								   }
							   }
						  });
						  
						  
					  }
				  }
			  });
		  });
		  
		  
		</script>
	</head>
<body>
<div class="wapOutside whithBg">
  <div class="header "> <a class="arrowLeft" href="javascript:void(0);" id="back"></a>
    <h1>安全验证</h1>
  </div>
  <div class="pLR16">
    <p class="loadTt">为了你的帐号安全，请完成身份验证:</p>
    <div class="smsMB">
	    <div class="safeCon"><span class="arrowDown"></span>
	      <p>
          <label>验证身份</label>
          请选择验证身份方式</p>
	      <ul>
	         <li>
	            <label>验证身份</label>
	            请选择验证身份方式</li>
	        <li><label>手机号</label>${phone}</li>
	        <c:if test="${email ne ''}">
	         <li><label>邮箱</label>${email}</li>
	        </c:if>
	      </ul>
	    </div>
	    <form id="phoneForm" name="phoneForm"  action="${project_name}/resetpage" method="post">
		 <div class="smsCode disNone">
		    <div class="regInput">
	          <label>验证码</label>
	          <input id="userId" name="userId" type="hidden" value="${user.id }" />
			  <input name="code" type="text"  placeholder="请填写验证码" id="xy" validate="{required:true,messages:{required:'请填写验证码'}}" />
	        </div>
	        <div class="regYzm"> 
	          <span  id="code_btn"  style="cursor:pointer;" onclick="getSmscode();">获取验证码</span> <span id="regetcode" class="time"><i>60</i>秒后重发</span><br />
	          <input type="hidden" id="smscode" name="smscode" value="" />
	          <input type="hidden" id="phoneStatus" name="phoneStatus" value="1" />
	          <b style="display:none;">请输入验证码</b> 
	        </div>
		 </div>
	    </form>
	    <form  id="emailForm" name="emailForm" action="${project_name}/sendEmail" method="post">
             <input id="userId" name="userId" type="hidden" value="${user.id }" />
        </form>
	    <input type="hidden" name="form_type" id="form_type_id"  value="0" />
    </div>
    <div class="mobile_sub"><a id="mobile_sub" href="javascript:void(0)">下一步</a></div>
  </div>
</div>
</body>
</html>
