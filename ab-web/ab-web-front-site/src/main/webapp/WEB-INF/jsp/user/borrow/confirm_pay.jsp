<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
<title>支付确认 - 华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/sureComplete.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${css_imagedomain}/front/js/pullNav.js"></script>
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/common/jquery.validation/css/validate.css">
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.metadata.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/jquery.validate.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/jquery.validation/validate-methods.js"></script>
  <style>
      .spanText{border-bottom:1px solid #e8e8e8;padding-top:46px;margin-bottom:15px;text-align:center;overflow:hidden;}
      .spanText span {display: inline-block;height: 64px; line-height: 64px;padding: 0 8px 0 42px; font-size: 20px;color: #ababab; }
      .spanText i{display: inline-block; width: 7px;height: 12px;background: url(${css_imagedomain}/front/images/ico_next.png) no-repeat 0 center; margin: 0 50px 0 32px;}
      .spanText .sp1{background: url(${css_imagedomain}/front/images/ico_011.png) no-repeat 8px center;}
      .spanText .sp2{background: url(${css_imagedomain}/front/images/ico_02.png) no-repeat 8px center;border-bottom: 2px solid #f27267;color:#383838;}
      .spanText .sp3{background: url(${css_imagedomain}/front/images/ico_3.png) no-repeat 8px center;}
  </style>
</head>

<body>
<div class="RechargeMask" id="RechargeMask"></div>
<div class="Recharge" style="display:none;" id="afterPay">
    <h3 class="color5 pr">提示</h3>
    <p class="color5 tit">请在新打开的页面完成申请后选择：</p>
    <div class="fenlie clear">
        <div class="yes fl">
            <p class="color5 cg">申请成功</p>
            <p class="color5"><a href="${project_name}/user/invest/investRecord" class="okA">查看投资明细</a></p>
        </div>
        <div class="no fl">
            <p class="color5 shibai">申请失败</p>
            <p class="color5"><a href="${project_name}/borrowInfo/detail.do?borrowId=${borrowId}" class="retA">重新投资</a></p>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--支付确认主体-->
<div class="confirm">
	<!--<div class="pay">-->
    <div class="newWidBg">
    	<!--<img src="${css_imagedomain}/front/images/pay.png" width="450" height="50" />-->
        <div class="spanText">
            <span class="sp1">确认信息</span>
            <i></i>
            <span class="sp2 active">支付确认</span>
            <i></i>
            <span class="sp3">完成</span>
        </div>
        <h3 class="newsH3Tt"><span></span>支付确认</h3>
        <c:if test="${!empty typeList}">
       	<h4 class="syjl319">使用活动奖励</h4>
        <div class="payDiv319">

            <table>
                <tr>
                    <th class="paySp1"></th>
                    <th class="paySp2">类型</th>
                    <th class="paySp3">面值</th>
                    <th class="paySp4">编号</th>
                    <th class="paySp5">有效期至</th>
                    <th class="paySp6">使用说明</th>
                </tr>
            <tbody class="payList" id="myBox">
                <c:forEach items="${typeList }" var="item">
                    <tr>
                        <td class="paySp1"><input type="checkbox" name="icheckbox" value="${item.ID }" money="<fmt:formatNumber value="${item.VALUE }" pattern="#.00#"></fmt:formatNumber>"/></td>
                        <td class="paySp2"><c:choose><c:when test="${item.TYPE==1 }">现金券</c:when><c:when test="${item.TYPE==2}">返佣红包</c:when></c:choose></td>
                        <td class="paySp3"><fmt:formatNumber value="${item.VALUE }" pattern="#"></fmt:formatNumber>元</td>
                        <td class="paySp4">${item.BU_CODE}</td>
                        <td class="paySp5"><fmt:formatDate value="${item.EXPIRE_TIME }" pattern="yyyy-MM-dd"/></td>
                        <td class="paySp6"><c:choose><c:when test="${item.TYPE==1 }">可支付购买产品</c:when><c:when test="${item.TYPE==2}">可直接提现或支付购买产品</c:when></c:choose></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        </c:if>
        <div class="truePay">实付总金额：<span><fmt:formatNumber value="${account}" pattern="#.00#"/>元</span><b ></b></div>
        <ul class="availableBalance">
        	<li class="labelL fl">
                可用余额：<span><fmt:formatNumber value="${userBase.avlBalance}" pattern="#.00#"/>元</span>
            </li>
            <li class="labelR fr">
                <label id="showtotal"><%--（50.00元 - 20.00元 = 30.00元）--%></label>支付金额：<span id="payaccountshow"><fmt:formatNumber value="${account}" pattern="#.00#"/>元</span>
            </li>
        </ul>
        <!--<form class="payForm" id="form" action="pay" method="post" target="_blank">-->
        <form id="form" action="pay" method="post" target="_blank">
        	<input type="hidden" name="account" value="${account}">
        	<input type="hidden" name="borrowId" value="${borrowId}">
        	<input type="hidden" name="payaccount" id="payaccount">
        	<input type="hidden" name="bonusUserId" id="bonusUserId">

            <div class="nextBtn319 marginT64"><input type="submit" class="pay" value="确认支付" id="subBtn"/></div>
        </form>
    </div>
</div>
<!--支付确认主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>
<script type="text/javascript" src="${css_imagedomain}/common/myjs/algorithmic.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	changeCode();
	$("#codeImg").bind("click", changeCode);
});
function changeCode() {
	$("#codeImg").attr("src", "${project_name}/code.do?t=" + genTimestamp());
}
function genTimestamp() {
	var time = new Date();
	return time.getTime();
}
$(document).ready(function(){
	/*登录验证模板*/
	$.metadata.setType("attr", "validate");
	$("#form").validate({
		onfocusout:false,
		onclick:false,
		onkeyup:false,
		errorElement: "em",//用来创建错误提示信息标签(可自定义)
		submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
            form.submit();   //提交表单   
        },
		errorContainer: $("#warning, #summary"),
		errorPlacement: function(error, element) {
			error.appendTo(element.parent()); 
		}
	});
	//点击提交按钮
	document.getElementById("subBtn").onclick = function(){
		if($("#form").valid()){
			$("#form").submit();
            //window.location.reload();
            document.getElementById('afterPay').style.display='block';
            document.getElementById('RechargeMask').style.display='block';
		}
	}
	
	var $subBox = $("input[name='icheckbox']");
    $subBox.on("click",function(){
        if($(this).is(':checked')) {
            // $(':checkbox[name=icheckbox]').attr('checked',false);
            $(':checkbox[name=icheckbox]').prop("checked", false);
            $(this).prop('checked',true);

        }
        var account = ${account}+".00";
        var vhtml = "("+account+"元";
        $("input[name='icheckbox']:checked").each(function(){
        	var money = $(this).attr("money");
        	account = numSub(account,money);
        	vhtml += " -"+money+"元(现金红包)";
        });
        vhtml += " ="+account+"元)";
        if($("input[name='icheckbox']:checked").length == 0){
        	vhtml="";
        }
        $("#showtotal").html(vhtml);
        if(account<0){
            $("#payaccountshow").html("0.00元");
        }else{
            $("#payaccountshow").html(account+"元")
        }

        $("#payaccount").val(account);
        $("#bonusUserId").val($(this).attr("value"));
    });
});



</script>
