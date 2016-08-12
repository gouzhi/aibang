<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<title>华金所_产品列表</title>
		<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
		<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
		<script src="${css_imagedomain}/move/js/iscroll.js" type="text/javascript"></script>
	</head>
	<body>
	
	<input id="nav_point" type="hidden" value="产品列表">
	 <jsp:useBean id="now" class="java.util.Date" />
     <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>
	<div class="wapOutside">
	
<form id="form" action="${project_name}/borrow/list.do" method="post">   
    <div class="searchBg">
	    <div class="searchBor"><span class="glyphicon-search"></span>
	      <input type="search"  name="bname" value="${hjsBorrowQuery.bname}" autocomplete="off" class="searchInput" id="proSearch"/>
	      <span class="glyphicon-remove-sign"></span>
	    </div>
	    <div class="searchBack" onclick="submitForm()">确定</div>
    </div>
 <input type="hidden" name="pageNumber" value="${hjsBorrowQuery.pageNumber}" />
  <div class="proSmallNavOut">
		  <ul class="proListSmallNav clearFix">
			  <li><span class="arrowDown"></span>
				  <p id="borrowApr">
					  <c:if test="${hjsBorrowQuery.borrowAprContext eq null || hjsBorrowQuery.borrowAprContext eq ''}">年化收益</c:if>
					  <c:if test="${hjsBorrowQuery.borrowAprContext ne null}">${hjsBorrowQuery.borrowAprContext}</c:if>
				  </p>
			  </li>
			  <li><span class="arrowDown"></span>
				  <p id="borrowPeriod">
					  <c:if test="${hjsBorrowQuery.borrowPeriodContext eq null || hjsBorrowQuery.borrowPeriodContext eq ''}">投资期限</c:if>
					  <c:if test="${hjsBorrowQuery.borrowPeriodContext ne null}">${hjsBorrowQuery.borrowPeriodContext}</c:if>
				  </p>
			  </li>
			  <li><span class="arrowDown"></span>
				  <p id="verifyStatus">
					  <c:if test="${hjsBorrowQuery.verifyStatusContext eq null || hjsBorrowQuery.verifyStatusContext eq ''}">投资状态</c:if>
					  <c:if test="${hjsBorrowQuery.verifyStatusContext ne null}">${hjsBorrowQuery.verifyStatusContext}</c:if>
				  </p>
			  </li>
		  </ul>
  </div>
	  <div class="proListSmallCon">
		  <ul>
			  <li>全部</li>
			  <li>9%以下</li>
			  <li>9%-10%</li>
			  <li>10%-11%</li>
			  <li>11%-12%</li>
			  <li>12%以上</li>
			  <input type="hidden" name="borrowAprMin" value="${hjsBorrowQuery.borrowAprMin}"/>
			  <input type="hidden" name="borrowAprMax" value="${hjsBorrowQuery.borrowAprMax}"/>
			  <input type="hidden" name="borrowAprContext" value="${hjsBorrowQuery.borrowAprContext}"/>
		  </ul>
		  <ul>
			  <li>全部</li>
			  <li>6个月以下</li>
			  <li>6-12个月</li>
			  <li>12个月以上</li>
			  <input type="hidden" name="borrowPeriodMin" value="${hjsBorrowQuery.borrowPeriodMin}"/>
			  <input type="hidden" name="borrowPeriodMax" value="${hjsBorrowQuery.borrowPeriodMax}"/>
			  <input type="hidden" name="borrowPeriodContext" value="${hjsBorrowQuery.borrowPeriodContext}"/>
		  </ul>
		  <ul>
			  <li>全部</li>
			  <li id="1">可投资</li>
			  <li id="2">投资结束</li>
			  <li id="3">还款中</li>
			  <li id="4">已结清</li>
			  <input type="hidden" name="investTag" value="${investTag}"/>
			  <input type="hidden" name="verifyStatusContext" value="${hjsBorrowQuery.verifyStatusContext}"/>
		  </ul>
	  </div>
  </form>
  
  <div id="proWrapper">
    <div id="scroller">
      <c:choose>
	        <c:when test="${not empty page.result }">
	          <div id="pullDown"> <span class="pullDownIcon"></span><span class="pullDownLabel"></span> </div>
			      <div class="proDlList" id="thelist">
			       <c:forEach items="${page.result }" var="item">
			             <fmt:formatDate value="${item.TENDER_END_TIME}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="tenderEndTime"/>
			             <fmt:formatDate value="${item.TENDER_START_TIME}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="tenderStartTime"/>
				         <dl>
				          <dt>
				             <a href="${project_name}/borrow/proDetails.do?borrowId=${item.ID}">
				                  ${item.B_NAME}
				                  <c:if test="${item.BORROW_TYPE eq 8 }">
				                     <span>新客专享</span>
				                  </c:if>
				             </a>
				          </dt>
				          <dd id="ddList">
				            <p><span class="orangeF"><b>${item.BORROW_APR}</b>％</span>预期年化收益率</p>
				            <p><span class="grayF"><b>${item.BORROW_PERIOD}</b>${item.REPAY_TYPE==1?'个月':'天'}</span>投资期限</p>
				          <c:choose>

                            <c:when test="${item.VERIFY_STATUS eq 2 && today >= tenderStartTime && today <= tenderEndTime && item.BORROW_ACCOUNT_YES lt item.ACCOUNT}">
                              <p class="pBtn mobile_sub"><a href="${project_name}/borrow/proDetails.do?borrowId=${item.ID}">立即投资</a></p>
                            </c:when>
                           
                             <c:when test="${(item.VERIFY_STATUS eq 3 || item.VERIFY_STATUS eq 6||item.VERIFY_STATUS eq 12 || item.VERIFY_STATUS eq 13 || item.VERIFY_STATUS eq 4) || (item.VERIFY_STATUS eq 2 && today > tenderEndTime) || (item.VERIFY_STATUS eq 2 && item.TENDER_SCALE eq 100 ) }">
                              <p class="pBtn btnGray"><a href="${project_name}/borrow/proDetails.do?borrowId=${item.ID}">投资结束</a></p>
                            </c:when>
                            
                             <c:when test="${item.VERIFY_STATUS eq 5 || item.VERIFY_STATUS eq 11}">
                              <p class="pBtn btnGray"><a href="${project_name}/borrow/proDetails.do?borrowId=${item.ID}">还款中</a></p>
                            </c:when>
                            
                            <c:when test="${item.VERIFY_STATUS eq 8 || item.VERIFY_STATUS eq 10}">
                              <p class="pBtn btnGray"><a href="${project_name}/borrow/proDetails.do?borrowId=${item.ID}">已结清</a></p>
                            </c:when>
                            <c:when test="${item.VERIFY_STATUS eq 2 && today < tenderStartTime }">
                                    <p class="pBtn btnGray" name="time-item" id="${item.ID}">
									    <input type="hidden" class="intDiff" value="${item.intDiff}" />
                                        <a href="${project_name}/borrow/proDetails.do?borrowId=${item.ID}" class="formatTime"></a>
                                    </p>
                            </c:when>
                          </c:choose>
				          
				           
				          </dd>
				        </dl>
			       </c:forEach>
			      </div>
			    <%--   <c:if test="${page.pageCount gt 1}"> --%>
			          <div id="pullUp"><span class="pullUpIcon"></span><span class="pullUpLabel"></span> </div>
			    <%--   </c:if> --%>
	        </c:when>
	      <c:otherwise>
                   <dl class="searchNo">
                       <dt><img src="${css_imagedomain}/move/images/searchNo1.png" /></dt>
                       <dd>暂时没有搜索到您要的数据!</dd>
                   </dl>  
          </c:otherwise>
      </c:choose>
      
    </div>
    <div class="myScrollbarV">
      <div></div>
    </div>
  </div>
  <%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</div>
	<div class="floatBBg2"></div>
