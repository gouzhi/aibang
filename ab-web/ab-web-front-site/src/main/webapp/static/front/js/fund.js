/**
 * Created by zhaoyu on 2015/9/15.
 * 主要包含用户提现，充值，提现列表和充值列表js方法
 */

/**
 * 充值提现页面状态更改事件
 */
$("#status").on("change", function () {
    change();
});
/**
 * 充值提现页面时间更改事件
 */
$("#time").on("click", function () {
    var time = $("#time").val();
    //0 全部; 1 最近一个余额; 2 最近一个星期
    if(time==0){
        clearTime();
    }else if(time==1){
        recentMonth();
    }else{
        recentWeek();
    }
    change();
});

/**
 * 充值提现页面时间更改事件
 */
/*$("#OneWeektime").on("click", function () {
	recentWeek();
	var timeRange="1";
    change("",timeRange);
});

$("#OneMonthonthtime").on("click", function () {
	recentMonth();
	var timeRange="2";
    change("",timeRange);
});

$("#SixMonthonthtime").on("click", function () {
	recentSixMonth();
	var timeRange="3";
    change("",timeRange);
});*/
/**
 * 用户充值提交按钮事件
 */
$(".rechargeSub").on("click", function () {
    var isBank = $(".huan").attr("val");
    if(isBank==2){
        alert("绑定银行卡");
        return;
    }
    //验证输入框
    if(!$(".rechargeList .rechargeUl:visible form[name='form']").valid()){
        return;
    }
    //数量
    var amount = $(".rechargeList .rechargeUl:visible input[type='text']").val();
    //选择的银行卡或者支付方式
    var param = {
        amount: amount
    }
    //ajax请求，无返回
    //$.post("recharge", param);
    
    $(".rechargeSub").submit();
    //弹出框
    $("#mask").show();
    $("#box").show();
});


/**
 * 提现按钮事件
 
$(".cashSub").on("click", function () {
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
    //资金密码
    var payPassword = $("#payPassword").val();
    var param = {
        amount: amount,
        verifyCode: verifyCode,
        smsCode: smsCode,
        payPassword: payPassword
    }
    $(this).attr("disabled","disabled");
    //提现
    $.post("cash",param, function (data) {
    	
        var $cashTip = $(".cashTip");
        switch (Number(data)){
            case -1:
                $cashTip.html("参数错误");
                break;
            case -2:
                $cashTip.html("验证码错误");
                break;
            case -3:
                $cashTip.html("资金密码错误");
                break;
            case -4:
                $cashTip.html("短信验证码错误"); 
                break;
            case -5:
                $cashTip.html("提现错误");
                break;
            case 1:
                 var amount=$("#amount").val();
               
                $("#verifyCode").val("");
                $("#smsCode").val("");
                $("#payPassword").val("")
                window.location.href = $("#projectName").val()+"/cash/outcash";
               $.post("outcash",param, function (data) {
                	window.location.href = $("#projectName").val()+"/cash/outcash";
                }
                break;
            default :
                $cashTip.html("其他错误");
        }
        //提示3000ms后消失
        setTimeout(function () {
           $cashTip.html("");
        },3000)
        $(".cashSub").removeAttr("disabled");
    });
});
*/
/**
 * 弹出框关闭按钮
 */
$("#box .Close,.resetBtn").on("click", function () {
    $("#mask").hide();
    $("#box").hide();
});
/**
 * 点击确定，去投资页面
 */
$(".okBtn").on("click", function () {
   window.location.href = $("#projectName").val()+"/user/center/accountall";
});
/**
 * 修改或者设置交易密码
 */
$(".payPasswordTip").on("click", function () {
    window.location.href = $("#projectName").val()+"/user/customer/toSafe";
});
/**
 * 修改或者绑定银行
 */
$(".huan").on("click", function () {
    window.location.href = $("#projectName").val()+"/user/customer/toSafe";
})
/**
 * 换验证码
 */
$("#vcode").on("click", function () {
    $(this).attr("src",$("#projectName").val()+"/code/cash?"+Math.random());
});
/**
 * 更改方法
 * @param pageNumber 目标页码
 */
function change(pageNumber,timeRange){
    var data = {
        createTimeBegin:$('#beginDate').val(),
        createTimeEnd:$('#endDate').val(),
        status:Number($("#status").val()),
        timeRange:timeRange
    };
    //当前页 不传 后台默认是首页
    if(!!$("#pageNumber").html()){
        data.currentPage=Number($("#pageNumber").html());
        if(data.currentPage==pageNumber){
            return;
        }
    }
    //目标页码
    if(!!pageNumber){
      data.pageNumber = pageNumber;
    }
    //清空信息
    $("#content").empty();
    //异步加载页面
    $("#content").load("table",data)
}
/**
 * 最近一个星期，赋值到时间选择框
 */
function recentWeek(){
    var today = new Date();
    today.setTime(today.getTime()-7*24*3600*1000);
    var begin = today.format('yyyy-MM-dd');
    var end =new Date().format('yyyy-MM-dd');
    $dp.$('beginDate').value = begin;
    $dp.$('endDate').value = end;
}
/**
 * 最近一个月，赋值到时间选择框
 */
function recentMonth(){
    var today = new Date();
    today.setTime(today.getTime()-30*24*3600*1000);
    var begin = today.format('yyyy-MM-dd');
    var end =new Date().format('yyyy-MM-dd');
    $dp.$('beginDate').value = begin;
    $dp.$('endDate').value = end;
}

/**
 * 最近六个月，赋值到时间选择框
 */
function recentSixMonth(){
    var today = new Date();
    today.setTime(today.getTime()-180*24*3600*1000);
    var begin = today.format('yyyy-MM-dd');
    var end =new Date().format('yyyy-MM-dd');
    $dp.$('beginDate').value = begin;
    $dp.$('endDate').value = end;
}
/**
 * 清空，赋值到时间选择框
 */
function clearTime(){
    $dp.$('endDate').value = "";
    $dp.$('beginDate').value = "";
}
/**
 * 时间格式化
 * @param format
 * @returns {*}
 */
Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
            RegExp.$1.length==1 ? o[k] :
                ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}
/**
 * 发送手机短信
 */
function sendSms(){
    $.post($("#projectName").val()+"/smscode/cash?"+Math.random());
}
/**
 * 翻页
 * @param page 目标页码
 */
function nextPage(page) {
    change(page);
}
/**
 * 跳转
 */
function toTZ() {
    var toPaggeVlue = document.getElementById("toGoPage").value;
    if (toPaggeVlue == '') {
        document.getElementById("toGoPage").value = 1;
        return;
    }
    if (isNaN(Number(toPaggeVlue))) {
        document.getElementById("toGoPage").value = 1;
        return;
    }
    var pageCount = $("#pageCount").html();
    var pageNumber = $("#pageNumber").html();
    if(toPaggeVlue<=0||toPaggeVlue>Number(pageCount)||Number(pageNumber)==toPaggeVlue){
        document.getElementById("toGoPage").value = 1;
        return;
    }
    nextPage(toPaggeVlue);
}