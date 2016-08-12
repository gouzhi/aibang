<!DOCTYPE html>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>渠道返佣</title>
  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/commen.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
<script src="${css_imagedomain}/front/js/jquery-1.9.1.min.js"></script>
<script src="${css_imagedomain}/front/js/creat.js"></script>
<style>
	.ico_Close{position:fixed;.position:absolute;display:inline-block;width: 64px;height: 64px;top:36.7%;left:59.5%;z-index:2;background: url(${css_imagedomain}/front/images/ico_Close.jpg) no-repeat center center;margin-left: -32px; margin-top: -32px;display:none;cursor: pointer;}
	.canvas{ margin-left: -120px; margin-top: -120px;}
</style>
<script>
$(function(){
	$('.bdsharebuttonbox #copy').click(function(){
		$('.fz_mask').show();
		$('.fz_lj').show();	
	});
	$('#close,.Close').click(function(){
		$('.fz_mask').hide();
		$('.fz_lj').hide();	
	});
	$('.ico_Close').click(function(){
		$(this).hide();
		$('.fz_mask').hide();
		$('.canvas').hide();
	});
	$('.bdsharebuttonbox li').mouseover(function(){
		$('.bdsharebuttonbox li').removeClass('active');
		$(this).addClass('active');
	});
	$('.bdsharebuttonbox li').mouseout(function(){
		$('.bdsharebuttonbox li').removeClass('active');
	});
	$('.Close').mouseover(function(){
		$(this).removeClass('CloseN').addClass('CloseY');
	});
	$('.Close').mouseout(function(){
		$(this).removeClass('CloseY').addClass('CloseN');
	});
});
</script>
</head> 

<body>
<div class="fz_mask"></div>
<i class='ico_Close'></i>
<div class="fz_lj">
	<p>复制一下链接内容，分享给您的好友  。</p>
    <input type="text" value="" class="fz_input" />
    <div class="anniu_div">
    	<input type="button" value="确定并复制" onclick="addr()" id="close"/>
    </div>
    <span class="Close CloseN"></span>
</div>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
    <div id="nav_point" class="icoPoint">
		<span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span>渠道返佣</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
		<div class="crumbNav329">渠道返佣</div>
    	<div class="whiteR329">
        	<div class="channelTab">
            	<span onclick="recommend()" class="channelActive">我要推荐</span>
                <span onclick="rebate()">返佣结算</span>
            </div>
            <div class="channelList" style="display:block;">
				<div class="channeClumb">我推荐的返佣</div>
            	<p class="channeCon1">佣金总额：
            	<span>
            			<!-- 判断金额是否为空 -->
            			<c:if test="${rebateSum.val != null}">${rebateSum.val}</c:if>
            			<c:if test="${rebateSum.val == null}">0</c:if>
            	</span> 元</p>
				<div class="channeLine"></div>
                <p class="succ_p">
                	<%-- <span>成功注册：<b><i>${rebateSum.count}</i>人</b><strong>（奖励：<i>${rebateSum.val}</i>元）</strong></span>
                   <span>绑定银行卡：<i>${userBank.count }</i>人（奖励：<i>${userBank.val }</i>元）</span>
                   <span>成功投资：<i>${account.count}</i>笔（奖励：<i>${account.val }</i>元）</span> --%>
                </p>
                <div class="channeClumb">我要赚取佣金</div>
                <p class="invite_num">我的邀请码：<span class="span_num">${inviteCode }</span></p>
				<p class="channeCon2">要获取返佣，需将此邀请码发给您的朋友。</p>
				<div class="channeLine"></div>
				<div class="channeClumb">社交渠道推广</div>
                <div class="">
                	<div class="bshare-custom icon-medium-plus fl">
                    	<!--<a title="分享到微信" class="bshare-weixin"></a>
                        <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
                        <a title="分享到QQ空间" class="bshare-qzone"></a>
                        <a title="分享到网易微博" class="bshare-neteasemb"></a> 
                        <a title="分享到雪球" class="bshare-xueqiu"></a> -->
                    </div>
					<!--<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=1&amp;lang=zh"></script>
					<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
                    <script type="text/javascript" charset="utf-8">
						bShare.addEntry({
							title:"bShare分享快乐",
							summary:"中国最强大的社会化分享分享工具，邀请您来体验！",
							vUid:'' , vEmail:'', vTag:'BSHARE'
						});-->
								
                    <!--分享QQ-->
                    
                    <div class="fl">
                    	<!--<script type="text/javascript">
							(function(){
							var p = {
							url:location.href, /*获取URL，可加上来自分享到QQ标识，方便统计*/
							desc:'', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
							title:'', /*分享标题(可选)*/
							summary:'', /*分享摘要(可选)*/
							pics:'', /*分享图片(可选)*/
							flash: '', /*视频地址(可选)*/
							site:'', /*分享来源(可选) 如：QQ分享*/
							style:'201',
							width:32,
							height:32
							};
							var s = [];
							for(var i in p){
							s.push(i + '=' + encodeURIComponent(p[i]||''));
							}
							document.write(['<a class="qcShareQQDiv" href="http://connect.qq.com/widget/shareqq/index.html?',s.join('&'),'" target="_blank">分享到QQ</a>'].join(''));
							})();
						</script>
						<script src="http://connect.qq.com/widget/loader/loader.js" widget="shareqq" charset="utf-8"></script>-->
                    </div>
                    <div class="bashEmail fl">
                    	<!--<ul class="clear">
                            <li class="fl">
                                <div class="bashImg short"></div>
                                <div>短信</div>
                            </li>
                            <li class="fl">
                                <div class="bashImg email"></div>
                                <div>邮件</div>
                            </li>
                       	</ul>-->
                    </div>
                     <ul class="bdsharebuttonbox">
                    	<li id="codes" class="">
							<span><img src="${css_imagedomain}/front/images/canalsIcon1.png" /></span>
							微信
						</li>
						<li id="copy">
							 <span><a href="javascript:;">
								 <img src="${css_imagedomain}/front/images/canalsIcon6.png" onclick="url();"/>
							 </a></span>
							 复制链接
						</li>

						<!--<li>微信</li>
						<li>微博</li>
						<li>QQ空间</li>
						<li>网易</li>
						<li>雪球</li>
						<li>QQ</li>-->
					</ul>
                     <script>
						 $('#codes').click(function(){
							 weixin();
							 $('.ico_Close').show();
						 });

						function weixin(){
						$('.fz_mask').show();
						var inviteCode = $(".span_num").html();//获取验证码的值
						var url="${move_domain}"+"/toReg?inviteCode="+inviteCode;
						$("#codes").qrcode({
							render: "canvas",
							width: 200,
							height:200,
							text: url
						}).find('canvas').css({
											//"float":"left",
											"position":"fixed",
											".position":"absolute",
											"left":"50%",
											"top":"50%",
											"padding":"10px",
											"background":"#fff",
											"z-index":"2"
											}).addClass('canvas');
						};
					</script>

                </div>
            </div>
     
        </div>
    
    </div>

</div>
<script type="text/javascript">
	//返佣结算链接地址
	function rebate(){
		location.href="rebateSum";
    }
	//我要推荐链接地址
	function recommend(){
		location.href="rebate";
    }
	
	function url(){
		var inviteCode = $(".span_num").html();//获取验证码的值
		var url="http://"+location.host+"/toReg?inviteCode="+inviteCode;//链接地址
		$(".fz_input").val(url);
    }
	
	//赋值路径地址
	function addr(){
	 	var e=$(".fz_input").select();//对象是content
        document.execCommand("Copy"); //复制链接
        $('.Close').hide();	
	}
</script>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
</html>