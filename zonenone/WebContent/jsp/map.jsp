<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ZoneNone - Plan</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="css/bootstrap.min.css" />
<!--Pulling Awesome Font -->
<link
	href="css/font-awesome.min.css"
	rel="stylesheet" />
<link href="css/plan.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/map.css" rel="stylesheet" />
<script
	src="js/jquery.min.js"></script>
<script
	src="css/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<div id="tooltip"></div><!-- div to hold tooltip. -->
<svg width="960" height="600" id="statesvg"></svg> <!-- svg to hold the map. -->
</div>
<script src="js/uStates.js"></script> <!-- creates uStates. -->
<script src="js/d3.v3.min.js"></script>
<script>

	function tooltipHtml(n, d){	/* function to create html content string in tooltip div. */
		return "<h4>"+n+"</h4><table>"+
			"<tr><td>Rate</td><td>"+(d.low)+"</td></tr>"+
			"<tr><td>Quality</td><td>"+(d.avg)+"</td></tr>"+
			"<tr><td>Range</td><td>"+(d.high)+"</td></tr>"+
			"</table>";
	}
	
	var sampleData ={};	/* Sample random data. */	
	["HI", "AK", "FL", "SC", "GA", "AL", "NC", "TN", "RI", "CT", "MA",
	"ME", "NH", "VT", "NY", "NJ", "PA", "DE", "MD", "WV", "KY", "OH", 
	"MI", "WY", "MT", "ID", "WA", "DC", "TX", "CA", "AZ", "NV", "UT", 
	"CO", "NM", "OR", "ND", "SD", "NE", "IA", "MS", "IN", "IL", "MN", 
	"WI", "MO", "AR", "OK", "KS", "LS", "VA"]
		.forEach(function(d){ 
			var low=Math.round(100*Math.random()), 
				mid=Math.round(100*Math.random()), 
				high=Math.round(100*Math.random());
			sampleData[d]={low:d3.min([low,mid,high]), high:d3.max([low,mid,high]), 
					avg:Math.round((low+mid+high)/3), color:d3.interpolate("#ffffcc", "#800026")(low/100)}; 
		});
	
	/* draw states on id #statesvg */	
	uStates.draw("#statesvg", sampleData, tooltipHtml);
</script>
<%@ include file="footer.jsp" %>
</body>
</html>