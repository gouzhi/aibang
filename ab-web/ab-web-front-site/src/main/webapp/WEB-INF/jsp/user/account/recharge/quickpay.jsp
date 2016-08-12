<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

 <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
 <link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />

<title>充值</title>


<!--<link href="css/index.css" rel="stylesheet" type="text/css" />-->

<!--<script language="javascript" type="text/javascript" src="${css_imagedomain}/front/My97DatePicker/WdatePicker.js"></script>-->
	
</head> 

<body style="background: #e8e8e8;">
<%-- <div class="RechargeMask" style="display:none;"></div>
<div class="Recharge" style="display:none;">
	<h3 class="color5 pr">充值提示<i class="off fz18 pa">x</i></h3>
	<p class="color5 tit">请在新打开的页面完成充值后选择：</p>
    <div class="fenlie clear">
    	<div class="yes fl">
        	<p class="color5 cg">充值成功</p>
            <p class="color5"><a href="${project_name}/user/center/accountlist" class="okA">查看资金明细</a></p>
        </div>
        <div class="no fl">
        	<p class="color5 shibai">充值失败</p>
            <p class="color5"><a href="main" class="retA">重新充值</a></p>
        </div>
    </div>
</div> --%>
<div class="bindingMask" style="display:none;"></div>
<div class="limit" style="display:none">
	<h3 class="color5 pr">充值限额<i class="off fz18 pa">x</i></h3>
	<table class="tab">
    	<tbody>
            <tr>
              	<th width="216">银行名称</th>
              	<th width="216">单笔限额</th>
              	<th width="216">单卡单日累计限额</th>
            </tr>
            <tr>
              	<td width="216">光大银行</td>
                <td width="216">5万元</td>
              	<td width="216">50万元</td>
            </tr>
            <tr>
              	<td width="216">建设银行</td>
                <td width="216">50万元</td>
              	<td width="216">50万元</td>
            </tr>
            <tr>
              	<td width="216">农业银行</td>
                <td width="216">5万元</td>
              	<td width="216">10万元</td>
            </tr>
            <tr>
              	<td width="216">平安银行（含深发）</td>
                <td width="216">5000元</td>
              	<td width="216">5000元</td>
            </tr>
            <tr>
              	<td width="216">浦发银行</td>
                <td width="216">5000元</td>
              	<td width="216">5000元</td>
            </tr>
            <tr>
              	<td width="216">上海银行</td>
                <td width="216">5000元</td>
              	<td width="216">5万元</td>
            </tr>
            <tr>
              	<td width="216">兴业银行</td>
                <td width="216">5万元</td>
              	<td width="216">5万元</td>
            </tr>
            <tr>
              	<td width="216">邮储银行</td>
                <td width="216">5000元</td>
              	<td width="216">5000元</td>
            </tr>
            <tr>
              	<td width="216">中信银行</td>
                <td width="216">50万元</td>
              	<td width="216">50万元</td>
            </tr>
            <tr>
              	<td width="216">中国银行</td>
                <td width="216">5万元</td>
              	<td width="216">50万元</td>
            </tr>
            <tr>
              	<td width="216">渤海银行</td>
                <td width="216">50万元</td>
              	<td width="216">50万元</td>
            </tr>
            <tr>
                <td width="216">工商银行</td>
                <td width="216">5万元</td>
                <td width="216">5万元</td>
            </tr>
        </tbody>
    </table>
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
            	<span onclick="internetRecharge()">网上银行</span> 
                <span class="rechargeSpan">快捷支付</span>
                <!--<span>快捷支付</span>-->
            </div >
            <div class="rechargeList">
            <form id="form2" action="recharge" method="post" target="_blank">
            <input type="hidden" name="gateBusiId" value="QP"/>
            <input type="hidden" name="bank" value=""/>
                <script>
                    $(function(){
                        $('.rechargeUl label').click(function(){
                            $('.rechargeUl label').removeClass('active');
                            $(this).addClass('active');
                        });

                    });

                </script>
				<ul class="rechargeUl" style="display:block;border-top:1px solid #d2d2d2;">
                	<li >
                        <h5><i></i><span>为了您的资金安全，绑定快捷卡后，该卡同时成为您唯一取现卡。如需解绑快捷卡，请在绑定后7天登录：<a href="https://c.chinapnr.com/p2puser/ " target="_blank" >https://c.chinapnr.com/p2puser/ </a>  操作。
如有疑问，请联系华金所客服：400-826-5000。
</span></h5>
                    </li>
                    
                	<li id="li1" style="border-top:none;padding: 0 0 14px 0;">
                    	<label class="active">
                        	<%--<input type="hidden" name="bank" value="CEB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CEB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="CCB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CCB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="ABC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/ABC.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="PINGAN"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/PINGAN.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="SPDB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/SPDB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="BOS"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/BOS.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="CITIC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CITIC.gif" width="156" height="40" />
                        </label>
                         <label>
                        	<%--<input type="hidden" name="bank" value="CBHB"/>--%>
                        	<img src="${css_imagedomain}/front/images/bank/CBHB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="CIB"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/CIB.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="PSBC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/PSBC.gif" width="156" height="40" />
                        </label>
                        <label>
                        	<%--<input type="hidden" name="bank" value="BOC"/>--%>
                            <img src="${css_imagedomain}/front/images/bank/BOC.gif" width="156" height="40" />
                        </label>
                        <label>
                            <img src="${css_imagedomain}/front/images/bank/ICBC.gif" width="156" height="40" />
                        </label>
                    </li>
                   
                   
                    <li style="border-top:1px solid #e8e8e8; padding-top: 10px;">
                            <div><span>可用余额：</span><b>${userBase.avlBalance}</b>元</div>
                            <p class="pr">
                                <span>充值金额：</span>
                                <input type="text" name="amount" value="" placeholder="请输入充值金额"  />
                                <input type="button" value="充值" class="rechargeSub" />
                                <a href="#" id="quota">支付限额</a>
                                <em id="validate1" value=""></em>
                            </p>
                        <script>
                            $('#quota').click(function(){
                                $('.limit').show();
                                $('.bindingMask').show();
                            });
                            $('.off').click(function(){
                                $('.limit').hide();
                                $('.bindingMask').hide();
                            });
                        </script>

                    </li>
                    <li>
                    	<dl>
                        	<dd><i></i>温馨提示</dd>
                            <dt>充值过程免费，无任何手续费。</dt>
                            <dt>为保证您的资金安全，资金帐户由汇付天下进行第三方托管。</dt>
                            <dt>只能绑定一张银行卡作为快捷卡，且只可以提现到该快捷卡，一经绑定，其余提现银行卡自动解绑。</dt>
                            <dt>为了您的资金安全，更换快捷卡需求人工审核，请选择常用的银行卡为快捷卡。</dt>
                            <dt> 快捷支付服务由汇付天下支付提供。</dt>
                            <dt>如遇到问题，请联系客服 400-826-5000。</dt>
                        </dl>
                    </li>
                </ul>
           </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
<script>
$(function(){
	$('.rechargeSub').click(function(){
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
		    
		    $('#form2').submit(); 
		    $("#validate1").html("");
});
});
function internetRecharge(){
	location.href="main?a="+Math.random();
}

</script>		