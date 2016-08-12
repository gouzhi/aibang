// JavaScript Document

$(function(){
	var Newpassword= /^([\w]|[_-]){6,16}$/;
	$('#passwordNew').focus(function(){
			
	});
	$('#passwordNew').blur(function(){
		if(!Newpassword.test($(this).val())){
		//alert('no');
		$(this).next('b').text('您输入有误！请重新输入！').show();		
	}
	else{
		//alert('ok');
		$(this).next('b').hide();							
		}	
	});	
	$('#passwordNew-align').blur(function(){
		if($(this).val()==$('#passwordNew').val()&&$(this).val()!=''){
		//alert('ok')	
		$(this).next('b').hide();
			}
			else{
				$(this).next('b').text('您输入有误！请重新输入！');	
			}
	});
});