<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta http-equiv="refresh" content="20"> -->
 <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
 <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />

<title>充值</title>


<!--<link href="css/index.css" rel="stylesheet" type="text/css" />-->

<!--<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js"></script>-->
      <style>
          #form1 li{border-top:1px solid #e8e8e8;}
      </style>
<script>
$(function(){
	
	$('#recharge').click(function(){
		
			var bankimgs=$(".active").children('img').attr('src')
			var  bankimg= bankimgs.substring(bankimgs.lastIndexOf("/")+1,bankimgs.length);
			var bankarr = bankimg.split(".gif");
			$("input[name='bank']").val(bankarr[0]);
	
		 $.ajax({
		        type: "post",
		        url: '${project_name}/user/recharge/findUsrCustId',
		        success: function (data) {
		        	  if(data){

		 		  	 }else{
		 		  		 $('.bindingMask').show();	
		 		  		 $('.binding').show();
		 		  		 //$("#usrCustId").val(data);
		 		  		 $('.off').click(function(){
		 		  				$('.bindingMask').hide();	
		 		  				$('.binding').hide();
		 		  				$('.cashMask').hide();
		 		  			}); 
		 		  		 return;
		 		  	 }
		            }
		    }); 

			/* if(!$(':radio[name=bank]:checked').length) {
			    alert('请选择银行');
			    return;
			} */
			  	var isNum = /^\d+(\.\d{0,9})?$/;
			  	var isNum1= /^\d+(\.\d{0,2})?$/;
			  	var isNum2=/^([1-9][\d]{0,7}|0)(\.[\d]{0,2})?$/;
		        var money = $("input[name='amount']").val();
		        
		        if(money<1){
		        	$("#validate1").html("最低充值金额应大于等于 1 元");
		        	//alert("请充值金额大于1");
		        	return;
		        }
		   
		      
		        if(!isNum.test(money)){
		        	$("#validate1").html("请输入正确的金额");
		            //alert("请输入正确的金额");
		            return;
		        } 
		        if(!isNum1.test(money)){
		        	$("#validate1").html("请只保留两位小数");
		        	 //alert("请只保留两位小数");
			            return;
		        }
		        if(!isNum2.test(money)){
		        	$("#validate1").html("请输入金额小于9位");
		            //alert("请输入正确的金额");
		            return;
		        }  
		    
		   
		    $("#validate1").html("");
		  $('#form1').submit();
		
	});

});

function quickPay(){
	location.href="${project_name}/user/recharge/main?quickPay=1&a="+Math.random();
}

</script>			
</head> 

<body style="background: #e8e8e8;">
<div class="bindingMask" style="display:none;"></div>
<div class="binding" style="display:none;">
	<h3 class="color5 pr">提示<span class="off fzw fz18 pa">x</span></h3>
	<p class="color5">您未开通第三方托管账户，<br /><span>请先开通后再进行操作</span></p>
    <a href="${project_name}/user/customer/toActivateName" class="open recharge_open">开通理财账户</a>
</div>

<!--header Start-->
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>

<!--header End-->

