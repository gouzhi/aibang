// JavaScript Document

$(function(){
	

$('.navListT li').mouseover(function(){
		$('.navListT li').children('.search').hide();
		$(this).children('.search').show();
	});
	$('.navListT li').mouseout(function(){
		$('.navListT li').children('.search').hide();
	});
	//验证用户名
	var r = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[A-Za-z]|[_-]){4,20}$/;
	//yincang();
	function yincang(){
			if ($('#loginname').val() == '') {
				$('#loginname').prev(".iejr").show();
			}
			else {
				$('#loginname').prev(".iejr").hide();
			}
			if ($('#password').val() == '') {
				$('#password').prev(".iejr").show();
			}
			else {
				$('#password').prev(".iejr").hide();
			}
		if ($('#chkpwd').val() == '') {
			$('#chkpwd').prev(".iejr").show();
		}
		else {
			$('#chkpwd').prev(".iejr").hide();
		}
		if ($('#phone').val() == '') {
			$('#phone').prev(".iejr").show();
		}
		else {
			$('#phone').prev(".iejr").hide();
		}
		if ($('#invitecode').val() == '') {
			$('#invitecode').prev(".iejr").show();
		}
		else {
			$('#invitecode').prev(".iejr").hide();
		}

	};
	$('#regForm input').bind({focus:function(){
		$(this).prev(".iejr").hide();
		$(this).siblings('b').show();
		$(this).siblings('i').hide();
		$(this).siblings('em').remove();
	},blur:function(){
		if($(this).val()==''){
			$(this).prev('label.iejr').show();/*获取焦点时提示文字显示；*/
		}
		$(this).siblings('b').hide();
		$(this).valid();
		if($(this).attr("id")=="loginname"){
			hasU();
		}else if($(this).attr("id")=="phone" && hasU()){
			hasP();
		}
	}});

	yincang();
	
});