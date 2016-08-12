<%--
  Created by IntelliJ IDEA.
  User: zhaoyu
  Date: 2015/9/15
  Time: 16:26
  To change this template use File | Settings | File Templates.
  充值记录显示
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<div class="rechargeTable">
  <ul class="rechargetableHead">
    <li>
      <span class="rechargeSp1">流水号</span>
      <span class="rechargeSp2">创建时间</span>
      <span class="rechargeSp3">充值金额（元）</span>
      <span class="rechargeSp4">手续费（元）</span>
      <span class="rechargeSp5">实际到账（元）</span>
      <span class="rechargeSp6">充值方式</span>
      <span class="rechargeSp7">状态</span>
      <span class="rechargeSp8">备注</span>
    </li>
  </ul>
  <form action="user/recharge/list" method="post">
  <%--有数据显示，没有数据显示暂无记录--%>
  <c:choose>
    <c:when test="${not empty page.result}">
      <c:forEach items="${page.result}" var="var" varStatus="vs">
        <ul class="rechargeList">
          <li>
            <span class="rechargeSp1">${var.TRADE_ID}</span>
            <span class="rechargeSp2"><fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            <span class="rechargeSp3">${var.MONEY}</span>
            <span class="rechargeSp4">${var.FEE}</span>
            <span class="rechargeSp5">${var.BALANCE}</span>
            <span class="rechargeSp6">${var.P_NAME}</span>
            <span class="rechargeSp7">
              <c:forEach items="${statusTypes}" var="item" varStatus="vs">
                <c:if test="${item.code eq var.STATUS}">
                  ${item.cname}
                </c:if>
              </c:forEach>
            </span>
            <span class="rechargeSp8">${var.REMARK}</span>
          </li>
        </ul>
      </c:forEach>
    </c:when>
    <c:otherwise>
      <ul class="rechargeList">
        <li>
          <span class="rechargeSp9">暂时没有记录</span>
        </li>
      </ul>
    </c:otherwise>
  </c:choose>
</div>

     <div class="page-header position-relative">
              <div class="page-header position-relative" style="margin-top: 12px">
				<table style="width:100%;">
				<tr>
				<td style="vertical-align:top;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.frontPageStr}</div></td>
			</tr>
			</table>
    		</div>
  	</div>
  	</form>
<%--没有分页--%>
<%-- <c:if test="${not empty page.result}">
  <%@ include file="../pagination.jsp"%>
</c:if> --%>
</div>
<script>
$(function(){
	alert('${page.pageNumber}');
});
</script>