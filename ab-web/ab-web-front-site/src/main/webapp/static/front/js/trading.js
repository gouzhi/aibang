// JavaScript Document

$(function(){
	/*$('.accountList li').click(function(){

		$('.accountList li').removeClass('select');
		$(this).addClass('select');
		
		if($(this).children('a').children('b').hasClass('icoI')){
			$(this).children('a').children('b').css('background','url(images/down.png) no-repeat center center');
		}
		else{
			$('.accountList li').children('a').children('b').css('background','url(images/pull.png) no-repeat center center');	
			}
		$('.listLi-chind').hide();
		$(this).find('.listLi-chind').show();
		$('.listLi-chind li').click(function(){
			$('.listLi-chind li').children('a').find('span').css('color','');
			$(this).children('a').find('span').css('color','#287ad2');	
		});
	});
		
	$('.accountList li .little').click(function(){
		$(this).next('ul').toggle();
	});
		
		
		
	
	$('.navListT li').mouseover(function(){
		$('.navListT li').children('.search').hide();
		$(this).children('.search').show();
	});
	$('.navListT li').mouseout(function(){
		$('.navListT li').children('.search').hide();
	});*/
		
		/*账户总览Tab切换*/
		$('.fourTab span').click(function(){
			$('.fourTab span').removeClass('actTab');
			$(this).addClass('actTab');
			$('.tableDiv').hide();
			$('.tableDiv').eq($(this).index('.fourTab span')).show();	
		});
		$('.evaluationList-con .evalSp6 a').click(function(){
			$('.evaluationList-con .comment').hide();
			$(this).parent().next().show();	
		});
		/*投资明细切换*/
		$('.detailedTab span').click(function(){
			$('.detailedTab span').removeClass('action');
			$(this).addClass('action');
			$('.detailedList').hide();
			$('.detailedList').eq($(this).index('.detailedTab span')).show();	
		});
		
		/*收款明细切换*/
		$('.receivablesTab span').click(function(){
			$('.receivablesTab span').removeClass('mingxi');
			$(this).addClass('mingxi');
			$('.receivablesTable').hide();
			$('.receivablesTable').eq($(this).index('.receivablesTab span')).show();	
		});
		
		/*资金明细*/
		$('.category li:last').css('border-right','none');
		/*充值Tab切换*/
		$('.rechargeTab span').click(function(){
			$('.rechargeTab span').removeClass('rechargeSpan');
			$(this).addClass('rechargeSpan');
			$('.rechargeList .rechargeUl').hide();
			$('.rechargeList .rechargeUl').eq($(this).index('.rechargeTab span')).show();	
		});
		
		/*活动奖励Tab切换*/
		/*$('.bonusUl li').click(function(){
			$('.bonusUl li').removeClass('bonusUlAct');
			$(this).addClass('bonusUlAct');
			$('.bonus .bonsList').hide();
			$('.bonus .bonsList').eq($(this).index('.bonusUl li')).show();		
		});*/
		
		/*渠道返佣Tab切换*/
		$('.channelTab span').click(function(){
			$('.channelTab span').removeClass('channelActive');
			$(this).addClass('channelActive');
			$('.channelList').hide();
			$('.channelList').eq($(this).index('.channelTab span')).show();	
		});
		
	
	/*赎回投资验证*/	
	var ok1=false;
	var ok2=false;
	$('.amount').focus(function(){
		$(this).next('b').text('请输入金额');
	});
	var r= /^([1-9]\d+|[2-9])$/;
	var r1=/^\d+(.\d{1,2})?$/;//可以有两位小数
	$('.amount').blur(function(){
		if(!r1.test($(this).val())){
			$(this).next('b').text('您输入有误！请重新输入！');
			alert('no')
			return false;
		}
		else{
			$(this).next('b').hide();
			ok1=true;
		}
	});	
});
/*倒计时*/
function validateTimeOver(){
	$(this).hide();
	$(this).next().show();
	var sTime=$('.time').children('i');

	var iNub=120;
	var iSpeed=1;
	var timer=null;
	timer=setInterval(function(){
		iNub-=iSpeed;
		if(iNub==0)
		{
			//iSpeed=-iSpeed;
			$('.time').hide();
			$('.formVer .formVerBut').show();
			clearInterval( timer );
		}
		$('.time').children('i').text(iNub);
	},1000);
	sendSms();
}