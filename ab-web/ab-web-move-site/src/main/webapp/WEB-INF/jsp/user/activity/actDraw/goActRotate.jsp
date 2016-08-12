<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
<head>
	<title>球门大挑战</title>
	<link href="${css_imagedomain}/move/ball/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${css_imagedomain}/move/ball/jquery-1.js"></script>
	<script type="text/javascript">
	var isWinning = false;
	$(function(){
		$('.blankFloat').height($(document).height());
		$('.pointer').click(function (){
			if(!checkBefore()){
				return;
			};
			actRotate();
			$('.roolBall').addClass('ans');
			setTimeout(function(){
				$('.roolBall').removeClass('ans');
			 	$('.ballWin, .blankFloat').css('display','block');
				$('.blankFloat').css('display','block');
	    	}, 3000);
			if(!isWinning){
				//是否隐藏领取现金
				$('.money').css('display','none');
			}
			isWinning = false;
		});
		//关闭弹窗
		$('.closeBtn, .again, .money').click(function(){
			$('.ballWin, .blankFloat').css('display','none');
			//次数减一
			$("#lastTimes").val($("#lastTimes").val()-1);
			$("#lastTimesValue").text($("#lastTimes").val());
		})
	});
	//抽奖前校验
	function checkBefore(){
		var status = $("#status").val();
		if(status!=1){
			$("#msg").html("活动已失效！");
			return false;
		}
		var lastTimes = $("#lastTimes").val();
		if(lastTimes==0){
			$("#msg").html("亲，你不能再参加本次活动了喔！下次再来吧^_^！");
			return false;
		}
		return true;
	}
	//抽奖
	function actRotate(){
		var actId = $("#actId").val();
		var url = "${project_name}/user/actRotate/actRotate?actId="+actId;
		$.ajax({ 
			   type: "post", 
		       url: url, 
		       cache:false, 
		       async:false, 
		       dateType:"json",
		       data:"actId="+actId,
		       success: function(data){
		    	   var obj = eval("("+data+")");
		    	   var state = obj.state;
		    	   if(state==3){
		    		   isWinning = true;
		    	   }
		    	   $("#msg").html(obj.msg);
		       } 
			});
	}
	</script>
</head>


<head>
<body>
<!-- 隐藏域 -->
<input type="hidden" id="actId" value="${actId}">
<input type="hidden" id="status" value="${status}">
<input type="hidden" id="lastTimes" value="${lastTimes}">
<div class="outBg1">
  <div class="ballFly"><img src="${css_imagedomain}/move/ball/ballFly.png"></div>
  <div class="aniCon1"><img src="${css_imagedomain}/move/ball/ani1.png" /></div>
  <div class="gameTime"><img src="${css_imagedomain}/move/ball/ani2.png" /></div>
  <div class="timeShan"><img src="${css_imagedomain}/move/ball/shandow1.png" /></div>
  <div class="fontImg1"><img src="${css_imagedomain}/move/ball/fontImg1.png" /></div>
</div>
<div class="outBg2">
  <div class="door"><img src="${css_imagedomain}/move/ball/ballDoor.png" /></div>
  <div class="roolBall"><img src="${css_imagedomain}/move/ball/ball.png" /></div>
  <div class="pointer"><img src="${css_imagedomain}/move/ball/start.png" /></div>
  <div class="whiteLine"></div>
  <div class="gameNum">剩余：<span id="lastTimesValue">${lastTimes}</span> 次</div>
  <div class="ballWin">
    <p class="closeBtn"><img src="${css_imagedomain}/move/ball/doorClose.png" /></p>
    <p class="con" id="msg"></p>
    <p class="winBtn"><img src="${css_imagedomain}/move/ball/getMoney.png" class="money"><img src="${css_imagedomain}/move/ball/onceAgain.png" class="again"></p>
  </div>
</div>
<div class="outBg3"></div>
<div class="outBg4"></div>
<div class="blankFloat"></div>
</body>
</html>