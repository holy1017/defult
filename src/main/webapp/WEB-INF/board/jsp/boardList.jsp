<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardList.jsp</title>

<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<!-- <link rel="stylesheet" type="text/css" href="../demo.css"> -->
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery.easyui.min.js"></script>

</head>
<body>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<!-- <th>내용</th> -->
				<th>삭제여부</th>
				<th>회원번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>탈퇴여부</th>
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


	<div class="easyui-pagination"
		data-options="
			pageList: [5,10,25,50,100,250,500,1000,2500,5000,10000],
			pageNumber:${pageNum },
			total:${totalRowCount },
			pageSize:${pageSize },
			onSelectPage:function(pageNumber, pageSize){
				$(location).attr(
						'href',
						'boardListPage?pageNum=' + pageNumber + '&pageSize='
								+ pageSize)
			},
			buttons:$('#p_buttons')
			"></div>


	<div id="p_buttons">
		<table>
			<!-- style="border-spacing: 0" -->
			<tr>
				<td><input class="easyui-searchbox" style="width: 150px">
				</td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-save',plain:true"></a></td>
			</tr>
		</table>
	</div>

	<%@ include file="/debug/debug.jsp"%>
</body>
</html>