<%@ page language="java"  pageEncoding="UTF-8"%>
<link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
<div class="bindingMask" style="display:none;"></div>
<div class="binding" style="display:none;">
    <i class="tishi"></i>
    <span class="off pa">x</span>
	<h3><span>提示</span></h3>
	<%--<p class="color5">您未开通第三方托管账户，请先开通后再进行操作。</p>--%>
    <p class="top">您未开通第三方托管账户</p>
    <p class="bot">请先开通后再进行操作</p>
    <a href="${project_name}/user/customer/toActivateName" class="open recharge_open">开通理财账户</a>
</div>
<div class="cashMask" id="bangdingcardId" style="display:none;">
    <i class="tishi"></i>
    <span class="off pa">x</span>
    <h3><span>提示</span></h3>
    <p class="top">您未开通第三方托管账户</p>
    <p class="bot">请先开通后再进行操作</p>
    <a  href="${project_name}/user/customer/toBindBank" class="open recharge_open">绑定银行卡</a>
</div>

<div class="account-Left fl" id="Left_nav">
       <h2 class="accounH">我的账户</h2>
       <ul class="accountList" id="navi">

       	<li class="select mousover">
           	<a href="${project_name}/user/center/accountall" class="accountListA on borT">
                   <i class="icon-dashboard ico1"></i>
                   <span>账户总览</span>
               </a>
           </li>
           <li>
           	<a href="javascript:void(0)" class="on" style="cursor:text;">
                   <i class="icon-dashboard ico2"></i>
                   <span>我的投资</span>
                   <b class="icoI"></b>
               </a>
               <ul class="listLi-chind">
                   <li  class="mousover">
                   	<a href="${project_name}/user/invest/investCount" class="accountListA">
                       	<i class="icon-dashChild"></i> 
                       	<span>投资统计</span>	
                    </a>
               	</li>
                <li  class="mousover">
                	<a href="${project_name}/user/invest/investHaving" class="accountListA">
                    	<i class="icon-dashChild"></i>
                        <span>投资明细</span>	
                	</a>
         		</li>
                <li  class="mousover">
                	<a href="${project_name}/user/invest/havingDetail" class="accountListA">
                    	<i class="icon-dashChild"></i>
                       	<span>收款明细</span>	
                    </a>
                </li>									
 			</ul>
		</li>
        <li>
        	<a href="javascript:void(0)" class="on" style="cursor:text;">
            	<i class="icon-dashboard ico3"></i>
               	<span>资金记录</span>
                <b class="icoI"></b>
            </a>
            <ul class="listLi-chind">
				<li  class="mousover">
                	<a href="${project_name}/user/center/accountlist" class="accountListA">
                    	<i class="icon-dashChild"></i>
                        <span>资金明细</span>	
					</a>
                </li>
                <li  class="mousover">
                	<a href="${project_name}/user/recharge/list" class="accountListA">
                        <i class="icon-dashChild"></i>
                        <span>充值查询</span>	
                    </a>
                </li>
                <li  class="mousover">
                	<a href="${project_name}/user/cash/list" class="accountListA">
                        <i class="icon-dashChild"></i>
                        <span>提现查询</span>	
                    </a>
                </li>
            </ul>
        </li>
         <li  class="mousover">
        	<a href="${project_name}/user/actbonususers/unuse?usestatus=0" class="accountListA on">
                <i class="icon-dashboard ico4"></i>
                <span>活动奖励</span>
            </a>
        </li>
        
        
         <li  class="mousover">
        	<a href="${project_name}/user/actbonususers/rebate" class="accountListA on">
                <i class="icon-dashboard ico5"></i>
                <span>渠道返佣</span>
            </a>
        </li>

        <li  class="mousover">
        	<a href="${project_name}/user/customer/toSafe" class="accountListA on">
                <i class="icon-dashboard ico6"></i>
                <span>账户安全</span>
            </a>
        </li>
		<li  class="mousover">
			<a href="${project_name}/user/message/page" class="accountListA on">
				<i class="icon-dashboard ico8"></i>
				<span>消息中心</span>
			</a>
		</li>
		<li  class="mousover">
			<a href="${project_name}/user/customer/toPersonal" class="accountListA on">
				<i class="icon-dashboard ico9"></i>
				<span>个人资料</span>
			</a>
		</li>

	</ul>
</div>
<script type="text/javascript" language="javascript">
$(function(){
var modelNum =$("#nav_point").find("span").length-1;
    //alert(modelNum);
var modelName=$("#nav_point").find("span").eq(modelNum).text();
$("#navi").find("li").removeClass("select");
$("#navi").find("li span:contains("+modelName+")").parent().parent("li").addClass("select");
});
function recharge(){

 $.ajax({
        type: "post",
        url: '${project_name}/user/recharge/findUsrCustId',
        success: function (data) {
                if(data){
                    location.href="${project_name}/user/recharge/main";
                    }
                else{
                    $('.bindingMask').show();
                    $('.binding').show();
                    $('.off').click(function(){
                           $('.bindingMask').hide();
                           $('.binding').hide();
                           $('.cashMask').hide();
                       });
                }
            }
    });
}
function cash(){
//先做一下是否开通汇付账户的判断
 $.ajax({
        type: "post",
        url: '${project_name}/user/cash/findbankId',
        success: function (data) {
                    /*
                    * 先判断是否开通第三方账户
                    */
                    if(data=="hasnotHF"){

                         $('.bindingMask').show();
                            $('.binding').show();
                           $('.off').click(function(){
                                $('.bindingMask').hide();
                                $('.binding').hide();
                                $('.cashMask').hide();
                            });

                            return;

                    }
                    /*
                    *  再判断是否绑定银行卡
                    */
                    if(data=="nocardId"){

                         $('.bindingMask').show();
                            $('#bangdingcardId').show();
                           $('.off').click(function(){
                                $('.bindingMask').hide();
                                $('.binding').hide();
                                $('.cashMask').hide();
                            });

                           return;

                    }
                    /*
                    * 都开通以后跳转到提现页面
                    */
                    if(data=="cardId"){

                         location.href="${project_name}/user/cash/main";
                         return;
                    }



            }
    });
}

</script>