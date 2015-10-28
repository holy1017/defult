<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<%@ include file="/include/ink_head.jsp"%>

</head>
<body>
	<table class="ink-table">
		<thead>
			<tr>
				<th>NO</th>
				<th>NICK</th>
				<th>TEXT</th>
				<th>DATE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${BoardList}" var="row">
				<tr>
					<td>${row.b_nick  }</td>
					<td>${row.b_pw    }</td>
					<td>${row.b_text  }</td>
					<td>${row.b_date  }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<%@ include file="/debug/debug.jsp"%>
</body>
</html>
