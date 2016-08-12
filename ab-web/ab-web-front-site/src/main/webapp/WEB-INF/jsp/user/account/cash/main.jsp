<%--
  Created by IntelliJ IDEA.
  User: zhaoyu
  Date: 2015/9/17
  Time: 12:44
  To change this template use File | Settings | File Templates.
  提现界面
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
<base href="${project_name}/">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>提现 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${css_imagedomain}/front/js/jquery.tips.js"></script>
  <style type="text/css">
  #regetcode{display:inline-block;width:108px;height:42px;line-height:42px;text-align:center;border:1px solid #d2d2d2;background:#eee;font-size:16px;color:#6b6b6b;}
  </style>
</head>

<body style="background: #e8e8e8;">
<!--header Start-->
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--header End-->
<!--提现主体-->
<div class="accountContent clear">
  <div id="nav_point" class="icoPoint">
    <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
    <i> &gt; </i>
	  <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金记录</a></span>
    <i> &gt; </i>
    <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金明细</a></span>
    <i> &gt; </i>
    <span>提现</span>
  </div>
  <%@ include file="/WEB-INF/jsp/common/left.jsp"%>
  <div class="account-Right fl">
    <div class="cash">
      <h3>提现</h3>
      <div class="cashform">
        <form id="formcash" action="${project_name}/user/cash/outcash" method="post" target="_blank">
           <div class="txbank">
				<p class="icdPtit">提现银行卡：</p>
				<div class="icdCar">
					<p class="icdP">
						<img src="${css_imagedomain}/front/images/bank/${bankId}.gif" width="156" height="40" />
						<span>**** **** **** ${fn:substring(cardId,cardId.length()-4,cardId.length())}</span>
						<span>${userNameabbr}**</span>
					</p>
				</div>
            </div>
          <p class="surplus">可提现余额：<span id="avilableAmount">${userBase.avlBalance}</span>元</p>
          <label>
            <%--<span>提现金额：</span>--%>
            <input type="text" value="${amount}" name="amount" onchange="cashAmountlimit()" placeholder="请输入提现金额" id="amount" validate="{required:true,isRightCashAmount:true,isZeroAmountCash:true,isBigAmountCash:true,isLittleAmountCash:true,isBigAmountCash:true,messages:{required:'请输入金额'}}"/>
            <strong class="time fz13" id="refreshamonut"  style="padding: 8px; display: none;position:absolute;width:202px; background-color:white;font-weight:normal;color:red;margin-top:-8px;">低于1000元的金额每月限两笔，请输入大于或等于1000的金额</strong>
          </label>
          <label class="pr">
            <%--<span>验证码：</span>--%>
            <input type="text" value="" name="verifyCode" class="verifyInp" id="verifyCode" onchange="cashveryCode()" />
            <img src="${project_name}/code/cash" width="85" height="34" id="vcode"/>
			  <a href="javascript:void(0);" onclick="changeCode();" id="shuaxin"></a>
			  <strong class="time fz13" id="refreshcode"  style="padding: 8px; display: none; font-weight:normal;background-color:white;color:red;">请输入正确的验证码</strong>
          </label>
          <label class="formVer pr">
            <%--<span>手机验证码：</span>--%>
			  <b class="pa poneLock"></b>
            <input type="text" value="" name="smsCode" class="verifyInp" id="smsCode" onchange="smspnoneCode()" placeholder="手机验证码" />
            <strong class="formVerBut fz14" onclick="getSmscode();" id="getcode">获取验证码</strong>
            <strong id="regetcode" style="display:none;"><i>120</i>秒</strong>
            <strong class="time fz13" id="refreshphonecode"  style="padding: 8px; display: none; font-weight:normal;background-color:white;color:red;">请输入正确的验证码</strong>
            <strong class="time fz13" id="overtimephonecode"  style="padding: 8px; display: none; font-weight:normal;background-color:white;color:red;">验证码已失效请重新发送</strong>
            <b></b>
          </label>
          <span class="cashTip"></span>
             <input type="button" value="提交" class="cashSub"/> 
                  
        </form>
        <div class="wxts">
            	<dl>
                    <dt><i></i>温馨提示</dd>
                    <dd>目前，提现手续费由华金所支付，用户可免费提现。</dd>
                    <dd>提现免费标准：低于1000元的金额每月限两笔，大于或等于1000元的金额无限制。</dd>
                    <dd>用户可对账户余额发起提现申请，资金提现申请后，需待第三方支付“汇付天下”确认成功（国家法定节假日汇付天下提现业务或许暂停），预计之后48小时以内转至您的提现银行卡账户，具体到账时间点依据提现银行不同而有所差异。</dd>
                    <dd>如提现过程遇到问题，请联系客服400-826-5000。</dd>
                </dl>
        </div>    
      </div>
    </div>
  </div>

