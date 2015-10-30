<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardList.jsp</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>�۹�ȣ</th>
				<th>����</th>
				<!-- <th>����</th> -->
				<th>��������</th>
				<th>ȸ����ȣ</th>
				<th>���̵�</th>
				<th>�г���</th>
				<th>Ż�𿩺�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.b_no}</td>
					<td><a href="boardDetail?b_no=${row.b_no}">${row.b_title}</a></td>
					<%-- <td>${row.b_content}</td> --%>
					<td>${row.b_delete}</td>
					<td>${row.u_no}</td>
					<td>${row.u_id}</td>
					<td><a href="userDetail?u_no=${row.u_no}">${row.u_nick}</a></td>
					<td>${row.u_delete}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot></tfoot>
	</table>


	<%@ include file="/debug/debug.jsp"%>
</body>
</html>