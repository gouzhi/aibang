<%--
  Created by IntelliJ IDEA.
  User: zhaoyu
  Date: 2015/9/15
  Time: 16:38
  To change this template use File | Settings | File Templates.
  分页
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%--分页 起止页码逻辑判断--%>
<c:choose>
  <%--页码变大--%>
  <c:when test="${pageOld<page.pageNumber}">
    <c:choose>
      <%--当前页后2页，当前页前2页，满足--%>
      <c:when test="${page.pageNumber+2<page.getPageCount() and page.pageNumber-2>0}">
        <c:set value="${page.pageNumber+2}" var="end"></c:set>
        <c:set value="${page.pageNumber-2}" var="begin"></c:set>
      </c:when>
      <%--不满足--%>
      <c:otherwise>
        <c:choose>
          <%--总页数大约5页--%>
          <c:when test="${page.getPageCount()>5}">
            <c:choose>
              <%--当前页以前并没有2页--%>
              <c:when test="${page.pageNumber-2<1}">
                <c:set value="${5}" var="end"></c:set>
                <c:set value="${1}" var="begin"></c:set>
              </c:when>
              <%--显示最后5页--%>
              <c:otherwise>
                <c:set value="${page.getPageCount()}" var="end"></c:set>
                <c:set value="${page.getPageCount()-5}" var="begin"></c:set>
              </c:otherwise>
            </c:choose>
          </c:when>
          <%--小于5页，显示所有页--%>
          <c:otherwise>
            <c:set value="${1}" var="begin"></c:set>
            <c:set value="${page.getPageCount()}" var="end"></c:set>
          </c:otherwise>
        </c:choose>
      </c:otherwise>
    </c:choose>
  </c:when>
  <%--页码变小--%>
  <c:otherwise>
    <c:choose>
      <%--当前页后2页，当前页前2页，满足--%>
      <c:when test="${page.pageNumber-2>0 and page.pageNumber+2<page.getPageCount()}">
        <c:set value="${page.pageNumber+2}" var="end"></c:set>
        <c:set value="${page.pageNumber-2}" var="begin"></c:set>
      </c:when>
      <%--不满足--%>
      <c:otherwise>
        <c:choose>
          <%--总页码大于5页--%>
          <c:when test="${page.getPageCount()>5}">
            <c:choose>
              <%--当前页加2大于总页码--%>
              <c:when test="${page.pageNumber+2>=page.getPageCount()}">
                <c:set value="${page.getPageCount()}" var="end"></c:set>
                <c:set value="${page.getPageCount()-5}" var="begin"></c:set>
              </c:when>
              <%--页码减2小于最小页，显示前五页--%>
              <c:otherwise>
                <c:set value="${5}" var="end"></c:set>
                <c:set value="${1}" var="begin"></c:set>
              </c:otherwise>
            </c:choose>
          </c:when>
          <%--总页码小于5页，全部显示--%>
          <c:otherwise>
            <c:set value="${1}" var="begin"></c:set>
            <c:set value="${page.getPageCount()}" var="end"></c:set>
          </c:otherwise>
        </c:choose>
      </c:otherwise>
    </c:choose>
  </c:otherwise>
</c:choose>
<div class="pagination">
  <%--判断是否存在数据--%>
  <c:choose>
    <c:when test="${page.totalCount>0}">
      <ul>
        <li>
          <a>共<font color="red">${page.totalCount}</font>条</a>
        </li>
        <li>
          <input type="number" placeholder="页码" style="width:50px;text-align:center;float:left" id="toGoPage" value="">
        </li>
        <li style="cursor:pointer;">
          <a class="btn btn-mini btn-success" onclick="toTZ();">跳转</a>
        </li>
        <li>
          <a onclick="<c:if test='${1<page.getPageCount() && 1!=page.pageNumber}'>nextPage(1)</c:if>">首页</a>
        </li>
        <li>
          <a onclick="<c:if test='${page.pageNumber-1>0}'>nextPage(${page.pageNumber-1})</c:if>">上页</a>
        </li>
        <%--页码信息--%>
        <c:forEach var="item" varStatus="status" begin="${begin}" end="${end}">
          <li>
            <%--当前页码特殊颜色--%>
          <c:choose>
            <c:when test="${status.index==page.pageNumber}">
              <a style="background: #d9ebff"><font color="#808080" onclick="nextPage(${status.index})">${status.index}</font></a>
            </c:when>
            <c:otherwise>
              <a><font color="#808080" onclick="nextPage(${status.index})">${status.index}</font></a>
            </c:otherwise>
          </c:choose>
          </li>
        </c:forEach>
        <li>
          <a onclick="<c:if test='${page.pageNumber+1 <= page.getPageCount()}'>nextPage(${page.pageNumber+1})</c:if>">下页</a>
        </li>
        <li><a onclick="<c:if test='${page.pageNumber<page.getPageCount()}'>nextPage(${page.getPageCount()})</c:if>">尾页</a></li>
        <li><a>第<span id="pageNumber">${page.pageNumber}</span>页</a></li>
        <li><a>共<span id="pageCount">${page.getPageCount()}</span>页</a></li>
      </ul>
    </c:when>
  </c:choose>
</div>
