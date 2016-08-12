<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8" />
<title>${query.title}_华金所_互联网金融超市</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>

	<link href="${css_imagedomain}/front/css/poly.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${css_imagedomain}/front/js/pullNav.js"></script>

</head>

<body>
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<form action="${project_name}/contentExt/converge.do?title=${query.title}" method="post">
<!--content-->
	<div class="polyWarp">
		<div class="poly">
			<h2 class="polyTitle">${query.txt}</h2>
			<div class="polyLeft">
				<div class="polyList">
					<ul class="polyUl">
                     <c:forEach items="${page.result}" var="item">
						<li class="clear">
							<a href="${education_domain}${item.channel_path}/<fmt:formatDate value="${item.release_date}" pattern="yyyyMMdd" />/${item.content_id}.html"><img src="${education_domain}${item.type_img}" width="270" height="173" alt="" class="fl" /></a>
							<div class="liList fl">
								<h3><a href="${education_domain}${item.channel_path}/<fmt:formatDate value="${item.release_date}" pattern="yyyyMMdd" />/${item.content_id}.html" class="fz14">${item.title}</a></h3>
								<p class="timeP lineH22">
									<span><fmt:formatDate value="${item.release_date}" pattern="yyyy-MM-dd" /></span>
									<span class="plun">${item.views_day}</span>
								</p>
								<p class="intro"><c:choose>
									<c:when test="${fn:length(item.description)<=150}">
										${item.description}
									</c:when>
									<c:otherwise>
										${fn:substring(item.description, 0, 150)}...
									</c:otherwise>
								</c:choose></p>
							</div>
						</li>
						 </c:forEach>
					</ul>
					<div class="pagination" style="padding-top: 0px;margin-top: 12px;">${page.frontPageStr}</div>
				</div>
			</div>
		</div>
	</div>

</form>
<!--content End-->
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>

</body>

</html>