<!--充值主体-->
<div class="accountContent clear">
<div id="nav_point" class="icoPoint">
    <span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
    <i> &gt; </i>
    <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金记录</a></span>
    <i> &gt; </i>
    <span><a href="/user/center/accountlist" style="font-size: 14px;color:#777;">资金明细</a></span>
    <i> &gt; </i>
    <span>充值</span>
  </div>
 <%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
		<div class="recharge">
        	<h3>充值</h3>
            <div class="rechargeTab">
            	<span class="rechargeSpan">网上银行</span>
                <span onclick="quickPay()">快捷支付</span>
                <!--<span>快捷支付</span>-->
            </div>
            <div class="rechargeList">
            	<ul class="rechargeUl" style="display:block;">
            	<form id="form1" name="form" action="recharge"  method="post" target="_blank">
            	<input type="hidden" name="gateBusiId" value="B2C"/>
            	<input type="hidden" name="bank" value=""/>
            	
            	<%-- <input type="hidden" name="usrCustId" value="${userId }"/> --%>
            	<%-- <input type="hidden" name="userId" value="${sessionScope.get }"></input> --%>
                    <script>
                        $(function(){
                           $('.rechargeUl label').click(function(){
                               $(this).siblings().removeClass('active');
                               $(this).addClass('active');
                           });

                        });

                    </script>
                	<li style="padding-top: 28px;padding-bottom: 14px;">
                    	<label class="active">
                        	<%--<input type="radio" name="bank" value="ICBC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/ICBC.gif"  width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="radio" name="bank" value="CCB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CCB.gif"  width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="radio" name="bank" value="BOC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/BOC.gif" width="156" height="40" />
                        </label>
                        <label>
                            <img src="${css_imagedomain}/front/images/bank/CITIC.gif" width="156" height="40" />
                        </label>
                        <label>
                            <img src="${css_imagedomain}/front/images/bank/SRCB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="radio" name="bank" value="CMB"/>--%>
                            <img  src="${css_imagedomain}/front/images/bank/CMB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="radio" name="bank" value="CEB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CEB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="radio" name="bank" value="CMBC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CMBC.gif" width="156" height="40" />
                        </label>
                         <label>
                        	<%--<input type="radio" name="bank" value="SPDB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/SPDB.gif" width="156" height="40" />
                        </label>
                         <label>
                        	<%--<input type="radio" name="bank" value="CIB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CIB.gif" width="156" height="40" />
                        </label>
                         <label>
                        	<%--<input type="radio" name="bank" value="PSBC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/PSBC.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="radio" name="bank" value="BOS"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/BOS.gif" width="156" height="40" />
                        </label>

                    </li>
                    <li style="padding-top: 10px;">
                    	
                            <div><span style="width:100px;color:#383838">账户可用余额：</span><b>${userBase.avlBalance}</b>元</div>
                            <p class="pr">
                                <span style="color:#383838">充值金额：</span>
                                <input type="text" name="amount" value="" placeholder="请输入充值金额"  />
                                <input  type="button" id="recharge" value="充&nbsp;值" class="rechargeSub" />
                                <em id="validate1" value=""></em>
                            </p>

                    </li>
                     </form>
                    <li>
                    	<dl>
                        	<dd><i></i>温馨提示</dd>
                            <dt>投资人充值过程全程免费，不收取任何手续费。</dt>
                            <dt>最低充值金额应大于等于 1 元。</dt>
                            <dt>充值/提现必须为银行借记卡，不支持存折、信用卡充值。</dt>
                            <dt>严禁利用充值功能进行信用卡套现、转账、洗钱等行为，一经发现，将封停账号30天。</dt>
                            <dt>充值期间，请勿关闭浏览器，待充值成功并返回首页后，所充资金才能入账，如有疑问，请联系客服。</dt>
                            <dt>充值需开通银行卡网上支付功能，如有疑问请咨询开户行客服。</dt>
                            <dt>如遇到问题，请联系客服 400-826-5000。</dt>
                        </dl>
                    </li>
                </ul>
               
                <!--<ul class="rechargeUl">
                 	<li>
                    	<label>
                        	<input type="radio" name="bank" />
                            <img src="${css_imagedomain}/front/images/cft.jpg" width="130" height="30" />
                        </label>
                        <label>
                        	<input type="radio" name="bank" />
                            <img src="${css_imagedomain}/front/images/zfb.jpg" width="130" height="30" />
                        </label>
                    </li>
                    <li>
                    	<form>
                            <div><span>账户余额：</span><b>0.00</b>元</div>
                            <p>
                                <span>充值金额：</span>
                                <input type="text" value="" placeholder="请输入充值金额"  />
                                <a href="#">充值限额</a>
                            </p>
                            <input type="submit" value="充值" class="rechargeSub" />
                        </form>
                    </li>
                 </ul>-->
            </div>
        </div>
    </div>
</div>
<!--充值主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>

