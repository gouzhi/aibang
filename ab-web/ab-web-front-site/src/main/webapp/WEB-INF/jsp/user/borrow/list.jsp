<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
<base href="${project_name}/">
<meta charset="utf-8" />
<title>产品列表-华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/productDetails.css" rel="stylesheet" type="text/css" />
      <link href="${css_imagedomain}/front/css/commen_new.css" rel="stylesheet" />
<script type="text/javascript" src="${css_imagedomain}/front/js/pullNav.js"></script>
<script type="text/javascript" src="${css_imagedomain}/common/myjs/switch.js"></script>
<style>
		.formatTime{
		background: rgb(193, 193, 193) none repeat scroll 0% 0%;
		color: rgb(255, 255, 255);
		text-align: center;
		width: 130px;
		}
      .newGuest{width:1200px; margin:20px auto 0; background:#fff;}
      .newGuest_top{height:60px;line-height:60px; background:url(${css_imagedomain}/front/images/line_c.png) no-repeat 0px top;}
      .newGuest_top sub.bg{ background:#f27267;padding:0 8px; border-radius:10px; margin-left:10px;}

      .newGuest_list li{border-bottom:1px solid #e8e8e8; padding-bottom:30px; padding-left:50px;}
      .newGuest_list li h2.new{height:70px;line-height:70px;font-size:20px;color:#494646;padding-left:20px;background:url(${css_imagedomain}/front/images/line_r.png) no-repeat 0 center;}
      .newGuest_list li h2.new a{font-size:20px;color:#494646;}
      .newGuest_list li h2{height:76px;line-height:76px;background:url(${css_imagedomain}/front/images/line_r.png) no-repeat 0 center;}
      .newGuest_listCL{width:175px;}
      .newGuest_listCL i{ display:inline-block;width:30px;height:30px; background:url(${css_imagedomain}/front/images/nianhua.png) no-repeat;}
      .newGuest_listCC{ margin-left:95px;}
      .newGuest_listCC .span1{width:155px;}
      .newGuest_listCC .span2{width:160px;}
      .newGuest_listCC .span3{width:195px;margin-top:2px;}
      .newGuest_listCC .span4{width:132px;}
      .newGuest_listCC .jibdu_w{width:132px;height:6px; background:#e8e8e8;margin-top:8px;}
      .newGuest_listCC .jindu_n{width:68%;height:6px; background:#f27267;}
      .newGuest_listCR{ margin:28px 0 0 80px;}
      .newGuest_listCR .span5 a.expect,.newGuest_listCR .span5 a.end{ display:block;width:130px;height:36px;line-height:36px; background:#c1c1c1;text-align:center;border-radius:4px; cursor: text;}
      .newGuest_listCR .span5 a.start{display:block;width:130px;height:36px;line-height:36px;background:#f27267;text-align:center;border-radius:4px;}

      /*字体*/
      .num_ber{ font-family: "Arial"}
      .fz12{ font-size:12px;}
      .fz13{ font-size:13px;}
      .fz14{ font-size:14px;}
      .fz16{ font-size:16px;}
      .fz18{ font-size:18px;}
      .fz20{ font-size:20px;}
      .fz22{ font-size:22px;}
      .fz24{ font-size:24px;}
      .fz26{ font-size:26px;}
      .fz40{ font-size:40px;}
      .fz24{ font-size:24px;}
      .fzw{ font-weight:bold;}
      /*字体颜色*/
      .color0{color:#fff;}
      .color1{color:#333;}
      .color2{color:#222;}
      .color3{color:#3292ce}
      .color4{color:#999}
      .color5{color:#a1a0a0}
      .color6{color:#359ce7}
      .color7{color:#6d6b6b;}
      .color8{color:#383838;}
      .color9{color:#797979;}
      .color10{color:#8f8d8d;}
      .color11{color:#999;}
      .color12{color:#5a5a5a;}
      .color13{color:#494646}
      .color14{color:#2cb7ff}
      .color15{color:#ff6e56;}
      .color16{color:#a6a6a6}
      .color17{color:#a6a6a6}
      .color18{color:#e76767}
      .color19{color:#7a7a7a}
      .mT8{margin-top: 8px;}
      .mT16{margin-top: 16px;}
      .mT20 {margin-top: 20px; }
      s{margin:0;padding:0;}
      .time-item{display: block;width: 130px;height: 36px;line-height: 36px;background: #c1c1c1;text-align: center;border-radius: 4px;text-decoration:none; overflow:hidden;}
      .time-item span{font-style:normal; float:left;font-size:14px;color:#fff; margin-left:6px;}

        /*分页代码*/
        .pagination{width:1100px;margin:0 auto;background: #fff; padding: 20px 0 50px;}
        .pagination ul{width:1100px;text-align: center;}
        .pagination ul li{margin-right:5px;display: inline-block;}
        .pagination ul li a{font-family:"Arial";font-size:14px;color:#6b6b6b;border-radius: 2px;}
        .pagination ul li.currentPage a{font-size:14px;color:#fff;background:#f27267;}
        .pagination ul li a:hover{font-size:14px;color:#fff;background:#f27267;}
        .pagination a{display:block;width:30px;height:26px;line-height:26px; text-align:center;border:1px solid #e8e8e8;cursor: pointer;}
        #toGoPage {border: 1px solid #ccc; padding:5px;margin-top: -6px;}


</style>
</head>
<body>
 <%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<!--产品列表主体-->
<div class="contentProduct">
 <jsp:useBean id="now" class="java.util.Date" />
 <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>
<div class="product">
  <form id="form" action="${project_name}/borrow/list.do" method="post">       
        <div class="productNav">
            <a href="${education_domain}" style="color:#929292;font-size: 14px;">首页</a>
            <i style="color:#929292;font-size: 14px;"> > </i>
             <c:if test="${hjsBorrowQuery.bname eq null || '' eq hjsBorrowQuery.bname}">
              <a href="#" style="color:#929292;font-size: 14px;">投资理财</a>
             </c:if>

               <%--<input type='text' name='bname' value="${hjsBorrowQuery.bname}"/>--%>
            <i name='bname'>${hjsBorrowQuery.bname}</i>


        </div>
       
        <div class="productSearch">
            <ul>
            
                <li class="clear">
                    <div class="searchHead fl">
                        <span>年化收益率：</span>
                    </div>
                    <div class="searchList fl" id="borrowApr" style="color: #383838;">
                        <span class="searchSp1">全部</span>
                        <span class="searchSp2<c:if test="${hjsBorrowQuery.borrowAprMin eq 9 && hjsBorrowQuery.borrowAprMax eq null}"> active</c:if>">9%以下</span>
                        <span class="searchSp2<c:if test="${hjsBorrowQuery.borrowAprMin eq 9 && hjsBorrowQuery.borrowAprMax eq 10}"> active</c:if>">9%-10%</span>
                        <span class="searchSp3<c:if test="${hjsBorrowQuery.borrowAprMin eq 10 && hjsBorrowQuery.borrowAprMax eq 11}"> active</c:if>">10%-11%</span>
                        <span class="searchSp4<c:if test="${hjsBorrowQuery.borrowAprMin eq 11 && hjsBorrowQuery.borrowAprMax eq 12}"> active</c:if>">11%-12%</span>
                        <span class="searchSp4<c:if test="${hjsBorrowQuery.borrowAprMin eq null && hjsBorrowQuery.borrowAprMax eq 12}"> active</c:if>">12%以上</span>
                        <input type="hidden" name="borrowAprMin" value="${hjsBorrowQuery.borrowAprMin}"/>
                        <input type="hidden" name="borrowAprMax" value="${hjsBorrowQuery.borrowAprMax}"/>
                        <input type="hidden" name="borrowAprContext" value="${hjsBorrowQuery.borrowAprContext}"/>
                    </div>
                </li>
                <!--<li class="clear">
                    <div class="searchHead fl">
                        <span>投资金额：</span>
                    </div>
                    <div class="searchList fl" id="tenderAccount">
                        <span class="searchSp1">全部</span>
                        <span class="searchSp2<c:if test="${hjsBorrowQuery.tenderAccountMinMin eq 1 && hjsBorrowQuery.tenderAccountMinMax eq null}"> active</c:if>">1万元以下</span>
                        <span class="searchSp3<c:if test="${hjsBorrowQuery.tenderAccountMinMin eq 1 && hjsBorrowQuery.tenderAccountMinMax eq 5}"> active</c:if>">1万元-5万元</span>
                        <span class="searchSp4<c:if test="${hjsBorrowQuery.tenderAccountMinMin eq 5 && hjsBorrowQuery.tenderAccountMinMax eq 10}"> active</c:if>">5万元-10万元</span>
                        <span class="searchSp5<c:if test="${hjsBorrowQuery.tenderAccountMinMin eq null && hjsBorrowQuery.tenderAccountMinMax eq 10}"> active</c:if>">10万元以上</span>
                        <input type="hidden" name="tenderAccountMinMin" value="${hjsBorrowQuery.tenderAccountMinMin}"/>
                        <input type="hidden" name="tenderAccountMinMax" value="${hjsBorrowQuery.tenderAccountMinMax}"/>
                        <input type="hidden" name="tenderAccountContext" value="${hjsBorrowQuery.tenderAccountContext}"/>
                        <label>
                        	<input type="text" id="min" value="" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" style="margin-left: 42px;" />
                        
                            <span style="margin: 0;">万元</span>
                            <i> - </i>
                            <input type="text" id="max" value="" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="4"/>
                            <span style="margin: 0;">万元</span>
                            <input type="button" value="确定" class="btnS"  onclick="confirm()" />
                        </label>
                    </div>
                </li>-->
                <li class="clear">
                    <div class="searchHead fl">
                        <span>投资期限：</span>
                    </div>
                    <div class="searchList fl" id="borrowPeriod">
                        <span class="searchSp1">全部</span>
                        <span class="searchSp2<c:if test="${hjsBorrowQuery.borrowPeriodMin eq 6 && hjsBorrowQuery.borrowPeriodMax eq null}"> active</c:if>">6个月以下</span>
                        <span class="searchSp3<c:if test="${hjsBorrowQuery.borrowPeriodMin eq 6 && hjsBorrowQuery.borrowPeriodMax eq 12}"> active</c:if>">6-12个月</span>
                        <span class="searchSp4<c:if test="${hjsBorrowQuery.borrowPeriodMin eq null && hjsBorrowQuery.borrowPeriodMax eq 12}"> active</c:if>">12个月以上</span>
                        <input type="hidden" name="borrowPeriodMin" value="${hjsBorrowQuery.borrowPeriodMin}"/>
                        <input type="hidden" name="borrowPeriodMax" value="${hjsBorrowQuery.borrowPeriodMax}"/>
                        <input type="hidden" name="borrowPeriodContext" value="${hjsBorrowQuery.borrowPeriodContext}"/>
                    </div>
                </li>
                <li class="clear">
                    <div class="searchHead fl">
                        <span>投资状态：</span>
                    </div>
                    <div class="searchList fl" id="vs">
                        <span class="searchSp1"  >全部</span>
                        <!-- 可投资：(初审成功 2，未满标) -->
                        <span class="searchSp2<c:if test="${investTag eq 1}" > active</c:if>"  id="1" >可投资</span>
                       <!-- 投资结束：（满标 ，流标，未放款，已放款，满流标审核中 -->
                        <span class="searchSp3<c:if test="${investTag eq 2}" > active</c:if>"  id="2" >投资结束</span>
                       <!-- 还款中：(未还款【逾期未还款 9,还款操作失败 11】，还款中【部分还款 7】) -->
                        <span class="searchSp4<c:if test="${investTag eq 3}" > active</c:if>"  id="3" >还款中</span>
                       <!-- 已结清（已还款）：【逾期还款成功 10，还款成功 8】 -->
                        <span class="searchSp5<c:if test="${investTag eq 4}" > active</c:if>"  id="4" >已结清</span>
                        <input type="hidden" name="investTag" value="${investTag}"/>
                        <input type="hidden" name="verifyStatusContext" value="${hjsBorrowQuery.verifyStatusContext}"/>
                    </div>
                </li>
                
            </ul>
          
          <c:if test="${fn:length(list) ne 0}">
             <div class="yixuan">
            	<span style="font-size:14px;color:#929292;padding-right:30px;">您已选择：</span>
            	<c:forEach items="${list}" var="var">
            	 <%--  <b><input type="text" name="" value="${var}" readonly="readonly"/><i class="cancel">x</i></b> --%>
            	    <span class="spText"><em>${var}</em><i class="cancel"></i></span>
            	</c:forEach>
              <a href="javascript:;" onclick="cancelAll()">清除</a>
             </div>
          </c:if>
        </div>
        <div class="sort">
        	<span style=" display:inline-block;width:66px;font-size:14px;color: #929292">排序：</span>
            <label>
                <span name="default"     <c:if test="${hjsBorrowQuery.sortTag eq 1 }">class="active"</c:if> id="1" onclick="defaultClick()">默认排序</span>
<%--                 <span name="sortAccount" <c:if test="${hjsBorrowQuery.sortTag eq 2 || hjsBorrowQuery.sortTag eq -2}">class="active"</c:if>id="" onclick="sortAccountClick()">投资金额</span>
 --%>                <span name="sortPeriod"  <c:if test="${hjsBorrowQuery.sortTag eq 3 || hjsBorrowQuery.sortTag eq -3}">class="active"</c:if>id="" onclick="sortPeriodClick()">投资期限</span>
                <input type="hidden"  name="sortTag" value="${hjsBorrowQuery.sortTag}" />
            </label>
        </div>
         
        </form>
        <c:choose>
        <c:when test="${not empty page.result }">
        
        <div class="productList">
        <c:forEach items="${page.result }" var="item">
        	<!--<ul class="ulList">
                <li>
                	<h4><a href="borrowInfo/detail.do?borrowId=${item.ID}">${item.B_NAME}</a></h4>
                    <div class="listDiv clear">
                    	<div class="divNav nav1 fl">
                        	<div class="divTitle">预期年化收益率</div>
                            <div class="divNum">${item.BORROW_APR}%</div>
                        </div>
                        <div class="divNav nav2 fl">
                        	<div class="divTitle">投资期限</div>
                            <div class="divNum">${item.BORROW_PERIOD}${item.REPAY_TYPE==1?'个月':'天'}
                            </div>
                        </div>
                        <div class="divNav nav3 fl">
                        	<div class="divTitle">收益方式</div>
                            <div class="divNum">
                             <c:if test="${item.REPAY_TYPE eq 1}">按月到期还本付息</c:if>
                             <c:if test="${item.REPAY_TYPE eq 2}">按日到期还本付息</c:if>
                            </div>
                        </div>
                        <div class="divNav nav4 fl">
                        	<div class="divTitle">投资金额</div>
                            <div class="divNum">${item.TENDER_ACCOUNT_MIN}起投</div>
                        </div>
                        <div class="divNav nav5 fl">
                        	<div class="divTitle">项目进度</div>
                            <div class="divNum">
                            <c:choose>
                              <c:when test="${item.VERIFY_STATUS eq 3 && item.TENDER_SCALE lt 100}">100%</c:when>
                              <c:otherwise>${item.TENDER_SCALE}%</c:otherwise>
                            </c:choose>
                            </div>
                            </div>
                        <div class="divNav nav6 fl">
                        <fmt:formatDate value="${item.TENDER_END_TIME}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="tenderEndTime"/>
                          <c:choose>
                            <c:when test="${item.VERIFY_STATUS eq 2 && today <= tenderEndTime && item.BORROW_ACCOUNT_YES lt item.ACCOUNT}">
                             <a href="borrowInfo/detail.do?borrowId=${item.ID}">投资</a>
                            </c:when>
                             <c:when test="${(item.VERIFY_STATUS eq 3 || item.VERIFY_STATUS eq 6||item.VERIFY_STATUS eq 12 || item.VERIFY_STATUS eq 13 || item.VERIFY_STATUS eq 4) || (item.VERIFY_STATUS eq 2 && today > tenderEndTime) || (item.VERIFY_STATUS eq 2 && item.TENDER_SCALE eq 100 ) }">
                             <a href="javascript:;" class="manbiao">投资结束</a>
                            </c:when>
                             <c:when test="${item.VERIFY_STATUS eq 5 || item.VERIFY_STATUS eq 11}">
                             <a href="javascript:;" class="manbiao">还款中</a>
                            </c:when>
                            <c:when test="${item.VERIFY_STATUS eq 8 || item.VERIFY_STATUS eq 10}">
                             <a href="javascript:;" class="manbiao">已结清</a>
                            </c:when>
                          </c:choose>
                        </div>
                   </div>
                </li>
            </ul>-->
            <ul class="newGuest_list">
                <li>
                    <h2 class="new"><a href="borrowInfo/detail.do?borrowId=${item.ID}">${item.B_NAME}</a>
                    <c:if test="${item.BORROW_TYPE eq 8 }">
                     <span style="border: 1px solid #f27267;padding: 0px 10px;font-size:14px;color:#f27267; margin-left: 10px;">新客专享</span>
                    </c:if>
                    </h2>
                    <div class="newGuest_listC clear">
                        <div class="newGuest_listCL fl">
                            <p><i></i><span class="num_ber" style="font-size: 40px;padding-left: 10px;color:#ff6e56;font-weight: bold;"><fmt:formatNumber value="${item.BORROW_APR}" pattern="##.##" minFractionDigits="2" /></span><span class="fz26 color15 num_ber" style="font-size: 26px;color:#ff6e56;font-weight: bold;">&nbsp;%</span></p>
                            <p class="fz16 color16" style="font-size: 16px;color: #a6a6a6;">预期年化收益率</p>
                        </div>
                        <div class="newGuest_listCC fl mT20">
                            <div class="clear">
                                <div class="span1 fl">
                                    <i class="fz24 color13 num_ber">${item.BORROW_PERIOD}</i><b class="fz18 color13">&nbsp;${item.REPAY_TYPE==1?'个月':'天'}</b><br />
                                    <b class="fz16 color16">期限</b>
                                </div>
                                <div class="span2 fl">
                                    <i class="fz24 color13 num_ber">${item.TENDER_ACCOUNT_MIN}</i><b class="fz18 color13">&nbsp;元</b><br />
                                    <b class="fz16 color16">起投</b>
                                </div>
                                <div class="span3 fl">
                                    <i class="fz18 color13">
                                        <c:if test="${item.REPAY_TYPE eq 1}">按月到期还本付息</c:if>
                                        <c:if test="${item.REPAY_TYPE eq 2}">按日到期还本付息</c:if>
                                    </i><br />
                                    <b class="fz16 color16" style="line-height: 26px;">收益方式</b>
                                </div>
                                <fmt:formatDate value="${item.TENDER_END_TIME}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="tenderEndTime"/>
                                <fmt:formatDate value="${item.TENDER_START_TIME}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="tenderStartTime"/>
                                
                                <div class="span4 fl">
                                 <c:choose>
                                     <c:when test="${item.VERIFY_STATUS eq 2 && today <= tenderEndTime && item.BORROW_ACCOUNT_YES lt item.ACCOUNT}">
	                                    <div class="jibdu_w">
	                                        <div class="jindu_n" style="width:${item.TENDER_SCALE}%;"></div>
	                                    </div>
	                                    <div class="tc fz18 color16 mT16 num_ber">
	                                        ${item.TENDER_SCALE}&nbsp;%
	                                    </div>
                                     </c:when>
                                     <c:otherwise>
                                        <div class="jibdu_w">
	                                        <div class="jindu_n" style="width:100%;"></div>
	                                    </div>
	                                    <div class="tc fz18 color16 mT8 num_ber">
	                                        100&nbsp;%
	                                    </div>
                                     
                                     </c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="newGuest_listCR fl">

                            <c:choose>
                                <c:when test="${item.VERIFY_STATUS eq 2 && today >= tenderStartTime && today <= tenderEndTime && item.BORROW_ACCOUNT_YES lt item.ACCOUNT}">
                                    <%--<a href="borrowInfo/detail.do?borrowId=${item.ID}">投资</a>--%>
                                    <div class="span5">
                                        <a href="borrowInfo/detail.do?borrowId=${item.ID}" class="fz16 color0 start">立即投资</a>
                                    </div>
                                </c:when>
                              
                                <c:when test="${(item.VERIFY_STATUS eq 3 || item.VERIFY_STATUS eq 6||item.VERIFY_STATUS eq 12 || item.VERIFY_STATUS eq 13 || item.VERIFY_STATUS eq 4) || (item.VERIFY_STATUS eq 2 && today > tenderEndTime) || (item.VERIFY_STATUS eq 2 && item.TENDER_SCALE eq 100 ) }">
                                    <%--<a href="javascript:;" class="manbiao">投资结束</a>--%>
                                    <div class="span5">
                                        <a href="javascript:;" class="fz16 color0 end">投资结束</a>
                                    </div>
                                </c:when>
                                <c:when test="${item.VERIFY_STATUS eq 5 || item.VERIFY_STATUS eq 11}">
                                    <%--<a href="javascript:;" class="manbiao">还款中</a>--%>
                                    <div class="span5">
                                        <a href="javascript:;" class="fz16 color0 end">还款中</a>
                                    </div>
                                </c:when>
                                <c:when test="${item.VERIFY_STATUS eq 8 || item.VERIFY_STATUS eq 10}">
                                    <%--<a href="javascript:;" class="manbiao">已结清</a>--%>
                                    <div class="span5">
                                        <a href="javascript:;" class="fz16 color0 end">已结清</a>
                                    </div>
                                </c:when>
                                <c:when test="${item.VERIFY_STATUS eq 2 && today < tenderStartTime }">
                                    <a href="#" class="time-item" id="${item.ID}">
									    <input type="text"  class="formatTime" value="${item.formatTime}"/>
									    <input type="hiddlen" class="intDiff" value="${item.intDiff}"/>
								    </a>
                                </c:when>
                            </c:choose>



                        </div>
                    </div>
                </li>

            </ul>




            </c:forEach>
            <div class="pagination">
              <span style="text-align: center;">${page.frontPageStr}</span>
            </div>
            <%--<script>--%>
                <%--$(function(){--%>
                    <%--$('.pagination ul li:first').hide();--%>
                    <%--$('.pagination ul li:first').next().hide();--%>
                    <%--$('.pagination ul li:first').next().next().hide();--%>
                    <%--$('.pagination ul li:first').next().next().next().hide();--%>

                    <%--$('.pagination ul li:last').hide();--%>
                    <%--$('.pagination ul li:last').prev().hide();--%>
                    <%--$('.pagination ul li:last').prev().prev().hide();--%>
                    <%--$('.pagination ul li:last').prev().prev().prev().hide();--%>
                <%--});--%>

            <%--</script>--%>
        </div>
      
      </c:when>
      <c:otherwise>
       <div style="text-align: center;padding:70px 0; color:#8f8f8f; font-size: 20px;background: #fff;">抱歉，目前没有满足条件的产品！</div>
	  </c:otherwise>
      </c:choose>
    </div>
</div>
<!--产品列表主体 End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
</body>
<script type="text/javascript">
$(function(){
	var str="";
	if($(".newGuest_listCR").children(".time-item").length>0){
		$(".newGuest_listCR").children(".time-item").each(function(){
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
					object.parent().append("<div class='span5'><a href='borrowInfo/detail.do?borrowId="+object.attr("id")+"'class='fz16 color0 start'>立即投资</a></div>");
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
				formatTime.val(str);
				ms--;
				str="";
				}, 1000);
		});
	}
	
});


</script>
</html>