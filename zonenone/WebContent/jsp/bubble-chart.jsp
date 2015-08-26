<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ZoneNone - Chart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,600,200italic,600italic&subset=latin,vietnamese'
	rel='stylesheet' type='text/css'>

<script src="http://phuonghuynh.github.io/js/bower_components/jquery/dist/jquery.min.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/d3/d3.min.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/d3-transform/src/d3-transform.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/cafej/src/extarray.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/cafej/src/misc.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/cafej/src/micro-observer.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/microplugin/src/microplugin.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/bubble-chart/src/bubble-chart.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/bubble-chart/src/plugins/central-click/central-click.js"></script>
  <script src="http://phuonghuynh.github.io/js/bower_components/bubble-chart/src/plugins/lines/lines.js"></script>
  <script src="js/bubble-chart.js"></script>
<style>
.bubbleChart {
	min-width: 100px;
	max-width: 540px;
	height: 342px;
	margin: 0 auto;
}

.bubbleChart svg {
	background: #000000;
}
</style>
</head>
<body>
<div class="container">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ include file="chartmenu.jsp"%>
${bubbleChartStr}
<div class="bubbleChart" />
<br />
<div class="col-md-12" style="margin-top: 20px;">
<%@ include file="footer.jsp"%></div>
</div>
</body>
</html>