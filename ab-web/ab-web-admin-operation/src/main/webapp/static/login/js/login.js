// JavaScript Document

$(function(){
	var ok1=false;
	var ok2=false;
	var ok3=false;
	var ok4=false;
	//用户名验证
	$('.nameDiv input').focus(function(){
		//$(this).next('p').text('最长16位字符，仅允许中英文，下划线').show();
	})
	var r = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[A-Za-z]|[_-]){4,20}$/;
	var rp=/^1\d{10}$/;
	var re=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
	$('.nameDiv input').blur(function(){
		if(!re.test($(this).val())&&!rp.test($(this).val())&&!r.test($(this).val())){
			//alert('error name');
			$(this).next('p').show().text('您输入有误！');
			return false;
		}
		else{
			//alert('ok')
			$(this).next('p').hide();
			ok1=true;
			};
	});
	//密码验证
	var r1 = /^([\w]|[_-]){6,16}$/;
	$('.passDiv input').blur(function(){
		if(!r1.test($(this).val())){
			//alert('error password');
			$(this).next('p').show().text('您输入有误！');
			return false;
		}
		else{
			//alert('ok')
			$(this).next('p').hide();
			ok2=true;
			};
	})
	 $('.logoSub').click(function(){
		if(ok1 && ok2 ){
			$('#landForm').submit();
		}else{
			//alert('no')
			return false;
		}
	});
	
 })