</body>
</html>
<script type="text/javascript">
var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;
/**
 * 下拉刷新 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
function pullDownAction () {
	setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
		window.location.href="${project_name}/borrow/list.do";
	}, 1000);	
}

/**
 * 滚动翻页 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
function pullUpAction () {
	setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
		var el, li, i;
		el = document.getElementById('thelist');
		 $.ajax({
			type: "POST",
			url: "list1.do",
			data:$('#form').serialize(),
			dataType:'json',
			cache: false,
			success: function(data){
				if(data.result=="3"){
					alert("没有更多了！！！");
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '没有更多了！！！！';	
					return ;
				}
				for (i=0; i<data.page.result.length; i++) {
					li = document.createElement('dl');
					var str=data.page.result[i].REPAY_TYPE;
					if(str=="1"){
						str="个月";
					}else{
						str="天";
					}
					var borrow=data.page.result[i];
					var url="${project_name}/borrow/proDetails.do?borrowId="+borrow.ID;
					if(borrow.VERIFY_STATUS==2 && getTodayFormat() >= borrow.TENDER_START_TIME && getTodayFormat()<=borrow.TENDER_END_TIME && borrow.BORROW_ACCOUNT_YES<borrow.ACCOUNT){
							li.innerHTML="<dt><a href="+url+">"+borrow.B_NAME+"</a></dt><dd><p><span class='orangeF'><b>"+borrow.BORROW_APR+"</b>%</span>预期年化收益率</p><p><span class='grayF'><b>"+borrow.BORROW_PERIOD+str+"</b></span>投资期限</p><p class='pBtn mobile_sub'><a href="+url+">立即投资</a></p></dd>";
					}else if((borrow.VERIFY_STATUS==3 || borrow.VERIFY_STATUS==6||borrow.VERIFY_STATUS==12 || borrow.VERIFY_STATUS==13 || borrow.VERIFY_STATUS==4) || (borrow.VERIFY_STATUS==2 && getTodayFormat() > borrow.TENDER_END_TIME) || (borrow.VERIFY_STATUS==2 && borrow.TENDER_SCALE==100 )){
						li.innerHTML="<dt><a href="+url+">"+borrow.B_NAME+"</a></dt><dd><p><span class='orangeF'><b>"+borrow.BORROW_APR+"</b>%</span>预期年化收益率</p><p><span class='grayF'><b>"+borrow.BORROW_PERIOD+str+"</b></span>投资期限</p><p class='pBtn btnGray'><a href="+url+">投资结束</a></p></dd>";
					} else if(borrow.VERIFY_STATUS==5 || borrow.VERIFY_STATUS==11){
						li.innerHTML="<dt><a href="+url+">"+borrow.B_NAME+"</a></dt><dd><p><span class='orangeF'><b>"+borrow.BORROW_APR+"</b>%</span>预期年化收益率</p><p><span class='grayF'><b>"+borrow.BORROW_PERIOD+str+"</b></span>投资期限</p><p class='pBtn btnGray'><a href="+url+">还款中</a></p></dd>";
					}else if(borrow.VERIFY_STATUS==8 || borrow.VERIFY_STATUS==10){
						li.innerHTML="<dt><a href="+url+">"+borrow.B_NAME+"</a></dt><dd><p><span class='orangeF'><b>"+borrow.BORROW_APR+"</b>%</span>预期年化收益率</p><p><span class='grayF'><b>"+borrow.BORROW_PERIOD+str+"</b></span>投资期限</p><p class='pBtn btnGray'><a href="+url+">已结清</a></p></dd>";
					}else if(borrow.VERIFY_STATUS==2 && getTodayFormat() < borrow.TENDER_START_TIME ){
						var val="<input type='hidden' class='intDiff' value="+borrow.intDiff+" /><a href='${project_name}/borrow/proDetails.do?borrowId="+borrow.ID+"' class='formatTime'></a>";
						li.innerHTML="<dt><a href="+url+">"+borrow.B_NAME+"</a></dt><dd><p><span class='orangeF'><b>"+borrow.BORROW_APR+"</b>%</span>预期年化收益率</p><p><span class='grayF'><b>"+borrow.BORROW_PERIOD+str+"</b></span>投资期限</p><p class='pBtn btnGray' name='time-item' id="+borrow.ID+">"+val+"</p></dd>";
						
					}
					el.appendChild(li, el.childNodes[0]);
				}
				$("input[name='pageNumber']").val(data.page.pageNumber);
				myScroll.refresh();	
				getT();
			}
		});
	
	 	// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
	}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
}
/**
 * 初始化iScroll控件
 */
