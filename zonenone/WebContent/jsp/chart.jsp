<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ZoneNone - Chart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script
	src="js/jquery.min.js"></script>
<!-- <script
	src="js/jquery-1.11.1.js"></script> -->
</head>
<body>
<div class="container"><%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<h1>ZoneNone - Bar charts</h1>
<div class="col-md-6" style="margin-top: 20px;">
	<div id="morrisBarChart"></div>
	<%-- <%@ include file="morris-bar-chart.jsp" %> --%>
</div>
<div class="col-md-6" style="margin-top: 20px;">
	<div id="bubbleChart"></div>
	<%-- <%@ include file="bubble-chart.jsp" %> --%>
</div>
<div class="col-md-6" style="margin-top: 20px;">
	<div id="liquidFillGauageChart"></div>
	<%-- <%@ include file="liquid-fill-gauage-chart.jsp" %> --%>
</div>
<div class="col-md-6" style="margin-top: 20px;">
	<div id="chloropethBarChart"></div>
	<%-- <%@ include file="chloropeth-bar-chart.jsp" %> --%>
</div>
<br />
<div class="col-md-12" style="margin-top: 20px;">
<%@ include file="footer.jsp"%></div>
</div>
<script>
loadCharts();
function loadCharts()
{
	//load morris bar chart
	 /* $.ajax({
        url: "morrisbarchart.do", //this is the submit URL
        type: 'GET', //or POST
        data: {
    		planNme : $("#planNme").val()
    	},
        success: function(data){
        	$('#morrisBarChart').empty();
    		$('#morrisBarChart').append(data);
        },
        error : function(data){
            $(".modal-error").html("Error :"+ data);
        }
    }); */
	//load morris bar chart
	$.ajax({
        url: "bubblechart.do", //this is the submit URL
        type: 'GET', //or POST
        data: {
    		planNme : $("#planNme").val()
    	},
        success: function(data){
        	$('#bubbleChart').empty();
    		$('#bubbleChart').append(data);
        },
        error : function(data){
            $(".modal-error").html("Error :"+ data);
        }
    }); 
	//load fill gauage chart
	 /* 
	$.ajax({
        url: "liquidfillgauagechart.do", //this is the submit URL
        type: 'GET', //or POST
        data: {
    		planNme : $("#planNme").val()
    	},
        success: function(data){
        	$('#liquidFillGauageChart').empty();
    		$('#liquidFillGauageChart').append(data);
        },
        error : function(data){
            $(".modal-error").html("Error :"+ data);
        }
    }); */
	//load chloropeth bar chart
	/*$.ajax({
        url: "chloropethbarchart.do", //this is the submit URL
        type: 'GET', //or POST
        data: {
    		planNme : $("#planNme").val()
    	},
        success: function(data){
        	$('#chloropethBarChart').empty();
    		$('#chloropethBarChart').append(data);
        },
        error : function(data){
            $(".modal-error").html("Error :"+ data);
        }
    }); */
}
</script>
</body>
</html>