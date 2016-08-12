// JavaScript Document


$(function(){
	$('.searchList span').click(function(){
		$('.searchList span').removeClass('active');
		$(this).addClass('active');
		$('.yixuan span em').text($(this).text());
	});
	
	//	排序切换
	$('.sort input').click(function(){
		$('.sort input').removeClass('active');
		$(this).addClass('active');
	})
});
