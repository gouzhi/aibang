<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>绑定银行 - 华金所</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
  <link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
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
	});
});
</script>
</head> 
 
<body>
<div class="maskName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if> ></div>
<div class="boxName" <c:if test="${result == 'success' }">style="display:block;"</c:if><c:if test="${result != 'success' }">style="display:none;"</c:if> >
    <span class="Close">x</span>
	<p>银行卡已绑定</p>
    <a href="toSafe">返回账户安全</a>   
</div>  
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--修改密码-->
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
        <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
        <span><a href="/user/customer/toSafe" style="font-size: 14px;color:#777;">账户安全</a></span>
        <i> > </i>
        <span><a href="javascript:;" style="font-size: 14px;color:#777;">银行卡绑定</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
		<div class="bind">
        	<h3>绑定银行卡</h3>
            <div class="bindName">
            	<div class="nameId">
                	<p>持卡人：<span>${name }</span></p>
                    <p>持卡人身份证号：<span>${cardId }</span></p>
                    <div class="already">已绑定银行账号：<span>${bankName }（尾号<b>${account }</b>）</span></div>
                </div>
                
                <form class="formCard" id="bankForm" name="bankForm" action="editBank" method="post">
                	<label>
                    	<span>新银行卡号：</span>
                        <input id="cardId" name="cardId" type="text" value="" class="cardId" validate="{required:true,isBankCard:true,messages:{required:'请输入银行卡号'}}" />
                        <i style="display:none;padding-left:21px;">该银行卡号已被绑定</i>
                    </label>
                    
                     <label class="newBank">
                    	<span>所属银行：</span>
                       	<select id="bankId" name="bankId" class="pro" validate="{required:true,messages:{required:'请选择银行'}}">
                        	<option value="">请选择银行</option>
                            <c:if test="${not empty bankList }">
                            	<c:forEach var="bank" items="${bankList}" varStatus="status">
                            		<option value="${bank.id }">${bank.bankName }</option>
                            	</c:forEach>
                            </c:if>                           
                        </select>
                    </label>
                    <label>
                    	<span>开户行：</span>
                        <select id="area1" name="area1"  class="pro" onchange="changeArea(2);" validate="{required:true,messages:{required:'请选择省市'}}">
                        	<option value="">请选择省市</option>
                        	<c:if test="${not empty areaList }">
                        		<c:forEach var="area" items="${areaList}" varStatus="status">
                        		<option value="${area.id }">${area.areaName }</option>
                        		</c:forEach>
                        	</c:if>
                        </select>
                         <select id="area2" name="area2" class="pro" onchange="changeArea(3);" validate="{required:true,messages:{required:'请选择市'}}">
                        	<option value="">全部</option>
                        </select>
                        <select id="area3" name="area3" class="pro"  >
                        	<option value="">全部</option>
                        </select>
                    </label>
                    <label>
                    	<span>交易密码：</span>
                        <input id="payPass" name="payPass" type="password" value="" class="pas" validate="{required:true,messages:{required:'请输入交易密码'}}" />
                    </label>                  
                    <label class="formVer">
                        <span class="fz14">手机验证码：</span>
                        <input type="hidden" id="phone" name="phone" value="${phone}" />
                        <input id="code" name="code" type="text" value="" validate="{required:true,messages:{required:'请输入验证码'}}" />
                        <input type="hidden" id="smscode" name="smscode" value="" />
                        <span><strong class="formVerBut fz14" id="getcode" style="cursor:pointer;" onclick="getSmscode();">获取验证码</strong>
                        <strong class="time fz13" id="regetcode" ><i>120</i>秒后重新获取</strong></span>
                        <b></b>
                        <i  style="display:none;padding-left:21px;">手机验证码不正确</i>
                    </label>
                    <!-- <label>
                    	<input type="checkbox" class="check" />
                        <b>将此卡设置为默认取现卡</b>
                    </label> -->
                    <input id="subBtn" type="button" value="确定" class="formCard-sub" />   
                </form>
            </div>
        </div>
    
    </div>
		<script type="text/javascript">			
		$(document).ready(function(){
			$('.formVerBut').on("click",validateTimeOver);
			/*登录验证模板*/
			$.metadata.setType("attr", "validate");
			$("#bankForm").validate({
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
				if($("#bankForm").valid()){
					if(!hasB()){
						return false;
					}else if(!vPhoneCode()){
						return false;
					}else{
						$("#bankForm").submit();
					}
				}
			}
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
		var InterValObj; //timer变量，控制时间  
		var count = 120; //间隔函数，1秒执行  
		var curCount;//当前剩余秒数  
		var code = ""; //验证码  
		var codeLength = 6;//验证码长度
		//得到手机验证码
		function getSmscode(){
			
				curCount = count;
				var phone = $("#phone").val();
				var url = "${project_name}/smscode/regist";
				$("#getcode").hide();
				$("#regetcode").show();
				$("#regetcode").html(curCount+"秒后重新获取");
				InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒执行一次
				$.ajax({ 
					   type: "post", 
				       url: url, 
				       cache:false, 
				       dataType: "text",
				       data:"phone="+phone,
				       success: function(data){
				    	   if(data===0){
								alert("发送失败");
								window.clearInterval(InterValObj);// 停止计时器
								$("#regetcode").hide();
								$("#getcode").show();
								return false;
							}else{
								$("#smscode").val(data);
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
		        $("#regetcode").html(curCount+"秒后重新获取");  
		    }  
		}
		//判断银行卡是否存在
		function hasB(){
			var account = $("#cardId").val();
			var url = "${project_name}/hasB.do?account="+account;
			var ref = true;
			$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false,  
		       success: function(data){
		    	   if(data=="error"){
						$("#cardId").siblings('i').html("<font color=red>该银行卡号已被绑定</font>");
						$("#cardId").siblings('i').show();
						$("#cardId").focus();
						ref=false;
					}else{
						$("#cardId").siblings('i').hide();
						ref=true;
					}
		       } 
			});
			return ref;
		}
		
		//验证手机验证码
		function vPhoneCode(){
			var phone = $("#phone").val();
			var code = $("#code").val();
			var url = "${project_name}/vphonecode?t=reg&ph="+phone+"&co="+code;
			var ref=true;
			$.ajax({ 
				   type: "post", 
			       url: url, 
			       cache:false, 
			       async:false,  
			       success: function(data){
			    	   if(data=="error"){
			    		   $("#code").siblings('i').html("<font color=red>手机验证码不正确</font>");
							$("#code").siblings('i').show();
							ref=false;
						}else{
							$("#code").siblings('i').hide();
							ref=true;
						}
			       } 
				});
			return ref;
		}
		</script>
</div>
<!--修改密码 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>