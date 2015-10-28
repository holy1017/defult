<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<%@ include file="/include/ink_head.jsp"%>

<style>
body {
	background: #ededed;
}

.panel {
	border-radius: 2px;
	-webkit-box-shadow: #dddddd 0 1px 1px 0;
	-moz-box-shadow: #dddddd 0 1px 1px 0;
	box-shadow: #dddddd 0 1px 1px 0;
	padding: 1em;
	border: 1px solid #BBB;
	background-color: #FFF;
}
</style>
</head>
<body>

	<!--[if lte IE 9 ]>
    <div class="ink-alert basic" role="alert">
        <button class="ink-dismiss">&times;</button>
        <p>
            <strong>You are using an outdated Internet Explorer version.</strong>
            Please <a href="http://browsehappy.com/">upgrade to a modern browser</a> to improve your web experience.
        </p>
    </div>
    -->

	<div class="panel">

		<nav id="p1" class="p1 ink-navigation">
			<ul class="pagination black">
			</ul>
		</nav>

		<div id="car1" class="ink-carousel"
			data-space-after-last-slide="false" data-autoload="false">

			<ul class="stage column-group half-gutters">
				<!--  -->
				<c:forEach items="${BoardList}" var="row">
					<li class="slide xlarge-33 large-50 medium-50 small-100 tiny-100">
						<!-- <img class="half-bottom-space" src="http://lorempixel.com/400/200/sports/1"> -->
						<div class="description">
							<!--  <h4 class="no-margin">Highlight Title</h4> -->
							<h5 class="slab">${row.b_nick  }/${row.b_date  }</h5>
							<p>${row.b_text  }</p>
						</div>
					</li>
				</c:forEach>
				<!--  -->
			</ul>

		</div>

		<nav id="p1" class="p1 ink-navigation">
			<ul class="pagination black">
			</ul>
		</nav>

	</div>

	
		<script>
			Ink.requireModules([ 'Ink.UI.Carousel_1' ], function(InkCarousel) {
				new InkCarousel('#car1', {
					pagination : '.p1'
				});
			});
		</script>



		<table class="ink-table bordered hover ink-grid panel">
			<thead>
				<tr class="column-group half-gutters">
					<th class="all-10">NICK/NO/DATE</th>
					<!-- <th class="all-10"></th> -->
					<th class="all-90">TEXT</th>
					<!-- <th class="all-10"></th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${BoardList}" var="row">
					<tr class="column-group half-gutters">
						<td class="all-10">${row.b_nick  }<br>${row.b_no    }<br>${row.b_date  }</td>
						<%-- <td class="all-10">${row.b_pw    }</td> --%>
						<td class="all-90">${row.b_text  }</td>
						<%-- <td class="all-10">${row.b_date  }</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	
	<%@ include file="/debug/debug.jsp"%>
</body>
</html>
