<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>sample</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/jquery/3.0.0-alpha1/jquery.js"></script>
<script src="jquery-1.11.3.js"></script>
<script src="jquery-1.11.3.min.js"></script>
</head>
<body>
	<h1>Hello world! sample</h1>

	<P>The time on the server is ${serverTime}.</P>

	<script type="text/javascript">
		$(function() {
			$("#jquerytest").html("jquerytest")
		})
	</script>
	<p id="jquerytest"></p>

	<%@ include file="/debug/debug.jsp"%>
</body>
</html>