</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
<input type="hidden" value="${project_name}" id="projectName"/>
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
<script type="text/javascript" src="${css_imagedomain}/front/js/fund.js"></script>
<script type="text/javascript">
  /**
   * 页面验证 jquery validator
   */
  $(document).ready(function(){
	  
	$('.formVerBut').on("click",validateTimeOver);
    $.metadata.setType("attr", "validate");
    $("#formcash").validate({
      onfocusout:true,
      onclick:false,
      onkeyup: function(element) { $(element).valid(); },
      errorElement: "em",//用来创建错误提示信息标签(可自定义)
      errorContainer: $("#warning, #summary"),
      errorPlacement: function(error, element) {
        error.appendTo(element.parent());
      }
    });
  });
  /**
  *换一张验证码
  */
  function changeCode() {
		$("#vcode").attr("src", "code/cash?t=" + genTimestamp());
	}
  function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
  $(".cashSub").on("click", function () {
	  
	    $("#refreshamonut").hide();
	  // 提现输入框验证
	    if(!$("#formcash").valid()){
	        return;
	    }
	    //金额
	    var amount = $("#amount").val();
	    //验证码
	    var verifyCode = $("#verifyCode").val();
	    //手机短信
	    var smsCode = $("#smsCode").val();
	
	    var url = "${project_name}/user/cash/cash.do";
    		$.ajax({ 
    			   type: "post", 
    		       url: url, 
    		       cache:false,
    		       async:false,
    		       dataType: "text",
    		       data:"amount="+amount+"&verifyCode="+verifyCode+"&smsCode="+smsCode,
    		       success:function(data){
    		    	   var $cashTip = $(".cashTip");
    		    	   if(data==1){
    		    		//alert("参数错误");
    		    		$("#amount").tips({
							side : 2,
							msg : "参数错误",
							bg : '#FF5080',
							time : 15
						});
    		    		changeCode();
    					return false;
    					}
    		    	   if(data==2){
    		    		 //alert("验证码错误");
    		    		
    		    		 $("#refreshcode").show();
    		    		
    		    		 $("#verifyCode").val("");
    		    		 changeCode();
       					return false;
       					}
    		    	   if(data==4){
    		    		   $("#refreshphonecode").show();
    		    		    $("#smsCode").val("");
    		    		    changeCode();
    		    		    windows.location.reload();
							return false;
       					
       				   }
    		    	   if(data==0){
    		    		   $("#refreshcode").hide();
    		    		   $("#refreshphonecode").hide();
    		    		   changeCode();
    		    		   $("#formcash").submit(); 
         			    }
    		       } 
    			});
  });
    var InterValObj; //timer变量，控制时间  
	var count = 120; //间隔函数，1秒执行  
	var curCount;//当前剩余秒数  
	var code = ""; //验证码  
	var codeLength = 6;//验证码长度
    /*
               获取手机验证码
    */
    function getSmscode(){
			curCount = count;
			var url = "${project_name}/user/cash/getsmscode";
			var code = $("#verifyCode").val();				
			InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
			$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       dataType: "text",
			       data:"code="+code,
			       success: function(data){
			    	   if(data===0){
							alert("发送手机验证码失败");
							window.clearInterval(InterValObj);// 停止计时器
							$("#regetcode").hide();
							$("#getcode").show();
							return false;
						}else if(data==-1){
						
							window.clearInterval(InterValObj);// 停止计时器
						
							$("#getcode").show();
							return false;
						}else{
						
							$("#getcode").hide();
							$("#regetcode").attr("class","showtime fz13");
							$("#regetcode").css('display','inline-block');
							$("#regetcode").html(curCount+"秒");
						}
			       } 
				});
	
    	
    }
  //timer处理函数  
	function SetRemainTime() {
	    if (curCount == 0) {                  
	        window.clearInterval(InterValObj);// 停止计时器    
	        $("#regetcode").hide();
			$("#getcode").show();    
	    }else {  
	        curCount--;  
	        $("#regetcode").html(curCount+"秒");
	    }  
	}  
	  /*
     * 校验手机验证码
     */
     function smspnoneCode(){
    	var smsCode=$("#smsCode").val();	
 
  		var url = "${project_name}/user/cash/smspnoneCode.do";
  		$.ajax({ 
  			   type: "post", 
  		       url: url, 
  		       cache:false,
  		       async:false,
  		       dataType: "text",
  		       data:"smsCode="+smsCode,
  		       success:function(data){
  		    	   if(data=="1"){
  		    		   $("#refreshphonecode").show();
  					    $("#smsCode").val("");
						$("#smsCode").focus();
						changeCode();
  					    return false;
  					}
  		    	   if(data=="2"){
  		    		 $("#smsCode").tips({
							side : 2,
							msg : "发送手机验证码失败",
							bg : '#FF5080',
							time : 15
						}); 
  		    		 $("#smsCode").val("");
  					 $("#smsCode").focus();
  					changeCode();
  					 return false;
  		    	   }
  		    	 $("#refreshphonecode").hide();
  		       } 
  			});
	  }
   
      /**
     * 提现验证码验证
     */
    function  cashveryCode(){
    	 var verifyCode=$("#verifyCode").val();	
    	 
    		var url = "${project_name}/user/cash/verycode.do";
    		$.ajax({ 
    			   type: "post", 
    		       url: url, 
    		       cache:false,
    		       async:false,
    		       dataType: "text",
    		       data:"verifyCode="+verifyCode,
    		       success:function(data){
    		    	   if(data==2){
    		    		$("#refreshcode").show();
					
    					$("#verifyCode").val("");
						$("#verifyCode").focus();
    					return false;
    					}
    		    	   $("#refreshcode").hide();
    		       } 
    			});
    	
    }
    /**
     * 提现金额验证
     */
    function cashAmountlimit(){
    	    var amount=$("#amount").val();	
    	    
    		var url = "${project_name}/user/cash/cashAmountlimit.do";
    		$.ajax({ 
    			   type: "post", 
    		       url: url, 
    		       cache:false,
    		       async:false,
    		       dataType: "text",
    		       data:"amount="+amount,
    		       success:function(data){
    		    	   if(data=="0"){
    		    		   $("#refreshamonut").show();
    							
    					$("#amount").val("");
						$("#amount").focus();
    					return false;
    					}
    		    	   $("#refreshamonut").hide();
    		       } 
    			});
    	
    }
</script>
</body>
</html>