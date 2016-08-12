<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
	  <title>账户总览 - 华金所</title>
	  <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="${css_imagedomain}/front/js/html5shiv.min.js"></script>
		  <script src="${css_imagedomain}/front/js/respond.min.js"></script>
		<![endif]-->
		<!-- ECharts单文件引入 -->
		<script src="${css_imagedomain}/front/js/echarts.js"></script>
		<script src="${css_imagedomain}/front/js/blue.js"></script>
	  <link href="${css_imagedomain}/front/css/overview.css" rel="stylesheet" type="text/css" />
	  <link href="${css_imagedomain}/front/css/mask.css" rel="stylesheet" type="text/css" />
</head> 
<body> 
<!--<div class="bindingMask" style="display:none;"></div>
<div class="binding" style="display:none;">
	<h3 class="color5 pr">提示<span class="off pa">x</span></h3>
	<p class="color5">您未开通第三方托管账户<br /><span>请先开通后再进行操作</span></p>
    <a href="${project_name}/user/customer/toActivateName" class="open recharge_open">开通理财账户</a>
</div>-->
<div id="cashMask" class="cashMask" style="display:none;">
	<i class="tishi"></i>
	<span class="off pa">x</span>
	<h3><span>提示</span></h3>
	<p class="top">您未开通第三方托管账户</p>
	<p class="bot">请先开通后再进行操作</p>
	<a  href="${project_name}/user/customer/toBindBank" class="open recharge_open">绑定银行卡</a>
</div>
<div id="cashMaskSuccess" class="cashMask" style="display:none;">
	<h3 class="color5 pr">提示<span id="closeBind" class="off fzw fz18 pa">x</span></h3>
	<p class="color5">操作完成，去提现</p>
    <a href="javascript:void(0);" onclick="checkBank();" class="">去提现</a>
</div>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>

