<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
<title>搜索教育 - 华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/Education.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${css_imagedomain}/front/js/pullNav.js"></script>

</head>

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<form action="${project_name}/contentExt/contentExtLsit.do?title=${query.title}" method="post" style="margin-top: 5px;">
<!--content-->
<div class="content clear">
	<div class="sousuo clear">
    	<div class="sou_left fl">
        	<span class="anchor">"${query.txt}"</span>
            <span>搜素结果</span>
        </div>
        <!--<div class="sou_right fr">
        	<span>搜索数：</span>
            <span class="anchor">${page.totalCount}</span>
        </div>-->
    </div>
	<div class="contentLeft fl">
        <div class="indexUl" style="display:block;">
            	<ul class="ulOne">
            	<c:forEach items="${page.result}" var="item">
                	<li class="clear">
                    	<a href="${education_domain}${item.channel_path}/<fmt:formatDate value="${item.release_date}" pattern="yyyyMMdd" />/${item.content_id}.html">
                            <img src="${education_domain}${item.type_img}" width="270" height="173" alt="" class="fl" >
                        </a>
                    	<div class="liList fl">
                        	<h3><a href="${education_domain}${item.channel_path}/<fmt:formatDate value="${item.release_date}" pattern="yyyyMMdd" />/${item.content_id}.html" class="fz18">${item.title}</a></h3>
                        	<p class="timeP lh30">
                            	<span class="fz12"><fmt:formatDate value="${item.release_date}" pattern="yyyy-MM-dd" /></span>
                            	<%--<span class="plun">${item.views_day}</span>--%>
                        	</p>
                        	<p class="textP">
                        	<c:choose>
                        	<c:when test="${fn:length(item.description)<=150}">
                        	${item.description}
                        	</c:when>
                        	<c:otherwise>                       	
                        	${fn:substring(item.description, 0, 150)}...
                        	</c:otherwise>
                        	</c:choose>
                        	
                        	</p>
                        	<%--<p class="icoP">${item.type_name}</p>--%>
                    	</div>
                	</li>
                	</c:forEach>
                 	                 	    
            	</ul>
            	 <div class="page-header position-relative" style="margin-top: 12px">
                    <table style="width:100%;">
                        <tr>
                            <td style="vertical-align:top;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.frontPageStr}</div></td>
                        </tr>
                    </table>
                </div>
        	</div>

    </div>
    <div class="contentRight fl" >
        <!-- <div class="wire_right">
            <h2 class="clear">
                <span class="fz18 color13 lh18 fzw fl">华金说说说</span>
                <a href="#" class="fz14 color17 fr" target="_blank">更多资讯&nbsp;&gt;</a>
            </h2>
            <ul>
                <li>
                    <a href="#" target="_blank"><img src="${css_imagedomain}/front/images/loign.png" width="360" height="128" alt="${a.title}" /></a>
                </li>
                <li>
                    <a href="#" class="clear" target="_blank">
                        <span class="fz14 color13 fl">一辈子最重要的三张保单</span>
                    </a>
                </li>

            </ul>
        </div>

        <div class="case">
            <h2 class="fz18 color13 lh18 fzw">理财案例</h2>
            <ul class="case_option clear">
                <li class="fl active">月薪5K以下</li>
                <li class="fl">月薪5-20K</li>
                <li class="fl">月薪20K以上</li>
            </ul>
            <div class="case_list">
                <ul style="display:block;">
                    <li>
                        <i></i><a href="${a.url}" class="fz14 color8" target="_blank"></a>
                    </li>
                    <li>
                        <i></i><a href="${a.url}" class="fz14 color8" target="_blank"></a>
                    </li>
                    <li>
                        <i></i><a href="${a.url}" class="fz14 color8" target="_blank"></a>
                    </li>
                </ul>
                <ul>
                    <li>
                        <i></i><a href="${a.url}" class="fz14 color8" target="_blank"></a>
                    </li>
                    <li>
                        <i></i><a href="${a.url}" class="fz14 color8" target="_blank"></a>
                    </li>

                </ul>
                <ul>
                    <li>
                        <i></i><a href="${a.url}" class="fz14 color8" target="_blank"></a>
                    </li>


                </ul>
            </div>
        </div>
        <script>
            $(function(){
                $('.case_option li').click(function(){
                    $('.case_option li').removeClass('active');
                    $(this).addClass('active');
                    $('.case_list ul').hide();
                    $('.case_list ul').eq($(this).index('.case_option li')).show();
                });
            });
        </script>-->



    </div>
</div>
</form>
<!--content End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>

</body>

</html>