function loaded() {
	pullDownEl = document.getElementById('pullDown');
	pullDownOffset = pullDownEl.offsetHeight;
	pullUpEl = document.getElementById('pullUp');	
	pullUpOffset = pullUpEl.offsetHeight;
	
	myScroll = new iScroll('proWrapper', {
		scrollbarClass: 'myScrollbar', /* 重要样式 */
		useTransition: false, /* 此属性不知用意，本人从true改为false */
		topOffset: pullDownOffset,
		onRefresh: function () {
			if (pullDownEl.className.match('loading')) {
				pullDownEl.className = '';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
			} else if (pullUpEl.className.match('loading')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
			}
		},
		onScrollMove: function () {
			if (this.y > 5 && !pullDownEl.className.match('flip')) {
				pullDownEl.className = 'flip';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...';
				this.minScrollY = 0;
			} else if (this.y < 5 && pullDownEl.className.match('flip')) {
				pullDownEl.className = '';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
				this.minScrollY = -pullDownOffset;
			} else if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
				this.maxScrollY = this.maxScrollY;
			} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
				this.maxScrollY = pullUpOffset;
			}
		},
		onScrollEnd: function () {
			if (pullDownEl.className.match('flip')) {
				pullDownEl.className = 'loading';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';				
				pullDownAction();	// Execute custom function (ajax call?)
			} else if (pullUpEl.className.match('flip')) {
				pullUpEl.className = 'loading';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';				
				pullUpAction();	// Execute custom function (ajax call?)
			}
		}
	});
	setTimeout(function () { document.getElementById('proWrapper').style.left = '0'; }, 800);
}
//初始化绑定iScroll控件 
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded', loaded, false); 

