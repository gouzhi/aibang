<%@ page language="java" pageEncoding="UTF-8"%>
<!--header Start-->
<script type="text/javascript" src="${css_imagedomain}/common/js/jquery.cookie.js"></script>
<link href="${css_imagedomain}/front/css/common.css" rel="stylesheet" type="text/css" />
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<!--顶部开始-->
<script>
	$(function(){
		/*顶部二维码*/
		$('.header_topR a').mouseover(function(){
			$('.header_topR a').children('img').hide();
			$(this).children('img').show();
		});
		$('.header_topR a').mouseout(function(){
			$(this).children('img').hide();
		});
		/*顶部二维码 End*/
		/*顶部搜索下拉*/
		$('.find .sub_nav li:last').hide();
		var flag = 0;
		$('.find .sub_nav li:first').click(function(){
			if(flag==0){
				$(this).next().show();
				flag=1;
			}
			else{
				$('.find .sub_nav li:last').hide();
				flag = 0;
			}
			$('.find .sub_nav li:last').click(function(){
				if($(this).text()== '投资'){
					$(this).text('教育').hide();
					$(this).prev().text('投资');
					flag=1;
				}
				else{
					$(this).text('投资');
					$(this).prev().text('教育');
				}

			});
		});
		
		//刷新页面获取显示最新消息
		
		$.ajax({
			   type: "POST",
			   data: "userid=${sessionUser.id}",
			   url: "http://${web_name}${web_domain}${project_name}/messageUpdate",
			   success: function(data){
			   }
		}); 
	});
</script>
<div class="header" style="background: #fff;">
	<div class="header_topW">
		<div class="header_top clear">
			<div class="header_topL fl">
				<p>
					<i class="vm"></i>
					<span class="vm fz12 color5">客服热线：</span>
					<strong class="vm fz14 color6">400&nbsp;826&nbsp;5000</strong>
					<span class="vm fz12 color5">(8:30-17:30)</span>
				</p>
			</div>
			<div class="header_topR fr">
				<div class="header_topR_w clear">
					<div class="find fl" style="margin-top: 7px;">
						<div class="clear" >
							<div class="pa fl" style="margin-left: -52px;">
							<ul class="sub_nav">
								<li>教育</li>
								<li>投资</li>
							</ul></div>
							<input type="text" value="" class="fl" id="search_text_id" />
							<div class="sou fl" onclick="search()"></div>

						</div>
					</div>
					<div class="fl">
						<ul class="clear">
							<li class="weibo pL20 pR10 fl">
								<a href="javascript:void(0);" target="_blank" class="pr">
									<img src="${css_imagedomain}/front/images/weibo.png" width="80" height="80" class="pa">
								</a>
							</li>
							<li class="weixin pR20 fl">
								<a href="javascript:void(0);" target="_blank" class="pr">
									<img src="${css_imagedomain}/front/images/weixin.jpg" width="80" height="80" class="pa">
								</a>
							</li>
							<c:if test="${empty sessionUser }">
								<li class="login pL20 h40 fl">
									<a onclick="directurl('http://${web_name}${web_domain}${project_name}/login')" href="javascript:void(0);" class="fz12 color7">
										<i class="vm"></i>
										<sub class="fz12 color7 pL5" >你好，请登录</sub>
									</a>
								</li>
								<li class="toreg pL20 h40 fl">
									<a onclick="directurl('http://${web_name}${web_domain}${project_name}/toReg')" href="javascript:void(0);" class="fz12 color7">
										<i class="vm"></i>
										<sub class="fz12 color7 pL5">免费注册</sub>
									</a>
								</li>
							</c:if>
							<c:if test="${not empty sessionUser }">
								<li class="toreg pL21 fl">
									<a 
										onclick="directurl('http://${web_name}${web_domain}${project_name}/user/center/accountall');"
										href="javascript:void(0);" 
										class="fz12 color14"
									>${sessionUser.username}</a>
								</li>
	                            <li class="toreg pL21 fl">
	                            	<a 
	                            		onclick="directurl('http://${web_name}${web_domain}${project_name}/user/message/page');"
	                            		href="javascript:void(0);" class="fz12 color14">消息&nbsp;<b class="fz12 color13">${unreadMessageCount}</b>
	                                	<!--<b class="pa">您有1条信息未读</b>-->
	                                </a>
	                            </li>
	                            <c:choose>
	                            	<c:when test="${not empty top}">
	                            		<li class="toreg pL21 fl">
	                            			<a href="${project_name}/${top}logout" class="fz12 color14">退出</a>
	                            		</li>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<li class="toreg pL21 fl">
	                            			<a
	                            				onclick="directurl('http://${web_name}${web_domain}${project_name}/logout');"
	                            				href="javascript:void(0);" class="fz12 color14">退出</a>
	                            		</li>
	                            	</c:otherwise>
	                            </c:choose>
	                         </c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="header_nav clear">
		<div class="header_navL fl">
			<a href="javascript:void(0);" onclick="directurl('${education_domain}');">
				<img src="${css_imagedomain}/front/images/logo.png" alt="logo" class="" />
			</a>
            <span>
            	<img src="${css_imagedomain}/front/images/logo_r.png" alt="" class="pL18" />
            </span>
		</div>
		<div class="header_navR fr">
			<a href="javascript:void(0);" id="accountall" onclick="directurl('${education_domain}');" class="fz16 color8 pL22 active">首页</a>
			<a href="javascript:void(0);" id="Financing" onclick="directurl('http://${web_name}${web_domain}');" class="fz16 color8 pL22 mL52">金融超市</a>
			<a href="javascript:void(0);" id="rongtoujinrong" onclick="directurl('${education_domain}rongtoujinrong/');" class="fz16 color8 pL22 mL52">理财资讯</a>
			<a href="javascript:void(0);" id="HuafaxCifexSay" onclick="directurl('${education_domain}HuafaxCifexSay/');" class="fz16 color8 pL22 mL52">华金说说说</a>
			<a href="javascript:void(0);" id="note" onclick="directurl('${education_domain}note/');" class="fz16 color8 pL22 mL52">公告专区</a>
		</div>
	</div>
