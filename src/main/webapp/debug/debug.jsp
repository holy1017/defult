<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
Context :<%=request.getContextPath()%><BR>
URL :<%=request.getRequestURL()%><BR>
URI :<%=request.getRequestURI()%><BR>
<!--    ex) http://localhost:8080/board/list.jsp
        return => /board/list.jsp ( 프로젝트 context path와 파일 경로까지 가져온다 ) -->
Path :<%=request.getServletPath()%><BR>
getQueryString :<%=request.getQueryString()%><BR>
getParameterMap :<%=request.getParameterMap()%><BR>
javax.servlet.include.request_uri :<%=request.getAttribute("javax.servlet.include.request_uri")%><BR>

<h1>param</h1>
<c:forEach items="${param}" var="item">
	<p>${item.key}=${item.value}</p>
</c:forEach>

<h1>sessionScope</h1>
<c:forEach items="${sessionScope}" var="item">
	<p>${item.key}=${item.value}</p>
</c:forEach>

<h1>requestScope</h1>
<c:forEach items="${requestScope}" var="item">
	<p>${item.key}=${item.value}</p>
</c:forEach>