function getTodayFormat(){
	var date = new Date(); 
	var mon = date.getMonth() + 1;
	var day = date.getDate();
	var nowDay = date.getFullYear() + "-" + (mon<10?"0"+mon:mon) + "-" +(day<10?"0"+day:day);
	return nowDay;
}
/* $(function(){
	$("input[name='bname']").focus(function(){
		$(this).val("");
	});
	$("input[name='bname']").blur(function(){
		var value=$(this).val().trim();
		if(value==""||value==null){
			$(this).val('搜索产品');
		}else{
			$(this).val(value);
		}
	});
}); */

$('.proListSmallNav li').click(function(){
		$('.floatBBg2').css('display','block');
		var nIndex=$(this).index();
		$(this).addClass('hoverLi').siblings().removeClass('hoverLi');
		$(this).find('span').removeClass('arrowDown').addClass('arrowUp').parent().siblings().find('span').removeClass('arrowUp').addClass('arrowDown');
		$('.proListSmallCon').find('ul').eq(nIndex).css('display','block').siblings().css('display','none');
		var oLi=$('.proListSmallCon ul').find('li');
		oLi.bind({
			mouseover:function(){$(this).addClass('okBg');},
			mouseout:function(){$(this).removeClass('okBg');},
			click:function(){
				$(this).parent().css('display','none');
				var str=$(this).html();
				$('.hoverLi p').html(str).parent().removeClass('hoverLi').find('span').removeClass('arrowUp').addClass('arrowDown');
				$('.floatBBg2').css('display','none');
				if(nIndex==0){//年化收益
						if(str.indexOf("-")>0){//包含“-”
						  $("input[name='borrowAprContext']").val(str);
					      $("input[name='borrowAprMin']").val(str.substring(0,str.indexOf("-")-1));
					      $("input[name='borrowAprMax']").val(str.substring(str.indexOf("-")+1,str.lastIndexOf("%")));
						}else if((str.indexOf("-")==-1)&&(str.indexOf("上")>0)){//不包含“-”
							$("input[name='borrowAprContext']").val(str);
							$("input[name='borrowAprMin']").val("");
					        $("input[name='borrowAprMax']").val(str.substring(0,str.indexOf("%")));
					    }else if((str.indexOf("-")==-1)&&(str.indexOf("下")>0)){
					    	$("input[name='borrowAprContext']").val(str);
					    	$("input[name='borrowAprMin']").val(str.substring(0,str.indexOf("%")));
					        $("input[name='borrowAprMax']").val("");
					    }else if(str=="全部"){
					    	$("input[name='borrowAprContext']").val("全部");
							$("input[name='borrowAprMin']").val("");
					        $("input[name='borrowAprMax']").val("");
						}else{
							$("input[name='borrowAprContext']").val("年化收益");
							$("input[name='borrowAprMin']").val("");
					        $("input[name='borrowAprMax']").val("");
						}
					       submitForm();
			 }
			 if(nIndex==1){//投资期限
				  if(str.indexOf("-")>0){//包含“-”
					   $("input[name='borrowPeriodContext']").val(str);
				       $("input[name='borrowPeriodMin']").val(str.substring(0,str.indexOf("-")));
				       $("input[name='borrowPeriodMax']").val(str.substring(str.indexOf("-")+1,str.lastIndexOf("个")));
					}else if((str.indexOf("-")==-1)&&(str.indexOf("上")>0)){//不包含“-”
						$("input[name='borrowPeriodContext']").val(str);
						$("input[name='borrowPeriodMin']").val("");
				        $("input[name='borrowPeriodMax']").val(str.substring(0,str.indexOf("个")));
			        }else if((str.indexOf("-")==-1)&&(str.indexOf("下")>0)){
			     	    $("input[name='borrowPeriodContext']").val(str);
			     	    $("input[name='borrowPeriodMin']").val(str.substring(0,str.indexOf("个")));
				        $("input[name='borrowPeriodMax']").val("");
			        }else if(str=="全部"){
			     	    $("input[name='borrowPeriodContext']").val("全部");
						$("input[name='borrowPeriodMin']").val("");
				        $("input[name='borrowPeriodMax']").val("");
					}else{
						$("input[name='borrowPeriodContext']").val("投资期限");
						$("input[name='borrowPeriodMin']").val("");
				        $("input[name='borrowPeriodMax']").val("");
					}
			       submitForm();
			}
			if(nIndex==2){//投资状态
				$("input[name='investTag']").val($(this).attr("id"));
				$("input[name='verifyStatusContext']").val(str);
		        submitForm();
			}
		 }
		})		
	});
	
