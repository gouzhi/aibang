<%--
  Created by IntelliJ IDEA.
  User: zhaoyu
  Date: 2015/9/15
  Time: 16:26
  To change this template use File | Settings | File Templates.
  提现记录显示
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<div class="cashTable">
  <table class="cashtableHead">
    <tr>
      <th class="cashSp1">创建时间</th>
      <th class="cashSp2">取现金额（元）</th>
      <th class="cashSp3">手续费（元）</th>
      <th class="cashSp4">实际到账金额（元）</th>
      <th class="cashSp5">银行账户</th>
      <th class="cashSp6">状态</th>
      <th class="cashSp7">备注</th>
    </tr>
  <c:choose>
    <%--当前页面的值不为空显示信息--%>
    <c:when test="${not empty page.result}">
      <c:forEach items="${page.result}" var="var" varStatus="vs">
        <tr>
            <td><fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${var.TOTAL}</td>
            <td>${var.FEE}</td>
            <td>${var.CREDITED}</td>
            <td>${var.BANK_NAME}(尾号${fn:substring(var.BANK_ACCOUNT,var.BANK_ACCOUNT.length()-4,var.BANK_ACCOUNT.length())})</td>
            <td>
               <c:forEach items="${statusTypes}" var="item" varStatus="vs">
                 <c:if test="${item.code eq var.STATUS}">
                   ${item.cname}
                 </c:if>
               </c:forEach>
            </td>
            <td class="cashSp7"><span>${var.REMARK}</span></td>
        </tr>
      </c:forEach>
    </c:when>
    <%--当前页面的值为空显示暂无记录--%>
    <c:otherwise>
      <tr class="cashList">
        <td colspan="7">暂时没有记录</td>
      </tr>
    </c:otherwise>
  </c:choose>
    </table>
</div>
<%--没有分页--%>
 <div class="pagination">
	${page.frontPageStr} 
 </div> 
</div>