<script>
$(function(){
	//var currentUrl=parent.window.location.href;
	//var currentUrl=window.location.href;
	    var currentUrl = getParentUrl();
	    function getParentUrl() {
			var url = null;
			if (parent !== window) {
				try {
					url = parent.location.href;
				} catch (e) {
					url = document.referrer;
				}
			}else
			{
				url=window.location.href;
			}
			return url;
		}
		$('.header_navR a').removeClass('active');
		if (currentUrl.indexOf("${web_name}${web_domain}") != -1) {
			//alert('${web_name}${web_domain}');
			//alert('${education_domain}');
			$("#Financing").addClass('active');
		}
		else if (currentUrl.indexOf("/rongtoujinrong") != -1) {
			$("#rongtoujinrong").addClass('active');
		} else if (currentUrl.indexOf("/HuafaxCifexSay") != -1) {
			$("#HuafaxCifexSay").addClass('active');
		} else if (currentUrl.indexOf("/note") != -1) {
			$("#note").addClass('active');
		} else if(currentUrl.indexOf(".html") != -1)
		{
		   $("#rongtoujinrong").addClass('active');
		}
		else {
			$("#accountall").addClass('active');
		}
		if($('#Left_nav').length == 1){
			$('.header_navR a').removeClass('active');
		}

	});
</script>
</div>
<!--顶部结束-->


<script>

	function search(){
		var souInput=$('.find .sub_nav li:last').text();
		var bname=$("#search_text_id").val();
		
		if(souInput=="投资"){
			//window.location.href="${project_name}/borrow/list.do?bname="+encodeURI(bname);
			directurl('http://${web_name}${web_domain}${project_name}/contentExt/contentExtLsit.do?title='+encodeURI(bname));

		}else {
			directurl('http://${web_name}${web_domain}${project_name}/borrow/list.do?bname='+encodeURI(bname));
		}
	}
	function directurl(url){

		top.window.location.href=url;
	}
	$(function(){
		$('.weixin a').mouseover(function(){
			$(this).children().show();
		});
		$('.weixin a').mouseout(function(){
			$(this).children().hide();
		});
	});
	function converge(title){
		directurl('http://${web_name}${web_domain}${project_name}/contentExt/converge.do?title='+encodeURI(title));
	}
</script>
<!--nav End-->