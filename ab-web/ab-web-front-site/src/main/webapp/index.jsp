<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:redirect url="/user/center/accountall" />  --%>
<%--<c:redirect page="/borrow/list" /> --%>
<%--<c:redirect page="${education_domain}" />--%>
<jsp:forward page="/borrow/list" />
