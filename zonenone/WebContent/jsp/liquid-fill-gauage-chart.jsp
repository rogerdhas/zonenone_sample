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

</head>
<body>
<div class="container">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ include file="chartmenu.jsp"%>

<script src="js/d3.v3.min.js" language="JavaScript"></script>
<script src="js/liquidFillGauge.js" language="JavaScript"></script>
<style>
.liquidFillGaugeText {
	font-family: Helvetica;
	font-weight: bold;
}
</style>
<svg id="fillgauge1" width="540px" height="342px"
	onclick="gauge1.update(NewValue());"></svg>

<script language="JavaScript">
	var gaugePercentage = <c:out value="${ageValue}"/>;
	var gauge1 = loadLiquidFillGauge("fillgauge1", gaugePercentage);
	var config1 = liquidFillGaugeDefaultSettings();
	config1.circleColor = "#FF7777";
	config1.textColor = "#FF4444";
	config1.waveTextColor = "#FFAAAA";
	config1.waveColor = "#FFDDDD";
	config1.circleThickness = 0.2;
	config1.textVertPosition = 0.2;
	config1.waveAnimateTime = 1000;
	function NewValue() {
		if (Math.random() > .5) {
			return Math.round(Math.random() * 100);
		} else {
			return (Math.random() * 100).toFixed(1);
		}
	}
</script>
<br />
<div class="col-md-12" style="margin-top: 20px;">
<%@ include file="footer.jsp"%></div>
</div>
</body>
</html>