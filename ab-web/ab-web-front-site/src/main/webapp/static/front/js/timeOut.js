// JavaScript Document
$(function(){
	$('.formVer .formVerBut').live("click",function(){
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
					alert('时间到了！');
					$('.time').hide();
					$('.formVer .formVerBut').show();
					clearInterval( timer );
				}
			$('.time').children('i').text(iNub);
		},1000);
	});
});