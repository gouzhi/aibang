// JavaScript Document

$(function(){
	var ok1=false;
	var ok2=false;
	var ok3=false;
	var ok4=false;
	/*手机号验证*/
	var rp=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
	$('#phone').blur(function(){
		if(!rp.test($(this).val())){
			
			$(this).next().next('b').css('display','inline-block');
			return false;
		}
		else{
			//$(this).next().next('b').hide();
			ok1=true;
			};
	});
	/*手机验证码*/
	$('#code_btn').on("click",function(){
		$(this).hide();
		$(this).next().css('display','inline-block');
		var sTime=$('.time').children('i');
		
		var iNub=60;
		var iSpeed=1;
		var timer=null;
		timer=setInterval(function(){
			iNub-=iSpeed;
				if(iNub==0)
				{
					$('.time').hide();
					$('#code_btn').show();
					clearInterval( timer );
				}
			$('.time').children('i').text(iNub);
		},1000);
	});
	$('#xy').blur(function(){
		if($(this).val()==''||$(this).val().length !==6){
			
			$(this).parent().parent().find('b').css('display','inline-block');
		}
		else{
			ok2=true;
		};
	});
	/*密码*/
	var r1 = /^([\w]|[_-]){6,16}$/;
	$('#password').blur(function(){
		//alert('1');
		if(!r1.test($(this).val())){
			$(this).next().next('b').css('display','inline-block');
			return false;
		}
		else{
			//$(this).next().next('b').hide();
			ok3=true;
		}
	});
	$('#mobile_sub').click(function(){
		if(ok1 && ok2 && ok3){
			$('#mobile_sub').submit();
			alert('ok');
		}
		else{
			alert('no');
			return false;
		}
	});	
	/*弹窗*/
	$('#but a').click(function(){
		$('.maskMobil').show();
		$('.boxMobile').show();
	});
	$('.sure').click(function(){
		$('.maskMobil').hide();
		$('.boxMobile').hide();
	});
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
	})
	
	/* 产品列表小导航 */
		
	$('.proListSmallNav li').click(function(){
		$('.floatBBg2').css('display','block');
		var nIndex=$(this).index();
		$(this).addClass('hoverLi').siblings().removeClass('hoverLi');
		$(this).find('span').removeClass('arrowDown').addClass('arrowUp').parent().siblings().find('span').removeClass('arrowUp').addClass('arrowDown');
		$('.proListSmallCon').find('ul').eq(nIndex).css('display','block').siblings().css('display','none');
		var oLi=$('.proListSmallCon ul').find('li');
		oLi.bind({
			touchstart:function(){$(this).addClass('okBg');},
			touchend:function(){$(this).removeClass('okBg');},
			click:function(){
				$(this).parent().css('display','none');
				var valls=$(this).html();
				$('.hoverLi p').html(valls).parent().removeClass('hoverLi').find('span').removeClass('arrowUp').addClass('arrowDown');
				$('.floatBBg2').css('display','none');
			}
		})		
	})
	/* 产品详情 */
	$('.detailMenu a').click(function(){
		var nIndex=$(this).index();
		$(this).addClass('on').siblings().removeClass('on');
		$('.detailConList').children().eq(nIndex).removeClass('disNone').siblings().addClass('disNone');
	})
	
	/* 是否用券 */
	$('.rewardMenu a').click(function(){
		var nIndex=$(this).index();
		$(this).addClass('on').siblings().removeClass('on');
		$(this).parent().next().children('div').eq(nIndex).css('display','block').siblings().css('display','none');
	})
	
	/* 产品列表搜索 */
	$('#proSearch').focus(function(){
		
		$(this).attr('placeholder','');
		$(this).parent().find('.glyphicon-remove-sign').click(function(){
			$('#proSearch').val('');
		});
	});
	/* 返回上一页 */
	$("#back").on("click", function(){			
		var c = window.location.href;
		if (/#back/.test(c)) {
			window.history.go(-2);
			window.location.load(window.location.href)
		} else {
			window.history.back()
		}
	});
	/* 我的投资 */
	$('.myInvestMenu li').click(function(){
		$(this).addClass('on').siblings().removeClass('on');
		var nIndex=$(this).index();
		$('.myInvesCons .myInvestList').eq(nIndex).removeClass('disNone').siblings().addClass('disNone');
	})
	/* 返佣结算 */
	$('.fycMenu span').click(function(){
		$(this).addClass('on').siblings().removeClass('on');
		var nIndex=$(this).index();
		$('.fycConList').children().eq(nIndex).removeClass('disNone').siblings().addClass('disNone');
	})
	var menu="";
	 //充值方式 
	$('.rechargeMenu').click(function(){
	
		var nUl=$(this).next('ul');		
		nUl.removeClass('disNone');
		nUl.find('li').click(function(){
			var nCon=$(this).html();
			$(this).parent().addClass('disNone');
			$(this).parent().prev('div').find('p').html(nCon);
			$(this).parent().find('li').eq(0).removeClass('disNone');
			 menu= $(this).attr("value");
			
		})
		
	})
	
	$('.rechargeMenu1').click(function(){
		if(menu=="1"){
			var nUl=$(this).next('ul');		
			nUl.removeClass('disNone');
			$(this).next('ul').find('li').click(function(){
				var nCon=$(this).html();
				
				$(this).parent().prev('div').find('p').html(nCon);
				$(this).parent().find('li').eq(0).removeClass('disNone');
				nUl.addClass('disNone');
			})
		}
		else if(menu=="2"){
			var nUl=$("#nav2_ul");		
			nUl.removeClass('disNone');
			$("#nav2_ul").find('li').click(function(){
				var nCon=$(this).html();
				$("#p1").html(nCon);
				$(this).parent().find('li').eq(0).removeClass('disNone');
				nUl.addClass('disNone');
			})
		}
		
	})

	/* 出现浮层 */
	$('.landBtn,.emailBtn,.forgetBtn,.mailValBtn,.personalSafe,.regisBtn,.revTelBtn,.saveNextBtn,.channBtn').click(function(){
		$('.floatAll').removeClass('disNone');
		$('.floatBBg1').css('display','block');
	})
	
	$(".resetBtn").click(function(){	
		$('.floatAlls').show();
		$('.floatBBg1').show();
		setTimeout(function(){$(".floatAlls").hide();$('.floatBBg1').hide();},3000);
	});
	
	$('.channBtn').click(function(){
		$('.floatAllImg').removeClass('disNone');
		$('.floatBBg1').css('display','block');
	})
	/* 关闭浮层 */
	$('.floatAll .btn, .floatAllImg .btn').click(function(){
		$(this).parent().addClass('disNone');
		$('.floatBBg1').css('display','none');
	})

});


/* 出现浮层 */
$('.landBtn,.emailBtn,.forgetBtn,.mailValBtn,.personalSafe,.regisBtn,.revTelBtn,.saveNextBtn').click(function(){
	$('.floatAll').removeClass('disNone');
	$('.floatBBg1').css('display','block');
});

$(".resetBtn").click(function(){	
	$('.floatAlls').show();
	$('.floatBBg1').show();
	setTimeout(function(){$(".floatAlls").hide();$('.floatBBg1').hide();},3000);
});

/* 出现浮层 */
	$('.channBtn').click(function(){
		$('.floatAllImg').removeClass('disNone');
		$('.floatBBg1').css('display','block');
	});
	/* 关闭浮层 */
	$('.floatAll .btn, .floatAllImg .btn').click(function(){
		$(this).parent().addClass('disNone');
		$('.floatBBg1').css('display','none');
	});

	

