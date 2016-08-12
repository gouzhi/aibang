<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
<title>产品详情 - 华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/productDetails.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${css_imagedomain}/front/js/pullNav.js"></script>
<style>

        .white_content {display: none;font-size: 14px;font-family: "Microsoft YaHei";width: 55%;  left: 50%; height: 220px; margin-left: -250px;margin-top: -110px;border: 1px solid #f27267; background-color: white;  z-index:2; top: 50%; width: 500px;position: fixed; overflow: hidden;}
        .white_content h3{height:50px;line-height:50px;font-size:18px;color:#fff;background:#f27267;padding-left:15px;}
        .white_content .Close{position:absolute;right:10px;top:12px;}
        .white_content .Close a{ display: inline-block;width:25px;height: 25px; background:url(${css_imagedomain}/front/images/Close.png) no-repeat center center; }
        .white_content .Close a:hover{ background:url(${css_imagedomain}/front/images/CloseOn.png) no-repeat center center;}
        .white_content .center{width:500px;text-align:center;padding: 15px 0 20px;}
        .white_content .butClick{font-size: 14px; height: 33px;line-height: 33px;color: #fff;display:block;width: 185px;background: #f27267;text-align: center;margin: 20px 0 0 140px;  }
        .black_overlay{ display: none;  position: fixed;top: 0%; left: 0%; width: 100%;  height: 100%; background-color: black; z-index:1; -moz-opacity: 0.5; opacity:.50; filter: alpha(opacity=50); }
        #yuebuzu .tishi{width:500px;height:36px;line-height:36px;text-align: center;margin:10px 0;color:#287ad2;font-weight:bold;background: url(${css_imagedomain}/front/images/tan.png) no-repeat 98px 5px; }
        #yuebuzu .jine{height:24px;line-height:24px;color:#666;margin-left:146px; }
        #yuebuzu .butClick{font-size: 14px;height: 33px;line-height: 33px;color: #fff;display:block;width: 185px;background: #f27267;text-align: center;margin: 20px 0 0 146px;}
        #yuebuzu{display: none;font-size: 14px; font-family: "Microsoft YaHei";width: 50%;left: 50%;height: 250px;margin-left: -250px; margin-top: -125px;.padding: 20px; border: 1px solid #CCCCCC; background-color: white;z-index:1222222; top: 50%;width: 500px;position: fixed;  }
        .time-item span{font-size: 12px;color:#fff;}
       #baifen{display:inline-block;height:50px;line-height:50px;font-size:16px;color:#494646;border-right: 1px solid #e8e8e8;padding-right:55px;}
       #baifen i{font-family: "Arial";font-size: 16px;color: #383838;}
/*分页代码*/
        .pagination{width:1100px;margin:0 auto;background: #fff; padding-bottom: 50px;}
        .pagination ul{width:1100px;text-align: center;}
        .pagination ul li{margin-right:5px;display: inline-block;}
        .pagination ul li a{font-family:"Arial";font-size:14px;color:#6b6b6b;border-radius: 2px;}
        .pagination ul li.currentPage a{font-size:14px;color:#fff;background:#f27267;}
        .pagination ul li a:hover{font-size:14px;color:#fff;background:#f27267;}
        .pagination a{display:block;width:30px;height:26px;line-height:26px; text-align:center;border:1px solid #e8e8e8;cursor: pointer;}
        #toGoPage {border: 1px solid #ccc; padding:5px;margin-top: -6px;}



</style>

</head>

<body>

<form action="${project_name}/borrowInfo/detail.do" method="post" id="myForm">
    <input name="borrowId" value="${borrow.id}" type="hidden"/>

<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>
    <fmt:formatDate value="${borrow.tenderEndTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd"  var="tenderEndTime"/>
    <fmt:formatDate value="${borrow.tenderStartTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd"  var="tenderStartTime"/>

<div id="yuebuzu" class="white_content">
	<h3>重要提示</h3>
    
	<span class="Close"><a href = "javascript:void(0)" onclick = "document.getElementById('yuebuzu').style.display='none';document.getElementById('fade').style.display='none';"></a></span>
    <p class="tishi">您的账户可用余额不足，请立即充值。</p>
    <p class="jine">计划投资金额：<span id="jhaccount"></span>元</p>
    <p class="jine" >账户可用余额：<span id="zhaccount"></span>元</p>
    <p class="jine" >需充值金额：<span id="xzaccount">10,000.00</span>元</p>
   	<a href="${project_name}/user/recharge/main.do" class="butClick">充值</a>

</div>        
 <div id="fade" class="black_overlay"></div> 
 <div id="completeMsg" class="white_content">
	<h3>重要提示</h3>
    <span class="Close"><a href = "javascript:void(0)" onclick = "document.getElementById('completeMsg').style.display='none';document.getElementById('fade').style.display='none';"></a></span>
    <p align="center" class="center">您未开通第三方托管账户，请先开通后再进行操作。</p>
   	<a href="${project_name}/user/customer/toSafe.do" class="butClick">开通第三方托管账户</a>
    
</div> 

<!--产品详情主体 --> 

<div class="contentProduct">
	<div class="productDetails">
    	<div class="productNav">
            <a href="${education_domain}" style="color:#929292;font-size: 14px;">首页</a>
            <i style="color:#929292;font-size: 14px;"> > </i>
            <a href="http://money.huafax.com/" style="color:#929292;font-size: 14px;">投资理财</a>
            <i style="color:#929292;font-size: 14px;"> > </i>
            <a href="#" style="color:#929292;font-size: 14px;">项目详情</a>
        </div>
        <div class="detailsTop clear">
        	<div class="detailsTop-Left fl">
            	<div class="detailsTop-Head clear">
                	<span class="spanLeft fl pr"><i style="display: inline-block;width:6px;height: 20px; background: #f27267; margin-right: 10px;position: absolute;left:0px;top:14px;"></i>${borrow.bname} <b style="font-size: 14px;color: #a6a6a6;margin-left: 40px;">编号：<b style="color:#383838;">${borrow.id}</b></b></span>
                    <span class="spanRight fr" style="color:#a6a6a6; margin-top: 2px;">发布时间：<i style="color:#383838;"><fmt:formatDate value="${borrow.createTime}" pattern="yyyy-MM-dd"/></i></span>
                </div>
                <div class="projectList clear">
                	<div class="projectDiv nav1 fl">
                    	<div class="divTitle">资金规模</div>
                        <div class="divNum">${borrow.account}&nbsp;元</div>
                    </div>
                    <div class="projectDiv nav2 fl">
                    	<div class="divTitle">年化收益</div>
                        <div class="divNum"><fmt:formatNumber value="${borrow.borrowApr}" pattern="#0.00#"/>&nbsp;%</div>
                    </div>
                    <div class="projectDiv nav3 fl">
                    	<div class="divTitle">投资期限</div>
                        <div class="divNum">${borrow.borrowPeriod}${borrow.repayType==1?'&nbsp;月':'&nbsp;天'}</div>
                    </div>
                </div>

                <div class="leftBottom clear">
                	<div class="bottomLeft fl">
                	<c:choose>
                	 <c:when test="${borrow.verifyStatus == 2 && today <= tenderEndTime && borrow.borrowAccountYes <borrow.account}">
                    	<span class="bottomSpeed" style="width:130px;margin:0 10px 0 25px;display: inline-block;position:relative;" >
                        	<span style="position:absolute;margin-top:-18px\9;display:inline-block;width:<fmt:formatNumber value="${borrow.tenderScale/100}" type="percent"/>;height:100%; background:#f27267;" ></span>

                        </span>
                        <span id="baifen"><i>${borrow.tenderScale }</i>&nbsp;%</span>
                   </c:when>
                   <c:otherwise>
                        <span class="bottomSpeed" style="width:130px;margin:0 10px 0 25px;display: inline-block;position:relative;" >
                            <span style="position:absolute;margin-top:-18px\9;display:inline-block;width:<fmt:formatNumber value="1" type="percent"/>;height:100%; background:#f27267;" ></span>
                        </span>
                        <span  id="baifen"><i>100</i>&nbsp%</span>
                   </c:otherwise>
                    </c:choose> 

                    </div>
                    <div class="bottomLeft_r fl">
                        <span class="same">满标后T+1起息</span>
                    </div>


                    <div class="bottomCenter fl"><c:choose><c:when test="${today < tenderStartTime}">募集期未开始</c:when><c:when test="${today >= tenderStartTime && today <= tenderEndTime && remainDay>=0 && borrow.verifyStatus eq 2}">募集期剩余${remainDay}天</c:when><c:otherwise>募集期已结束</c:otherwise></c:choose></div>
                    <%--<div class="bottomRight fl">100%本息担保</div>--%>
                </div>
            </div>
            <div class="detailsTop-Right fl" style="position: relative;">

            <c:choose>

            <c:when test="${borrow.verifyStatus==5 || borrow.verifyStatus==11}">
            
            	<%--<div class="detailsTop-Head">--%>
                	<%----%>
                    <%--<div class="touzi_over">还款中</div>--%>
                <%--</div>--%>
                <img src="${css_imagedomain}/front/images/repay.png" width="220" height="222"  class="stateImg"  />
               
            </div>
            </c:when>
            <c:when test="${borrow.verifyStatus == 8 || borrow.verifyStatus == 10}">

            <%--<div class="detailsTop-Head">--%>

                <%--<div class="touzi_over">已结清</div>--%>
            <%--</div>--%>
            <img src="${css_imagedomain}/front/images/full.png" width="220" height="222"  class="stateImg" />

        </div>
        </c:when>
        <%--判断显示预售情况--%>
        <c:when test="${borrow.verifyStatus == 2 && today < tenderStartTime}">
            <img src="${css_imagedomain}/front/images/timeOn.png" width="220" height="222" class="stateImg" />
            <div class="time-item" style=" position: absolute;left:128px;top:154px;width:120px;height:24px;line-height: 24px; overflow: hidden;">
                <span class="day_show"></span>
                <span class="hour_show"></span>
                <span class="minute_show"></span>
                <span class="second_show"></span>
            </div>
            <script type="text/javascript">
                Countdown();
                function Countdown(){
                    //var intDiff = parseInt(395500);//倒计时总秒数量

                    function timer(intDiff){
                        window.setInterval(function(){
                            var day=0,
                                    hour=0,
                                    minute=0,
                                    second=0;//时间默认值
                            if(intDiff > 0){
                                day = Math.floor(intDiff / (60 * 60 * 24));
                                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                            }
                            if (minute <= 9) minute = '0' + minute;
                            if (second <= 9) second = '0' + second;
                            $('.day_show').html(day+"天");
                            $('.hour_show').html('<s id="h"></s>'+hour+'时');
                            $('.minute_show').html('<s></s>'+minute+'分');
                            $('.second_show').html('<s></s>'+second+'秒');
                            intDiff--;
                        }, 1000);
                    }

                    $(function(){
                        intDiff=${intDiff};
                        timer(intDiff);
                    });
                }
            </script>
</div>
        </c:when>
    <%--判断用户是否为新客--%>
        <c:when test="${borrow.verifyStatus == 2 && today <= tenderEndTime && today>=tenderStartTime && borrow.borrowAccountYes <borrow.account && isNew==0}">
    <img src="${css_imagedomain}/front/images/newmen.png" width="220" height="222" class="stateImg" />

</div>
        </c:when>
        <c:when test="${borrow.verifyStatus == 2 && today <= tenderEndTime && today>=tenderStartTime && borrow.borrowAccountYes <borrow.account}">

            <div class="detailsTop-Head">
                    <span class="spanRight">可投金额：<i>${enableAmount}</i>&nbsp;元</span>
                </div>
                
                    <label class="pr">
                        <input name="account" id="amountBtn" autocomplete="off" onkeyup="calAmount()" type="text" <c:choose><c:when test="${borrow.tenderAccountMin>enableAmount}">value="${enableAmount}"   readonly="readonly" </c:when><c:otherwise>placeholder="${borrow.tenderAccountMin}元起投,以${borrow.tenderAccountStep}元为单位递增" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"</c:otherwise></c:choose> class="investText"  maxlength="8" /><i class="unit pa">元</i>
                        <div style="height:22px;line-height: 22px; margin-top: 2px;"><div class="enter_num" id="errorMsg">请输入正确的金额！</div></div>

                    </label>

                    <label class="label_list">
                        <span>回款方式：
                            <i style="font-size: 16px;color:#383838;">
                                <c:forEach items="${repayconfigs}" var="item">
                                <c:if test="${borrow.repayType == item.code}">
                                ${item.cname}
                                </c:if>
                                </c:forEach>
                            </i>
                        </span>
                    </label>
                    <label class="label_list" style="margin-bottom: 10px;">
                        <span>到期收益：
                            <i id="allAccount" style="font-size: 16px;color:#f27267;">0.00<i style='font-size: 14px;color: #383838;'>&nbsp;元</i></i>
                        </span>
                    </label>
                    <label>
                        <input type="checkbox" value="123456" class="checkbox" id="agreeBox" checked="true" onclick="sel(this)"/>
                        <span style="font-size: 14px;color: #494646;">我同意<a target="_blank" href="${project_name}/serAgreement.do">《华金所服务协议》</a></span>
                    </label>
                    <input id="investBtn" type="button" value="${ifLogin}" class="investSub" />
                    
                
            </div>
    </c:when>
    <c:otherwise>

    <img src="${css_imagedomain}/front/images/flow.png" width="220" height="222"  class="stateImg"/>

</div>
    </c:otherwise>
            </c:choose>

        </div>
        
        <div class="detailsFoot">
        	<div class="footNav clear">
            	<span <c:if test="${tab==0}">class="active"</c:if>>产品详情</span>
                <span>企业信息</span>
                <span>还款来源</span>
                <span>风险控制</span>
                <span <c:if test="${tab==1}">class="active"</c:if>>投资记录</span>
                <%--<span>热门评论</span>--%>
            </div>
            <!--产品详情-->
            <div class="footList" <c:if test="${tab==0}">style="display:block;"</c:if> >${borrow.porjectRemark}</div>
            <!--企业信息-->
            <div class="footList">${borrow.borrowUserRemark}</div>
            <!--担保详情-->
            <div class="footList">${borrow.vouchRemark} </div>
            <!--风险控制-->
            <div class="footList">${borrow.windControl}</div>
            <!--投资记录-->

            <div class="footList footUl" <c:if test="${tab==1}">style="display:block;"</c:if>>
            	<ul class="record">
                	<li>
                    	<span class="recordSp1">投资人</span>
                        <span class="recordSp2">投资金额</span>
                        <span class="recordSp3">投资时间</span>
                        <span class="recordSp4" >投资状态</span>
                    </li>
                </ul>
                <ul class="recordList">
                    <c:forEach items="${page.result}" var="item">
                	<li>
                    	<span class="recordSp1">${fn:substring(item.USERNAME, 0, 2)}***${fn:substring(item.USERNAME,fn:length(item.USERNAME)-2,fn:length(item.USERNAME))}</span>
                        <span class="recordSp2"><b>${item.TENDER_ACCOUNT}</b>元</span>
                        <span class="recordSp3"><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd-HH : mm" /> </span>
                        <span class="recordSp4"><c:choose><c:when test="${item.STATUS ==1}">已投标/已付款 </c:when><c:when test="${item.STATUS ==0}">已投标/未付款 </c:when><c:when test="${item.STATUS ==2}">已撤回投标</c:when></c:choose></span>
                    </li>
                    </c:forEach>
                </ul>
               <!-- <div class="page-header position-relative" style="margin-top: 12px">
                    <table style="width:100%;">
                        <tr>
                            <td style="vertical-align:top;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.frontPageStr}</div></td>
                        </tr>
                    </table>
                </div>-->

                <div class="pagination" style="padding-top: 0px;margin-top: 20px;">
                   <span style="text-align: center;">${page.frontPageStr}</span>
                </div>

            </div>

            <%--<div class="footList footUl">
            	<ul class="hotUl">
                	<li>
                    	<span class="hotSp1">投资心得</span>
                        <span class="hotSp2">满意度</span>
                        <span class="hotSp3">投资信息</span>
                        <span class="hotSp4">评论者</span>
                    </li>
                </ul>
                <ul class="hotList">
                	<li>
                    	<div class="divTop">
                        	<div class="hotSp1">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                             Aenean euismod bibendum laoreet.Proi</div>
                             <div class="hotSp2">
                             	<img src="${css_imagedomain}/front/images/star.png" />
                             </div>
                             <div class="hotSp3">
                             	<div class="">投资金额：<span>1000.00</span>元</div>
                                <div class="">收益金额：<span>1000.00</span>元</div>
                             </div>
                              <div class="hotSp4">
                             	<div class="">华赢凯来***2</div>
                                <div class="">2015-06-12 09:12 购买</div>
                             </div>
                        </div>
                        <div class="pingfen">10</div>
                    </li>
                </ul>
            </div>--%>
            <script>
            	$('.footNav span').click(function(){
					$('.footNav span').removeClass('active');
					$(this).addClass('active');	
					$('.detailsFoot .footList').hide();
					$('.detailsFoot .footList').eq($(this).index('.footNav span')).show();
				});
            </script>
        </div>
   
    </div>
    
</div>
<!--产品详情主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</form>
</body>

</html>
<script type="text/javascript" >
   /* function selRecords(){
        var tabVal=1;
        window.location.href="${project_name}/borrowInfo/detail.do?borrowId=${borrow.id}&tab="+tabVal;
    }*/
    function sel(obj){
        var investVal=$("#investBtn").val();
        if(obj.checked==true)
        {
            if(investVal=="请登录"){

                $("#investBtn").attr("disabled",false);
            }else{

                $("#investBtn").attr("disabled",false);
            }

        }
        else
        {
            if(investVal=="请登录"){

                $("#investBtn").attr("disabled",false);

            }else{

                $("#investBtn").attr("disabled",true);
            }

        }

    }
$(function(){

    $("#investBtn").click(function(){
        if($("#investBtn").val()=="请登录"){
            window.location.href="${project_name}/login.do";
        }else{
            var amount=$("#amountBtn").val();
            var amountMin=${borrow.tenderAccountMin};
            var amountStep=${borrow.tenderAccountStep};
            var enableAmount=${enableAmount};
            var subAmount=amount-amountMin;
            if((amount<=enableAmount && subAmount%amountStep==0 && amount>=amountMin && amountMin<=enableAmount)||(amountMin>enableAmount && amount<=enableAmount)){
                $.ajax({
                    type: "POST",
                    url: "goToValidation.do",
                    data:{
                        "account":$("#amountBtn").val(),
                        "loginId":'${sessionUser.id}',
                        "userId":'${sessionUserCustomer.hjsUserBase.id}'
                    },

                    dataType:'json',
                    cache: false,
                    success: function(data){
                        

                        if(data.result==0){
                            //alert(000000);
                            //提示账户验证
                            document.getElementById('completeMsg').style.display='block';
                            document.getElementById('fade').style.display='block';
                        }else if(data.result==1){
                            //alert(data.result);
                            $("#jhaccount").html(data.account);
                            $("#zhaccount").html(data.zhaccount);
                            $("#xzaccount").html(data.xzaccount);
                            //账户余额不足
                            document.getElementById('yuebuzu').style.display='block';
                            document.getElementById('fade').style.display='block';
                        }else if(data.result==2){
                            $("#myForm").attr("action","${project_name}/user/investment/confirmInfo.do");
                            $("#myForm").submit();
                            //window.location.href="${project_name}/investment/confirmInfo.do?borrowId=${borrow.id}&account="+amount;
                        }else if(data.result==3){

                            window.location.href="${project_name}/login.do";

                        }
                    }
                });

            }

        } 

    });

});
function calAmount(){

    var enableAmount=${enableAmount};
    var amount=$("#amountBtn").val();

    var amountMin=${borrow.tenderAccountMin};
    var amountStep=${borrow.tenderAccountStep};
    var subAmount=amount-amountMin;

    if((amount<=enableAmount && subAmount%amountStep==0 && amount>=amountMin && amountMin<=enableAmount)||(amountMin>enableAmount && amount<=enableAmount)){

        document.getElementById('errorMsg').style.display='none';

        $("#investBtn").prop('disabled',false);

        var condi = {
            "account":$("#amountBtn").val(),
            "id":'${borrow.id}'
        }
        $.ajax({
            url:"getAppr.do",
            type:"post",
            data:condi,
            dataType:"json",
            success:function(result){
                $("#allAccount").html(result + "<i style='font-size: 14px;color: #383838;'>&nbsp;元</i>");
            }
        });

    }else if(amount>enableAmount){
        $("#errorMsg").html("投资金额不能超过可投金额!");
        $("#allAccount").html("");
        document.getElementById('errorMsg').style.display='block';
        $("#investBtn").prop('disabled',true);
    }
    else if(amount>amountMin && subAmount%amountStep!=0 ){
        $("#errorMsg").html("金额必须等于\"递增金额${borrow.tenderAccountStep}的整数倍+起投金额${borrow.tenderAccountMin}\"");
        $("#allAccount").html("");
        document.getElementById('errorMsg').style.display='block';
        $("#investBtn").prop('disabled',true);
    }else if(amount<amountMin && amountMin<=enableAmount){
        $("#errorMsg").html("起投金额为"+amountMin);
        $("#allAccount").html("");
        document.getElementById('errorMsg').style.display='block';
        $("#investBtn").prop('disabled',true);



    }

		
	
	
	
}
</script>