<!--账户总览主体-->
<div class="accountContent_wrap" style="width:100%;background: #e8e8e8;">
<div class="accountContent clear">
	<div class="icoPoint" id="nav_point">
		<span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> > </i>
		<span><a href="/user/center/accountall" style="font-size: 14px;color:#777;">账户总览</a></span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
    <div class="account-Right fl">
    	<c:if test="${!hasHF}">
			<h3 class="account-RightH">您的第三方资金托管账户，尚未开通！ 开通后即可领取相关奖励哦！<a href="${project_name}/user/customer/toSafe">立即开通</a> </h3>
		</c:if>
    	<div class="accuntR-one clear">
  			<div class="oneLeft fl">
            	<div class="clear" style="margin-top: 10px;">
                    <div class="oneLeft1 fl">
                       <c:if test="${empty userInfo.headPic }">
						 <div style="width:82px;height:82px;border-radius: 50%;overflow: hidden; background: #eeeeee;">
                         	<img src="${css_imagedomain}/front/images/head.png" width="82" height="82" />
						 </div>
				</c:if>
                       <c:if test="${!empty userInfo.headPic }">
						   <div style="width:82px;height:82px;border-radius: 50%;overflow: hidden;">
                             <img src="${imagedomainpublic}${userInfo.headPic }" width="82" height="82" />
					     </div>
				</c:if>
                        <%--<p><a href="${project_name}/user/customer/toPersonal">修改资料</a></p>--%>
                    </div>
                    <div class="oneLeft2 fl">
						<p>
							<span class="tit">我的账户：</span>
							<span class="con">${loginUser.username }</span>
							<a href="${project_name}/user/customer/toPersonal">[修改资料]</a>
						</p>
						<p class="star_P">
							<span class="tit">账户安全：</span>
							<span class="starS star_${safeLevel}d0"></span>
							<a href="${project_name}/user/customer/toSafe">[提升]</a>
						</p>
						<p class="star_P">
							<span class="tit">汇付账户：</span>
							<span class="con">${loginUser.nrpUsrId}</span>
						</p>
					</div>
                </div>
            </div>
            <div class="oneCenter fl">
            	<%--<p class="star_P">--%>
                	<%--<a href="#" class="fl">账户安全：</a>--%>
                    <%--<span class="star_${safeLevel}d0"></span>--%>
                <%--</p>--%>
                <%-- <p>汇付账户：<i>bjqc_136800</i></p> --%>
            </div>
            <div class="oneRight fl">
            	<p>
                	账户余额：<span class="star-value-no"><i>${userBase.balance }</i>&nbsp;元</span>
                </p>
               <div class="balanceB">
                	<a id="recharge" onclick="recharge()" class="recharges" >充值</a>
                	<c:if test="${hasHF}">
                	<c:if test="${!hasBank}">
                		<a id="cash" class="cash" href="javascript:void(0);">提现</a>
                	</c:if>
                	<c:if test="${hasBank}">
                		<a class="cash" href="${project_name}/user/cash/main" target="_blank">提现</a>
                	</c:if>     
                	</c:if>
                	<c:if test="${!hasHF}">
                		<a id="bangdinghf" class="cash" href="javascript:void(0);">提现</a>  
                	</c:if>         
                </div>
            </div>
        </div>
        <div class="accuntR-two">
        	<ul class="twoList clear">

                <%----%>
				<li>
					<p class="titP titP1">资产总额</p>
					<p class="conP"><span>${userBase.total }</span>&nbsp;元</p>

				</li>
					<li>
						<p class="titP titP2">冻结金额</p>
						<p class="conP"><span>${userBase.frost }</span>&nbsp;元</p>

					</li>
					<li>
						<p class="titP titP3">待收收益</p>
						<p class="conP"><span>${userBase.awaitInterest }</span>&nbsp;元</p>

					</li>
					<li>
						<p class="titP titP4">待收本金</p>
						<p class="conP"><span>${userBase.awaitCapital }</span>&nbsp;元</p>

					</li>
				<%--<li>资产总额：<span>${userBase.total }</span>元</li>--%>
                <%--<li>冻结金额：<span>${userBase.frost }</span>元</li>--%>
                <%--<li>待收收益：<span>${userBase.awaitInterest }</span>元</li>--%>
                <%--<li>待收本金：<span>${userBase.awaitCapital }</span>元</li>--%>
            </ul>
        </div>
       <!-- <c:if test="${!hasHF or !hasBank}">
	        <div class="accuntR-three pr">
	        	<ul class="threeList clear">
	            	<li>
                		<div class="threeTOP real">汇付天下</div>
                    	<p>第三方托管账户，全面管理平台资金</p>
                    	<c:if test="${hasHF }">
                    		<div class="state"><a href="javascript:void(0);" class="finish">已完成</a></div>
                    	</c:if>
                    	<c:if test="${!hasHF }">
                    		<div class="state"><a href="${project_name}/user/customer/toSafe" class="unfinish">未完成</a></div>
                    	</c:if>
                    	
                	</li>
	                <li>
	                	<div class="threeTOP bind">绑定银行卡</div>
	                    <p>绑定后，可进行充值提现</p>
	                    
	                    <c:if test="${hasBank}">
	                      <div class="state"><a href="javascript:void(0)" class="finish">已完成</a></div>
	                    </c:if>
	                    <c:if test="${!hasBank}">
	                      <div class="state"><a href="${project_name}/user/customer/toSafe" class="unfinish">未完成</a></div>
	                    </c:if>                  
	                </li>
	            </ul>
	            <p class="ready pa">投资前准备</p>
	        </div>
        </c:if>-->
        
        <div class="accuntR-four">
        	<div class="fourTab">
            	<span class="actTab fl">持有中的投资</span>
                <span class="fl ">已结清的投资</span>
                <a href="${project_name}/user/invest/investHaving" class="fr">更多投资&nbsp;&nbsp;&gt;</a>
            </div>
            <div class="tableDiv" style="display:block;">
                <ul class="ulHeader">
                    <li>
                        <span class="sp2">投资名称</span>
                        <span class="sp3">投资金额(元)</span>
                        <span class="sp4">年化收益</span>
                        <span class="sp5">投资时间</span>
                        <span class="sp7">期限</span>
                        <span class="sp8">操作</span> 
                    </li>
                </ul>
                <ul class="ulTable" >
                   
	                    <c:forEach items="${pageTendering.result }" var="item">
	                     <li> 
	                        <span class="sp2">${item.B_NAME }</span>
	                        <span class="sp3">${item.TENDER_ACCOUNT }</span>
	                        <span class="sp4">${item.BORROW_APR }%</span>
	                        <span class="sp5"><fmt:formatDate value="${item.BORROW_START_TIME}" pattern="yyyy-MM-dd"/> </span>
	                        <span class="sp7">
	                        <c:if test="${item.REPAY_TYPE eq '1'}">
	                        ${item.BORROW_PERIOD}个月
	                        </c:if>
	                        <c:if test="${item.REPAY_TYPE eq '2'}">
	                        ${item.BORROW_PERIOD}天
	                        </c:if>
	                        </span>
	                        <span class="sp8"><a href="${project_name}/user/invest/investHavingDetail?tId=${item.ID}">详情</a></span>
	                            </li>
	                    </c:forEach>
                
                </ul>
            </div>
            <div  class="tableDiv">
               <ul class="ulHeader">
                     <li>
                        <span class="sp2">投资名称</span>
                        <span class="sp3">到期时间</span>
                        <span class="sp4">投资金额(元)</span>
                        <span class="sp5">已回款</span>
                        <span class="sp7">期限</span>
                        <span class="sp8">操作</span> 
                    </li> 
                 </ul>
                <ul class="ulTable">
                
                        <c:forEach items="${pageTendered.result }" var="item">
                            <li> 
	                        <span class="sp2">${item.B_NAME }</span>
	                        <span class="sp3"><fmt:formatDate value="${item.REPAY_TIME_YES}" pattern="yyyy年MM月dd日"/> </span>
	                        <span class="sp4">${item.TENDER_ACCOUNT }</span>
	                        <span class="sp5">${item.RECOVER_ACCOUNT_ALL }</span>
	                        <span class="sp7"> <c:if test="${item.REPAY_TYPE eq '1'}">
	                        ${item.BORROW_PERIOD}个月
	                        </c:if>
	                        <c:if test="${item.REPAY_TYPE eq '2'}">
	                        ${item.BORROW_PERIOD}天
	                        </c:if></span>
	                        <span class="sp8"><a href="${project_name}/user/invest/investOverDetail?tId=${item.ID}">详情</a></span> 
	                           </li>
                        </c:forEach>    
                 
                </ul>
            </div>
        </div>
        <div class="accuntR-five">
        	<div class="fiveHead clear">
            	<span class="">收益统计</span>
           		<!--<select>
                	<option>近七日</option>
                    <option>近30日</option>
                </select>-->
               <!--  <select id="interestType" class="fr">
                   <option value="">全部</option>
                   <option value="11">P2P理财</option>
                   <option value="30">基金理财</option>
               </select> -->
        	</div>
            <div class="fiveChart clear">
            	<div class="chartLeft fl" style="width:630px;">
                <div id="main" style="width:630px;height:300px"></div>
	                <script type="text/javascript"> 
	                function recharge(){
				        	  if('${userBase.usrCustId}'){
				        		 location.href="${project_name}/user/recharge/main";
				        	 }else{
				        		 $('.bindingMask').show();	
				        		 $('.binding').show();
				        		 $('.off').click(function(){
				        				$('.bindingMask').hide();	
				        				$('.binding').hide();
				        				$('.cashMask').hide();
				        			});  
				        	 }
	                }
				         $(function () { 
							  /* $("#interestType").change(function(){
								  loadMyChart($(this).val());
							  }); */
							  loadMyChart(11);
				          });   
				        
				         //加载收益统计图表
				         function loadMyChart(type)
				         {
				        	  var myChart = echarts.init(document.getElementById('main')); 
							  myChart.setTheme(theme);
							  var option = {
									tooltip : {
										trigger: 'axis'
									}, 
									toolbox: {
										show : false,
										feature : {
											mark : {show: true},
											dataView : {show: true, readOnly: false},
											magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
											restore : {show: true},
											saveAsImage : {show: true}
										}
									},
									calculable : true,
									xAxis : [
										{
											type : 'category',
											boundaryGap : false,
											data : []
										}
									],
									yAxis : [
										{
											type : 'value'
										}
									],
									series : [
										{
											name:'收益',
											type:'line',
											stack: '金额',
											data:[]
										} 
									]
								};
							  $.get("accountchart?type="+type,
									  function(rs)
									  { 
										  $("#sumInterest").text(rs.sumInterest);
										  $("#toDayInterest").text(rs.toDayInterest);
										  if(rs.chartList.length!=0)
										  {
											  for(var i=0;i<rs.chartList.length;i++)
											  {
												  option.xAxis[0].data.push(rs.chartList[i].INTEREST_DATE);
												  option.series[0].data.push(rs.chartList[i].SUM_INTEREST.toFixed(2));
											  }
										  }else
										  {
											  var myDate = new Date();
											  option.xAxis[0].data.push(0);
											  option.series[0].data.push("0.00");
											  option.xAxis[0].data.push(getNowFormatDate());
											  option.series[0].data.push("0.00");
										  }
									      // 为echarts对象加载数据 
						        	      myChart.setOption(option);  
									  },"json");
				         }
				         
				         
				         function getNowFormatDate() {
				        	    var date = new Date();
				        	    var seperator1 = "-";
				        	    var seperator2 = ":";
				        	    var year = date.getFullYear();
				        	    var month = date.getMonth() + 1;
				        	    var strDate = date.getDate();
				        	    if (month >= 1 && month <= 9) {
				        	        month = "0" + month;
				        	    }
				        	    if (strDate >= 0 && strDate <= 9) {
				        	        strDate = "0" + strDate;
				        	    }
				        	    var currentdate = year +"" + month  + strDate;
				        	    return currentdate;
				        	}
				        //提现点击事件
				         $('#cash').click(function(){
				     		$('.bindingMask').show();	
				     		$('#cashMask').show();		
				     	});
				        //提现点击事件bangdinghf
				         $('#bangdinghf').click(function(){
				        	 $('.bindingMask').show();	
			        		 $('.binding').show();
			        		 $('.off').click(function(){
			        				$('.bindingMask').hide();	
			        				$('.binding').hide();
			        				$('.cashMask').hide();
			        			});  	
				     	});
				        //点击关闭
				         $('.off').click(function(){
				     		$('.bindingMask').hide();	
				     		$('.binding').hide();
				     		$('#cashMask').hide();
				     		$('#cashMaskSuccess').hide();
				     	});
				         //点击绑卡
				         $('#bindBank').click(function(){
				        	 $('#cashMask').hide(); 
				        	 $('#cashMaskSuccess').show();
				         });
				         //绑定成功点击关闭
				         $('#closeBind').click(function(){
				        	$('.bindingMask').hide();	
					     	$('.binding').hide();
					     	$('#cashMask').hide();
					     	$('#cashMaskSuccess').hide();
				        	document.location.reload(); 
				         });
				         
				         function checkBank(){
				        	 $.get("checkBankBind",
									  function(rs)
									  { 
										 if(rs.result==true){
											 document.location.href="${project_name}/user/cash/main";
										 }else{
											 alert("操作错误，请重试...");
											 document.location.reload();
										 }
									  },"json");				        	 
				         }
				    </script>
                </div>
                <div class="chartRight fl">
                    <div class="chartTop">
                        <p><span class="titS">今日收益</span><span id="toDayInterest">0.00</span><i>元</i></p>
                    </div>
                    <div class="chartB">
                        <p><span class="titS">累计总收益</span><span id="sumInterest">0.00</span><i>元</i></p>
                    </div>
                 </div>
            </div>
        </div>
        <div class="accuntR-six">
        	<h3 class="clear"><span class="fl">为您推荐</span><a href="${project_name }/borrow/list"  class="fr">更多理财&nbsp;&nbsp;&gt;</a></h3>
            <div class="recoTable">
            	<ul>
            	<c:forEach items="${hotBorrows.result }" var="item">
                	<li>
                    	<span class="s1">${item.B_NAME }</span>
						<span class="s2">年化收益率&nbsp;&nbsp;<i>${item.BORROW_APR }&nbsp;%</i></span>
                        <span class="s3">期限&nbsp;&nbsp;<c:if test="${item.REPAY_TYPE eq '1'}"><i>${item.BORROW_PERIOD}&nbsp;</i>个月</c:if><c:if test="${item.REPAY_TYPE eq '2'}"><i>${item.BORROW_PERIOD}&nbsp;</i>天</c:if></span>

                        <span class="s4">起投&nbsp;&nbsp;<i>${item.TENDER_ACCOUNT_MIN }</i>&nbsp;元</span>
                        <span class="s5">
                        	<a href="${project_name}/borrowInfo/detail.do?borrowId=${item.ID}">投资</a>
                        </span>
                    </li>
                   </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</div>
<!--账户总览主体 End-->
</div>

 

<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body> 
</html>