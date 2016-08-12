// JavaScript Document
$(function(){
	/*个人资料JS*/
	$('.ownTab span').click(function(){
		$('.ownTabList .ownBasic').hide();
		$('.ownTab span').removeClass('activeO');
		$(this).addClass('activeO');
		$('.ownTabList .ownBasic').eq($(this).index('.ownTab span')).show();
	});
	fnTab('.ownGender label');
	fnTab1('.ownOpn_base label');
	fnTab2('.ownOpn_info label');
		//性别
		function fnTab(obj){
			$(obj).click(function(){
				$(obj).find('i').removeClass('activeI');
				$(this).find('i').addClass('activeI');
				if($(this).find('i').attr('id')=='man'){
					$("#sex").val(1);
				}else{
					$("#sex").val(0);
				}
			});
		};
		//基本资料开放
		function fnTab1(obj){
			$(obj).click(function(){
				$(obj).find('i').removeClass('activeI');
				$(this).find('i').addClass('activeI');
				if($(this).find('i').attr('id')=='kf'){
					$("#baseinfo").val(1);
				}else{
					$("#baseinfo").val(0);
				}
			});
		};
		//详细资料开放
		function fnTab2(obj){
			$(obj).click(function(){
				$(obj).find('i').removeClass('activeI');
				$(this).find('i').addClass('activeI');
				if($(this).find('i').attr('id')=='kf'){
					$("#infoOpen").val(1);
				}else{
					$("#infoOpen").val(0);
				}
			});
		};
		
	
		
	/*验证身份切换*/
	
	$('.dropInp input').click(function(){
		$('.dropInp ul').show();
		
	});
	$('.dropInp ul li').click(function(){
			$('.dropInp input').val($(this).text());
			$('.optionTab').hide();
			$('.optionTab').eq($(this).index('.dropInp ul li')).show();
			$('.dropInp ul').hide();			
		});
	

	
	/*左侧导航菜单展开收缩*/
	//$('.formVerBut').live("click",function(){
	$(document).on(".formVerBut","click",function(){

		$(this).hide();
		$(this).next().show();
		//$('.formVer').find('b').css('margin-left','200px')
		var sTime=$('.time').children('i');
		
		var iNub=120;
		var iSpeed=1;
		var timer=null;
		timer=setInterval(function(){
			iNub-=iSpeed;
				if(iNub==0)
				{
					//iSpeed=-iSpeed;
					//alert('时间到了！');
					$('.time').hide();
					$('.formVerBut').show();
					//$('.formVer').find('b').css('margin-left','');
					clearInterval( timer );
				}
			$('.time').children('i').text(iNub);
		},1000);
	});
});