//提交表单
function submitForm(){
    $("input[name='pageNumber']").val(1);
	$("#form").submit();
}


$(function(){
	getT();
});

//提交表单
function submitForm(){
    $("input[name='pageNumber']").val(1);
	$("#form").submit();
}

 function getT(){
		var str="";
		if($("#thelist").find("p[name='time-item']").length>0){
			$("#thelist").find("p[name='time-item']").each(function(){
				var ms=$(this).find(".intDiff").val();
				var formatTime=$(this).find(".formatTime");
				var object=$(this);
				window.setInterval(function(){
					 var day=0,
						hour=0,
						minute=0,milliSecond=0,
						second=0;//时间默认值		
						var mi =60;  
						var hh = mi * 60;  
						var dd = hh * 24;  
					if(ms > 0){
						day = Math.floor(ms / (dd));
						hour = Math.floor((ms - day * dd) / hh);
						minute = Math.floor((ms - day * dd - hour * hh) / mi);
						second = Math.floor(ms - day * dd - hour * hh - minute * mi);
					}else{//倒计时结束
						object.parent().append("<div class='span5'><a href='borrowInfo/detail.do?borrowId="+object.attr("id")+"'class='fz16 color0 start'>立即11投资</a></div>");
					    object.remove();
						return ;
					}
					if (minute <= 9) {minute = '0' + minute;}
					if (second <= 9) {second = '0' + second;}
				    if(day>0){
				    	str=str+day+"天";
				    }
				    if(hour>=0){
				    	str=str+hour+'时';
				    }
				    if(minute>=0){
				    	str=str+minute+'分';
				    }
				    if(second>=0){
				    	str=str+second+'秒';
				    }
					formatTime.html(str);
					ms--;
					str="";
					}, 1000);
			});
		}
 }
</script>
