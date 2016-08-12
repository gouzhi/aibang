$(function(){
	//导航下拉菜单
	
	/*$('.navListT li').mouseover(function(){
		$('.navListT li').children('.search').hide();
		$(this).children('.search').show();
	});
	$('.navListT li').mouseout(function(){
		$(this).children('.search').hide();
	});*/
		
	//首页切换	
	indexClcik();
	function indexClcik(){
		$('.listHead a').click(function(){
			$('.listHead a').css('background','#2869ae')
			$(this).css('background','#4a95e5')
			$('.indexUl').hide();
			$('.indexUl').eq($(this).index('.listHead a')).show();
		});
	};
	//频道页切换
	show();
	function show(){
		$('.contentLeft-top a').click(function(){
			$('.contentLeft-top a').removeClass('activeA');
			$(this).addClass('activeA');
			$('.indexUl').hide();
			$('.indexUl').eq($(this).index('.contentLeft-top a')).show();
			
		});
	};	
	//公共页切换
		$('.publicNavList li').click(function(){
			$('.publicNavList li').removeClass('active');
			$(this).addClass('active');
			$('.publicContTleft').text($(this).children().text());
			$('.publicContTright').find('span:last').text($(this).children().text());
			$('.abouts').hide();
			$('.abouts').eq($(this).index('.publicNavList li')).show();
		});

});